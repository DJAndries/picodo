#ifndef UTIL_H
#define UTIL_H

#include <stdint.h>

void write_unsigned_to_eeprom(unsigned data, unsigned char address);

unsigned read_unsigned_from_eeprom(unsigned char address);

unsigned char utoa(unsigned value, char* dest, unsigned char padding, unsigned char ndecimals);

uint16_t get_curr_time();

void memcpy(char* dest, char* src, unsigned char length);

#endif
