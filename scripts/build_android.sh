#!/bin/bash

echo "========================================"
echo "REChain Android Build Script"
echo "========================================"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
ANDROID_DIR="$PROJECT_ROOT/android"

echo "Project root: $PROJECT_ROOT"
echo "Android directory: $ANDROID_DIR"

cd "$PROJECT_ROOT"

echo ""
echo "[1/6] Cleaning previous builds..."
flutter clean
if [ $? -ne 0 ]; then
    echo "ERROR: Flutter clean failed"
    exit 1
fi

echo ""
echo "[2/6] Getting Flutter dependencies..."
flutter pub get
if [ $? -ne 0 ]; then
    echo "ERROR: Flutter pub get failed"
    exit 1
fi

echo ""
echo "[3/6] Generating code..."
flutter packages pub run build_runner build --delete-conflicting-outputs
if [ $? -ne 0 ]; then
    echo "WARNING: Code generation failed, continuing..."
fi

echo ""
echo "[4/6] Building Android APK (Debug)..."
flutter build apk --debug
if [ $? -ne 0 ]; then
    echo "ERROR: Debug APK build failed"
    exit 1
fi

echo ""
echo "[5/6] Building Android APK (Release)..."
flutter build apk --release
if [ $? -ne 0 ]; then
    echo "ERROR: Release APK build failed"
    exit 1
fi

echo ""
echo "[6/6] Building Android App Bundle (Release)..."
flutter build appbundle --release
if [ $? -ne 0 ]; then
    echo "ERROR: App Bundle build failed"
    exit 1
fi

echo ""
echo "========================================"
echo "Build completed successfully!"
echo "========================================"
echo ""
echo "Output files:"
echo "- Debug APK: build/app/outputs/flutter-apk/app-debug.apk"
echo "- Release APK: build/app/outputs/flutter-apk/app-release.apk"
echo "- App Bundle: build/app/outputs/bundle/release/app-release.aab"
echo ""
