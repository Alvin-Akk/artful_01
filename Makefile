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

# Build
$(TARGET): main.c led.c
	$(CC) -mmcu=msp430g2553 \
	-I $(INCLUDE_DIRS) \
	-L $(LIB_DIRS) \
	-Og -g -Wall \
	led.c main.c -o blink