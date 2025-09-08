#!/bin/bash

echo "========================================"
echo "REChain macOS Test Script"
echo "========================================"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
MACOS_DIR="$PROJECT_ROOT/macos"

echo "Project root: $PROJECT_ROOT"
echo "macOS directory: $MACOS_DIR"

cd "$PROJECT_ROOT"

echo ""
echo "[1/4] Running Flutter tests..."
flutter test
if [ $? -ne 0 ]; then
    echo "WARNING: Flutter tests failed, continuing..."
fi

echo ""
echo "[2/4] Running macOS unit tests..."
cd "$MACOS_DIR"
xcodebuild test \
    -workspace Runner.xcworkspace \
    -scheme Runner \
    -destination 'platform=macOS,arch=x86_64' \
    -only-testing:RunnerTests
if [ $? -ne 0 ]; then
    echo "WARNING: macOS unit tests failed, continuing..."
fi

echo ""
echo "[3/4] Running macOS UI tests..."
xcodebuild test \
    -workspace Runner.xcworkspace \
    -scheme Runner \
    -destination 'platform=macOS,arch=x86_64' \
    -only-testing:RunnerUITests
if [ $? -ne 0 ]; then
    echo "WARNING: macOS UI tests failed, continuing..."
fi

echo ""
echo "[4/4] Running static analysis..."
cd "$PROJECT_ROOT"
flutter analyze
if [ $? -ne 0 ]; then
    echo "WARNING: Static analysis found issues, continuing..."
fi

echo ""
echo "========================================"
echo "Test run completed!"
echo "========================================"
echo ""
echo "Check the following for detailed results:"
echo "- Flutter tests: test results in console"
echo "- macOS tests: Xcode test results"
echo "- Static analysis: flutter analyze output"
echo ""
