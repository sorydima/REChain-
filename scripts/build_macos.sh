#!/bin/bash

echo "========================================"
echo "REChain macOS Build Script"
echo "========================================"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
MACOS_DIR="$PROJECT_ROOT/macos"

echo "Project root: $PROJECT_ROOT"
echo "macOS directory: $MACOS_DIR"

cd "$PROJECT_ROOT"

echo ""
echo "[1/6] Cleaning Flutter project..."
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
echo "[3/6] Installing macOS pods..."
cd "$MACOS_DIR"
pod install --repo-update
if [ $? -ne 0 ]; then
    echo "WARNING: Pod install failed, continuing..."
fi

cd "$PROJECT_ROOT"

echo ""
echo "[4/6] Building macOS Debug..."
flutter build macos --debug
if [ $? -ne 0 ]; then
    echo "ERROR: macOS debug build failed"
    exit 1
fi

echo ""
echo "[5/6] Building macOS Release..."
flutter build macos --release
if [ $? -ne 0 ]; then
    echo "ERROR: macOS release build failed"
    exit 1
fi

echo ""
echo "[6/6] Creating macOS Archive (if signing configured)..."
if [ -f "$MACOS_DIR/ExportOptions.plist" ]; then
    xcodebuild -workspace "$MACOS_DIR/Runner.xcworkspace" \
               -scheme Runner \
               -configuration Release \
               -archivePath "$PROJECT_ROOT/build/macos/Runner.xcarchive" \
               archive
    
    if [ $? -eq 0 ]; then
        echo "Archive created successfully"
        
        xcodebuild -exportArchive \
                   -archivePath "$PROJECT_ROOT/build/macos/Runner.xcarchive" \
                   -exportPath "$PROJECT_ROOT/build/macos/app" \
                   -exportOptionsPlist "$MACOS_DIR/ExportOptions.plist"
        
        if [ $? -eq 0 ]; then
            echo "App exported successfully"
        else
            echo "WARNING: App export failed"
        fi
    else
        echo "WARNING: Archive creation failed"
    fi
else
    echo "No ExportOptions.plist found, skipping archive"
fi

echo ""
echo "========================================"
echo "macOS build completed!"
echo "========================================"
echo ""
echo "Build outputs:"
echo "- Debug build: build/macos/Build/Products/Debug/REChain.app"
echo "- Release build: build/macos/Build/Products/Release/REChain.app"
if [ -f "$PROJECT_ROOT/build/macos/app/REChain.app" ]; then
    echo "- Exported app: build/macos/app/REChain.app"
fi
echo ""
