#!/bin/bash

set -euxo pipefail

echo "📦 Installing Rust & WebAssembly tooling..."

# Install Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"

# Add required targets and tools
rustup component add llvm-tools-preview
rustup target add wasm32-unknown-unknown
cargo install wasm-pack
cargo install flutter_rust_bridge_codegen

# Show versions
rustc --version
cargo --version

# Clone vodozemac for building WASM bindings
echo "📦 Cloning and building vodozemac..."
git clone https://github.com/matrix-org/vodozemac.git
cd vodozemac
wasm-pack build --target web
cd ..

# Generate locale config if needed
echo "🌍 Generating locale config..."
chmod +x scripts/generate_locale_config.sh || true
./scripts/generate_locale_config.sh || true

chmod +x scripts/generate-locale-config.sh || true
./scripts/generate-locale-config.sh || true

# Clone Dart bindings
echo "🔁 Cloning dart-vodozemac and generating bridge code..."
git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
cd .vodozemac

flutter_rust_bridge_codegen build-web \
  --dart-root dart \
  --rust-root "$(readlink -f rust)" \
  --release
cd ..

# Move and clean up
mkdir -p assets/vodozemac
rm -f ./assets/vodozemac/vodozemac_bindings_dart*
mv .vodozemac/dart/web/pkg/vodozemac_bindings_dart* ./assets/vodozemac/
rm -rf .vodozemac vodozemac

# Prepare build output
mkdir -p build
cp -r public/* build/

echo "✅ Build completed for Vercel"
