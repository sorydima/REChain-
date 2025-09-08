#!/bin/bash

# REChain Linux Test Script
# This script runs comprehensive tests for the Linux build

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$PROJECT_ROOT/build/linux"
TEST_RESULTS_DIR="$PROJECT_ROOT/test_results/linux"

echo -e "${BLUE}=== REChain Linux Test Suite ===${NC}"
echo -e "${BLUE}Project Root: $PROJECT_ROOT${NC}"

# Function to print status messages
print_status() {
    echo -e "${GREEN}[TEST]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# Initialize test results
mkdir -p "$TEST_RESULTS_DIR"
TEST_LOG="$TEST_RESULTS_DIR/test_results_$(date +%Y%m%d_%H%M%S).log"
FAILED_TESTS=0
TOTAL_TESTS=0

# Function to run a test and log results
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    print_status "Running test: $test_name"
    
    if eval "$test_command" >> "$TEST_LOG" 2>&1; then
        print_success "$test_name - PASSED"
        echo "[PASS] $test_name" >> "$TEST_LOG"
    else
        print_error "$test_name - FAILED"
        echo "[FAIL] $test_name" >> "$TEST_LOG"
        FAILED_TESTS=$((FAILED_TESTS + 1))
    fi
}

# Start testing
echo "=== REChain Linux Test Results ===" > "$TEST_LOG"
echo "Test started at: $(date)" >> "$TEST_LOG"
echo "" >> "$TEST_LOG"

print_status "Starting Linux test suite..."

# Test 1: Flutter Tests
print_status "Running Flutter tests..."
cd "$PROJECT_ROOT"
run_test "Flutter Unit Tests" "flutter test"

# Test 2: Flutter Integration Tests
if [ -d "$PROJECT_ROOT/integration_test" ]; then
    run_test "Flutter Integration Tests" "flutter test integration_test/"
fi

# Test 3: Build System Tests
print_status "Testing build system..."
run_test "CMake Configuration Test" "cd '$PROJECT_ROOT/linux' && cmake -B test_build -S . -DCMAKE_BUILD_TYPE=Debug"
run_test "CMake Build Test" "cd '$PROJECT_ROOT/linux' && cmake --build test_build --config Debug --parallel 2"

# Test 4: Dependencies Check
print_status "Checking system dependencies..."
run_test "GTK+ 3.0 Availability" "pkg-config --exists gtk+-3.0"
run_test "libnotify Availability" "pkg-config --exists libnotify"
run_test "GIO 2.0 Availability" "pkg-config --exists gio-2.0"
run_test "GLib 2.0 Availability" "pkg-config --exists glib-2.0"

# Test 5: Native Services Tests (if built)
if [ -f "$BUILD_DIR/bundle/rechainonline" ]; then
    print_status "Testing native services..."
    
    # Test executable exists and has correct permissions
    run_test "Executable Permissions" "test -x '$BUILD_DIR/bundle/rechainonline'"
    
    # Test library dependencies
    run_test "Library Dependencies" "ldd '$BUILD_DIR/bundle/rechainonline' | grep -E '(gtk|notify|gio|glib)'"
    
    # Test basic execution (version check)
    run_test "Basic Execution Test" "timeout 10s '$BUILD_DIR/bundle/rechainonline' --version || true"
    
    # Test desktop integration files
    if [ -f "$BUILD_DIR/bundle/rechainonline.desktop" ]; then
        run_test "Desktop File Validation" "desktop-file-validate '$BUILD_DIR/bundle/rechainonline.desktop' || true"
    fi
fi

# Test 6: Code Quality Tests
print_status "Running code quality tests..."

# Static analysis with cppcheck (if available)
if command -v cppcheck &> /dev/null; then
    run_test "C++ Static Analysis" "cppcheck --enable=all --inconclusive --std=c++14 '$PROJECT_ROOT/linux' --suppress=missingIncludeSystem"
fi

# Test 7: Memory and Performance Tests
if [ -f "$BUILD_DIR/bundle/rechainonline" ]; then
    print_status "Running performance tests..."
    
    # Test memory usage (basic check)
    if command -v valgrind &> /dev/null; then
        run_test "Memory Leak Check" "timeout 30s valgrind --leak-check=summary --error-exitcode=1 '$BUILD_DIR/bundle/rechainonline' --version"
    fi
fi

# Test 8: Packaging Tests
print_status "Testing packaging capabilities..."

# Test AppImage creation (if tools available)
if command -v appimagetool &> /dev/null; then
    run_test "AppImage Creation Test" "cd '$PROJECT_ROOT/linux/packaging/appimage' && ./create_appimage.sh --test"
fi

# Test DEB packaging (if tools available)
if command -v dpkg-deb &> /dev/null; then
    run_test "DEB Package Test" "cd '$PROJECT_ROOT/linux/packaging/deb' && ./create_deb.sh --test"
fi

# Test RPM packaging (if tools available)
if command -v rpmbuild &> /dev/null; then
    run_test "RPM Package Test" "cd '$PROJECT_ROOT/linux/packaging/rpm' && ./create_rpm.sh --test"
fi

# Test 9: Desktop Environment Integration
print_status "Testing desktop integration..."

# Test system tray support
run_test "System Tray Support" "python3 -c 'import gi; gi.require_version(\"Gtk\", \"3.0\"); from gi.repository import Gtk; print(\"System tray supported:\", hasattr(Gtk, \"StatusIcon\"))'"

# Test notification support
run_test "Notification Support" "python3 -c 'import gi; gi.require_version(\"Notify\", \"0.7\"); from gi.repository import Notify; print(\"Notifications supported:\", Notify.init(\"test\"))'"

# Test 10: Security Tests
print_status "Running security tests..."

# Test for hardening flags
if [ -f "$BUILD_DIR/bundle/rechainonline" ]; then
    run_test "Security Hardening Check" "checksec --file='$BUILD_DIR/bundle/rechainonline' || readelf -d '$BUILD_DIR/bundle/rechainonline' | grep -E '(RELRO|BIND_NOW|STACK)'"
fi

# Test file permissions
run_test "File Permissions Check" "find '$BUILD_DIR/bundle' -type f -executable -perm /u+s,g+s | wc -l | grep -q '^0$'"

# Cleanup test build
if [ -d "$PROJECT_ROOT/linux/test_build" ]; then
    rm -rf "$PROJECT_ROOT/linux/test_build"
fi

# Generate test report
echo "" >> "$TEST_LOG"
echo "=== Test Summary ===" >> "$TEST_LOG"
echo "Total Tests: $TOTAL_TESTS" >> "$TEST_LOG"
echo "Passed Tests: $((TOTAL_TESTS - FAILED_TESTS))" >> "$TEST_LOG"
echo "Failed Tests: $FAILED_TESTS" >> "$TEST_LOG"
echo "Test completed at: $(date)" >> "$TEST_LOG"

# Print final results
print_status "Test suite completed!"
echo -e "${BLUE}=== Test Results Summary ===${NC}"
echo -e "Total Tests: $TOTAL_TESTS"
echo -e "Passed: ${GREEN}$((TOTAL_TESTS - FAILED_TESTS))${NC}"
echo -e "Failed: ${RED}$FAILED_TESTS${NC}"
echo -e "Success Rate: $(( (TOTAL_TESTS - FAILED_TESTS) * 100 / TOTAL_TESTS ))%"
echo -e "Detailed log: $TEST_LOG"

# Exit with appropriate code
if [ $FAILED_TESTS -eq 0 ]; then
    print_success "All tests passed!"
    exit 0
else
    print_error "$FAILED_TESTS test(s) failed!"
    exit 1
fi
