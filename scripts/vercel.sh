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

# Clone vodozemac and build wasm
echo "Building vodozemac WASM..."
git clone https://github.com/matrix-org/vodozemac.git
cd vodozemac

# Add crate-type to Cargo.toml if not present
if ! grep -q "crate-type.*cdylib" Cargo.toml; then
    echo "Adding crate-type to Cargo.toml..."
    
    # Create a backup of the original Cargo.toml
    cp Cargo.toml Cargo.toml.backup
    
    # Extract the package name from the original Cargo.toml
    package_name=$(grep -A 10 "\[package\]" Cargo.toml.backup | grep "name" | head -1 | cut -d'"' -f2)
    
    # If we can't find the package name, use "vodozemac" as default
    if [ -z "$package_name" ]; then
        package_name="vodozemac"
    fi
    
    # Create a new Cargo.toml with the correct crate-type
    cat > Cargo.toml.new << EOF
[package]
name = "$package_name"
version = "0.5.0"
edition = "2021"
description = "A Rust implementation of Olm and Megolm cryptographic ratchets"
license = "Apache-2.0"
repository = "https://github.com/matrix-org/vodozemac"
readme = "README.md"
keywords = ["matrix", "olm", "megolm", "cryptography", "crypto"]
categories = ["cryptography", "no-std"]

[lib]
name = "$package_name"
crate-type = ["cdylib", "rlib"]

[dependencies]
aes = "0.8"
base64 = "0.22"
curve25519-dalek = { version = "4", features = ["serde"] }
ed25519-dalek = { version = "2", features = ["serde"] }
getrandom = "0.2"
hmac = "0.12"
matrix-pickle = "0.1"
pbkdf2 = { version = "0.12", default-features = false }
prost = "0.12"
rand = "0.8"
serde = { version = "1.0", features = ["derive"] }
serde_json = "1.0"
sha2 = "0.10"
thiserror = "1.0"
x25519-dalek = { version = "2", features = ["serde", "static_secrets"] }
zeroize = { version = "1.5", features = ["serde"] }

[target.'cfg(target_arch = "wasm32")'.dependencies]
getrandom = { version = "0.2", features = ["js"] }

[dev-dependencies]
anyhow = "1.0"
assert_matches = "1.5"
proptest = "1.0"
serde_json = "1.0"

[build-dependencies]
prost-build = "0.12"

[features]
default = []
low-level-api = []
EOF

    # Replace the original Cargo.toml with our new one
    mv Cargo.toml.new Cargo.toml
    
    echo "Successfully created new Cargo.toml with crate-type configuration"
    echo "Current Cargo.toml content:"
    cat Cargo.toml
fi

# Install wasm-pack if not already installed
if ! command -v wasm-pack &> /dev/null; then
    echo "Installing wasm-pack..."
    cargo install wasm-pack
fi

# Build wasm
echo "Building WASM package..."
echo "Verifying Cargo.toml configuration before build:"
if grep -q "crate-type.*cdylib" Cargo.toml; then
    echo "✓ crate-type is correctly configured"
    echo "Current [lib] section:"
    grep -A 3 "\[lib\]" Cargo.toml
else
    echo "✗ ERROR: crate-type is not configured correctly"
    echo "Current Cargo.toml content:"
    cat Cargo.toml
    exit 1
fi

wasm-pack build --target web
cd ..

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
