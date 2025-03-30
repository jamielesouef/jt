#!/bin/bash

# Installation Script for JTTool (GitHub Search CLI)
set -euo pipefail

# Configuration
TOOL_NAME="jt"
BUILD_DIR=".build/release"
TARGET_BIN="jt"
INSTALL_DIR="/usr/local/bin"
VERSION="1.0.0"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

function header() {
    echo -e "${YELLOW}=== JTTool Installer v$VERSION ===${NC}"
}

function build_tool() {
    echo -e "${GREEN}Building release binary...${NC}"
    swift build -c release
}

function install_tool() {
    echo -e "${GREEN}Installing to $INSTALL_DIR...${NC}"
    
    # Check for existing installation
    if [ -f "$INSTALL_DIR/$TOOL_NAME" ]; then
        echo -e "${YELLOW}Found existing installation. Overwriting...${NC}"
        sudo rm -f "$INSTALL_DIR/$TOOL_NAME"
    fi
    
    # Install with proper permissions
    sudo install "$BUILD_DIR/$TARGET_BIN" "$INSTALL_DIR/$TOOL_NAME"
    
    # Verify
    if command -v $TOOL_NAME >/dev/null; then
        echo -e "${GREEN}Successfully installed:${NC}"
        which $TOOL_NAME
        $TOOL_NAME --version
    else
        echo -e "${RED}Installation failed!${NC}"
        exit 1
    fi
}

function uninstall_tool() {
    echo -e "${YELLOW}Uninstalling...${NC}"
    sudo rm -f "$INSTALL_DIR/$TOOL_NAME"
    echo -e "${GREEN}Removed $INSTALL_DIR/$TOOL_NAME${NC}"
}

function main() {
    header
    case "${1:-}" in
        --uninstall)
            uninstall_tool
            ;;
        *)
            build_tool
            install_tool
            ;;
    esac
}

main "$@"
