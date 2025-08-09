#!/bin/bash
set -e

error_exit() {
    echo "❌ $1"
    exit 1
}

echo "=== Настройка окружения ==="
export HOME="/vercel"
mkdir -p "$HOME"

# Установка Dart SDK
echo "→ Устанавливаем Dart..."
curl -s -O https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip \
    || error_exit "Не удалось скачать Dart SDK"
unzip -q dartsdk-linux-x64-release.zip -d "$HOME/dart-sdk"
export PATH="$HOME/dart-sdk/dart-sdk/bin:$PATH"
command -v dart >/dev/null || error_exit "Dart не установился"

# Установка Flutter
if [ ! -d flutter ]; then
    echo "→ Клонируем Flutter..."
    git clone --depth 1 https://github.com/flutter/flutter.git \
        || error_exit "Не удалось клонировать Flutter"
fi
export PATH="$PWD/flutter/bin:$PATH"
command -v flutter >/dev/null || error_exit "Flutter не установился"

echo "=== Установка Rust ==="
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
source "$HOME/.cargo/env"
rustup update stable
rustup default stable
command -v cargo >/dev/null || error_exit "Rust не установился"

echo "=== Клонирование vodozemac и сборка wasm ==="
rm -rf vodozemac
git clone https://github.com/sorydima/vodozemac.git || error_exit "Не удалось клонировать vodozemac"
cd vodozemac

# Проверка Cargo.toml
[ -f Cargo.toml ] || error_exit "В vodozemac нет Cargo.toml"
[ -f src/lib.rs ] || error_exit "В vodozemac нет src/lib.rs"

# Настройка Cargo.toml
sed -i '/^\[lib\]/,+2d' Cargo.toml || true
echo -e "[lib]\ncrate-type = [\"cdylib\", \"rlib\"]" >> Cargo.toml
sed -i '/^getrandom = /d' Cargo.toml
echo 'getrandom = { version = "0.2.16", features = ["js"] }' >> Cargo.toml

cargo install wasm-pack --force
wasm-pack build --target web || error_exit "Сборка wasm не удалась"
cd ..

echo "=== Генерация локалей ==="
chmod +x scripts/generate_locale_config.sh scripts/generate-locale-config.sh
scripts/generate_locale_config.sh || error_exit "Ошибка при generate_locale_config.sh"
scripts/generate-locale-config.sh || error_exit "Ошибка при generate-locale-config.sh"

echo "=== Клонирование dart-vodozemac и сборка bindings ==="
rm -rf .vodozemac
git clone https://github.com/famedly/dart-vodozemac.git .vodozemac || error_exit "Не удалось клонировать dart-vodozemac"
cd .vodozemac

# Проверка rust crate внутри dart-vodozemac
if [ -d rust ] && [ -f rust/Cargo.toml ] && [ -f rust/src/lib.rs ]; then
    RUST_PATH=$(cd rust && pwd)
else
    error_exit "В dart-vodozemac нет корректной папки rust"
fi

cargo install flutter_rust_bridge_codegen --force
flutter_rust_bridge_codegen build-web \
    --dart-root dart \
    --rust-root "$RUST_PATH" \
    --release || error_exit "flutter_rust_bridge_codegen не выполнился"

cd ..
rm -f ./assets/vodozemac/vodozemac_bindings_dart*
mv .vodozemac/dart/web/pkg/vodozemac_bindings_dart* ./assets/vodozemac/ || error_exit "Не удалось переместить bindings"
rm -rf .vodozemac

echo "=== Сборка Flutter Web ==="
flutter config --no-analytics
flutter build web --release || error_exit "Сборка Flutter Web не удалась"

echo "✅ Сборка завершена успешно"
