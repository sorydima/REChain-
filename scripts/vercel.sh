#!/bin/bash
set -e

echo "=== Установка Rust ==="
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

echo "=== Клонирование vodozemac и сборка wasm ==="
git clone https://github.com/matrix-org/vodozemac.git
cd vodozemac

# Добавляем crate-type в Cargo.toml
sed -i '/\[lib\]/,+2d' Cargo.toml || true
echo -e "[lib]\ncrate-type = [\"cdylib\", \"rlib\"]" >> Cargo.toml

cargo install wasm-pack --force
wasm-pack build --target web
cd ..

echo "=== Генерация локалей ==="
cd scripts
chmod +x generate_locale_config.sh generate-locale-config.sh
./generate_locale_config.sh
./generate-locale-config.sh
cd ..

echo "=== Клонирование dart-vodozemac и сборка bindings ==="
git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
cd .vodozemac
cargo install flutter_rust_bridge_codegen --force
flutter_rust_bridge_codegen build-web --dart-root dart --rust-root rust --release
cd ..
rm -f ./assets/vodozemac/vodozemac_bindings_dart*
mv .vodozemac/dart/web/pkg/vodozemac_bindings_dart* ./assets/vodozemac/
rm -rf .vodozemac

echo "=== Flutter config и билд web ==="
flutter config --no-analytics
flutter/bin/flutter build web --release
