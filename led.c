#include "led.h"
#include <msp430.h>

void led_init(void)
{
    P1DIR |= 0x40; // Set P1.6 to output direction (0x40 = binary 0100 0000)
}

void led_toggle(void)
{
    P1OUT ^= 0x40; // Toggle P1.6 using exclusive-OR
}