#!/bin/bash
set -e

curl -O https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip
unzip dartsdk-linux-x64-release.zip -d $HOME/dart-sdk
export PATH="$HOME/dart-sdk/dart-sdk/bin:$PATH"

echo "=== Установка Rust ==="
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustup update stable
rustup default stable

echo "=== Клонирование vodozemac и сборка wasm ==="
git clone https://github.com/sorydima/vodozemac.git
cd vodozemac

sed -i '/^\[lib\]/,+2d' Cargo.toml || true
echo -e "[lib]\ncrate-type = [\"cdylib\", \"rlib\"]" >> Cargo.toml

# Удаляем все существующие строки с getrandom
sed -i '/^getrandom = /d' Cargo.toml

# Добавляем getrandom с нужной фичей
echo 'getrandom = { version = "0.2.16", features = ["js"] }' >> Cargo.toml

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
