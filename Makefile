blink: main.c led.c
	D:/dev/tools/msp430-gcc/bin/msp430-elf-gcc -mmcu=msp430g2553 \
	-I D:/dev/tools/msp430-gcc/include \
	-L D:/dev/tools/msp430-gcc/include \
	-Og -g -Wall \
	led.c main.c -o blink
