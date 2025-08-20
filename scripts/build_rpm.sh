#!/bin/bash
set -euo pipefail

echo "=== Building REChain RPM package ==="

# Check if rpmbuild is installed
if ! command -v rpmbuild &> /dev/null; then
    echo "rpmbuild not found. Installing..."
    sudo apt install rpm-build
fi

# Create RPM build directory structure if not exists
mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

# Copy spec file to RPM build directory
cp packages/rpm/SPECS/rechainonline.spec ~/rpmbuild/SPECS/

# Download source files if needed (this would depend on the spec file)
# For now, we'll assume source files are properly referenced in the spec

# Build the RPM package
echo "Building RPM package..."
rpmbuild -bb ~/rpmbuild/SPECS/rechainonline.spec

echo "RPM package built successfully!"
echo "Package location: ~/rpmbuild/RPMS/x86_64/"
