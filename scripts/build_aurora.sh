#!/bin/bash

# REChain Aurora OS Build Script
# Comprehensive build automation for Aurora OS platform
# Supports cross-compilation for ARM and x86_64 architectures

set -euo pipefail

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
AURORA_DIR="$PROJECT_ROOT/aurora"
BUILD_DIR="$PROJECT_ROOT/build/aurora"
DIST_DIR="$PROJECT_ROOT/dist/aurora"

# Build configuration
BUILD_TYPE="${BUILD_TYPE:-Release}"
TARGET_ARCH="${TARGET_ARCH:-aarch64}"
PSDK_VERSION="${PSDK_VERSION:-4.6.0.13}"
CLEAN_BUILD="${CLEAN_BUILD:-false}"
VERBOSE="${VERBOSE:-false}"
PARALLEL_JOBS="${PARALLEL_JOBS:-$(nproc)}"

# Aurora OS SDK paths
AURORA_SDK_ROOT="${AURORA_SDK_ROOT:-/opt/aurora-sdk}"
PSDK_ROOT="$AURORA_SDK_ROOT/PlatformSDK"
TARGET_ROOT="$AURORA_SDK_ROOT/targets"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Print script header
print_header() {
    echo "=================================================="
    echo "REChain Aurora OS Build Script"
    echo "=================================================="
    echo "Build Type: $BUILD_TYPE"
    echo "Target Architecture: $TARGET_ARCH"
    echo "PSDK Version: $PSDK_VERSION"
    echo "Parallel Jobs: $PARALLEL_JOBS"
    echo "Clean Build: $CLEAN_BUILD"
    echo "=================================================="
}

# Check dependencies
check_dependencies() {
    log_info "Checking build dependencies..."
    
    # Check for Aurora SDK
    if [[ ! -d "$AURORA_SDK_ROOT" ]]; then
        log_error "Aurora SDK not found at $AURORA_SDK_ROOT"
        log_error "Please install Aurora SDK or set AURORA_SDK_ROOT environment variable"
        exit 1
    fi
    
    # Check for required tools
    local required_tools=("cmake" "make" "gcc" "g++" "pkg-config")
    for tool in "${required_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            log_error "Required tool '$tool' not found"
            exit 1
        fi
    done
    
    # Check for Qt5 development packages
    if ! pkg-config --exists Qt5Core Qt5DBus Qt5Multimedia Qt5Network; then
        log_error "Qt5 development packages not found"
        log_error "Please install Qt5 development packages"
        exit 1
    fi
    
    # Check for Flutter
    if [[ ! -d "$PROJECT_ROOT/flutter" ]]; then
        log_error "Flutter directory not found at $PROJECT_ROOT/flutter"
        exit 1
    fi
    
    log_success "All dependencies found"
}

# Setup build environment
setup_build_environment() {
    log_info "Setting up build environment..."
    
    # Create build directories
    mkdir -p "$BUILD_DIR"
    mkdir -p "$DIST_DIR"
    
    # Set up Aurora OS environment
    export PKG_CONFIG_PATH="$TARGET_ROOT/aurora-$TARGET_ARCH/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
    export CMAKE_PREFIX_PATH="$TARGET_ROOT/aurora-$TARGET_ARCH/usr"
    export PATH="$PSDK_ROOT/bin:$PATH"
    
    # Set up cross-compilation environment
    if [[ "$TARGET_ARCH" == "aarch64" ]]; then
        export CC="aarch64-aurora-linux-gnu-gcc"
        export CXX="aarch64-aurora-linux-gnu-g++"
        export AR="aarch64-aurora-linux-gnu-ar"
        export STRIP="aarch64-aurora-linux-gnu-strip"
        export RANLIB="aarch64-aurora-linux-gnu-ranlib"
    elif [[ "$TARGET_ARCH" == "armv7hl" ]]; then
        export CC="armv7hl-aurora-linux-gnueabihf-gcc"
        export CXX="armv7hl-aurora-linux-gnueabihf-g++"
        export AR="armv7hl-aurora-linux-gnueabihf-ar"
        export STRIP="armv7hl-aurora-linux-gnueabihf-strip"
        export RANLIB="armv7hl-aurora-linux-gnueabihf-ranlib"
    fi
    
    log_success "Build environment configured"
}

# Clean build directory
clean_build() {
    if [[ "$CLEAN_BUILD" == "true" ]]; then
        log_info "Cleaning build directory..."
        rm -rf "$BUILD_DIR"
        mkdir -p "$BUILD_DIR"
        log_success "Build directory cleaned"
    fi
}

# Build Flutter bundle
build_flutter() {
    log_info "Building Flutter bundle for Aurora OS..."
    
    cd "$PROJECT_ROOT"
    
    # Set Flutter configuration for Aurora OS
    export FLUTTER_TARGET_PLATFORM="linux-$TARGET_ARCH"
    
    # Build Flutter bundle
    if [[ "$VERBOSE" == "true" ]]; then
        flutter build linux --release --verbose
    else
        flutter build linux --release
    fi
    
    # Copy Flutter bundle to Aurora build directory
    cp -r "build/linux/$TARGET_ARCH/release/bundle/"* "$BUILD_DIR/"
    
    log_success "Flutter bundle built successfully"
}

# Configure CMake
configure_cmake() {
    log_info "Configuring CMake build..."
    
    cd "$BUILD_DIR"
    
    local cmake_args=(
        "-DCMAKE_BUILD_TYPE=$BUILD_TYPE"
        "-DCMAKE_SYSTEM_NAME=Linux"
        "-DCMAKE_SYSTEM_PROCESSOR=$TARGET_ARCH"
        "-DCMAKE_C_COMPILER=$CC"
        "-DCMAKE_CXX_COMPILER=$CXX"
        "-DCMAKE_FIND_ROOT_PATH=$TARGET_ROOT/aurora-$TARGET_ARCH"
        "-DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=NEVER"
        "-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY"
        "-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY"
        "-DCMAKE_INSTALL_PREFIX=/usr"
        "-DPSDK_VERSION=$PSDK_VERSION"
        "-DAURORA_OS_BUILD=ON"
    )
    
    if [[ "$VERBOSE" == "true" ]]; then
        cmake "${cmake_args[@]}" --debug-output "$AURORA_DIR"
    else
        cmake "${cmake_args[@]}" "$AURORA_DIR"
    fi
    
    log_success "CMake configuration completed"
}

# Build the project
build_project() {
    log_info "Building REChain Aurora OS application..."
    
    cd "$BUILD_DIR"
    
    local make_args=("-j$PARALLEL_JOBS")
    
    if [[ "$VERBOSE" == "true" ]]; then
        make "${make_args[@]}" VERBOSE=1
    else
        make "${make_args[@]}"
    fi
    
    log_success "Project built successfully"
}

# Run tests
run_tests() {
    log_info "Running Aurora OS tests..."
    
    cd "$BUILD_DIR"
    
    # Run unit tests if available
    if [[ -f "test/rechain_tests" ]]; then
        ./test/rechain_tests
        log_success "Unit tests passed"
    else
        log_warning "No unit tests found"
    fi
    
    # Run integration tests
    if [[ -f "test/integration_tests" ]]; then
        ./test/integration_tests
        log_success "Integration tests passed"
    else
        log_warning "No integration tests found"
    fi
}

# Package the application
package_application() {
    log_info "Packaging Aurora OS application..."
    
    cd "$BUILD_DIR"
    
    # Create RPM package
    make package
    
    # Copy packages to distribution directory
    cp *.rpm "$DIST_DIR/" 2>/dev/null || log_warning "No RPM packages found"
    
    # Create tarball
    local tarball_name="rechain-aurora-$TARGET_ARCH-$(date +%Y%m%d).tar.gz"
    tar -czf "$DIST_DIR/$tarball_name" \
        --exclude="*.o" \
        --exclude="*.a" \
        --exclude="CMakeFiles" \
        .
    
    log_success "Application packaged: $tarball_name"
}

# Generate build report
generate_build_report() {
    log_info "Generating build report..."
    
    local report_file="$DIST_DIR/build-report-$(date +%Y%m%d-%H%M%S).txt"
    
    {
        echo "REChain Aurora OS Build Report"
        echo "=============================="
        echo "Build Date: $(date)"
        echo "Build Type: $BUILD_TYPE"
        echo "Target Architecture: $TARGET_ARCH"
        echo "PSDK Version: $PSDK_VERSION"
        echo "Compiler: $($CXX --version | head -n1)"
        echo "CMake Version: $(cmake --version | head -n1)"
        echo ""
        echo "Build Configuration:"
        echo "- Clean Build: $CLEAN_BUILD"
        echo "- Verbose: $VERBOSE"
        echo "- Parallel Jobs: $PARALLEL_JOBS"
        echo ""
        echo "Build Artifacts:"
        find "$BUILD_DIR" -name "*.so" -o -name "*.rpm" -o -name "com.rechain.online" | sort
        echo ""
        echo "Package Contents:"
        if [[ -f "$DIST_DIR"/*.rpm ]]; then
            rpm -qlp "$DIST_DIR"/*.rpm | head -20
        fi
        echo ""
        echo "Build Statistics:"
        echo "- Build Directory Size: $(du -sh "$BUILD_DIR" | cut -f1)"
        echo "- Package Size: $(du -sh "$DIST_DIR" | cut -f1)"
        echo "- Build Duration: $((SECONDS / 60)) minutes $((SECONDS % 60)) seconds"
    } > "$report_file"
    
    log_success "Build report generated: $report_file"
}

# Cleanup function
cleanup() {
    log_info "Cleaning up temporary files..."
    
    # Remove temporary build files
    find "$BUILD_DIR" -name "*.tmp" -delete 2>/dev/null || true
    find "$BUILD_DIR" -name "*.log" -delete 2>/dev/null || true
    
    log_success "Cleanup completed"
}

# Main build function
main() {
    local start_time=$SECONDS
    
    print_header
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --clean)
                CLEAN_BUILD=true
                shift
                ;;
            --verbose)
                VERBOSE=true
                shift
                ;;
            --arch)
                TARGET_ARCH="$2"
                shift 2
                ;;
            --build-type)
                BUILD_TYPE="$2"
                shift 2
                ;;
            --jobs)
                PARALLEL_JOBS="$2"
                shift 2
                ;;
            --help)
                echo "Usage: $0 [OPTIONS]"
                echo "Options:"
                echo "  --clean          Clean build directory before building"
                echo "  --verbose        Enable verbose output"
                echo "  --arch ARCH      Target architecture (aarch64, armv7hl)"
                echo "  --build-type TYPE Build type (Debug, Release, RelWithDebInfo)"
                echo "  --jobs N         Number of parallel jobs"
                echo "  --help           Show this help message"
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    # Execute build steps
    check_dependencies
    setup_build_environment
    clean_build
    build_flutter
    configure_cmake
    build_project
    
    # Optional steps
    if [[ "$BUILD_TYPE" != "Debug" ]]; then
        run_tests
        package_application
    fi
    
    generate_build_report
    cleanup
    
    local duration=$((SECONDS - start_time))
    log_success "Build completed successfully in $((duration / 60))m $((duration % 60))s"
    
    # Display build artifacts
    echo ""
    echo "Build Artifacts:"
    ls -la "$DIST_DIR"
}

# Error handling
trap 'log_error "Build failed at line $LINENO"' ERR

# Run main function
main "$@"
