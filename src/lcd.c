#include "lcd.h"
#include <pic16f876.h>

#define LCD_ADDR 0x27 << 1
#define LCD_BACKLIGHT 0x08
#define LCD_ENABLE 0x04
#define LCD_REG_SELECT 0x01

static void wait_tx() {
	while (READ_WRITE || (SSPCON2 & 0x1F));
}

static void send_nibble(char data) {
	wait_tx();
	SSPBUF = data;
	wait_tx();
	SSPBUF = data | LCD_ENABLE;
	wait_tx();
	SSPBUF = data;
}

static void send_cmd(char data, char mode) {
	wait_tx();
	SEN = 1;
	wait_tx();
	SSPBUF = LCD_ADDR;
	send_nibble((data & 0xF0) | LCD_BACKLIGHT | mode);
	send_nibble(((data << 4) & 0xF0) | LCD_BACKLIGHT | mode);
	wait_tx();
	PEN = 1;
}

void lcd_write_string(const char* str, char is_second_line, unsigned char position) {
	unsigned char i;
	send_cmd((0x80 | (is_second_line ? 0x40 : 0x00)) + position, 0);
	for (i = 0; str[i] != 0; i++) {
		send_cmd(str[i], LCD_REG_SELECT);
	}
}

void init_lcd() {
	/* set up i2c master mode */
	SSPCON = 0b00101000;
	SSPADD = 2;

	/* 4 bit init sequence */
	send_cmd(0x03, 0);
	send_cmd(0x03, 0);
	send_cmd(0x03, 0);
	send_cmd(0x02, 0);

	/* function set, 2 lines */
	send_cmd(0b00101000, 0);
	/* display on, cursor off */
	send_cmd(0b00001100, 0);
	/* clear display */
	send_cmd(0x1, 0);
	/* entry mode set */
	send_cmd(0b00000110, 0);
}
