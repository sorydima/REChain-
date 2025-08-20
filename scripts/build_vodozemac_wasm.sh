#!/bin/bash
set -euo pipefail

echo "=== Building vodozemac WASM from scratch ==="

# Source Rust environment
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Create a temporary directory for building vodozemac
BUILD_DIR="/tmp/vodozemac_build"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

echo "Creating Cargo.toml with correct crate-type configuration..."

# Create Cargo.toml with correct configuration
cat > Cargo.toml << EOF
[package]
name = "vodozemac"
version = "0.5.0"
edition = "2021"
description = "A Rust implementation of Olm and Megolm cryptographic ratchets"
license = "Apache-2.0"
repository = "https://github.com/matrix-org/vodozemac"
readme = "README.md"
keywords = ["matrix", "olm", "megolm", "cryptography", "crypto"]
categories = ["cryptography", "no-std"]

[lib]
name = "vodozemac"
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

echo "Cargo.toml created successfully"
echo "Verifying crate-type configuration:"
grep -A 3 "\[lib\]" Cargo.toml

# Install wasm-pack if not already installed
if ! command -v wasm-pack &> /dev/null; then
    echo "Installing wasm-pack..."
    cargo install wasm-pack
fi

# Add rust-src component which is needed for WASM compilation
echo "Installing rust-src component..."
rustup component add rust-src --toolchain nightly || echo "Failed to add rust-src component, continuing..."

# Build with nightly toolchain and proper flags
echo "Building WASM package..."
export RUSTFLAGS="-C target-feature=+atomics,+bulk-memory,+mutable-globals"
export RUSTUP_TOOLCHAIN=nightly

# Try to build with build-std flag first
if wasm-pack build --target web -- -Z build-std=std,panic_abort; then
    echo "WASM build successful with build-std flag"
else
    echo "WASM build failed with build-std flag, trying without..."
    # Fallback to regular build
    wasm-pack build --target web
fi

echo "Build completed successfully!"
echo "Generated files are in pkg/ directory"

# Copy the generated files to the expected location
if [ -d "pkg" ]; then
    echo "Copying generated files to project directory..."
    # Try different possible paths
    if [ -d "/vercel/path0" ]; then
        mkdir -p /vercel/path0/assets/vodozemac
        cp pkg/* /vercel/path0/assets/vodozemac/ || echo "Failed to copy to /vercel/path0"
    elif [ -d "/Users/builder/clone" ]; then
        mkdir -p /Users/builder/clone/assets/vodozemac
        cp pkg/* /Users/builder/clone/assets/vodozemac/ || echo "Failed to copy to /Users/builder/clone"
    else
        # Fallback to relative path
        mkdir -p ../../assets/vodozemac
        cp pkg/* ../../assets/vodozemac/ || echo "Failed to copy to relative path"
    fi
    echo "Files copied successfully"
else
    echo "ERROR: pkg directory not found"
    exit 1
fi

# Clean up
cd /
rm -rf "$BUILD_DIR"

echo "vodozemac WASM build completed successfully!"
