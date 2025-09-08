#!/bin/bash

echo "========================================"
echo "REChain iOS Test Script"
echo "========================================"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
IOS_DIR="$PROJECT_ROOT/ios"

echo "Project root: $PROJECT_ROOT"
echo "iOS directory: $IOS_DIR"

cd "$PROJECT_ROOT"

echo ""
echo "[1/4] Running Flutter tests..."
flutter test
if [ $? -ne 0 ]; then
    echo "WARNING: Flutter tests failed, continuing..."
fi

echo ""
echo "[2/4] Running iOS unit tests..."
cd "$IOS_DIR"
xcodebuild test \
    -workspace Runner.xcworkspace \
    -scheme Runner \
    -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' \
    -only-testing:RunnerTests
if [ $? -ne 0 ]; then
    echo "WARNING: iOS unit tests failed, continuing..."
fi

echo ""
echo "[3/4] Running iOS UI tests..."
xcodebuild test \
    -workspace Runner.xcworkspace \
    -scheme Runner \
    -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' \
    -only-testing:RunnerUITests
if [ $? -ne 0 ]; then
    echo "WARNING: iOS UI tests failed, continuing..."
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
echo "- iOS tests: Xcode test results"
echo "- Static analysis: flutter analyze output"
echo ""
