#!/bin/bash
set -e

error_exit() {
    echo "❌ $1"
    exit 1
}

echo "=== Установка Dart SDK ==="
curl -s -O https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-x64-release.zip \
    || error_exit "Не удалось скачать Dart SDK"
unzip -q dartsdk-linux-x64-release.zip -d "$PWD/dart-sdk"
export PATH="$PWD/dart-sdk/dart-sdk/bin:$PATH"
command -v dart >/dev/null || error_exit "Dart не установился"

echo "=== Установка Flutter ==="
if [ ! -d flutter ]; then
    git clone --depth 1 https://github.com/flutter/flutter.git || error_exit "Не удалось клонировать Flutter"
fi
export PATH="$PWD/flutter/bin:$PATH"
command -v flutter >/dev/null || error_exit "Flutter не установился"

echo "=== Установка Rust и nightly toolchain с компонентами ==="
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
elif [ -f "$PWD/.cargo/env" ]; then
    source "$PWD/.cargo/env"
elif [ -f "/root/.cargo/env" ]; then
    source "/root/.cargo/env"
else
    echo "⚠️ Не найден файл .cargo/env, продолжаем без source"
fi

NIGHTLY_VER=nightly-2025-07-01

rustup install "$NIGHTLY_VER" || error_exit "Не удалось установить Rust nightly $NIGHTLY_VER"
rustup component add rust-src --toolchain "$NIGHTLY_VER" || error_exit "Не удалось установить rust-src для $NIGHTLY_VER"
rustup component add llvm-tools-preview --toolchain "$NIGHTLY_VER" || error_exit "Не удалось установить llvm-tools-preview для $NIGHTLY_VER"
rustup default "$NIGHTLY_VER"

command -v cargo >/dev/null || error_exit "Rust не установился"

echo "=== Проверка установленных компонентов ==="
if rustup component list --toolchain "$NIGHTLY_VER" | grep -q "^rust-src.*(installed)"; then
    echo "rust-src установлен"
else
    error_exit "rust-src не установлен"
fi

if rustup component list --toolchain "$NIGHTLY_VER" | grep -q "^llvm-tools-preview.*(installed)"; then
    echo "llvm-tools-preview установлен"
else
    error_exit "llvm-tools-preview не установлен"
fi

echo "=== Клонирование vodozemac и сборка wasm ==="
rm -rf vodozemac
git clone https://github.com/sorydima/vodozemac.git || error_exit "Не удалось клонировать vodozemac"
cd vodozemac

sed -i '/^\[lib\]/,+2d' Cargo.toml || true
echo -e "[lib]\ncrate-type = [\"cdylib\", \"rlib\"]" >> Cargo.toml
sed -i '/^getrandom = /d' Cargo.toml
echo 'getrandom = { version = "0.2.16", features = ["js"] }' >> Cargo.toml

cargo install wasm-pack --force
rustup run "$NIGHTLY_VER" wasm-pack build --target web || error_exit "Сборка wasm не удалась"
cd ..

echo "=== Генерация локалей ==="
chmod +x scripts/generate_locale_config.sh scripts/generate_locale-config.sh
scripts/generate_locale_config.sh || error_exit "Ошибка при generate_locale_config.sh"
scripts/generate_locale_config.sh || error_exit "Ошибка при generate_locale_config.sh"

echo "=== Клонирование dart-vodozemac и сборка bindings ==="
rm -rf .vodozemac
git clone https://github.com/famedly/dart-vodozemac.git .vodozemac || error_exit "Не удалось клонировать dart-vodozemac"
cd .vodozemac

if [ -d rust ] && [ -f rust/Cargo.toml ] && [ -f rust/src/lib.rs ]; then
    RUST_PATH=$(cd rust && pwd)
else
    error_exit "В dart-vodozemac нет корректной папки rust"
fi

cargo install flutter_rust_bridge_codegen --force

export FRB_DART_RUN_COMMAND_STDERR=1
rustup run "$NIGHTLY_VER" flutter_rust_bridge_codegen build-web \
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
