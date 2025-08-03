#!/bin/bash
set -euo pipefail

echo "=== REChain Vercel Build Script ==="

# Install Rust if not already installed
if ! command -v rustc &> /dev/null; then
    echo "Installing Rust..."
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source $HOME/.cargo/env
else
    source $HOME/.cargo/env
fi

# Check versions
echo "Rust version: $(rustc --version)"
echo "Cargo version: $(cargo --version)"

# Install Flutter if not present
if [ ! -d "flutter" ]; then
    echo "Installing Flutter..."
    git clone https://github.com/flutter/flutter.git -b stable --depth 1
    export PATH="$PATH:$(pwd)/flutter/bin"
    flutter doctor
fi

export PATH="$PATH:$(pwd)/flutter/bin"

# Clean up previous builds
rm -rf vodozemac
rm -rf .vodozemac

# Build vodozemac WASM using our reliable standalone approach
echo "Building vodozemac WASM using standalone approach..."
bash ../scripts/build_vodozemac_wasm.sh

# Run locale config scripts
echo "Generating locale configuration..."
cd scripts
chmod +x generate_locale_config.sh
./generate_locale_config.sh
chmod +x generate-locale-config.sh
./generate-locale-config.sh
cd ..

# Clone dart-vodozemac
echo "Building dart-vodozemac..."
git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
cd .vodozemac

# Install flutter_rust_bridge_codegen if not already installed
if ! command -v flutter_rust_bridge_codegen &> /dev/null; then
    echo "Installing flutter_rust_bridge_codegen..."
    cargo install flutter_rust_bridge_codegen
fi

# Check if dart is installed
if ! command -v dart &> /dev/null; then
    echo "Warning: dart command not found. Please install Dart SDK."
    echo "Attempting to continue without dart..."
else
    # Run flutter_rust_bridge_codegen
    echo "Running flutter_rust_bridge_codegen..."
    flutter_rust_bridge_codegen build-web --dart-root dart --rust-root $(readlink -f rust) --release
fi

cd ..

# Copy generated files if they exist
if ls .vodozemac/dart/web/pkg/vodozemac_bindings_dart* 1> /dev/null 2>&1; then
    echo "Copying vodozemac bindings..."
    rm -f ./assets/vodozemac/vodozemac_bindings_dart*
    mv .vodozemac/dart/web/pkg/vodozemac_bindings_dart* ./assets/vodozemac/
else
    echo "Warning: vodozemac_bindings_dart files not found. Skipping copy."
fi

# Clean up
rm -rf .vodozemac

# Get Flutter dependencies
echo "Getting Flutter dependencies..."
flutter pub get

# Build Flutter web
echo "Building Flutter web application..."
flutter build web --release

echo "Build completed successfully!"
