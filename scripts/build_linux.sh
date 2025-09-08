#!/bin/bash

# REChain Linux Build Script
# This script builds the REChain application for Linux with all native services

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
DIST_DIR="$PROJECT_ROOT/dist"
BUILD_TYPE="${BUILD_TYPE:-Release}"
FLUTTER_BUILD_MODE="${FLUTTER_BUILD_MODE:-release}"

echo -e "${BLUE}=== REChain Linux Build Script ===${NC}"
echo -e "${BLUE}Project Root: $PROJECT_ROOT${NC}"
echo -e "${BLUE}Build Type: $BUILD_TYPE${NC}"
echo -e "${BLUE}Flutter Mode: $FLUTTER_BUILD_MODE${NC}"

# Function to print status messages
print_status() {
    echo -e "${GREEN}[BUILD]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check dependencies
print_status "Checking build dependencies..."

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
    exit 1
fi

# Check if CMake is installed
if ! command -v cmake &> /dev/null; then
    print_error "CMake is not installed"
    exit 1
fi

# Check if pkg-config is installed
if ! command -v pkg-config &> /dev/null; then
    print_error "pkg-config is not installed"
    exit 1
fi

# Check required system libraries
print_status "Checking system dependencies..."

MISSING_DEPS=()

if ! pkg-config --exists gtk+-3.0; then
    MISSING_DEPS+=("libgtk-3-dev")
fi

if ! pkg-config --exists libnotify; then
    MISSING_DEPS+=("libnotify-dev")
fi

if ! pkg-config --exists gio-2.0; then
    MISSING_DEPS+=("libglib2.0-dev")
fi

if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
    print_error "Missing system dependencies: ${MISSING_DEPS[*]}"
    print_error "Install with: sudo apt-get install ${MISSING_DEPS[*]}"
    exit 1
fi

print_status "All dependencies are available"

# Clean previous build
if [ "$1" = "clean" ] || [ "$1" = "--clean" ]; then
    print_status "Cleaning previous build..."
    rm -rf "$BUILD_DIR"
    rm -rf "$PROJECT_ROOT/linux/build"
    flutter clean
fi

# Create build directory
mkdir -p "$BUILD_DIR"
mkdir -p "$DIST_DIR"

# Navigate to project root
cd "$PROJECT_ROOT"

# Flutter build
print_status "Building Flutter application..."
flutter config --enable-linux-desktop
flutter pub get

if [ "$FLUTTER_BUILD_MODE" = "debug" ]; then
    flutter build linux --debug
else
    flutter build linux --release
fi

if [ $? -ne 0 ]; then
    print_error "Flutter build failed"
    exit 1
fi

print_status "Flutter build completed successfully"

# Native build with CMake
print_status "Building native components..."
cd "$PROJECT_ROOT/linux"

# Configure CMake
cmake -B build -S . \
    -DCMAKE_BUILD_TYPE="$BUILD_TYPE" \
    -DCMAKE_INSTALL_PREFIX="$BUILD_DIR/bundle"

if [ $? -ne 0 ]; then
    print_error "CMake configuration failed"
    exit 1
fi

# Build
cmake --build build --config "$BUILD_TYPE" --parallel $(nproc)

if [ $? -ne 0 ]; then
    print_error "Native build failed"
    exit 1
fi

print_status "Native build completed successfully"

# Install to bundle directory
print_status "Installing application bundle..."
cmake --install build --config "$BUILD_TYPE"

if [ $? -ne 0 ]; then
    print_error "Installation failed"
    exit 1
fi

# Copy additional resources
print_status "Copying additional resources..."

# Copy desktop file
if [ -f "$PROJECT_ROOT/assets/linux/rechainonline.desktop" ]; then
    cp "$PROJECT_ROOT/assets/linux/rechainonline.desktop" "$BUILD_DIR/bundle/"
fi

# Copy icon files
if [ -d "$PROJECT_ROOT/assets" ]; then
    mkdir -p "$BUILD_DIR/bundle/icons"
    find "$PROJECT_ROOT/assets" -name "*.png" -o -name "*.svg" -o -name "*.ico" | while read icon; do
        cp "$icon" "$BUILD_DIR/bundle/icons/" 2>/dev/null || true
    done
fi

# Create distribution package
print_status "Creating distribution package..."

DIST_NAME="rechainonline-$(date +%Y%m%d)-linux"
DIST_PATH="$DIST_DIR/$DIST_NAME"

# Remove existing distribution
rm -rf "$DIST_PATH"
mkdir -p "$DIST_PATH"

# Copy bundle
cp -r "$BUILD_DIR/bundle"/* "$DIST_PATH/"

# Create launcher script
cat > "$DIST_PATH/rechainonline.sh" << 'EOF'
#!/bin/bash
# REChain Linux Launcher Script

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set library path
export LD_LIBRARY_PATH="$SCRIPT_DIR/lib:$LD_LIBRARY_PATH"

# Launch the application
exec "$SCRIPT_DIR/rechainonline" "$@"
EOF

chmod +x "$DIST_PATH/rechainonline.sh"

# Create archive
cd "$DIST_DIR"
tar -czf "$DIST_NAME.tar.gz" "$DIST_NAME"

print_status "Distribution package created: $DIST_DIR/$DIST_NAME.tar.gz"

# Build information
print_status "Build completed successfully!"
echo -e "${GREEN}Build Information:${NC}"
echo -e "  Build Type: $BUILD_TYPE"
echo -e "  Flutter Mode: $FLUTTER_BUILD_MODE"
echo -e "  Bundle Location: $BUILD_DIR/bundle"
echo -e "  Distribution: $DIST_DIR/$DIST_NAME.tar.gz"
echo -e "  Executable: $DIST_PATH/rechainonline"

# Test run (optional)
if [ "$2" = "test" ] || [ "$2" = "--test" ]; then
    print_status "Running quick test..."
    "$DIST_PATH/rechainonline" --version || true
fi

print_status "Linux build process completed!"
