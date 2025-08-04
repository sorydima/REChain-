#!/bin/bash
set -euo pipefail

echo "🦀 Installing Rust toolchain..."
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustup target add wasm32-unknown-unknown

echo "📦 Installing wasm-pack..."
cargo install wasm-pack

# Патчим Cargo.toml, если нужно
CARGO_TOML_PATH="vodozemac/Cargo.toml"
if grep -q "\[lib\]" "$CARGO_TOML_PATH"; then
  if ! grep -q "crate-type" "$CARGO_TOML_PATH"; then
    echo "🔧 Adding crate-type to $CARGO_TOML_PATH"
    sed -i '/\[lib\]/a crate-type = ["cdylib", "rlib"]' "$CARGO_TOML_PATH"
  else
    echo "✅ crate-type already set in $CARGO_TOML_PATH"
  fi
else
  echo "🔧 Adding [lib] section with crate-type to $CARGO_TOML_PATH"
  printf "\n[lib]\ncrate-type = [\"cdylib\", \"rlib\"]\n" >> "$CARGO_TOML_PATH"
fi

echo "🚀 Building Rust WASM module..."
cd vodozemac
wasm-pack build --target web --release
cd ..

echo "🦋 Installing Flutter SDK..."
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi
export PATH="$PWD/flutter/bin:$PATH"
flutter config --enable-web
flutter pub get

echo "🌐 Building Flutter web app..."
flutter build web --release

echo "📁 Moving build output to public directory..."
mkdir -p public
cp -r build/web/* public/

echo "✅ Build finished successfully"
