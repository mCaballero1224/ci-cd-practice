# Default compiler if not specified by GitHub Actions matrix
CC ?= gcc
CFLAGS = -Wall -Wextra -O2

# Directories
SRC_DIR = src
TEST_DIR = tests
BUILD_DIR = build

# Targets
all: prep $(BUILD_DIR)/app

# Prepare build directory
prep:
	mkdir -p $(BUILD_DIR)

# Compile main application
$(BUILD_DIR)/app: $(SRC_DIR)/main.c
	$(CC) $(CFLAGS) $(SRC_DIR)/main.c -o $(BUILD_DIR)/app

# Compile test runner (defines TESTING macro to omit main.c's main function)
$(BUILD_DIR)/test_runner: $(SRC_DIR)/main.c $(TEST_DIR)/test_main.c
	$(CC) $(CFLAGS) -DTESTING $(SRC_DIR)/main.c $(TEST_DIR)/test_main.c -o $(BUILD_DIR)/test_runner

# Target executed by CI pipeline to run tests
test: prep $(BUILD_DIR)/test_runner
	./$(BUILD_DIR)/test_runner

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)
