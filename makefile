# Makefile for jt CLI tool
.PHONY: all build install uninstall clean test

# Config
NAME := jt
VERSION := 1.0.0
INSTALL_DIR := /usr/local/bin
BUILD_DIR := .build/release
INSTALL_SCRIPT := install.sh

all: build

# Build release binary
build:
	@echo "🛠  Building $(NAME) v$(VERSION)..."
	swift build -c release --disable-sandbox
	@echo "✅ Build complete: $(BUILD_DIR)/$(NAME)"

# Install globally
install: build
	@echo "🔧 Installing to $(INSTALL_DIR)..."
	@chmod +x $(INSTALL_SCRIPT)
	@./$(INSTALL_SCRIPT)
	@echo "✨ Installed: $(shell which $(NAME))"

# Uninstall
uninstall:
	@if [ -f "$(INSTALL_DIR)/$(NAME)" ]; then \
		sudo rm -f "$(INSTALL_DIR)/$(NAME)"; \
		echo "🗑  Removed $(INSTALL_DIR)/$(NAME)"; \
	else \
		echo "⚠️  $(NAME) not found in $(INSTALL_DIR)"; \
	fi

# Run tests
test:
	@echo "🧪 Running tests..."
	swift test --enable-test-discovery

# Clean build artifacts
clean:
	@echo "🧹 Cleaning..."
	swift package clean
	rm -rf .build

# Run locally without install
run:
	swift run $(NAME) $(filter-out $@,$(MAKECMDGOALS))

# Help
help:
	@echo "Usage:"
	@echo "  make build       - Compile release binary"
	@echo "  make install     - Install globally (requires sudo)"
	@echo "  make uninstall   - Remove installed binary"
	@echo "  make test        - Run tests"
	@echo "  make clean       - Delete build artifacts"
	@echo "  make run ARGS=\"\" - Run locally (e.g.
