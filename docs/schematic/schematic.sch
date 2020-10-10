EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_PIC16:PIC16F876-XXISP U1
U 1 1 5F7F889E
P 5000 3850
F 0 "U1" H 5000 5031 50  0000 C CNN
F 1 "PIC16F876-XXISP" H 5000 4940 50  0000 C CNN
F 2 "" H 5000 3850 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/30292C.pdf" H 5000 3850 50  0001 C CNN
	1    5000 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5F7F9C73
P 5500 2850
F 0 "#PWR05" H 5500 2700 50  0001 C CNN
F 1 "+5V" V 5515 2978 50  0000 L CNN
F 2 "" H 5500 2850 50  0001 C CNN
F 3 "" H 5500 2850 50  0001 C CNN
	1    5500 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 2850 5500 2850
$Comp
L power:GND #PWR04
U 1 1 5F7FD136
P 5100 5050
F 0 "#PWR04" H 5100 4800 50  0001 C CNN
F 1 "GND" H 5105 4877 50  0000 C CNN
F 2 "" H 5100 5050 50  0001 C CNN
F 3 "" H 5100 5050 50  0001 C CNN
	1    5100 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4850 5100 5050
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 5F7FD585
P 8200 5350
F 0 "J2" V 8354 5062 50  0000 R CNN
F 1 "ICSP" V 8263 5062 50  0000 R CNN
F 2 "" H 8200 5350 50  0001 C CNN
F 3 "~" H 8200 5350 50  0001 C CNN
	1    8200 5350
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_Reed SW1
U 1 1 5F801D90
P 6800 3850
F 0 "SW1" H 6800 4072 50  0000 C CNN
F 1 "SW_Reed" H 6800 3981 50  0000 C CNN
F 2 "" H 6800 3850 50  0001 C CNN
F 3 "~" H 6800 3850 50  0001 C CNN
	1    6800 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3850 6150 3850
$Comp
L Device:R R2
U 1 1 5F806058
P 6150 3700
F 0 "R2" H 6220 3746 50  0000 L CNN
F 1 "10k" H 6220 3655 50  0000 L CNN
F 2 "" V 6080 3700 50  0001 C CNN
F 3 "~" H 6150 3700 50  0001 C CNN
	1    6150 3700
	1    0    0    -1  
$EndComp
Connection ~ 6150 3850
Wire Wire Line
	6150 3850 6600 3850
$Comp
L power:+5V #PWR06
U 1 1 5F80682B
P 6150 3550
F 0 "#PWR06" H 6150 3400 50  0001 C CNN
F 1 "+5V" H 6165 3723 50  0000 C CNN
F 2 "" H 6150 3550 50  0001 C CNN
F 3 "" H 6150 3550 50  0001 C CNN
	1    6150 3550
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x02 SW2
U 1 1 5F807B0B
P 7000 2950
F 0 "SW2" H 7000 3317 50  0000 C CNN
F 1 "SW_DIP_x02" H 7000 3226 50  0000 C CNN
F 2 "" H 7000 2950 50  0001 C CNN
F 3 "~" H 7000 2950 50  0001 C CNN
	1    7000 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3550 6000 3550
$Comp
L Device:R R3
U 1 1 5F80AD03
P 6300 2700
F 0 "R3" H 6370 2746 50  0000 L CNN
F 1 "10k" H 6370 2655 50  0000 L CNN
F 2 "" V 6230 2700 50  0001 C CNN
F 3 "~" H 6300 2700 50  0001 C CNN
	1    6300 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5F80B2AF
P 6300 2550
F 0 "#PWR07" H 6300 2400 50  0001 C CNN
F 1 "+5V" H 6315 2723 50  0000 C CNN
F 2 "" H 6300 2550 50  0001 C CNN
F 3 "" H 6300 2550 50  0001 C CNN
	1    6300 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5F80C374
P 7850 2900
F 0 "#PWR09" H 7850 2650 50  0001 C CNN
F 1 "GND" V 7855 2772 50  0000 R CNN
F 2 "" H 7850 2900 50  0001 C CNN
F 3 "" H 7850 2900 50  0001 C CNN
	1    7850 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5F812B00
P 7550 2850
F 0 "R5" V 7757 2850 50  0000 C CNN
F 1 "330" V 7666 2850 50  0000 C CNN
F 2 "" V 7480 2850 50  0001 C CNN
F 3 "~" H 7550 2850 50  0001 C CNN
	1    7550 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 5F8170FF
P 7550 2950
F 0 "R6" V 7757 2950 50  0000 C CNN
F 1 "330" V 7666 2950 50  0000 C CNN
F 2 "" V 7480 2950 50  0001 C CNN
F 3 "~" H 7550 2950 50  0001 C CNN
	1    7550 2950
	0    -1   1    0   
$EndComp
Wire Wire Line
	7300 2850 7400 2850
Wire Wire Line
	7300 2950 7400 2950
Wire Wire Line
	7700 2850 7850 2850
Wire Wire Line
	7850 2850 7850 2900
Wire Wire Line
	7700 2950 7850 2950
Wire Wire Line
	7850 2950 7850 2900
Connection ~ 7850 2900
Wire Wire Line
	6700 2850 6300 2850
Connection ~ 6300 2850
Wire Wire Line
	6300 2850 6000 2850
Wire Wire Line
	6000 2850 6000 3550
Wire Wire Line
	6700 3300 6700 2950
Wire Wire Line
	8300 4150 8300 5150
Wire Wire Line
	5800 4450 8200 4450
Wire Wire Line
	8200 4450 8200 5150
Wire Wire Line
	5800 4550 8100 4550
Wire Wire Line
	8100 4550 8100 5150
Connection ~ 8300 4150
Wire Wire Line
	5800 4150 8300 4150
Wire Wire Line
	8300 3300 6700 3300
Wire Wire Line
	8300 3300 8300 4150
$Comp
L power:GND #PWR08
U 1 1 5F80BBD0
P 7500 3850
F 0 "#PWR08" H 7500 3600 50  0001 C CNN
F 1 "GND" V 7505 3722 50  0000 R CNN
F 2 "" H 7500 3850 50  0001 C CNN
F 3 "" H 7500 3850 50  0001 C CNN
	1    7500 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F82A77E
P 7200 3850
F 0 "R4" V 7407 3850 50  0000 C CNN
F 1 "330" V 7316 3850 50  0000 C CNN
F 2 "" V 7130 3850 50  0001 C CNN
F 3 "~" H 7200 3850 50  0001 C CNN
	1    7200 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7000 3850 7050 3850
Wire Wire Line
	7350 3850 7500 3850
Wire Wire Line
	3750 3150 3750 2200
Wire Wire Line
	3750 2200 8400 2200
Wire Wire Line
	8400 2200 8400 5150
$Comp
L power:+5V #PWR01
U 1 1 5F84FC97
P 3150 3150
F 0 "#PWR01" H 3150 3000 50  0001 C CNN
F 1 "+5V" V 3165 3278 50  0000 L CNN
F 2 "" H 3150 3150 50  0001 C CNN
F 3 "" H 3150 3150 50  0001 C CNN
	1    3150 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5F85065A
P 3500 3150
F 0 "R1" V 3707 3150 50  0000 C CNN
F 1 "10k" V 3616 3150 50  0000 C CNN
F 2 "" V 3430 3150 50  0001 C CNN
F 3 "~" H 3500 3150 50  0001 C CNN
	1    3500 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 3150 3750 3150
Connection ~ 3750 3150
Wire Wire Line
	3750 3150 4200 3150
Wire Wire Line
	3150 3150 3350 3150
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5F852B83
P 2950 4300
F 0 "J1" H 3058 4581 50  0000 C CNN
F 1 "I2C Display" H 3058 4490 50  0000 C CNN
F 2 "" H 2950 4300 50  0001 C CNN
F 3 "~" H 2950 4300 50  0001 C CNN
	1    2950 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4150 3700 4150
Wire Wire Line
	3700 4150 3700 4200
Wire Wire Line
	3700 4200 3150 4200
Wire Wire Line
	4200 4250 3700 4250
Wire Wire Line
	3700 4250 3700 4300
Wire Wire Line
	3700 4300 3150 4300
$Comp
L power:+5V #PWR02
U 1 1 5F8548B7
P 3550 4400
F 0 "#PWR02" H 3550 4250 50  0001 C CNN
F 1 "+5V" V 3565 4528 50  0000 L CNN
F 2 "" H 3550 4400 50  0001 C CNN
F 3 "" H 3550 4400 50  0001 C CNN
	1    3550 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 4400 3550 4400
$Comp
L power:GND #PWR03
U 1 1 5F856274
P 3600 4500
F 0 "#PWR03" H 3600 4250 50  0001 C CNN
F 1 "GND" V 3605 4372 50  0000 R CNN
F 2 "" H 3600 4500 50  0001 C CNN
F 3 "" H 3600 4500 50  0001 C CNN
	1    3600 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3600 4500 3150 4500
$Comp
L Device:C C?
U 1 1 5F8692D6
P 2450 3800
F 0 "C?" H 2565 3846 50  0000 L CNN
F 1 "27pF" H 2565 3755 50  0000 L CNN
F 2 "" H 2488 3650 50  0001 C CNN
F 3 "~" H 2450 3800 50  0001 C CNN
	1    2450 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F869EAD
P 2450 3400
F 0 "R?" H 2520 3446 50  0000 L CNN
F 1 "10k" H 2520 3355 50  0000 L CNN
F 2 "" V 2380 3400 50  0001 C CNN
F 3 "~" H 2450 3400 50  0001 C CNN
	1    2450 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F8707C8
P 2450 3950
F 0 "#PWR?" H 2450 3700 50  0001 C CNN
F 1 "GND" H 2455 3777 50  0000 C CNN
F 2 "" H 2450 3950 50  0001 C CNN
F 3 "" H 2450 3950 50  0001 C CNN
	1    2450 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F870DB6
P 2450 3250
F 0 "#PWR?" H 2450 3100 50  0001 C CNN
F 1 "+5V" H 2465 3423 50  0000 C CNN
F 2 "" H 2450 3250 50  0001 C CNN
F 3 "" H 2450 3250 50  0001 C CNN
	1    2450 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3550 2450 3600
Wire Wire Line
	4200 3450 3150 3450
Wire Wire Line
	3150 3450 3150 3600
Wire Wire Line
	3150 3600 2450 3600
Connection ~ 2450 3600
Wire Wire Line
	2450 3600 2450 3650
$EndSCHEMATC