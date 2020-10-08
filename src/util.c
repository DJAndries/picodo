#include "util.h"
#include <pic16f876.h>

unsigned char utoa(unsigned value, char* dest, unsigned char min_len_pad, unsigned char ndecimals) {
	int i;
	unsigned char n_digits;
	unsigned x = value;
	n_digits = (x == 0) + (ndecimals > 0);
	while (x > 0) {
		x /= 10;
		n_digits++;
	}
	x = value;
	if (n_digits < min_len_pad) n_digits = min_len_pad;
	if (ndecimals && n_digits < (ndecimals + 2)) n_digits = ndecimals + 2;
	for (i = n_digits - 1; i >= 0; i--) {
		if (ndecimals && i == (n_digits - ndecimals - 1)) {
			dest[i] = '.';
			continue;
		}
		dest[i] = (x % 10) + '0';
		x /= 10;
	}
	return n_digits;
}

void write_unsigned_to_eeprom(unsigned data, unsigned char address) {
	unsigned char i = 0;
	for (i = 0; i < 2; i++) {
		while (WR == 1);
		EEADR = address;
		EEDATA = data & 0xFF;
		EEPGD = 0;
		WREN = 1;
		GIE = 0;
		EECON2 = 0x55;
		EECON2 = 0xAA;
		WR = 1;
		GIE = 1;
		WREN = 0;
		while (WR == 1 || EEIF == 0);
		EEIF = 0;
		data >>= 8;
		address++;
	}
}

unsigned read_unsigned_from_eeprom(unsigned char address) {
	int i;
	unsigned val = 0;
	address++;
	for (i = 1; i >= 0; i--) {
		EEADR = address;
		EEPGD = 0;
		RD = 1;
		val |= EEDATA;
		if (i == 1) {
			val <<= 8;
		}
		RD = 0;
		address--;
	}
	return val;
}

uint16_t get_curr_time() {
	return TMR1L | (TMR1H << 8);
}

void memcpy(char* dest, char* src, unsigned char length) {
	unsigned char i;
	for (i = 0; i < length; i++) {
		dest[i] = src[i];
	}
}
