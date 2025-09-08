#!/bin/bash

# REChain Linux Packaging Script
# This script creates various Linux distribution packages (DEB, RPM, AppImage)

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
PACKAGES_DIR="$PROJECT_ROOT/packages"
VERSION=$(grep -oP 'version:\s*\K[^+]*' "$PROJECT_ROOT/pubspec.yaml" || echo "1.0.0")
BUILD_NUMBER=$(grep -oP 'version:\s*[^+]*\+\K\d+' "$PROJECT_ROOT/pubspec.yaml" || echo "1")

echo -e "${BLUE}=== REChain Linux Packaging Script ===${NC}"
echo -e "${BLUE}Version: $VERSION+$BUILD_NUMBER${NC}"

# Function to print status messages
print_status() {
    echo -e "${GREEN}[PACKAGE]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if build exists
if [ ! -f "$BUILD_DIR/bundle/rechainonline" ]; then
    print_error "Build not found. Run build_linux.sh first."
    exit 1
fi

# Create packages directory
mkdir -p "$PACKAGES_DIR"

# Function to create DEB package
create_deb_package() {
    print_status "Creating DEB package..."
    
    local deb_dir="$PACKAGES_DIR/deb/rechainonline"
    local deb_name="rechainonline_${VERSION}-${BUILD_NUMBER}_amd64.deb"
    
    # Clean and create structure
    rm -rf "$deb_dir"
    mkdir -p "$deb_dir/DEBIAN"
    mkdir -p "$deb_dir/usr/bin"
    mkdir -p "$deb_dir/usr/share/applications"
    mkdir -p "$deb_dir/usr/share/icons/hicolor/256x256/apps"
    mkdir -p "$deb_dir/usr/share/rechainonline"
    
    # Copy application files
    cp -r "$BUILD_DIR/bundle"/* "$deb_dir/usr/share/rechainonline/"
    
    # Create wrapper script
    cat > "$deb_dir/usr/bin/rechainonline" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/usr/share/rechainonline/lib:$LD_LIBRARY_PATH"
exec /usr/share/rechainonline/rechainonline "$@"
EOF
    chmod +x "$deb_dir/usr/bin/rechainonline"
    
    # Create desktop file
    cat > "$deb_dir/usr/share/applications/rechainonline.desktop" << EOF
[Desktop Entry]
Type=Application
Name=REChain
Comment=Secure decentralized communication platform
Exec=rechainonline
Icon=rechainonline
Terminal=false
Categories=Network;InstantMessaging;
MimeType=x-scheme-handler/matrix;
StartupWMClass=REChain
StartupNotify=true
EOF
    
    # Copy icon
    if [ -f "$PROJECT_ROOT/assets/app_icon.png" ]; then
        cp "$PROJECT_ROOT/assets/app_icon.png" "$deb_dir/usr/share/icons/hicolor/256x256/apps/rechainonline.png"
    fi
    
    # Create control file
    cat > "$deb_dir/DEBIAN/control" << EOF
Package: rechainonline
Version: $VERSION-$BUILD_NUMBER
Section: net
Priority: optional
Architecture: amd64
Depends: libgtk-3-0, libnotify4, libglib2.0-0, libc6
Maintainer: REChain Team <support@rechain.email>
Description: REChain - Secure Decentralized Communication
 REChain is a secure, decentralized communication platform built on Matrix protocol.
 It provides end-to-end encrypted messaging, voice and video calls, file sharing,
 and advanced privacy features.
Homepage: https://rechain.email
EOF
    
    # Create postinst script
    cat > "$deb_dir/DEBIAN/postinst" << 'EOF'
#!/bin/bash
set -e

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database /usr/share/applications
fi

# Update icon cache
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
    gtk-update-icon-cache -t /usr/share/icons/hicolor
fi

exit 0
EOF
    chmod +x "$deb_dir/DEBIAN/postinst"
    
    # Create postrm script
    cat > "$deb_dir/DEBIAN/postrm" << 'EOF'
#!/bin/bash
set -e

if [ "$1" = "remove" ]; then
    # Update desktop database
    if command -v update-desktop-database >/dev/null 2>&1; then
        update-desktop-database /usr/share/applications
    fi
    
    # Update icon cache
    if command -v gtk-update-icon-cache >/dev/null 2>&1; then
        gtk-update-icon-cache -t /usr/share/icons/hicolor
    fi
fi

exit 0
EOF
    chmod +x "$deb_dir/DEBIAN/postrm"
    
    # Build DEB package
    if command -v dpkg-deb >/dev/null 2>&1; then
        dpkg-deb --build "$deb_dir" "$PACKAGES_DIR/$deb_name"
        print_status "DEB package created: $PACKAGES_DIR/$deb_name"
    else
        print_warning "dpkg-deb not found, DEB package creation skipped"
    fi
}

# Function to create RPM package
create_rpm_package() {
    print_status "Creating RPM package..."
    
    local rpm_dir="$PACKAGES_DIR/rpm"
    local spec_file="$rpm_dir/SPECS/rechainonline.spec"
    local rpm_name="rechainonline-${VERSION}-${BUILD_NUMBER}.x86_64.rpm"
    
    # Create RPM build structure
    mkdir -p "$rpm_dir"/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
    
    # Create source tarball
    local source_name="rechainonline-$VERSION"
    mkdir -p "$rpm_dir/SOURCES/$source_name"
    cp -r "$BUILD_DIR/bundle"/* "$rpm_dir/SOURCES/$source_name/"
    
    cd "$rpm_dir/SOURCES"
    tar -czf "$source_name.tar.gz" "$source_name"
    rm -rf "$source_name"
    cd - > /dev/null
    
    # Create spec file
    cat > "$spec_file" << EOF
Name:           rechainonline
Version:        $VERSION
Release:        $BUILD_NUMBER%{?dist}
Summary:        REChain - Secure Decentralized Communication
License:        MIT
URL:            https://rechain.email
Source0:        %{name}-%{version}.tar.gz
BuildArch:      x86_64

Requires:       gtk3, libnotify, glib2

%description
REChain is a secure, decentralized communication platform built on Matrix protocol.
It provides end-to-end encrypted messaging, voice and video calls, file sharing,
and advanced privacy features.

%prep
%setup -q

%build
# No build needed, pre-compiled

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/usr/share/rechainonline
mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/usr/share/applications
mkdir -p %{buildroot}/usr/share/icons/hicolor/256x256/apps

# Copy application files
cp -r * %{buildroot}/usr/share/rechainonline/

# Create wrapper script
cat > %{buildroot}/usr/bin/rechainonline << 'WRAPPER_EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/usr/share/rechainonline/lib:\$LD_LIBRARY_PATH"
exec /usr/share/rechainonline/rechainonline "\$@"
WRAPPER_EOF
chmod +x %{buildroot}/usr/bin/rechainonline

# Create desktop file
cat > %{buildroot}/usr/share/applications/rechainonline.desktop << 'DESKTOP_EOF'
[Desktop Entry]
Type=Application
Name=REChain
Comment=Secure decentralized communication platform
Exec=rechainonline
Icon=rechainonline
Terminal=false
Categories=Network;InstantMessaging;
MimeType=x-scheme-handler/matrix;
StartupWMClass=REChain
StartupNotify=true
DESKTOP_EOF

%files
/usr/bin/rechainonline
/usr/share/rechainonline/
/usr/share/applications/rechainonline.desktop

%post
/usr/bin/update-desktop-database /usr/share/applications &> /dev/null || :
/usr/bin/gtk-update-icon-cache -t /usr/share/icons/hicolor &> /dev/null || :

%postun
/usr/bin/update-desktop-database /usr/share/applications &> /dev/null || :
/usr/bin/gtk-update-icon-cache -t /usr/share/icons/hicolor &> /dev/null || :

%changelog
* $(date +'%a %b %d %Y') REChain Team <support@rechain.email> - $VERSION-$BUILD_NUMBER
- Automated build
EOF
    
    # Build RPM package
    if command -v rpmbuild >/dev/null 2>&1; then
        rpmbuild --define "_topdir $rpm_dir" -ba "$spec_file"
        
        # Copy RPM to packages directory
        find "$rpm_dir/RPMS" -name "*.rpm" -exec cp {} "$PACKAGES_DIR/" \;
        print_status "RPM package created in $PACKAGES_DIR/"
    else
        print_warning "rpmbuild not found, RPM package creation skipped"
    fi
}

# Function to create AppImage
create_appimage() {
    print_status "Creating AppImage..."
    
    local appimage_dir="$PACKAGES_DIR/appimage"
    local appdir="$appimage_dir/REChain.AppDir"
    local appimage_name="REChain-${VERSION}-x86_64.AppImage"
    
    # Clean and create AppDir structure
    rm -rf "$appdir"
    mkdir -p "$appdir"
    
    # Copy application files
    cp -r "$BUILD_DIR/bundle"/* "$appdir/"
    
    # Create AppRun script
    cat > "$appdir/AppRun" << 'EOF'
#!/bin/bash
# AppRun script for REChain

# Get the directory where this AppImage is mounted
HERE="$(dirname "$(readlink -f "${0}")")"

# Set library path
export LD_LIBRARY_PATH="$HERE/lib:$LD_LIBRARY_PATH"

# Set application directory
export APPDIR="$HERE"

# Launch the application
exec "$HERE/rechainonline" "$@"
EOF
    chmod +x "$appdir/AppRun"
    
    # Create desktop file
    cat > "$appdir/rechainonline.desktop" << EOF
[Desktop Entry]
Type=Application
Name=REChain
Comment=Secure decentralized communication platform
Exec=rechainonline
Icon=rechainonline
Terminal=false
Categories=Network;InstantMessaging;
MimeType=x-scheme-handler/matrix;
StartupWMClass=REChain
StartupNotify=true
EOF
    
    # Copy icon
    if [ -f "$PROJECT_ROOT/assets/app_icon.png" ]; then
        cp "$PROJECT_ROOT/assets/app_icon.png" "$appdir/rechainonline.png"
    fi
    
    # Create AppImage using appimagetool
    if command -v appimagetool >/dev/null 2>&1; then
        cd "$appimage_dir"
        appimagetool "$appdir" "$PACKAGES_DIR/$appimage_name"
        print_status "AppImage created: $PACKAGES_DIR/$appimage_name"
    else
        print_warning "appimagetool not found, AppImage creation skipped"
        print_warning "Install from: https://github.com/AppImage/AppImageKit/releases"
    fi
}

# Function to create Flatpak
create_flatpak() {
    print_status "Creating Flatpak package..."
    
    if [ -f "$PROJECT_ROOT/com.rechain.online/com.rechain.online.json" ]; then
        local flatpak_dir="$PROJECT_ROOT/com.rechain.online"
        
        if command -v flatpak-builder >/dev/null 2>&1; then
            cd "$flatpak_dir"
            flatpak-builder --force-clean build-dir com.rechain.online.json
            flatpak build-export repo build-dir
            flatpak build-bundle repo "$PACKAGES_DIR/REChain-${VERSION}.flatpak" com.rechain.online
            print_status "Flatpak created: $PACKAGES_DIR/REChain-${VERSION}.flatpak"
        else
            print_warning "flatpak-builder not found, Flatpak creation skipped"
        fi
    else
        print_warning "Flatpak manifest not found, skipping Flatpak creation"
    fi
}

# Main packaging logic
case "${1:-all}" in
    "deb")
        create_deb_package
        ;;
    "rpm")
        create_rpm_package
        ;;
    "appimage")
        create_appimage
        ;;
    "flatpak")
        create_flatpak
        ;;
    "all")
        create_deb_package
        create_rpm_package
        create_appimage
        create_flatpak
        ;;
    *)
        echo "Usage: $0 [deb|rpm|appimage|flatpak|all]"
        exit 1
        ;;
esac

# Summary
print_status "Packaging completed!"
echo -e "${GREEN}Created packages:${NC}"
find "$PACKAGES_DIR" -name "*.deb" -o -name "*.rpm" -o -name "*.AppImage" -o -name "*.flatpak" | while read package; do
    echo -e "  $(basename "$package")"
done
