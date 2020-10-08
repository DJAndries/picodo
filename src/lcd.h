#ifndef LCD_H
#define LCD_H

void init_lcd();

void lcd_write_string(const char* str, char is_second_line, unsigned char position);

#endif
