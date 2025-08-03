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
    
    # Try the patch approach first
    echo "Trying patch approach..."
    cp ../scripts/vodozemac-cargo.patch Cargo.toml.patched
    
    # Copy the original lib section and name if they exist
    if grep -q "\[lib\]" Cargo.toml; then
        # Extract the lib section from original and merge with our patch
        name_line=$(grep -A 5 "\[lib\]" Cargo.toml | grep "name" | head -1)
        
        if [ ! -z "$name_line" ]; then
            # Replace the name in our patch with the original name
            sed -i "s/name = \"vodozemac\"/$name_line/" Cargo.toml.patched
        fi
        
        # Replace the entire Cargo.toml with our patched version
        cp Cargo.toml.patched Cargo.toml
    else
        # Just append our patch to the end of the file
        echo "" >> Cargo.toml
        cat Cargo.toml.patched >> Cargo.toml
    fi
    
    # Verify that crate-type was added, if not try sed approach
    if ! grep -q "crate-type.*cdylib" Cargo.toml; then
        echo "Patch approach failed, trying sed approach..."
        # First make sure there's a [lib] section
        if ! grep -q "\[lib\]" Cargo.toml; then
            echo "" >> Cargo.toml
            echo "[lib]" >> Cargo.toml
        fi
        # Add crate-type after [lib] section using sed
        sed -i '/\[lib\]/a crate-type = ["cdylib", "rlib"]' Cargo.toml
    fi
    
    # Final verification
    if grep -q "crate-type.*cdylib" Cargo.toml; then
        echo "Successfully added crate-type to Cargo.toml"
    else
        echo "WARNING: Failed to add crate-type to Cargo.toml"
        echo "Current Cargo.toml content:"
        cat Cargo.toml
    fi
fi

# Install wasm-pack if not already installed
if ! command -v wasm-pack &> /dev/null; then
    echo "Installing wasm-pack..."
    cargo install wasm-pack
fi

# Build wasm
echo "Building WASM package..."
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
