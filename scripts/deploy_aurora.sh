#!/bin/bash

# REChain Aurora OS Deployment Script
# Comprehensive deployment automation for Aurora OS platform
# Supports multiple deployment targets and packaging formats

set -euo pipefail

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
AURORA_DIR="$PROJECT_ROOT/aurora"
BUILD_DIR="$PROJECT_ROOT/build/aurora"
DIST_DIR="$PROJECT_ROOT/dist/aurora"
DEPLOY_DIR="$PROJECT_ROOT/deploy/aurora"

# Deployment configuration
DEPLOY_TARGET="${DEPLOY_TARGET:-local}"
TARGET_ARCH="${TARGET_ARCH:-aarch64}"
PACKAGE_FORMAT="${PACKAGE_FORMAT:-rpm}"
SIGN_PACKAGES="${SIGN_PACKAGES:-false}"
UPLOAD_PACKAGES="${UPLOAD_PACKAGES:-false}"
DEPLOY_ENV="${DEPLOY_ENV:-staging}"

# Repository configuration
REPO_URL="${REPO_URL:-}"
REPO_USER="${REPO_USER:-}"
REPO_PASS="${REPO_PASS:-}"
GPG_KEY_ID="${GPG_KEY_ID:-}"

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
    echo "REChain Aurora OS Deployment Script"
    echo "=================================================="
    echo "Deploy Target: $DEPLOY_TARGET"
    echo "Target Architecture: $TARGET_ARCH"
    echo "Package Format: $PACKAGE_FORMAT"
    echo "Environment: $DEPLOY_ENV"
    echo "Sign Packages: $SIGN_PACKAGES"
    echo "Upload Packages: $UPLOAD_PACKAGES"
    echo "=================================================="
}

# Check deployment prerequisites
check_prerequisites() {
    log_info "Checking deployment prerequisites..."
    
    # Check if build exists
    if [[ ! -d "$BUILD_DIR" ]]; then
        log_error "Build directory not found: $BUILD_DIR"
        log_error "Please run build script first"
        exit 1
    fi
    
    # Check for built executable
    if [[ ! -f "$BUILD_DIR/com.rechain.online" ]]; then
        log_error "Built executable not found"
        exit 1
    fi
    
    # Check for required tools
    local required_tools=("rpmbuild" "createrepo" "rsync")
    for tool in "${required_tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            log_warning "Optional tool '$tool' not found"
        fi
    done
    
    # Check signing requirements
    if [[ "$SIGN_PACKAGES" == "true" ]]; then
        if [[ -z "$GPG_KEY_ID" ]]; then
            log_error "GPG_KEY_ID required for package signing"
            exit 1
        fi
        
        if ! command -v gpg &> /dev/null; then
            log_error "GPG not found, required for package signing"
            exit 1
        fi
    fi
    
    log_success "Prerequisites check completed"
}

# Setup deployment environment
setup_deployment_environment() {
    log_info "Setting up deployment environment..."
    
    # Create deployment directories
    mkdir -p "$DEPLOY_DIR"
    mkdir -p "$DEPLOY_DIR/packages"
    mkdir -p "$DEPLOY_DIR/repository"
    mkdir -p "$DEPLOY_DIR/staging"
    
    # Set deployment metadata
    export DEPLOY_TIMESTAMP=$(date +%Y%m%d-%H%M%S)
    export DEPLOY_VERSION="4.1.10+1160-$DEPLOY_TIMESTAMP"
    export DEPLOY_BUILD_ID="aurora-$TARGET_ARCH-$DEPLOY_TIMESTAMP"
    
    log_success "Deployment environment configured"
}

# Create RPM package
create_rpm_package() {
    log_info "Creating RPM package..."
    
    local rpm_build_dir="$DEPLOY_DIR/rpmbuild"
    local spec_file="$rpm_build_dir/SPECS/rechain.spec"
    
    # Setup RPM build directory structure
    mkdir -p "$rpm_build_dir"/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
    
    # Create RPM spec file
    cat > "$spec_file" << EOF
Name:           rechain
Version:        4.1.10
Release:        1160%{?dist}
Summary:        REChain - Secure Matrix Client for Aurora OS
Group:          Applications/Internet
License:        GPL-3.0+
URL:            https://rechain.com
Source0:        %{name}-%{version}.tar.gz
BuildArch:      $TARGET_ARCH

BuildRequires:  cmake >= 3.16
BuildRequires:  gcc-c++
BuildRequires:  qt5-qtcore-devel
BuildRequires:  qt5-qtdbus-devel
BuildRequires:  qt5-qtmultimedia-devel
BuildRequires:  qt5-qtnetwork-devel
BuildRequires:  qt5-qtsensors-devel
BuildRequires:  flutter-embedder-devel
BuildRequires:  aurora-sdk-devel

Requires:       qt5-qtcore
Requires:       qt5-qtdbus
Requires:       qt5-qtmultimedia
Requires:       qt5-qtnetwork
Requires:       qt5-qtsensors
Requires:       flutter-embedder
Requires:       aurora-runtime

%description
REChain is a secure, decentralized Matrix client designed specifically for
Aurora OS. It provides end-to-end encryption, comprehensive notification
support, and deep system integration with Aurora OS features.

%prep
%setup -q

%build
mkdir -p build
cd build
cmake .. \\
    -DCMAKE_BUILD_TYPE=Release \\
    -DCMAKE_INSTALL_PREFIX=%{_prefix} \\
    -DAURORA_OS_BUILD=ON
make %{?_smp_mflags}

%install
cd build
make install DESTDIR=%{buildroot}

# Install configuration files
mkdir -p %{buildroot}%{_sysconfdir}/rechain
install -m 644 ../aurora/config/rechain.conf %{buildroot}%{_sysconfdir}/rechain/
install -m 644 ../aurora/config/logging.conf %{buildroot}%{_sysconfdir}/rechain/

# Install systemd service file
mkdir -p %{buildroot}%{_unitdir}
cat > %{buildroot}%{_unitdir}/rechain.service << 'SYSTEMD_EOF'
[Unit]
Description=REChain Matrix Client
After=network.target

[Service]
Type=simple
User=defaultuser
ExecStart=%{_bindir}/com.rechain.online
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
SYSTEMD_EOF

%files
%defattr(-,root,root,-)
%{_bindir}/com.rechain.online
%{_datadir}/com.rechain.online/
%{_datadir}/applications/com.rechain.online.desktop
%{_datadir}/icons/hicolor/*/apps/com.rechain.online.png
%config(noreplace) %{_sysconfdir}/rechain/rechain.conf
%config(noreplace) %{_sysconfdir}/rechain/logging.conf
%{_unitdir}/rechain.service
%doc README.md CHANGELOG.md
%license LICENSE

%post
systemctl daemon-reload
if [ \$1 -eq 1 ]; then
    # First installation
    systemctl enable rechain.service
fi

%preun
if [ \$1 -eq 0 ]; then
    # Uninstallation
    systemctl stop rechain.service
    systemctl disable rechain.service
fi

%postun
systemctl daemon-reload

%changelog
* $(date '+%a %b %d %Y') REChain Team <team@rechain.com> - 4.1.10-1160
- Aurora OS optimized build
- Enhanced notification system
- Improved system integration
- Crash reporting and error handling
- Performance optimizations
EOF
    
    # Create source tarball
    local source_dir="$rpm_build_dir/SOURCES"
    tar -czf "$source_dir/rechain-4.1.10+1160.tar.gz" \
        -C "$PROJECT_ROOT" \
        --exclude=".git" \
        --exclude="build" \
        --exclude="dist" \
        --exclude="deploy" \
        .
    
    # Build RPM
    cd "$rpm_build_dir"
    rpmbuild --define "_topdir $rpm_build_dir" -ba SPECS/rechain.spec
    
    # Copy built packages
    cp RPMS/$TARGET_ARCH/*.rpm "$DEPLOY_DIR/packages/"
    cp SRPMS/*.rpm "$DEPLOY_DIR/packages/"
    
    log_success "RPM package created successfully"
}

# Create DEB package (for compatibility)
create_deb_package() {
    log_info "Creating DEB package..."
    
    local deb_build_dir="$DEPLOY_DIR/debbuild"
    local package_dir="$deb_build_dir/rechain_4.1.10+1160_$TARGET_ARCH"
    
    # Setup DEB package structure
    mkdir -p "$package_dir"/{DEBIAN,usr/bin,usr/share/applications,usr/share/icons/hicolor/128x128/apps,etc/rechain}
    
    # Copy files
    cp "$BUILD_DIR/com.rechain.online" "$package_dir/usr/bin/"
    cp "$BUILD_DIR/bundle/"* "$package_dir/usr/share/com.rechain.online/" -r
    cp "$AURORA_DIR/desktop/com.rechain.online.desktop" "$package_dir/usr/share/applications/"
    cp "$AURORA_DIR/icons/128x128.png" "$package_dir/usr/share/icons/hicolor/128x128/apps/com.rechain.online.png"
    cp "$AURORA_DIR/config/"*.conf "$package_dir/etc/rechain/"
    
    # Create control file
    cat > "$package_dir/DEBIAN/control" << EOF
Package: rechain
Version: 4.1.10+1160
Section: net
Priority: optional
Architecture: $TARGET_ARCH
Depends: qt5-default, libqt5dbus5, libqt5multimedia5, libqt5network5
Maintainer: REChain Team <team@rechain.com>
Description: REChain - Secure Matrix Client for Aurora OS
 REChain is a secure, decentralized Matrix client designed specifically for
 Aurora OS. It provides end-to-end encryption, comprehensive notification
 support, and deep system integration with Aurora OS features.
Homepage: https://rechain.com
EOF
    
    # Build DEB package
    cd "$deb_build_dir"
    dpkg-deb --build "rechain_4.1.10+1160_$TARGET_ARCH"
    
    # Copy to packages directory
    cp *.deb "$DEPLOY_DIR/packages/"
    
    log_success "DEB package created successfully"
}

# Sign packages
sign_packages() {
    if [[ "$SIGN_PACKAGES" != "true" ]]; then
        return 0
    fi
    
    log_info "Signing packages..."
    
    cd "$DEPLOY_DIR/packages"
    
    # Sign RPM packages
    for rpm in *.rpm; do
        if [[ -f "$rpm" ]]; then
            rpm --addsign "$rpm"
            log_info "Signed RPM: $rpm"
        fi
    done
    
    # Sign DEB packages
    for deb in *.deb; do
        if [[ -f "$deb" ]]; then
            dpkg-sig --sign builder "$deb"
            log_info "Signed DEB: $deb"
        fi
    done
    
    log_success "Package signing completed"
}

# Create repository
create_repository() {
    log_info "Creating package repository..."
    
    local repo_dir="$DEPLOY_DIR/repository"
    
    # Create RPM repository
    if ls "$DEPLOY_DIR/packages"/*.rpm &> /dev/null; then
        mkdir -p "$repo_dir/rpm/$TARGET_ARCH"
        cp "$DEPLOY_DIR/packages"/*.rpm "$repo_dir/rpm/$TARGET_ARCH/"
        
        if command -v createrepo &> /dev/null; then
            createrepo "$repo_dir/rpm/$TARGET_ARCH"
            log_success "RPM repository created"
        else
            log_warning "createrepo not available, skipping RPM repository creation"
        fi
    fi
    
    # Create DEB repository
    if ls "$DEPLOY_DIR/packages"/*.deb &> /dev/null; then
        mkdir -p "$repo_dir/deb"
        cp "$DEPLOY_DIR/packages"/*.deb "$repo_dir/deb/"
        
        # Create Packages file
        cd "$repo_dir/deb"
        dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
        log_success "DEB repository created"
    fi
    
    # Create repository metadata
    cat > "$repo_dir/rechain.repo" << EOF
[rechain-aurora]
name=REChain Aurora OS Repository
baseurl=https://repo.rechain.com/aurora/$TARGET_ARCH
enabled=1
gpgcheck=$([ "$SIGN_PACKAGES" == "true" ] && echo "1" || echo "0")
$([ "$SIGN_PACKAGES" == "true" ] && echo "gpgkey=https://repo.rechain.com/RPM-GPG-KEY-rechain")
EOF
    
    log_success "Repository metadata created"
}

# Deploy to local staging
deploy_local() {
    log_info "Deploying to local staging area..."
    
    local staging_dir="$DEPLOY_DIR/staging"
    
    # Copy packages
    cp -r "$DEPLOY_DIR/packages"/* "$staging_dir/"
    cp -r "$DEPLOY_DIR/repository"/* "$staging_dir/"
    
    # Create deployment manifest
    cat > "$staging_dir/deployment-manifest.json" << EOF
{
    "deployment": {
        "id": "$DEPLOY_BUILD_ID",
        "timestamp": "$DEPLOY_TIMESTAMP",
        "version": "$DEPLOY_VERSION",
        "environment": "$DEPLOY_ENV",
        "architecture": "$TARGET_ARCH",
        "packages": [
$(find "$DEPLOY_DIR/packages" -name "*.rpm" -o -name "*.deb" | sed 's/.*\///' | sed 's/^/            "/' | sed 's/$/",/' | sed '$s/,$//')
        ],
        "checksums": {
$(find "$DEPLOY_DIR/packages" -name "*.rpm" -o -name "*.deb" -exec basename {} \; -exec sha256sum {} \; | paste - - | sed 's/\t/ /' | sed 's/^/            "/' | sed 's/ /": "/' | sed 's/$/",/' | sed '$s/,$//')
        }
    }
}
EOF
    
    log_success "Local deployment completed"
}

# Deploy to remote repository
deploy_remote() {
    if [[ "$UPLOAD_PACKAGES" != "true" ]]; then
        return 0
    fi
    
    log_info "Deploying to remote repository..."
    
    if [[ -z "$REPO_URL" ]]; then
        log_error "REPO_URL not specified for remote deployment"
        exit 1
    fi
    
    # Upload packages using rsync
    if command -v rsync &> /dev/null; then
        rsync -avz --progress "$DEPLOY_DIR/repository/" "$REPO_URL"
        log_success "Packages uploaded to remote repository"
    else
        log_error "rsync not available for remote deployment"
        exit 1
    fi
}

# Deploy to Aurora Store
deploy_aurora_store() {
    log_info "Preparing Aurora Store deployment..."
    
    # Create Aurora Store package
    local store_dir="$DEPLOY_DIR/aurora-store"
    mkdir -p "$store_dir"
    
    # Copy RPM package for Aurora Store
    if ls "$DEPLOY_DIR/packages"/*.rpm &> /dev/null; then
        cp "$DEPLOY_DIR/packages"/*.rpm "$store_dir/"
        
        # Create store metadata
        cat > "$store_dir/store-metadata.json" << EOF
{
    "package": {
        "name": "rechain",
        "displayName": "REChain",
        "version": "4.1.10+1160",
        "category": "Communication",
        "description": "Secure Matrix client for Aurora OS",
        "developer": "REChain Team",
        "homepage": "https://rechain.com",
        "license": "GPL-3.0+",
        "screenshots": [
            "https://rechain.com/screenshots/aurora/1.png",
            "https://rechain.com/screenshots/aurora/2.png"
        ],
        "requirements": {
            "auroraVersion": "4.6.0",
            "architecture": "$TARGET_ARCH",
            "permissions": [
                "network",
                "notifications",
                "storage"
            ]
        }
    }
}
EOF
        
        log_success "Aurora Store package prepared"
    else
        log_warning "No RPM packages found for Aurora Store deployment"
    fi
}

# Generate deployment report
generate_deployment_report() {
    log_info "Generating deployment report..."
    
    local report_file="$DEPLOY_DIR/deployment-report-$DEPLOY_TIMESTAMP.html"
    
    cat > "$report_file" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>REChain Aurora OS Deployment Report</title>
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
        <h1>REChain Aurora OS Deployment Report</h1>
        <p>Deployment ID: $DEPLOY_BUILD_ID</p>
        <p>Timestamp: $DEPLOY_TIMESTAMP</p>
        <p>Environment: $DEPLOY_ENV</p>
        <p>Architecture: $TARGET_ARCH</p>
    </div>
    
    <h2>Deployment Summary</h2>
    <table>
        <tr><th>Component</th><th>Status</th><th>Details</th></tr>
        <tr><td>Package Creation</td><td class="success">Success</td><td>$(ls "$DEPLOY_DIR/packages" | wc -l) packages created</td></tr>
        <tr><td>Package Signing</td><td class="$([ "$SIGN_PACKAGES" == "true" ] && echo "success" || echo "warning")">$([ "$SIGN_PACKAGES" == "true" ] && echo "Enabled" || echo "Disabled")</td><td>GPG Key: ${GPG_KEY_ID:-"None"}</td></tr>
        <tr><td>Repository Creation</td><td class="success">Success</td><td>Local repository created</td></tr>
        <tr><td>Remote Upload</td><td class="$([ "$UPLOAD_PACKAGES" == "true" ] && echo "success" || echo "warning")">$([ "$UPLOAD_PACKAGES" == "true" ] && echo "Completed" || echo "Skipped")</td><td>URL: ${REPO_URL:-"None"}</td></tr>
    </table>
    
    <h2>Package Information</h2>
    <table>
        <tr><th>Package</th><th>Size</th><th>Checksum</th></tr>
$(find "$DEPLOY_DIR/packages" -type f \( -name "*.rpm" -o -name "*.deb" \) -exec basename {} \; -exec stat -c %s {} \; -exec sha256sum {} \; | paste - - - | while read name size checksum file; do
    echo "        <tr><td>$name</td><td>$(numfmt --to=iec $size)</td><td>${checksum:0:16}...</td></tr>"
done)
    </table>
    
    <h2>Installation Instructions</h2>
    <h3>Aurora OS (RPM)</h3>
    <pre>
# Add repository
sudo curl -o /etc/yum.repos.d/rechain.repo https://repo.rechain.com/aurora/rechain.repo

# Install package
sudo pkcon install rechain

# Or install directly from file
sudo rpm -ivh $(basename $(ls "$DEPLOY_DIR/packages"/*.rpm | head -1))
    </pre>
    
    <h3>Manual Installation</h3>
    <pre>
# Download and extract
wget https://repo.rechain.com/aurora/packages/$(basename $(ls "$DEPLOY_DIR/packages"/*.rpm | head -1))
sudo rpm -ivh $(basename $(ls "$DEPLOY_DIR/packages"/*.rpm | head -1))

# Start service
sudo systemctl enable --now rechain.service
    </pre>
    
    <h2>Deployment Artifacts</h2>
    <ul>
$(find "$DEPLOY_DIR" -type f -name "*.rpm" -o -name "*.deb" -o -name "*.json" -o -name "*.repo" | sort | while read file; do
    echo "        <li>$(basename "$file") ($(stat -c %s "$file" | numfmt --to=iec))</li>"
done)
    </ul>
    
    <p><em>Report generated on $(date)</em></p>
</body>
</html>
EOF
    
    log_success "Deployment report generated: $report_file"
}

# Main deployment function
main() {
    local start_time=$SECONDS
    
    print_header
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --target)
                DEPLOY_TARGET="$2"
                shift 2
                ;;
            --arch)
                TARGET_ARCH="$2"
                shift 2
                ;;
            --format)
                PACKAGE_FORMAT="$2"
                shift 2
                ;;
            --sign)
                SIGN_PACKAGES=true
                shift
                ;;
            --upload)
                UPLOAD_PACKAGES=true
                shift
                ;;
            --repo-url)
                REPO_URL="$2"
                shift 2
                ;;
            --gpg-key)
                GPG_KEY_ID="$2"
                shift 2
                ;;
            --env)
                DEPLOY_ENV="$2"
                shift 2
                ;;
            --help)
                echo "Usage: $0 [OPTIONS]"
                echo "Options:"
                echo "  --target TARGET    Deployment target (local, remote, aurora-store)"
                echo "  --arch ARCH        Target architecture"
                echo "  --format FORMAT    Package format (rpm, deb, both)"
                echo "  --sign             Sign packages with GPG"
                echo "  --upload           Upload to remote repository"
                echo "  --repo-url URL     Remote repository URL"
                echo "  --gpg-key ID       GPG key ID for signing"
                echo "  --env ENV          Deployment environment"
                echo "  --help             Show this help message"
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    # Execute deployment steps
    check_prerequisites
    setup_deployment_environment
    
    # Create packages based on format
    case $PACKAGE_FORMAT in
        "rpm")
            create_rpm_package
            ;;
        "deb")
            create_deb_package
            ;;
        "both")
            create_rpm_package
            create_deb_package
            ;;
        *)
            log_error "Unknown package format: $PACKAGE_FORMAT"
            exit 1
            ;;
    esac
    
    # Sign packages if requested
    sign_packages
    
    # Create repository
    create_repository
    
    # Deploy based on target
    case $DEPLOY_TARGET in
        "local")
            deploy_local
            ;;
        "remote")
            deploy_local
            deploy_remote
            ;;
        "aurora-store")
            deploy_local
            deploy_aurora_store
            ;;
        *)
            log_error "Unknown deployment target: $DEPLOY_TARGET"
            exit 1
            ;;
    esac
    
    # Generate deployment report
    generate_deployment_report
    
    local duration=$((SECONDS - start_time))
    log_success "Deployment completed successfully in $((duration / 60))m $((duration % 60))s"
    
    # Display deployment summary
    echo ""
    echo "Deployment Summary:"
    echo "- Build ID: $DEPLOY_BUILD_ID"
    echo "- Packages: $(find "$DEPLOY_DIR/packages" -type f | wc -l)"
    echo "- Repository: $DEPLOY_DIR/repository"
    echo "- Report: $DEPLOY_DIR/deployment-report-$DEPLOY_TIMESTAMP.html"
}

# Error handling
trap 'log_error "Deployment failed at line $LINENO"' ERR

# Run main function
main "$@"
