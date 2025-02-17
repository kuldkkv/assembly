CC = gcc
NASM = nasm
NASM_FLAGS = -f elf64
BUILD = build
BIN = bin
DIST = dist
SRC = src
LIB = lib
PROGRAM = $(BIN)/03_asm_from_c

OBJECTS = $(BUILD)/03_asm_from_c.o $(LIB)/libutil.o

$(PROGRAM): $(OBJECTS)
	$(CC) -nostdlib $^ -o $@

$(BUILD)/03_asm_from_c.o: $(SRC)/03_asm_from_c.c
	$(CC) -c $^ -o $@

$(LIB)/libutil.o: $(SRC)/libutil.asm
	$(NASM) $(NASM_FLAGS) $^ -o $@

run: $(PROGRAM)
	$^

clean:
	$(RM) $(OBJECTS)

cleanall:
	$(RM) $(OBJECTS) $(PROGRAM)
