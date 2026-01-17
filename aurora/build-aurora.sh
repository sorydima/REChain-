#!/bin/bash
# REChain Aurora OS Build Script
# Version: 4.1.10+1160
# Last Updated: 2025-12-06

set -e

#==============================================================================
# Colors
#==============================================================================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

#==============================================================================
# Configuration
#==============================================================================
PROJECT_NAME="com.rechain.online"
VERSION="4.1.10+1160"
BUILD_TYPE="${1:-Release}"
ARCHITECTURE="${2:-armv7l}"
BUILD_DIR="build"
INSTALL_PREFIX="/usr/local"

#==============================================================================
# Functions
#==============================================================================
print_header() {
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║       REChain Aurora OS Build Script v${VERSION}            ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_step() {
    echo -e "${CYAN}📦 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

#==============================================================================
# Prerequisites Check
#==============================================================================
check_prerequisites() {
    print_step "Checking prerequisites..."
    
    local missing_deps=()
    
    # Check CMake
    if ! command -v cmake &> /dev/null; then
        missing_deps+=("cmake")
    fi
    
    # Check C++ compiler
    if ! command -v g++ &> /dev/null; then
        missing_deps+=("g++")
    fi
    
    # Check Qt5
    if ! pkg-config --exists Qt5Core; then
        missing_deps+=("qtbase5-dev")
    fi
    
    # Check Flutter
    if ! command -v flutter &> /dev/null; then
        print_warning "Flutter not found - will use pre-built Flutter assets"
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_error "Missing dependencies: ${missing_deps[*]}"
        echo "Install with:"
        echo "  sudo apt install ${missing_deps[*]}"
        exit 1
    fi
    
    print_success "All prerequisites met"
    echo ""
}

#==============================================================================
# Clean Build
#==============================================================================
clean_build() {
    print_step "Cleaning build directory..."
    
    if [ -d "$BUILD_DIR" ]; then
        rm -rf "$BUILD_DIR"
        print_success "Build directory cleaned"
    else
        print_warning "Build directory not found, nothing to clean"
    fi
    echo ""
}

#==============================================================================
# Configure Build
#==============================================================================
configure_build() {
    print_step "Configuring build..."
    echo "  Build Type: $BUILD_TYPE"
    echo "  Architecture: $ARCHITECTURE"
    echo "  Version: $VERSION"
    echo ""
    
    mkdir -p "$BUILD_DIR"
    cd "$BUILD_DIR"
    
    cmake .. \
        -DCMAKE_BUILD_TYPE="$BUILD_TYPE" \
        -DCMAKE_SYSTEM_PROCESSOR="$ARCHITECTURE" \
        -DCMAKE_INSTALL_PREFIX="$INSTALL_PREFIX" \
        -DENABLE_TESTS=ON \
        -DENABLE_COVERAGE=OFF
    
    print_success "Build configured"
    echo ""
}

#==============================================================================
# Build
#==============================================================================
build() {
    print_step "Building REChain..."
    
    cd "$BUILD_DIR"
    
    local cores=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 2)
    echo "  Using $cores CPU cores"
    echo ""
    
    # Build with all available cores
    if command -v ninja &> /dev/null; then
        ninja -j$cores
    else
        make -j$cores
    fi
    
    print_success "Build completed"
    echo ""
}

#==============================================================================
# Run Tests
#==============================================================================
run_tests() {
    print_step "Running tests..."
    
    if [ "$BUILD_TYPE" = "Debug" ]; then
        cd "$BUILD_DIR"
        ctest --output-on-failure --verbose
        print_success "Tests completed"
    else
        print_warning "Tests only run in Debug mode"
        echo "  Run with: ./build-aurora.sh Debug"
    fi
    echo ""
}

#==============================================================================
# Package
#==============================================================================
package() {
    print_step "Creating package..."
    
    cd "$BUILD_DIR"
    
    # Create RPM package
    cpack -G RPM
    print_success "RPM package created"
    
    # Create DEB package
    cpack -G DEB
    print_success "DEB package created"
    
    echo ""
}

#==============================================================================
# Install
#==============================================================================
install_app() {
    print_step "Installing REChain..."
    
    cd "$BUILD_DIR"
    sudo make install
    
    print_success "REChain installed"
    echo ""
}

#==============================================================================
# Uninstall
#==============================================================================
uninstall_app() {
    print_step "Uninstalling REChain..."
    
    cd "$BUILD_DIR"
    sudo make uninstall
    
    print_success "REChain uninstalled"
    echo ""
}

#==============================================================================
# Run Application
#==============================================================================
run_app() {
    print_step "Running REChain..."
    
    if [ -f "$BUILD_DIR/rechainonline" ]; then
        "$BUILD_DIR/rechainonline"
    elif [ -f "/usr/bin/rechainonline" ]; then
        /usr/bin/rechainonline
    else
        print_error "REChain binary not found"
        echo "  Build first with: ./build-aurora.sh"
    fi
}

#==============================================================================
# Show Help
#==============================================================================
show_help() {
    echo "REChain Aurora OS Build Script"
    echo ""
    echo "Usage: $0 [command] [build_type] [architecture]"
    echo ""
    echo "Commands:"
    echo "  build       Build the application (default)"
    echo "  clean       Clean build directory"
    echo "  configure   Configure build only"
    echo "  test        Run tests (Debug mode only)"
    echo "  package     Create RPM/DEB packages"
    echo "  install     Install to system"
    echo "  uninstall   Remove from system"
    echo "  run         Run application"
    echo "  all         Clean, configure, build, and package"
    echo "  help        Show this help"
    echo ""
    echo "Build Types:"
    echo "  Debug       Debug build with symbols"
    echo "  Release     Optimized release build (default)"
    echo "  RelWithDebInfo  Release with debug info"
    echo ""
    echo "Architectures:"
    echo "  armv7l      ARM 32-bit (default)"
    echo "  aarch64     ARM 64-bit"
    echo "  x86_64      Intel/AMD 64-bit (for testing)"
    echo ""
    echo "Examples:"
    echo "  $0                    # Release build for ARMv7l"
    echo "  $0 Debug armv7l       # Debug build for ARMv7l"
    echo "  $0 Release aarch64    # Release build for ARM64"
    echo "  $0 all Debug          # Clean, build, and package Debug"
    echo ""
}

#==============================================================================
# Main
#==============================================================================
main() {
    local command="${1:-build}"
    
    print_header
    
    case "$command" in
        build)
            check_prerequisites
            configure_build
            build
            ;;
        clean)
            clean_build
            ;;
        configure)
            check_prerequisites
            configure_build
            ;;
        test)
            run_tests
            ;;
        package)
            package
            ;;
        install)
            install_app
            ;;
        uninstall)
            uninstall_app
            ;;
        run)
            run_app
            ;;
        all)
            check_prerequisites
            clean_build
            configure_build
            build
            package
            ;;
        help|--help|-h)
            show_help
            ;;
        *)
            print_error "Unknown command: $command"
            show_help
            exit 1
            ;;
    esac
    
    print_success "Done!"
}

main "$@"

