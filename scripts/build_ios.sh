#!/bin/bash

echo "========================================"
echo "REChain iOS Build Script"
echo "========================================"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
IOS_DIR="$PROJECT_ROOT/ios"

echo "Project root: $PROJECT_ROOT"
echo "iOS directory: $IOS_DIR"

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
echo "[3/6] Installing iOS pods..."
cd "$IOS_DIR"
pod install --repo-update
if [ $? -ne 0 ]; then
    echo "WARNING: Pod install failed, continuing..."
fi

cd "$PROJECT_ROOT"

echo ""
echo "[4/6] Building iOS Debug..."
flutter build ios --debug --no-codesign
if [ $? -ne 0 ]; then
    echo "ERROR: iOS debug build failed"
    exit 1
fi

echo ""
echo "[5/6] Building iOS Release..."
flutter build ios --release --no-codesign
if [ $? -ne 0 ]; then
    echo "ERROR: iOS release build failed"
    exit 1
fi

echo ""
echo "[6/6] Building iOS Archive (if signing configured)..."
if [ -f "$IOS_DIR/ExportOptions.plist" ]; then
    xcodebuild -workspace "$IOS_DIR/Runner.xcworkspace" \
               -scheme Runner \
               -configuration Release \
               -archivePath "$PROJECT_ROOT/build/ios/Runner.xcarchive" \
               archive
    
    if [ $? -eq 0 ]; then
        echo "Archive created successfully"
        
        xcodebuild -exportArchive \
                   -archivePath "$PROJECT_ROOT/build/ios/Runner.xcarchive" \
                   -exportPath "$PROJECT_ROOT/build/ios/ipa" \
                   -exportOptionsPlist "$IOS_DIR/ExportOptions.plist"
        
        if [ $? -eq 0 ]; then
            echo "IPA exported successfully"
        else
            echo "WARNING: IPA export failed"
        fi
    else
        echo "WARNING: Archive creation failed"
    fi
else
    echo "No ExportOptions.plist found, skipping archive"
fi

echo ""
echo "========================================"
echo "iOS build completed!"
echo "========================================"
echo ""
echo "Build outputs:"
echo "- Debug build: build/ios/iphoneos/Runner.app"
echo "- Release build: build/ios/iphoneos/Runner.app"
if [ -f "$PROJECT_ROOT/build/ios/ipa/REChain.ipa" ]; then
    echo "- IPA file: build/ios/ipa/REChain.ipa"
fi
echo ""
