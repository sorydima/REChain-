#!/bin/bash
set -e

# Install rustup silently
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Source cargo environment
source $HOME/.cargo/env

# Add rust components and targets
rustup component add llvm-tools-preview
rustup target add wasm32-unknown-unknown

# Show rustc and cargo versions
rustc --version
cargo --version

# Clone vodozemac repository
git clone https://github.com/matrix-org/vodozemac.git
cd vodozemac

# Install wasm-pack and build wasm target
cargo install wasm-pack
wasm-pack build --target web

cd ..

# Run locale config scripts
cd scripts
chmod +x generate_locale_config.sh
./generate_locale_config.sh
chmod +x generate-locale-config.sh
./generate-locale-config.sh
cd ..

# Clone dart-vodozemac repository and run flutter_rust_bridge_codegen build-web
git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
cd .vodozemac

cargo install flutter_rust_bridge_codegen
flutter_rust_bridge_codegen build-web --dart-root dart --rust-root $(readlink -f rust) --release

cd ..

# Move generated dart bindings to assets and clean up
rm -f ./assets/vodozemac/vodozemac_bindings_dart*
mv .vodozemac/dart/web/pkg/vodozemac_bindings_dart* ./assets/vodozemac/
rm -rf .vodozemac

# Note: Flutter and cmake installation commands are Windows-specific and omitted here.
# Ensure flutter and cmake are installed in your environment separately if needed.

echo "vercel.sh script completed successfully."
