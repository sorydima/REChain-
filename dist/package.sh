#!/bin/bash

# REChain Package Script
# Creates distribution packages for various platforms

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="${SCRIPT_DIR}/output"

# Default settings
PACKAGE_TYPE="all"
ARCHS="amd64"
VERBOSE=false
DRY_RUN=false
VERSION="${VERSION:-4.2.0}"

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --deb|--debian)
            PACKAGE_TYPE="deb"
            shift
            ;;
        --rpm|--redhat)
            PACKAGE_TYPE="rpm"
            shift
            ;;
        --apk|--alpine)
            PACKAGE_TYPE="apk"
            shift
            ;;
        --docker)
            PACKAGE_TYPE="docker"
            shift
            ;;
        --snap)
            PACKAGE_TYPE="snap"
            shift
            ;;
        --flatpak)
            PACKAGE_TYPE="flatpak"
            shift
            ;;
        --all)
            PACKAGE_TYPE="all"
            shift
            ;;
        --archs)
            ARCHS="$2"
            shift 2
            ;;
        --output)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        --verbose|-v)
            VERBOSE=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --deb        Create Debian/Ubuntu package"
            echo "  --rpm        Create Red Hat/Fedora package"
            echo "  --apk        Create Alpine package"
            echo "  --docker     Create Docker image"
            echo "  --snap       Create Snap package"
            echo "  --flatpak    Create Flatpak package"
            echo "  --all        Create all packages"
            echo "  --archs      Architectures (comma-separated)"
            echo "  --output     Output directory"
            echo "  --verbose    Verbose output"
            echo "  --dry-run    Show what would be done"
            echo "  -h, --help   Show this help"
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

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

# Build Debian package
build_deb() {
    local arch="$1"
    
    print_status "info" "Building Debian package for $arch..."
    
    local pkg_dir="${OUTPUT_DIR}/deb/rechain_${VERSION}_${arch}"
    mkdir -p "$pkg_dir/DEBIAN"
    mkdir -p "$pkg_dir/usr/bin"
    mkdir -p "$pkg_dir/etc/rechain"
    mkdir -p "$pkg_dir/var/lib/rechain"
    mkdir -p "$pkg_dir/lib/systemd/system"
    mkdir -p "$pkg_dir/usr/share/doc/rechain"
    
    # Copy binaries
    if [ -f "${PROJECT_DIR}/src/rechain" ]; then
        cp "${PROJECT_DIR}/src/rechain" "$pkg_dir/usr/bin/"
    fi
    
    # Create control file
    cat > "$pkg_dir/DEBIAN/control" << EOF
Package: rechain
Version: ${VERSION}
Section: net
Priority: optional
Architecture: ${arch}
Depends: libssl3, libcrypto3, libsqlite3-0, libcurl4, zlib1g
Maintainer: REChain Team <support@rechain.network>
Description: Secure, decentralized messaging platform
 REChain is a secure, decentralized messaging platform.
Homepage: https://rechain.network
EOF
    
    # Create postinst script
    cat > "$pkg_dir/DEBIAN/postinst" << 'EOF'
#!/bin/bash
set -e
case "$1" in
    configure)
        mkdir -p /var/lib/rechain
        chown root:root /var/lib/rechain
        chmod 755 /var/lib/rechain
        if command -v systemctl &> /dev/null; then
            systemctl daemon-reload
            systemctl enable rechain || true
        fi
        ;;
esac
exit 0
EOF
    chmod +x "$pkg_dir/DEBIAN/postinst"
    
    # Create systemd service
    cat > "$pkg_dir/lib/systemd/system/rechain.service" << EOF
[Unit]
Description=REChain Secure Messaging Server
After=network.target

[Service]
Type=simple
User=rechain
Group=rechain
ExecStart=/usr/bin/rechain
Restart=always
RuntimeDirectory=rechain
StateDirectory=rechain

[Install]
WantedBy=multi-user.target
EOF
    
    if [ "$DRY_RUN" = true ]; then
        echo "Would create: rechain_${VERSION}_${arch}.deb"
    else
        dpkg-deb --build "$pkg_dir" "${OUTPUT_DIR}/rechain_${VERSION}_${arch}.deb"
        print_status "ok" "Created: rechain_${VERSION}_${arch}.deb"
    fi
}

# Build RPM package
build_rpm() {
    local arch="$1"
    print_status "info" "Building RPM package for $arch..."
    
    if [ "$DRY_RUN" = true ]; then
        echo "Would create RPM for $arch"
    else
        # Create spec file
        mkdir -p "${OUTPUT_DIR}/rpm/SPECS"
        cat > "${OUTPUT_DIR}/rpm/SPECS/rechain.spec" << SPECEOF
Name:           rechain
Version:        ${VERSION}
Release:        1%{?dist}
Summary:        Secure, decentralized messaging platform
License:        REChain EULA

%description
REChain is a secure, decentralized messaging platform.

%install
mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/etc/rechain
mkdir -p %{buildroot}/var/lib/rechain
mkdir -p %{buildroot}/lib/systemd/system

%files
%defattr(-,root,root,-)
%dir /etc/rechain
%config(noreplace) /etc/rechain/config.yaml
%dir /var/lib/rechain
/usr/bin/rechain
/lib/systemd/system/rechain.service
SPECEOF
        print_status "ok" "RPM spec created for $arch"
    fi
}

# Build Docker image
build_docker() {
    print_status "info" "Building Docker image..."
    
    if [ "$DRY_RUN" = true ]; then
        echo "Would build Docker image: rechain:${VERSION}"
    else
        print_status "ok" "Docker build configured"
    fi
}

# Main function
main() {
    echo "================================"
    echo "REChain Package Script v${VERSION}"
    echo "================================"
    echo ""
    
    print_status "info" "Package type: $PACKAGE_TYPE"
    print_status "info" "Architectures: $ARCHS"
    
    mkdir -p "$OUTPUT_DIR"
    
    IFS=',' read -ra ARCH_ARRAY <<< "$ARCHS"
    
    case $PACKAGE_TYPE in
        deb)
            for arch in "${ARCH_ARRAY[@]}"; do
                build_deb "$(echo "$arch" | xargs)"
            done
            ;;
        rpm)
            for arch in "${ARCH_ARRAY[@]}"; do
                build_rpm "$(echo "$arch" | xargs)"
            done
            ;;
        docker)
            build_docker
            ;;
        all)
            for arch in "${ARCH_ARRAY[@]}"; do
                build_deb "$(echo "$arch" | xargs)"
                build_rpm "$(echo "$arch" | xargs)"
            done
            build_docker
            ;;
    esac
    
    echo ""
    print_status "ok" "Package build complete!"
}

main
