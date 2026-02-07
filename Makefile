
# Compiler
CC = gcc

# Compiler flags C11 standard
CFLAGS = -Wall -Wextra -std=c11

# Target executable
TARGET = mysh

# Default ruule: build the shell
all: $(TARGET)

# Compile mysh.c into mysh
$(TARGET): mysh.c
	$(CC) $(CFLAGS) -o $(TARGET) mysh.c

# Clean up
clean:
	rm -f $(TARGET)
