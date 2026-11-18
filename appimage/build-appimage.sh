#!/bin/bash
# REChain AppImage Build Script
# Version: 4.1.20+1162
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
APP_NAME="REChain"
VERSION="4.1.20+1162"
ARCH="${1:-x86_64}"
APP_DIR="REChain.AppDir"
OUTPUT_DIR="output"
BUILD_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║         REChain AppImage Build Script v${VERSION}            ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check prerequisites
check_prerequisites() {
    echo -e "${YELLOW}📋 Checking prerequisites...${NC}"
    
    if ! command -v flutter &> /dev/null; then
        echo -e "${RED}❌ Flutter is not installed or not in PATH${NC}"
        echo "   Install Flutter: https://flutter.dev/docs/get-started/install"
        exit 1
    fi
    echo -e "${GREEN}✓ Flutter found${NC}"
    
    if ! command -v appimagetool &> /dev/null; then
        echo -e "${YELLOW}⚠ appimagetool not found, downloading...${NC}"
        download_appimagetool
    else
        echo -e "${GREEN}✓ appimagetool found${NC}"
    fi
    
    echo -e "${GREEN}✓ All prerequisites met${NC}"
    echo ""
}

# Download appimagetool if not present
download_appimagetool() {
    echo "Downloading AppImageTool..."
    wget -q "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage" \
         -O appimagetool.AppImage || {
        echo -e "${RED}❌ Failed to download appimagetool${NC}"
        echo "   Download manually from: https://github.com/AppImage/AppImageKit/releases"
        exit 1
    }
    chmod +x appimagetool.AppImage
    echo -e "${GREEN}✓ appimagetool downloaded${NC}"
}

# Clean previous builds
clean_build() {
    echo -e "${YELLOW}🧹 Cleaning previous builds...${NC}"
    rm -rf "$APP_DIR"
    rm -rf "$OUTPUT_DIR"
    rm -f "${APP_NAME}-${VERSION}-${ARCH}.AppImage"
    echo -e "${GREEN}✓ Build directory cleaned${NC}"
    echo ""
}

# Build Flutter application
build_flutter() {
    echo -e "${YELLOW}🔨 Building Flutter application for Linux (${ARCH})...${NC}"
    
    FLUTTER_TARGET="lib/main.dart"
    FLUTTER_BUILD_DIR="build/linux/${ARCH}/release"
    
    flutter build linux \
        --target="$FLUTTER_TARGET" \
        --no-codesign \
        --verbose \
        2>&1 | grep -E "(Building|Compiling|Linking|Done|Warning|Error)" || true
    
    echo -e "${GREEN}✓ Flutter build complete${NC}"
    echo ""
}

# Create AppDir structure
create_appdir() {
    echo -e "${YELLOW}📦 Creating AppDir structure...${NC}"
    
    # Create directory structure
    mkdir -p "${APP_DIR}/usr/bin"
    mkdir -p "${APP_DIR}/usr/lib"
    mkdir -p "${APP_DIR}/usr/share/icons/hicolor/scalable/apps"
    mkdir -p "${APP_DIR}/usr/share/applications"
    mkdir -p "${APP_DIR}/usr/share/metainfo"
    mkdir -p "${APP_DIR}/usr/share/doc/rechain"
    
    # Copy Flutter build artifacts
    FLUTTER_BUILD_DIR="build/linux/${ARCH}/release/bundle"
    cp -r "${FLUTTER_BUILD_DIR}/"* "${APP_DIR}/" 2>/dev/null || true
    
    # Copy application files
    cp "${BUILD_SCRIPT_DIR}/AppRun" "${APP_DIR}/"
    cp "${BUILD_SCRIPT_DIR}/REChain.desktop" "${APP_DIR}/usr/share/applications/"
    cp "${BUILD_SCRIPT_DIR}/com.rechain.online.appdata.xml" "${APP_DIR}/usr/share/metainfo/"
    cp "${BUILD_SCRIPT_DIR}/com.rechain.online.svg" "${APP_DIR}/usr/share/icons/hicolor/scalable/apps/"
    
    # Create symlink for binary
    if [ -f "${APP_DIR}/rechainonline" ]; then
        ln -sf ../rechainonline "${APP_DIR}/usr/bin/rechainonline"
    fi
    
    # Copy README
    cp "${BUILD_SCRIPT_DIR}/README.md" "${APP_DIR}/usr/share/doc/rechain/"
    
    # Make AppRun executable
    chmod +x "${APP_DIR}/AppRun"
    chmod +x "${APP_DIR}/rechainonline" 2>/dev/null || true
    
    echo -e "${GREEN}✓ AppDir structure created${NC}"
    echo ""
}

# Bundle dependencies
bundle_dependencies() {
    echo -e "${YELLOW}📦 Bundling dependencies...${NC}"
    
    # Ensure essential libraries are present
    # These are typically required by Flutter apps on Linux
    
    # Check for and copy missing libraries
    if command -v ldd &> /dev/null; then
        BINARY="${APP_DIR}/rechainonline"
        if [ -f "$BINARY" ]; then
            echo "Checking library dependencies..."
            ldd "$BINARY" 2>&1 | grep "not found" || echo -e "${GREEN}✓ All dependencies satisfied${NC}"
        fi
    fi
    
    echo -e "${GREEN}✓ Dependencies checked${NC}"
    echo ""
}

# Build AppImage
build_appimage() {
    echo -e "${YELLOW}🔨 Building AppImage...${NC}"
    
    # Create output directory
    mkdir -p "$OUTPUT_DIR"
    
    # AppImage filename
    APPIMAGE_NAME="${APP_NAME}-${VERSION}-${ARCH}.AppImage"
    
    # Run appimagetool
    if [ -f "appimagetool.AppImage" ]; then
        ./appimagetool.AppImage "${APP_DIR}" "${OUTPUT_DIR}/${APPIMAGE_NAME}"
    elif command -v appimagetool &> /dev/null; then
        appimagetool "${APP_DIR}" "${OUTPUT_DIR}/${APPIMAGE_NAME}"
    else
        echo -e "${RED}❌ appimagetool not found${NC}"
        exit 1
    fi
    
    # Make AppImage executable
    chmod +x "${OUTPUT_DIR}/${APPIMAGE_NAME}"
    
    echo -e "${GREEN}✓ AppImage built: ${OUTPUT_DIR}/${APPIMAGE_NAME}${NC}"
    echo ""
}

# Verify AppImage
verify_appimage() {
    echo -e "${YELLOW}🔍 Verifying AppImage...${NC}"
    
    APPIMAGE_PATH="${OUTPUT_DIR}/${APP_NAME}-${VERSION}-${ARCH}.AppImage"
    
    if [ ! -f "$APPIMAGE_PATH" ]; then
        echo -e "${RED}❌ AppImage not found at ${APPIMAGE_PATH}${NC}"
        exit 1
    fi
    
    # Check if AppImage is valid
    if "$APPIMAGE_PATH" --appimage-extract &> /dev/null; then
        echo -e "${GREEN}✓ AppImage is valid${NC}"
        rm -rf "${APP_NAME}.AppDir"
    else
        echo -e "${RED}❌ AppImage verification failed${NC}"
        exit 1
    fi
    
    # Show AppImage info
    echo ""
    echo -e "${BLUE}📊 AppImage Information:${NC}"
    echo "  Size: $(du -h "$APPIMAGE_PATH" | cut -f1)"
    echo "  Path: $(realpath "$APPIMAGE_PATH")"
    echo ""
}

# Show usage
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  ARCHITECTURE    Target architecture: x86_64 (default) or arm64"
    echo "  --clean         Clean previous builds before building"
    echo "  --help          Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                  # Build for x86_64"
    echo "  $0 arm64           # Build for arm64"
    echo "  --clean x86_64     # Clean and build for x86_64"
}

# Main execution
main() {
    CLEAN_BUILD=false
    TARGET_ARCH="x86_64"
    
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --clean)
                CLEAN_BUILD=true
                shift
                ;;
            --help|-h)
                usage
                exit 0
                ;;
            x86_64|arm64)
                TARGET_ARCH="$1"
                shift
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                usage
                exit 1
                ;;
        esac
    done
    
    echo -e "${BLUE}Building REChain AppImage${NC}"
    echo -e "${BLUE}Version: ${VERSION}${NC}"
    echo -e "${BLUE}Architecture: ${TARGET_ARCH}${NC}"
    echo ""
    
    check_prerequisites
    
    if [ "$CLEAN_BUILD" = true ]; then
        clean_build
    fi
    
    build_flutter
    create_appdir
    bundle_dependencies
    build_appimage
    verify_appimage
    
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                  ✅ BUILD SUCCESSFUL!                       ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}📦 Output:${NC}"
    echo "   ${OUTPUT_DIR}/${APP_NAME}-${VERSION}-${TARGET_ARCH}.AppImage"
    echo ""
    echo -e "${YELLOW}🚀 To run:${NC}"
    echo "   chmod +x ${OUTPUT_DIR}/${APP_NAME}-${VERSION}-${TARGET_ARCH}.AppImage"
    echo "   ${OUTPUT_DIR}/${APP_NAME}-${VERSION}-${TARGET_ARCH}.AppImage"
    echo ""
}

# Run main function
main "$@"

