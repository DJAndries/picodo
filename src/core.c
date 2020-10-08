#include <pic16f876.h>
#include <stdint.h>
#include "lcd.h"
#include "util.h"

#define TIMER_MS 65
#define TIMER_DS 6500
#define INTS_PER_REFRESH 3
#define WHEEL_CIRC_CM 228
#define RATE_SAMPLE_TIME 5
#define RATE_HOUR_MULTIP 720

volatile __xdata __at (0x0020) char debug_mem1[7];
volatile __xdata __at (0x007f) char debug_mem2[1];

static __code uint16_t __at (_CONFIG) config = _RC_OSC & _WDT_OFF & _PWRTE_OFF & _CP_OFF & _BOREN_ON & _LVP_ON & _CPD_OFF & _DEBUG_OFF & _WRT_ON;

unsigned char time_count = 0;

unsigned char passes_in_period = 0;
unsigned rate = 0;

unsigned meters_travelled = 0;
unsigned hm_travelled = 0;
unsigned cm_staging = 0;

unsigned minutes_elapsed = 0;
unsigned char seconds_elapsed = 0;
unsigned ms_elapsed = 0;

unsigned last_rate_check_seconds = 0;

uint16_t last_pass_time = 0;
uint16_t last_sec_time = 0;

void Intr(void) __interrupt 0 {
	unsigned curr_time;

	__asm__("fill 0x00, 19");

	if (INTF) {
		curr_time = get_curr_time();
		INTF = 0;
		if ((curr_time - last_pass_time) > TIMER_DS) {
			last_pass_time = curr_time;
			passes_in_period++;
		}
	}

	if (T0IF) {
		T0IF = 0;
		time_count++;
	}
}

void render() {
	unsigned char result;
	char display_str[12];
	if (!RA4) {
		/* render magnet passes if RA4 is grounded */
		display_str[1] = display_str[2] = ' ';
		result = utoa(passes_in_period, display_str, 0, 0);
		lcd_write_string(display_str, 1, 13);
	} else {
		/* render km odometer */
		result = utoa(hm_travelled / 10, display_str, 0, 0);
		memcpy(display_str + result, "k", 2);
		lcd_write_string(display_str, 1, 16 - result - 1);
	}

	/* render time */
	result = utoa(minutes_elapsed, display_str, 2, 0);
	display_str[result++] = ':';
	result += utoa(seconds_elapsed, display_str + result, 2, 0);
	display_str[result] = 0;
	lcd_write_string(display_str, 0, 16 - result);

	/* render speed */
	result = utoa(rate, display_str, 2, 2);
	memcpy(display_str + result, " km/h ", 7);
	lcd_write_string(display_str, 1, 0);

	/* render trip odometer */
	result = utoa(meters_travelled, display_str, 0, 0);
	memcpy(display_str + result, " m", 3);
	lcd_write_string(display_str, 0, 0);
}

void time_update() {
	uint16_t curr_time = get_curr_time();
	uint16_t time_diff = curr_time - last_sec_time;
	if (time_diff >= TIMER_DS) {
		ms_elapsed += time_diff / TIMER_MS;
		while (ms_elapsed >= 1000) {
			seconds_elapsed++;
			ms_elapsed -= 1000;
		}
		if (seconds_elapsed >= 60) {
			minutes_elapsed++;
			seconds_elapsed -= 60;
		}
		
		last_sec_time = curr_time;
	}
}

void metrics_update() {
	unsigned sample_cm;
	unsigned long pre_rate;
	
	if (last_rate_check_seconds != seconds_elapsed
			&& seconds_elapsed % RATE_SAMPLE_TIME == 0) {
		/* get meter count for this sample */
		sample_cm = passes_in_period;
		sample_cm *= WHEEL_CIRC_CM;

		/* convert sample to rate in km/h */ 
		pre_rate = sample_cm;
		pre_rate *= RATE_HOUR_MULTIP;
		/* divide by 1000 only, so there are two decimal places in whole number */
		pre_rate /= 1000;
		rate = pre_rate;

		/* add sample to "staging" var */
		cm_staging += sample_cm;

		passes_in_period = 0;
		last_rate_check_seconds = seconds_elapsed;

		/* every 10 meters in staging var, increment meters travelled */
		while (cm_staging >= 1000) {
			cm_staging -= 1000;
			meters_travelled += 10;
			
			/* save hectometers to eeprom */
			if (meters_travelled % 100 == 0) {
				hm_travelled += 1;
				write_unsigned_to_eeprom(hm_travelled, 0);
			}
		}
	}
}

void main() {
	/* trigger int on falling edge, enable ints, enable pin int */
	INTEDG = 0;
	GIE = 1;
	INTE = 1;

	init_lcd();

	/* enable timer1 with prescaler */
	T1CKPS1 = 1;
	T1CKPS0 = 1;
	TMR1CS = 0;
	TMR1ON = 1;
	
	/* set port a as digital, RA4 as input */
	RA4 = 0;
	PCFG0 = 1;
	PCFG1 = 1;
	PCFG2 = 1;
	PCFG3 = 0;
	TRISA4 = 1;

	/* enable timer0 with prescaler, enable timer int */
	PS2 = 1;
	PS1 = 1;
	PS0 = 1;
	PSA = 0;
	T0CS = 0;
	T0IE = 1;

	last_sec_time = get_curr_time();
	hm_travelled = read_unsigned_from_eeprom(0);

	while(1) {
		if (time_count >= INTS_PER_REFRESH) {
			time_count = 0;
			time_update();
			metrics_update();
			render();		
		}
	}
}
