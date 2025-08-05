#!/bin/bash

# Fix Rust Environment Script
# This script addresses the Rust panic caused by Cyrillic characters in environment variables

echo "🔧 Fixing Rust Environment Issues..."

# Function to write colored output
write_status() {
    local message="$1"
    local color="$2"
    case $color in
        "green") echo -e "\033[32m[$(date '+%H:%M:%S')] $message\033[0m" ;;
        "yellow") echo -e "\033[33m[$(date '+%H:%M:%S')] $message\033[0m" ;;
        "red") echo -e "\033[31m[$(date '+%H:%M:%S')] $message\033[0m" ;;
        *) echo -e "[$(date '+%H:%M:%S')] $message" ;;
    esac
}

# Step 1: Clear problematic environment variables
write_status "Clearing problematic environment variables..." "yellow"
unset OWD APPIMAGE LD_LIBRARY_PATH APPDIR PERLLIB GSETTINGS_SCHEMA_DIR XDG_DATA_DIRS QT_PLUGIN_PATH CHROME_DESKTOP CURSOR_TRACE_ID CURSOR_AGENT GIT_ASKPASS VSCODE_GIT_ASKPASS_NODE VSCODE_GIT_ASKPASS_MAIN

# Step 2: Set clean environment variables
write_status "Setting clean environment variables..." "yellow"
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export LANGUAGE=C.UTF-8

# Step 3: Reinstall Rust with clean environment
write_status "Reinstalling Rust with clean environment..." "yellow"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | LC_ALL=C.UTF-8 sh -s -- -y

# Step 4: Source Rust environment
write_status "Sourcing Rust environment..." "yellow"
source "$HOME/.cargo/env"

# Step 5: Test Rust installation
write_status "Testing Rust installation..." "yellow"
if rustc --version && cargo --version; then
    write_status "✅ Rust installation successful!" "green"
else
    write_status "❌ Rust installation failed!" "red"
    exit 1
fi

# Step 6: Install required Rust components
write_status "Installing required Rust components..." "yellow"
rustup component add llvm-tools-preview
rustup target add wasm32-unknown-unknown

# Step 7: Test Flutter build
write_status "Testing Flutter build..." "yellow"
export PATH="$PATH:$HOME/flutter/bin"

if flutter doctor -v; then
    write_status "✅ Flutter environment is ready!" "green"
    
    # Try a simple Flutter command
    if flutter pub get; then
        write_status "✅ Flutter dependencies installed successfully!" "green"
    else
        write_status "❌ Flutter dependencies installation failed!" "red"
    fi
else
    write_status "❌ Flutter environment has issues!" "red"
fi

write_status "Environment fix completed!" "green"
write_status "You can now run: source scripts/fix_rust_environment.sh" "yellow" 