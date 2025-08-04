#!/bin/bash
set -euo pipefail

echo "Using custom build script"

# Устанавливаем wasm-pack вручную
curl -L https://github.com/rustwasm/wasm-pack/releases/download/v0.13.1/wasm-pack-v0.13.1-x86_64-unknown-linux-musl.tar.gz | tar xz

# Создаем .cargo/bin если её нет
mkdir -p ~/.cargo/bin

# Перемещаем wasm-pack
mv wasm-pack-v0.13.1-x86_64-unknown-linux-musl/wasm-pack ~/.cargo/bin/

# Добавляем wasm-pack в PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Билдим
wasm-pack build --release

git submodule add https://github.com/matrix-org/vodozemac.git vodozemac

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
