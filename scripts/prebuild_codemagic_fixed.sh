#!/bin/bash

# Clean up previous builds
rm -rf vodozemac
rm -rf .vodozemac

# Install Rust if not already installed
if ! command -v rustc &> /dev/null; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    . "$HOME/.cargo/env"
else
    . "$HOME/.cargo/env"
fi

# Check versions
rustc --version
cargo --version

# Clone vodozemac and build wasm
git clone https://github.com/matrix-org/vodozemac.git
cd vodozemac

# Add crate-type to Cargo.toml if not present
if ! grep -q "crate-type.*cdylib" Cargo.toml; then
    sed -i '/\[lib\]/a crate-type = ["cdylib", "rlib"]' Cargo.toml
fi

# Install wasm-pack if not already installed
if ! command -v wasm-pack &> /dev/null; then
    cargo install wasm-pack
fi

# Build wasm
wasm-pack build --target web
cd ..

# Run locale config scripts
cd scripts
chmod +x generate_locale_config.sh
./generate_locale_config.sh
chmod +x generate-locale-config.sh
./generate-locale-config.sh
cd ..

# Clone dart-vodozemac
git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
cd .vodozemac

# Install flutter_rust_bridge_codegen if not already installed
if ! command -v flutter_rust_bridge_codegen &> /dev/null; then
    cargo install flutter_rust_bridge_codegen
fi

# Check if dart is installed
if ! command -v dart &> /dev/null; then
    echo "Warning: dart command not found. Please install Dart SDK."
    echo "Attempting to continue without dart..."
else
    # Run flutter_rust_bridge_codegen
    flutter_rust_bridge_codegen build-web --dart-root dart --rust-root $(readlink -f rust) --release
fi

cd ..

# Copy generated files if they exist
if ls .vodozemac/dart/web/pkg/vodozemac_bindings_dart* 1> /dev/null 2>&1; then
    rm -f ./assets/vodozemac/vodozemac_bindings_dart*
    mv .vodozemac/dart/web/pkg/vodozemac_bindings_dart* ./assets/vodozemac/
else
    echo "Warning: vodozemac_bindings_dart files not found. Skipping copy."
fi

# Clean up
rm -rf .vodozemac

echo "Prebuild script completed successfully!"
