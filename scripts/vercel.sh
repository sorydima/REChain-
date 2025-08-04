#!/bin/bash
set -e

echo "📦 Installing system dependencies..."
apt-get update
apt-get install -y curl git unzip libstdc++6 pkg-config libssl-dev build-essential cmake clang

echo "🦀 Installing Rust toolchain..."
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
rustup target add wasm32-unknown-unknown

echo "📦 Installing wasm-pack..."
cargo install wasm-pack

# 🔧 Ensure Cargo.toml is configured properly
echo "🔧 Patching Cargo.toml with cdylib crate-type if needed..."
if grep -q "\[lib\]" Cargo.toml; then
  if ! grep -q "crate-type" Cargo.toml; then
    sed -i '/\[lib\]/a crate-type = ["cdylib", "rlib"]' Cargo.toml
    echo "✅ Added crate-type to existing [lib] section."
  else
    echo "✅ crate-type already present in [lib]."
  fi
else
  echo -e "\n[lib]\ncrate-type = [\"cdylib\", \"rlib\"]" >> Cargo.toml
  echo "✅ Created [lib] section with crate-type."
fi

echo "🚀 Building Rust WASM module..."
cd rust || exit 1
wasm-pack build --target web
cd ..

echo "🦋 Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth=1
export PATH="$PWD/flutter/bin:$PATH"
flutter config --enable-web
flutter pub get

echo "🌐 Building Flutter web app..."
flutter build web --release

echo "📁 Moving build output to public directory..."
mkdir -p public
cp -r build/web/* public/

echo "✅ Build finished successfully"
