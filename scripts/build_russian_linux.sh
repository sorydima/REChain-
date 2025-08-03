#!/bin/bash

set -euo pipefail

PROJECT_NAME="flutter_rus_app"
BUILD_DIR="build/linux"
DIST_DIR="dist"
ARCH=$(uname -m)
OS_NAME=""
PKG_TYPE=""

SUPPORTED_OS=(
  "RED:deb"
  "ALT:rpm"
  "ROSA:rpm"
  "OSNOVA:deb"
  "ALTER:deb"
  "ATLANT:deb"
  "STRELETS:deb"
  "MSVSPHERE:deb"
  "LOTOS:deb"
  "ELBRUS:deb"
)

detect_os() {
  echo "[INFO] Определение ОС..."
  for entry in "${SUPPORTED_OS[@]}"; do
    IFS=":" read -r name type <<< "$entry"
    if grep -qi "$name" /etc/*release 2>/dev/null; then
      OS_NAME="$name"
      PKG_TYPE="$type"
      return
    fi
  done
  echo "[WARN] ОС не определена, по умолчанию .deb"
  OS_NAME="UNKNOWN"
  PKG_TYPE="deb"
}

detect_arch() {
  case "$ARCH" in
    x86_64) echo "[INFO] Архитектура: x86_64";;
    aarch64) echo "[INFO] Архитектура: ARM64 (aarch64)";;
    e2k) echo "[INFO] Обнаружен процессор Эльбрус (e2k)";;
    *) echo "[WARN] Неизвестная архитектура: $ARCH";;
  esac
}

install_deps() {
  echo "[INFO] Установка зависимостей..."
  if command -v apt >/dev/null; then
    sudo apt update
    sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev libsqlite3-dev locales
  elif command -v dnf >/dev/null || command -v rpm >/dev/null; then
    sudo dnf install -y clang cmake ninja-build pkgconf-pkg-config gtk3-devel sqlite-devel glibc-locale-source
  elif command -v urpmi >/dev/null; then
    sudo urpmi cmake ninja pkgconfig libgtk+3.0-devel sqlite3-devel
  else
    echo "[ERROR] Не удалось определить пакетный менеджер."
    exit 1
  fi
}

configure_russian_locale() {
  echo "[INFO] Установка русской локали..."
  sudo locale-gen ru_RU.UTF-8 2>/dev/null || true
  export LANG=ru_RU.UTF-8
  export LC_ALL=ru_RU.UTF-8
}

flutter_build() {
  echo "[INFO] Сборка Flutter-приложения..."

  flutter config --enable-linux-desktop
  flutter pub get
  flutter clean

  case "$ARCH" in
    e2k)
      echo "[INFO] Сборка под Эльбрус..."
      flutter build linux --release --target-platform=linux-e2k
      ;;
    aarch64)
      echo "[INFO] Сборка под ARM64..."
      flutter build linux --release --target-platform=linux-arm64
      ;;
    *)
      flutter build linux --release
      ;;
  esac
}

package_deb() {
  echo "[INFO] Упаковка .deb..."

  mkdir -p "$DIST_DIR/DEBIAN"
  mkdir -p "$DIST_DIR/usr/local/bin"

  cp -r "$BUILD_DIR/x64/release/bundle/"* "$DIST_DIR/usr/local/bin/"

  cat <<EOF > "$DIST_DIR/DEBIAN/control"
Package: $PROJECT_NAME
Version: 1.0.0
Architecture: $ARCH
Maintainer: REChain Team
Description: Flutter-приложение для российских Linux-систем
EOF

  dpkg-deb --build "$DIST_DIR" "${PROJECT_NAME}_${ARCH}.deb"
}

package_rpm() {
  echo "[INFO] Упаковка .rpm..."

  if ! command -v fpm >/dev/null; then
    echo "[INFO] Установка fpm (требуется Ruby)..."
    sudo gem install --no-document fpm
  fi

  mkdir -p rpmroot/usr/local/bin
  cp -r "$BUILD_DIR/x64/release/bundle/"* rpmroot/usr/local/bin/

  fpm -s dir -t rpm -n "$PROJECT_NAME" -v 1.0.0 -a "$ARCH" rpmroot/
}

main() {
  detect_os
  detect_arch
  install_deps
  configure_russian_locale
  flutter_build

  case "$PKG_TYPE" in
    deb) package_deb ;;
    rpm) package_rpm ;;
    *) echo "[INFO] Только сборка без упаковки." ;;
  esac

  echo "[SUCCESS] Сборка завершена для $OS_NAME ($ARCH) как $PKG_TYPE"
}

main "$@"
