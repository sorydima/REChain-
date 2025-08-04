#!/bin/bash

# REChain Windows Prebuild Script
# This script sets up the environment for Windows builds with flutter_vodozemac

set -e

echo "=== REChain Windows Prebuild Setup ==="

# Install Rust if not already installed
if ! command -v rustc &> /dev/null; then
    echo "Installing Rust..."
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source $HOME/.cargo/env
else
    echo "Rust is already installed"
fi

# Add required Rust components
echo "Adding Rust components..."
rustup component add llvm-tools-preview
rustup target add wasm32-unknown-unknown

# Verify Rust installation
echo "Rust version: $(rustc --version)"
echo "Cargo version: $(cargo --version)"

# Install wasm-pack if not already installed
if ! command -v wasm-pack &> /dev/null; then
    echo "Installing wasm-pack..."
    cargo install wasm-pack
else
    echo "wasm-pack is already installed"
fi

# Install flutter_rust_bridge_codegen if not already installed
if ! command -v flutter_rust_bridge_codegen &> /dev/null; then
    echo "Installing flutter_rust_bridge_codegen..."
    cargo install flutter_rust_bridge_codegen
else
    echo "flutter_rust_bridge_codegen is already installed"
fi

# Clone and build vodozemac if needed
if [ ! -d "vodozemac" ]; then
    echo "Cloning vodozemac..."
    git clone https://github.com/matrix-org/vodozemac.git
fi

# Build vodozemac for web
echo "Building vodozemac for web..."
cd vodozemac
wasm-pack build --target web
cd ..

# Generate locale configurations
echo "Generating locale configurations..."
chmod +x scripts/generate_locale_config.sh
./scripts/generate_locale_config.sh || true

chmod +x scripts/generate-locale-config.sh
./scripts/generate-locale-config.sh || true

# Setup dart-vodozemac
echo "Setting up dart-vodozemac..."
if [ -d ".vodozemac" ]; then
    rm -rf .vodozemac
fi

git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
cd .vodozemac

# Build web bindings
flutter_rust_bridge_codegen build-web --dart-root dart --rust-root $(readlink -f rust) --release

cd ..

# Copy built files to assets
echo "Copying built files to assets..."
rm -f ./assets/vodozemac/vodozemac_bindings_dart*
mkdir -p ./assets/vodozemac/
mv .vodozemac/dart/web/pkg/vodozemac_bindings_dart* ./assets/vodozemac/
rm -rf .vodozemac

echo "=== Prebuild setup complete ==="
echo "Windows build environment is ready"
