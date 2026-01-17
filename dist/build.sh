#!/bin/bash

# REChain Build Script
# Builds REChain from source for various platforms

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Default settings
BUILD_TYPE="release"
ARCH="amd64"
OUTPUT_DIR="${SCRIPT_DIR}/output"
VERBOSE=false
CLEAN=false
PARALLEL=true
JOBS=$(nproc)

# Version info (set by CI)
VERSION="${VERSION:-4.2.0}"
GIT_COMMIT="${GIT_COMMIT:-$(git -C "$PROJECT_DIR" rev-parse HEAD 2>/dev/null || echo "unknown")}"
GIT_BRANCH="${GIT_BRANCH:-$(git -C "$PROJECT_DIR" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")}"

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --release)
            BUILD_TYPE="release"
            shift
            ;;
        --debug)
            BUILD_TYPE="debug"
            shift
            ;;
        --arch)
            ARCH="$2"
            shift 2
            ;;
        --archs)
            ARCHS="$2"
            shift 2
            ;;
        --output)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        --clean)
            CLEAN=true
            shift
            ;;
        --verbose|-v)
            VERBOSE=true
            shift
            ;;
        --jobs|-j)
            JOBS="$2"
            shift 2
            ;;
        --no-parallel)
            PARALLEL=false
            shift
            ;;
        --version)
            echo "$VERSION"
            exit 0
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --release       Build release version (default)"
            echo "  --debug         Build debug version"
            echo "  --arch <arch>   Build for specific architecture (default: amd64)"
            echo "  --archs <archs> Build for multiple architectures (comma-separated)"
            echo "  --output <dir>  Output directory (default: dist/output)"
            echo "  --clean         Clean before building"
            echo "  --verbose       Verbose output"
            echo "  --jobs <n>      Number of parallel jobs (default: nproc)"
            echo "  --no-parallel   Disable parallel builds"
            echo "  --version       Show version and exit"
            echo "  -h, --help      Show this help message"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Function to print status
print_status() {
    local status=$1
    local message=$2
    if [ "$status" = "ok" ]; then
        echo -e "${GREEN}[OK]${NC} $message"
    elif [ "$status" = "warn" ]; then
        echo -e "${YELLOW}[WARN]${NC} $message"
    elif [ "$status" = "error" ]; then
        echo -e "${RED}[ERROR]${NC} $message"
    elif [ "$status" = "info" ]; then
        echo -e "${BLUE}[INFO]${NC} $message"
    fi
}

# Function to print verbose output
print_verbose() {
    if [ "$VERBOSE" = true ]; then
        echo -e "${BLUE}[DEBUG]${NC} $1"
    fi
}

# Check prerequisites
check_prerequisites() {
    echo "Checking prerequisites..."
    
    # Check for C compiler
    if command -v gcc &> /dev/null; then
        print_status "ok" "GCC found: $(gcc --version | head -n1)"
    elif command -v clang &> /dev/null; then
        print_status "ok" "Clang found: $(clang --version | head -n1)"
    else
        print_status "error" "No C/C++ compiler found"
        exit 1
    fi
    
    # Check for make
    if command -v make &> /dev/null; then
        print_status "ok" "Make found: $(make --version | head -n1)"
    else
        print_status "error" "Make not found"
        exit 1
    fi
    
    # Check for CMake (if needed)
    if command -v cmake &> /dev/null; then
        print_status "ok" "CMake found: $(cmake --version | head -n1)"
    else
        print_status "warn" "CMake not found, will use Makefile"
    fi
    
    # Check for pkg-config
    if command -v pkg-config &> /dev/null; then
        print_status "ok" "pkg-config found"
    else
        print_status "warn" "pkg-config not found, some checks may fail"
    fi
}

# Check dependencies
check_dependencies() {
    print_status "info" "Checking build dependencies..."
    
    local missing_deps=()
    
    # Check for OpenSSL
    if ! pkg-config --exists openssl 2>/dev/null; then
        if [ -f /usr/include/openssl/ssl.h ]; then
            print_status "ok" "OpenSSL headers found"
        else
            missing_deps+=("libssl-dev")
        fi
    else
        print_status "ok" "OpenSSL found"
    fi
    
    # Check for SQLite
    if ! pkg-config --exists sqlite3 2>/dev/null; then
        if [ -f /usr/include/sqlite3.h ]; then
            print_status "ok" "SQLite headers found"
        else
            missing_deps+=("libsqlite3-dev")
        fi
    else
        print_status "ok" "SQLite found"
    fi
    
    # Check for zlib
    if ! pkg-config --exists zlib 2>/dev/null; then
        if [ -f /usr/include/zlib.h ]; then
            print_status "ok" "zlib headers found"
        else
            missing_deps+=("zlib1g-dev")
        fi
    else
        print_status "ok" "zlib found"
    fi
    
    # Check for curl
    if ! pkg-config --exists libcurl 2>/dev/null; then
        if [ -f /usr/include/curl/curl.h ]; then
            print_status "ok" "libcurl headers found"
        else
            missing_deps+=("libcurl4-openssl-dev")
        fi
    else
        print_status "ok" "libcurl found"
    fi
    
    if [ ${#missing_deps[@]} -gt 0 ]; then
        print_status "warn" "Missing dependencies: ${missing_deps[*]}"
        echo ""
        echo "Install with:"
        echo "  sudo apt-get install ${missing_deps[*]}"
        echo ""
        read -p "Continue anyway? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Clean build directory
clean_build() {
    if [ "$CLEAN" = true ]; then
        print_status "info" "Cleaning build directory..."
        rm -rf "$OUTPUT_DIR"
        rm -rf "${PROJECT_DIR}/build"
        rm -f "${PROJECT_DIR}/src/rechain"
        rm -f "${PROJECT_DIR}/src/rechain-cli"
    fi
}

# Detect build system
detect_build_system() {
    if [ -f "${PROJECT_DIR}/CMakeLists.txt" ]; then
        echo "cmake"
    elif [ -f "${PROJECT_DIR}/Makefile" ]; then
        echo "makefile"
    elif [ -f "${PROJECT_DIR}/meson.build" ]; then
        echo "meson"
    else
        echo "unknown"
    fi
}

# Configure build
configure_build() {
    local build_system="$1"
    
    print_status "info" "Configuring build with $build_system..."
    
    case $build_system in
        cmake)
            mkdir -p "${PROJECT_DIR}/build"
            cd "${PROJECT_DIR}/build"
            
            local cmake_args=(
                "-DCMAKE_BUILD_TYPE=${BUILD_TYPE^}"
                "-DCMAKE_INSTALL_PREFIX=/usr"
                "-DSYSCONFDIR=/etc"
                "-DLOCALSTATEDIR=/var"
            )
            
            if [ "$BUILD_TYPE" = "release" ]; then
                cmake_args+=("-DCMAKE_RELEASE_BUILD=ON")
            fi
            
            if [ "$PARALLEL" = true ]; then
                cmake_args+=("-DCMAKE_BUILD_PARALLEL=$JOBS")
            fi
            
            if [ "$VERBOSE" = true ]; then
                cmake "${cmake_args[@]}" ..
            else
                cmake "${cmake_args[@]}" .. > /dev/null
            fi
            ;;
            
        makefile)
            # Use environment variables for Makefile builds
            export CFLAGS="-O3 -DNDEBUG"
            export CXXFLAGS="-O3 -std=c++17"
            ;;
            
        meson)
            meson setup "${PROJECT_DIR}/build" \
                --buildtype="$BUILD_TYPE" \
                --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var
            ;;
    esac
}

# Compile
compile() {
    local build_system="$1"
    
    print_status "info" "Compiling REChain ($BUILD_TYPE)..."
    
    local start_time=$(date +%s)
    
    case $build_system in
        cmake)
            cd "${PROJECT_DIR}/build"
            if [ "$VERBOSE" = true ]; then
                cmake --build . -- -j "$JOBS"
            else
                cmake --build . -- -j "$JOBS" 2>&1 | grep -E "(Error|error|warning:|Building)" || true
            fi
            ;;
            
        makefile)
            cd "${PROJECT_DIR}"
            if [ "$PARALLEL" = true ]; then
                make -j "$JOBS" 2>&1 | grep -E "(Error|error|warning:)" || true
            else
                make 2>&1 | grep -E "(Error|error|warning:)" || true
            fi
            ;;
            
        meson)
            cd "${PROJECT_DIR}/build"
            ninja -j "$JOBS"
            ;;
    esac
    
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))
    print_status "ok" "Build completed in ${duration}s"
}

# Copy binaries and assets
install_to_staging() {
    print_status "info" "Installing to staging directory..."
    
    mkdir -p "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}"
    mkdir -p "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/bin"
    mkdir -p "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/config"
    mkdir -p "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/scripts"
    mkdir -p "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/doc"
    
    # Copy binaries
    if [ -f "${PROJECT_DIR}/src/rechain" ]; then
        cp "${PROJECT_DIR}/src/rechain" "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/bin/"
    fi
    
    if [ -f "${PROJECT_DIR}/src/rechain-cli" ]; then
        cp "${PROJECT_DIR}/src/rechain-cli" "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/bin/"
    fi
    
    # Copy configuration template
    if [ -f "${SCRIPT_DIR}/templates/config.yaml" ]; then
        cp "${SCRIPT_DIR}/templates/config.yaml" "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/config/"
    fi
    
    # Copy scripts
    if [ -f "${SCRIPT_DIR}/scripts/pre_install.sh" ]; then
        cp "${SCRIPT_DIR}/scripts/pre_install.sh" "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/scripts/"
    fi
    
    if [ -f "${SCRIPT_DIR}/scripts/post_install.sh" ]; then
        cp "${SCRIPT_DIR}/scripts/post_install.sh" "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/scripts/"
    fi
    
    # Copy documentation
    if [ -f "${PROJECT_DIR}/README.md" ]; then
        cp "${PROJECT_DIR}/README.md" "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/doc/"
    fi
    
    print_status "ok" "Staging directory created"
}

# Create archive
create_archive() {
    print_status "info" "Creating archive..."
    
    cd "${OUTPUT_DIR}/${VERSION}"
    
    local archive_name="rechain-${VERSION}-${ARCH}"
    
    # Create tar.gz
    tar -czf "${archive_name}.tar.gz" "${archive_name}"
    
    # Create tar.xz (better compression)
    tar -cJf "${archive_name}.tar.xz" "${archive_name}"
    
    # Create zip (for Windows)
    zip -rq "${archive_name}.zip" "${archive_name}"
    
    # Create checksums
    cd "${OUTPUT_DIR}/${VERSION}"
    sha256sum "${archive_name}.tar.gz" "${archive_name}.tar.xz" "${archive_name}.zip" > "${archive_name}.sha256"
    sha512sum "${archive_name}.tar.gz" "${archive_name}.tar.xz" "${archive_name}.zip" > "${archive_name}.sha512"
    
    # List created files
    echo ""
    ls -lh "${archive_name}".*
    
    print_status "ok" "Archive created successfully"
}

# Build for specific architecture
build_arch() {
    local arch="$1"
    
    print_status "info" "Building for architecture: $arch"
    
    # Set architecture-specific flags
    case $arch in
        x86_64|amd64)
            ARCH="amd64"
            ;;
        arm64|aarch64)
            ARCH="arm64"
            ;;
        armv7|armhf)
            ARCH="armhf"
            ;;
        x86|i386)
            ARCH="i386"
            ;;
    esac
    
    # Run build
    clean_build
    
    local build_system=$(detect_build_system)
    if [ "$build_system" = "unknown" ]; then
        print_status "warn" "No recognized build system found, copying source instead"
        mkdir -p "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}"
        cp -r "${PROJECT_DIR}/"* "${OUTPUT_DIR}/${VERSION}/rechain-${VERSION}-${ARCH}/"
    else
        configure_build "$build_system"
        compile "$build_system"
        install_to_staging
        create_archive
    fi
}

# Show build info
show_build_info() {
    echo ""
    echo "================================"
    echo "REChain Build Information"
    echo "================================"
    echo ""
    echo "Version:    $VERSION"
    echo "Git Commit: $GIT_COMMIT"
    echo "Git Branch: $GIT_BRANCH"
    echo "Build Type: $BUILD_TYPE"
    echo "Architecture: $ARCH"
    echo "Parallel Jobs: $JOBS"
    echo "Output Dir: $OUTPUT_DIR"
    echo "Project Dir: $PROJECT_DIR"
    echo ""
}

# Main execution
main() {
    echo "================================"
    echo "REChain Build Script v${VERSION}"
    echo "================================"
    echo ""
    
    show_build_info
    
    check_prerequisites
    check_dependencies
    
    # Create output directory
    mkdir -p "$OUTPUT_DIR"
    
    # Build for single or multiple architectures
    if [ -n "$ARCHS" ]; then
        IFS=',' read -ra ARCH_ARRAY <<< "$ARCHS"
        for arch in "${ARCH_ARRAY[@]}"; do
            build_arch "$(echo "$arch" | xargs)"
        done
    else
        build_arch "$ARCH"
    fi
    
    echo ""
    echo "================================"
    echo "Build Complete!"
    echo "================================"
    echo ""
    echo "Output files:"
    ls -lh "$OUTPUT_DIR/${VERSION}"/rechain-${VERSION}-*.* 2>/dev/null || true
    echo ""
    print_status "ok" "Build successful!"
}

main


