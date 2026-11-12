# Directories
MSPGCC_ROOT_DIR = D:/dev/tools/msp430-gcc
MSPGCC_BIN_DIR = $(MSPGCC_ROOT_DIR)/bin
MSPGCC_INCLUDE_DIR = $(MSPGCC_ROOT_DIR)/include

BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)/bin

TI_CCS_DIR = D:/dev/tools/ccs2041/ccs
DEBUG_BIN_DIR = $(TI_CCS_DIR)/ccs_base/DebugServer/bin
CCXML = MSP430G2553.ccxml

LIB_DIRS = $(MSPGCC_INCLUDE_DIR)
INCLUDE_DIRS = $(MSPGCC_INCLUDE_DIR) \
			   ./src \
			   ./external/ \
			   ./external/printf

# Toolchain
CC = $(MSPGCC_BIN_DIR)/msp430-elf-gcc
RM = rm
DEBUG = $(DEBUG_BIN_DIR)/DSLite

# Files
TARGET = $(BIN_DIR)/sumo

SOURCES = src/main.c \
          src/app/drive.c \
          src/app/enemy.c \
          src/drivers/i2c.c \
          src/drivers/uart.c

OBJECT_NAMES = $(SOURCES:.c=.o)
OBJECTS = $(patsubst %,$(OBJ_DIR)/%,$(OBJECT_NAMES))

# Flags
MCU = msp430g2553
WFLAGS = -Wall -Wextra -Werror -Wshadow
CFLAGS = -mmcu=$(MCU) $(WFLAGS) $(addprefix -I,$(INCLUDE_DIRS)) -Og -g
LDFLAGS = -mmcu=$(MCU) $(addprefix -L,$(LIB_DIRS))

# Build
## Linking
$(TARGET): $(OBJECTS)
	@mkdir -p $(dir $@)
	$(CC) $(LDFLAGS) $^ -o $@

## Compiling
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c -o $@ $^

# Phonies
.PHONY: all clean flash

all: $(TARGET)

clean:
	$(RM) -r $(BUILD_DIR)

flash: $(TARGET)
	$(DEBUG) flash --config=$(CCXML) -u $(TARGET)