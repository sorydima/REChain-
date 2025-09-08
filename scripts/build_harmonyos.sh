#!/bin/bash

# REChain HarmonyOS Build Script
# Comprehensive build automation for HarmonyOS platform
# Supports cross-compilation and DevEco Studio integration

set -euo pipefail

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
HARMONYOS_DIR="$PROJECT_ROOT/harmonyos"
BUILD_DIR="$PROJECT_ROOT/build/harmonyos"
DIST_DIR="$PROJECT_ROOT/dist/harmonyos"

# Build configuration
BUILD_TYPE="${BUILD_TYPE:-release}"
TARGET_ARCH="${TARGET_ARCH:-arm64-v8a}"
API_LEVEL="${API_LEVEL:-12}"
CLEAN_BUILD="${CLEAN_BUILD:-false}"
VERBOSE="${VERBOSE:-false}"
PARALLEL_JOBS="${PARALLEL_JOBS:-$(nproc)}"
SIGN_HAP="${SIGN_HAP:-false}"

# HarmonyOS SDK paths
HARMONYOS_SDK_ROOT="${HARMONYOS_SDK_ROOT:-$HOME/Huawei/Sdk}"
DEVECO_STUDIO_PATH="${DEVECO_STUDIO_PATH:-/opt/DevEco-Studio}"
HVIGOR_PATH="${HVIGOR_PATH:-$HARMONYOS_SDK_ROOT/hvigor}"

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
    echo "REChain HarmonyOS Build Script"
    echo "=================================================="
    echo "Build Type: $BUILD_TYPE"
    echo "Target Architecture: $TARGET_ARCH"
    echo "API Level: $API_LEVEL"
    echo "Parallel Jobs: $PARALLEL_JOBS"
    echo "Clean Build: $CLEAN_BUILD"
    echo "Sign HAP: $SIGN_HAP"
    echo "=================================================="
}

# Check dependencies
check_dependencies() {
    log_info "Checking build dependencies..."
    
    # Check for HarmonyOS SDK
    if [[ ! -d "$HARMONYOS_SDK_ROOT" ]]; then
        log_error "HarmonyOS SDK not found at $HARMONYOS_SDK_ROOT"
        log_error "Please install HarmonyOS SDK or set HARMONYOS_SDK_ROOT environment variable"
        exit 1
    fi
    
    # Check for Node.js (required for hvigor)
    if ! command -v node &> /dev/null; then
        log_error "Node.js not found, required for HarmonyOS build system"
        exit 1
    fi
    
    # Check for npm
    if ! command -v npm &> /dev/null; then
        log_error "npm not found, required for HarmonyOS build system"
        exit 1
    fi
    
    # Check for hvigor
    if [[ ! -f "$HARMONYOS_DIR/hvigorw" ]]; then
        log_warning "hvigor wrapper not found, will install dependencies"
    fi
    
    # Check for Flutter (if using Flutter integration)
    if command -v flutter &> /dev/null; then
        log_info "Flutter found: $(flutter --version | head -n1)"
    else
        log_warning "Flutter not found, Flutter integration will be skipped"
    fi
    
    log_success "Dependencies check completed"
}

# Setup build environment
setup_build_environment() {
    log_info "Setting up build environment..."
    
    # Create build directories
    mkdir -p "$BUILD_DIR"
    mkdir -p "$DIST_DIR"
    
    # Set up HarmonyOS environment variables
    export HARMONYOS_SDK_HOME="$HARMONYOS_SDK_ROOT"
    export PATH="$HARMONYOS_SDK_ROOT/toolchains:$PATH"
    export PATH="$HARMONYOS_SDK_ROOT/hvigor/bin:$PATH"
    
    # Set up Node.js environment for hvigor
    export NODE_OPTIONS="--max-old-space-size=8192"
    
    # Set build configuration
    export BUILD_MODE="$BUILD_TYPE"
    export TARGET_PLATFORM="HarmonyOS"
    export COMPILE_SDK_VERSION="$API_LEVEL"
    export COMPATIBLE_SDK_VERSION="$API_LEVEL"
    
    log_success "Build environment configured"
}

# Install dependencies
install_dependencies() {
    log_info "Installing build dependencies..."
    
    cd "$HARMONYOS_DIR"
    
    # Install hvigor if not present
    if [[ ! -f "hvigorw" ]]; then
        log_info "Installing hvigor build system..."
        npm install @ohos/hvigor@latest @ohos/hvigor-ohos-plugin@latest
        
        # Create hvigor wrapper
        cat > hvigorw << 'EOF'
#!/bin/bash
# HarmonyOS hvigor wrapper script

HVIGOR_APP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export HVIGOR_APP_HOME

HVIGOR_WRAPPER_FILE="$HVIGOR_APP_HOME/hvigor/hvigor-wrapper.js"
if [ -r "$HVIGOR_WRAPPER_FILE" ]; then
    node "$HVIGOR_WRAPPER_FILE" "$@"
else
    echo "Error: hvigor-wrapper.js not found"
    exit 1
fi
EOF
        chmod +x hvigorw
    fi
    
    # Install project dependencies
    if [[ -f "oh-package.json5" ]]; then
        log_info "Installing project dependencies..."
        npm install
    fi
    
    # Install entry module dependencies
    if [[ -f "entry/oh-package.json5" ]]; then
        cd entry
        npm install
        cd ..
    fi
    
    log_success "Dependencies installed successfully"
}

# Clean build directory
clean_build() {
    if [[ "$CLEAN_BUILD" == "true" ]]; then
        log_info "Cleaning build directory..."
        
        cd "$HARMONYOS_DIR"
        
        # Clean using hvigor
        if [[ -f "hvigorw" ]]; then
            ./hvigorw clean
        fi
        
        # Remove build artifacts
        rm -rf build/
        rm -rf entry/build/
        rm -rf .hvigor/
        rm -rf node_modules/
        rm -rf entry/node_modules/
        
        log_success "Build directory cleaned"
    fi
}

# Build Flutter assets (if Flutter integration is enabled)
build_flutter_assets() {
    if command -v flutter &> /dev/null && [[ -f "$PROJECT_ROOT/pubspec.yaml" ]]; then
        log_info "Building Flutter assets for HarmonyOS..."
        
        cd "$PROJECT_ROOT"
        
        # Build Flutter assets
        flutter build harmonyos --$BUILD_TYPE
        
        # Copy Flutter assets to HarmonyOS project
        if [[ -d "build/harmonyos/assets" ]]; then
            cp -r "build/harmonyos/assets" "$HARMONYOS_DIR/entry/src/main/resources/rawfile/"
        fi
        
        log_success "Flutter assets built successfully"
    else
        log_info "Skipping Flutter assets build (Flutter not available or not configured)"
    fi
}

# Build HarmonyOS application
build_harmonyos_app() {
    log_info "Building HarmonyOS application..."
    
    cd "$HARMONYOS_DIR"
    
    # Ensure dependencies are installed
    install_dependencies
    
    # Build using hvigor
    local build_args=()
    
    if [[ "$BUILD_TYPE" == "debug" ]]; then
        build_args+=("assembleHap" "--mode" "debug")
    else
        build_args+=("assembleHap" "--mode" "release")
    fi
    
    if [[ "$VERBOSE" == "true" ]]; then
        build_args+=("--info")
    fi
    
    if [[ "$PARALLEL_JOBS" -gt 1 ]]; then
        build_args+=("--parallel" "--max-workers=$PARALLEL_JOBS")
    fi
    
    # Execute build
    log_info "Running: ./hvigorw ${build_args[*]}"
    ./hvigorw "${build_args[@]}"
    
    log_success "HarmonyOS application built successfully"
}

# Sign HAP package
sign_hap_package() {
    if [[ "$SIGN_HAP" != "true" ]]; then
        return 0
    fi
    
    log_info "Signing HAP package..."
    
    cd "$HARMONYOS_DIR"
    
    # Find built HAP files
    local hap_files=($(find . -name "*.hap" -type f))
    
    if [[ ${#hap_files[@]} -eq 0 ]]; then
        log_error "No HAP files found to sign"
        return 1
    fi
    
    for hap_file in "${hap_files[@]}"; do
        log_info "Signing HAP: $hap_file"
        
        # Sign using HarmonyOS signing tools
        # Note: This requires proper signing certificates and profiles
        if command -v hap-sign &> /dev/null; then
            hap-sign -mode localjks -privatekey "$SIGNING_KEY_PATH" \
                     -inputFile "$hap_file" -outputFile "${hap_file%.hap}-signed.hap" \
                     -signAlg SHA256withECDSA -keystoreFile "$KEYSTORE_PATH" \
                     -keystorePwd "$KEYSTORE_PASSWORD" -keyAlias "$KEY_ALIAS" \
                     -keyPwd "$KEY_PASSWORD" -profile "$PROVISION_PROFILE_PATH" \
                     -certpath "$CERT_PATH"
        else
            log_warning "HAP signing tool not found, skipping signing"
        fi
    done
    
    log_success "HAP package signing completed"
}

# Package application
package_application() {
    log_info "Packaging HarmonyOS application..."
    
    cd "$HARMONYOS_DIR"
    
    # Find built HAP files
    local hap_files=($(find . -name "*.hap" -type f))
    
    if [[ ${#hap_files[@]} -eq 0 ]]; then
        log_error "No HAP files found"
        return 1
    fi
    
    # Copy HAP files to distribution directory
    for hap_file in "${hap_files[@]}"; do
        local filename=$(basename "$hap_file")
        local target_name="rechain-harmonyos-${TARGET_ARCH}-${BUILD_TYPE}-$(date +%Y%m%d).hap"
        
        cp "$hap_file" "$DIST_DIR/$target_name"
        log_info "Packaged: $target_name"
    done
    
    # Create installation package
    local install_package="$DIST_DIR/rechain-harmonyos-installer-$(date +%Y%m%d).tar.gz"
    tar -czf "$install_package" -C "$DIST_DIR" *.hap
    
    # Generate checksums
    cd "$DIST_DIR"
    sha256sum *.hap > checksums.sha256
    
    log_success "Application packaging completed"
}

# Run tests
run_tests() {
    log_info "Running HarmonyOS tests..."
    
    cd "$HARMONYOS_DIR"
    
    # Run unit tests
    if [[ -f "hvigorw" ]]; then
        ./hvigorw test
    fi
    
    # Run integration tests if available
    if [[ -d "entry/src/ohosTest" ]]; then
        log_info "Running integration tests..."
        ./hvigorw connectedAndroidTest
    fi
    
    log_success "Tests completed"
}

# Generate build report
generate_build_report() {
    log_info "Generating build report..."
    
    local report_file="$DIST_DIR/build-report-$(date +%Y%m%d-%H%M%S).html"
    
    cat > "$report_file" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>REChain HarmonyOS Build Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header { background: #f0f0f0; padding: 10px; border-radius: 5px; }
        .success { color: green; }
        .warning { color: orange; }
        .error { color: red; }
        table { border-collapse: collapse; width: 100%; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="header">
        <h1>REChain HarmonyOS Build Report</h1>
        <p>Build Date: $(date)</p>
        <p>Build Type: $BUILD_TYPE</p>
        <p>Target Architecture: $TARGET_ARCH</p>
        <p>API Level: $API_LEVEL</p>
    </div>
    
    <h2>Build Summary</h2>
    <table>
        <tr><th>Component</th><th>Status</th><th>Details</th></tr>
        <tr><td>Dependencies</td><td class="success">Success</td><td>All dependencies installed</td></tr>
        <tr><td>Flutter Assets</td><td class="$(command -v flutter &> /dev/null && echo "success" || echo "warning")">$(command -v flutter &> /dev/null && echo "Built" || echo "Skipped")</td><td>Flutter integration</td></tr>
        <tr><td>HarmonyOS Build</td><td class="success">Success</td><td>HAP package created</td></tr>
        <tr><td>Package Signing</td><td class="$([ "$SIGN_HAP" == "true" ] && echo "success" || echo "warning")">$([ "$SIGN_HAP" == "true" ] && echo "Signed" || echo "Unsigned")</td><td>HAP signing status</td></tr>
    </table>
    
    <h2>Build Artifacts</h2>
    <table>
        <tr><th>File</th><th>Size</th><th>Type</th></tr>
$(find "$DIST_DIR" -name "*.hap" -exec basename {} \; -exec stat -c %s {} \; | paste - - | while read name size; do
    echo "        <tr><td>$name</td><td>$(numfmt --to=iec $size)</td><td>HAP Package</td></tr>"
done)
    </table>
    
    <h2>Installation Instructions</h2>
    <h3>HarmonyOS Device</h3>
    <pre>
# Install via hdc (HarmonyOS Device Connector)
hdc install $(basename $(ls "$DIST_DIR"/*.hap | head -1))

# Or install via DevEco Studio
# 1. Open DevEco Studio
# 2. Connect HarmonyOS device
# 3. Click Run/Debug button
    </pre>
    
    <h3>HarmonyOS Simulator</h3>
    <pre>
# Install on simulator
hdc -t simulator install $(basename $(ls "$DIST_DIR"/*.hap | head -1))
    </pre>
    
    <h2>Build Configuration</h2>
    <pre>
Build Type: $BUILD_TYPE
Target Architecture: $TARGET_ARCH
API Level: $API_LEVEL
HarmonyOS SDK: $HARMONYOS_SDK_ROOT
Clean Build: $CLEAN_BUILD
Parallel Jobs: $PARALLEL_JOBS
Sign HAP: $SIGN_HAP
    </pre>
    
    <p><em>Report generated on $(date)</em></p>
</body>
</html>
EOF
    
    log_success "Build report generated: $report_file"
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
            --api-level)
                API_LEVEL="$2"
                shift 2
                ;;
            --jobs)
                PARALLEL_JOBS="$2"
                shift 2
                ;;
            --sign)
                SIGN_HAP=true
                shift
                ;;
            --help)
                echo "Usage: $0 [OPTIONS]"
                echo "Options:"
                echo "  --clean          Clean build directory before building"
                echo "  --verbose        Enable verbose output"
                echo "  --arch ARCH      Target architecture (arm64-v8a, armeabi-v7a)"
                echo "  --build-type TYPE Build type (debug, release)"
                echo "  --api-level LEVEL API level (default: 12)"
                echo "  --jobs N         Number of parallel jobs"
                echo "  --sign           Sign HAP package"
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
    build_flutter_assets
    build_harmonyos_app
    sign_hap_package
    package_application
    
    # Optional steps
    if [[ "$BUILD_TYPE" != "debug" ]]; then
        run_tests
    fi
    
    generate_build_report
    
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
