# Directories
MSPGCC_ROOT_DIR = D:/dev/tools/msp430-gcc
MSPGCC_BIN_DIR = $(MSPGCC_ROOT_DIR)/bin
MSPGCC_INCLUDE_DIR = $(MSPGCC_ROOT_DIR)/include
INCLUDE_DIRS = $(MSPGCC_INCLUDE_DIR)
LIB_DIRS = $(MSPGCC_INCLUDE_DIR)

# Toolchain
CC = $(MSPGCC_BIN_DIR)/msp430-elf-gcc

# Files
TARGET = blink

# Flags
MCU = msp430g2553
WFLAGS = -Wall -Wextra -Werror -Wshadow
CFLAGS = -mmcu=$(MCU) $(WFLAGS) $(addprefix -I,$(INCLUDE_DIRS)) -Og -g
LDFLAGS = -mmcu=$(MCU) $(addprefix -L,$(LIB_DIRS))

# Build
## Linking
$(TARGET): main.o led.o
	$(CC) $(LDFLAGS) led.o main.o -o $(TARGET)

## Compiling
main.o: main.c
	$(CC) $(CFLAGS) -c -o main.o main.c

## Compiling
led.o: led.c
	$(CC) $(CFLAGS) -c -o led.o led.c