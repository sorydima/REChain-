#!/bin/bash

# Linux CI/CD Build Script for REChain Flutter Application
# This script handles the vodozemac compilation and Linux build setup

set -e  # Exit on any error

# Configuration
BUILD_TYPE=${1:-"release"}
FLUTTER_VERSION=${2:-"3.32.8"}

echo "Starting REChain Linux CI/CD Build Process..."

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

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Step 1: Install Rust
write_status "Installing Rust..." "yellow"
if ! command_exists rustc; then
    write_status "Downloading and installing Rust..." "yellow"
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
else
    write_status "Rust already installed" "green"
fi

# Step 2: Install system dependencies
write_status "Installing system dependencies..." "yellow"
if command_exists apt-get; then
    # Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y git curl wget build-essential cmake pkg-config libssl-dev
elif command_exists yum; then
    # CentOS/RHEL
    sudo yum groupinstall -y "Development Tools"
    sudo yum install -y git curl wget cmake openssl-devel
elif command_exists dnf; then
    # Fedora
    sudo dnf groupinstall -y "Development Tools"
    sudo dnf install -y git curl wget cmake openssl-devel
elif command_exists pacman; then
    # Arch Linux
    sudo pacman -Syu --noconfirm base-devel git curl wget cmake openssl
fi

# Step 3: Install Flutter
write_status "Installing Flutter..." "yellow"
if ! command_exists flutter; then
    # Download Flutter
    FLUTTER_HOME="$HOME/flutter"
    if [ ! -d "$FLUTTER_HOME" ]; then
        git clone https://github.com/flutter/flutter.git "$FLUTTER_HOME"
    fi
    
    # Add Flutter to PATH
    export PATH="$FLUTTER_HOME/bin:$PATH"
    
    # Switch to specific version if needed
    if [ "$FLUTTER_VERSION" != "latest" ]; then
        cd "$FLUTTER_HOME"
        git fetch --tags
        git checkout "$FLUTTER_VERSION"
        cd - > /dev/null
    fi
else
    write_status "Flutter already installed" "green"
fi

# Step 4: Configure Rust environment
write_status "Configuring Rust environment..." "yellow"
source "$HOME/.cargo/env"
rustup component add llvm-tools-preview
rustup target add wasm32-unknown-unknown

# Verify Rust installation
write_status "Verifying Rust installation..." "yellow"
rustc --version
cargo --version

# Step 5: Clone and build vodozemac
write_status "Setting up vodozemac..." "yellow"
if [ ! -d "vodozemac" ]; then
    git clone https://github.com/matrix-org/vodozemac.git
fi

# Step 6: Install wasm-pack
write_status "Installing wasm-pack..." "yellow"
if ! command_exists wasm-pack; then
    cargo install wasm-pack
fi

# Step 7: Build vodozemac for web
write_status "Building vodozemac for web..." "yellow"
cd vodozemac
wasm-pack build --target web
cd ..

# Step 8: Generate locale configuration
write_status "Generating locale configuration..." "yellow"
if [ -f "scripts/generate_locale_config.sh" ]; then
    chmod +x scripts/generate_locale_config.sh
    ./scripts/generate_locale_config.sh
fi

if [ -f "scripts/generate-locale-config.sh" ]; then
    chmod +x scripts/generate-locale-config.sh
    ./scripts/generate-locale-config.sh
fi

# Step 9: Setup dart-vodozemac
write_status "Setting up dart-vodozemac..." "yellow"
if [ -d ".vodozemac" ]; then
    rm -rf .vodozemac
fi

git clone https://github.com/famedly/dart-vodozemac.git .vodozemac

# Step 10: Install flutter_rust_bridge_codegen
write_status "Installing flutter_rust_bridge_codegen..." "yellow"
if ! command_exists flutter_rust_bridge_codegen; then
    cargo install flutter_rust_bridge_codegen
fi

# Step 11: Build vodozemac bindings
write_status "Building vodozemac bindings..." "yellow"
cd .vodozemac
flutter_rust_bridge_codegen build-web --dart-root dart --rust-root "$(readlink -f rust)" --release
cd ..

# Step 12: Copy generated files
write_status "Copying generated files..." "yellow"
mkdir -p assets/vodozemac

# Remove existing bindings
rm -f assets/vodozemac/vodozemac_bindings_dart*

# Copy new bindings
cp .vodozemac/dart/web/pkg/vodozemac_bindings_dart* assets/vodozemac/

# Cleanup
rm -rf .vodozemac

# Step 13: Configure Flutter
write_status "Configuring Flutter..." "yellow"
flutter config --no-analytics
flutter doctor -v

# Step 14: Get dependencies
write_status "Getting Flutter dependencies..." "yellow"
flutter pub get

# Step 15: Build for Linux
write_status "Building for Linux ($BUILD_TYPE)..." "yellow"
if flutter build linux --$BUILD_TYPE; then
    write_status "Build completed successfully!" "green"
else
    write_status "Build failed, attempting debug build..." "yellow"
    if flutter build linux --debug; then
        write_status "Debug build completed successfully!" "green"
    else
        write_status "Debug build also failed!" "red"
        exit 1
    fi
fi

write_status "Linux CI/CD build process completed!" "green" 