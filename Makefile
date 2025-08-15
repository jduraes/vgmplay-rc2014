# VGM Player for RC2014 - Makefile
# Builds with sjasmplus assembler

ASM = sjasmplus
TARGET = vgmplay-rc2014
SOURCE = $(TARGET).z80

# Output formats
COM_FILE = $(TARGET).com
BIN_FILE = $(TARGET).bin
SYM_FILE = $(TARGET).sym

# Assembly options
ASM_OPTS = --syntax=abf --lst=$(TARGET).lst --sym=$(SYM_FILE)

.PHONY: all clean com bin

all: com

# Build CP/M .COM file
com: $(COM_FILE)

$(COM_FILE): $(SOURCE)
	$(ASM) $(ASM_OPTS) --raw=$(COM_FILE) $(SOURCE)

# Build binary file  
bin: $(BIN_FILE)

$(BIN_FILE): $(SOURCE)
	$(ASM) $(ASM_OPTS) --raw=$(BIN_FILE) $(SOURCE)

clean:
	rm -f $(COM_FILE) $(BIN_FILE) $(SYM_FILE) $(TARGET).lst

test: com
	@echo "Built $(COM_FILE) - ready for RC2014 testing"
	@ls -la $(COM_FILE)
