
# Compiler
CC = gcc

# Compiler flags C11 standard
CFLAGS = -Wall -Wextra -std=c11

TARGET = mysh

# Directories
SRC_DIR = src
INC_DIR = include
BUILD_DIR = build
BIN_DIR = bin

# Source Discovery
SRC = $(shell find $(SRC_DIR) -type f -name '*.c')
OBJS = ($patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))
DEPS = $(OBJS:.o=.d)

# Default Target
.PHONY: all
all: $(BIN_DIR)/$(TARGET)

# Link
$(BIN_DIR)/$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

# ---------- Compile (with dependency generation) ----------
# -MMD -MP generates .d dependency files alongside .o
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -c $< -o $@

# ---------- Include auto-generated deps ----------
-include $(DEPS)

# ---------- Convenience targets ----------
.PHONY: run
run: all
	./$(BIN_DIR)/$(TARGET)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

.PHONY: format
format:
	@echo "No formatter configured.
