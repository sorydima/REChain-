#!/bin/bash
set -e

echo "=== Установка Rust через rustup ==="
curl https://sh.rustup.rs -sSf | sh -s -- -y

export PATH="$HOME/.cargo/bin:$PATH"

echo "=== Клонирование vodozemac и сборка wasm ==="
git clone https://github.com/matrix-org/vodozemac.git
cd vodozemac

cargo install wasm-pack --force

wasm-pack build --target web
cd ..

echo "=== Запуск скриптов генерации локалей ==="
cd scripts
chmod +x generate_locale_config.sh generate-locale-config.sh
./generate_locale_config.sh
./generate-locale-config.sh
cd ..

echo "=== Клонирование dart-vodozemac и сборка bindings ==="
git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
cd .vodozemac

cargo install flutter_rust_bridge_codegen --force

# readlink -f может не работать, заменим на относительный путь:
flutter_rust_bridge_codegen build-web --dart-root dart --rust-root rust --release
cd ..

echo "=== Перемещение сгенерированных dart bindings ==="
rm -f ./assets/vodozemac/vodozemac_bindings_dart*
mv .vodozemac/dart/web/pkg/vodozemac_bindings_dart* ./assets/vodozemac/

echo "=== Очистка временных файлов ==="
rm -rf .vodozemac

echo "=== Отключение аналитики Flutter ==="
flutter config --no-analytics

echo "=== Сборка Flutter Web ==="
flutter build web
