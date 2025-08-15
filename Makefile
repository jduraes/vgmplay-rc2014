# VGM Player for RC2014 - Makefile
# Builds with sjasmplus assembler
# Uses 8.3 filename convention for CP/M compatibility

ASM = sjasmplus
TARGET = VGMPLAY
SOURCE = $(TARGET).Z80

# Output formats (8.3 naming)
COM_FILE = $(TARGET).COM
BIN_FILE = $(TARGET).BIN
SYM_FILE = $(TARGET).SYM
LST_FILE = $(TARGET).LST

# Assembly options
ASM_OPTS = --syntax=abf --lst=$(LST_FILE) --sym=$(SYM_FILE)

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
	rm -f $(COM_FILE) $(BIN_FILE) $(SYM_FILE) $(LST_FILE)

test: com
	@echo "Built $(COM_FILE) - ready for RC2014 CP/M testing"
	@ls -la $(COM_FILE)
