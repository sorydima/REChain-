#!/bin/bash

# REChain Signing Script
# Signs distribution packages with GPG and generates checksums

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="${SCRIPT_DIR}/output"
GPG_KEY="${GPG_KEY:-rechain@rechain.network}"

# Default settings
SIGN_GPG=true
SIGN_CHECKSUM=true
VERIFY=false
VERBOSE=false
DRY_RUN=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --gpg)
            SIGN_GPG=true
            SIGN_CHECKSUM=false
            shift
            ;;
        --checksum)
            SIGN_CHECKSUM=true
            SIGN_GPG=false
            shift
            ;;
        --verify)
            VERIFY=true
            shift
            ;;
        --key)
            GPG_KEY="$2"
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
            echo "Usage: $0 [OPTIONS] [files...]"
            echo ""
            echo "Options:"
            echo "  --gpg         Sign with GPG only"
            echo "  --checksum    Generate checksums only"
            echo "  --verify      Verify signatures/checksums"
            echo "  --key <key>   GPG key to use"
            echo "  --verbose     Verbose output"
            echo "  --dry-run     Show what would be done"
            echo "  -h, --help    Show this help"
            exit 0
            ;;
        *)
            shift
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
    fi
}

# Sign file with GPG
sign_gpg() {
    local file="$1"
    local basename=$(basename "$file")
    
    print_status "info" "Signing: $basename"
    
    if [ "$DRY_RUN" = true ]; then
        echo "Would sign: $file with GPG key: $GPG_KEY"
        return
    fi
    
    # Create cleartext signature
    gpg --batch --yes --armor \
        --local-user "$GPG_KEY" \
        --detach-sign "$file" \
        --output "${file}.sig"
    
    # Create binary signature
    gpg --batch --yes \
        --local-user "$GPG_KEY" \
        --detach-sign --binary "$file" > "${file}.bin.sig"
    
    # Create signature block for .deb files
    if [[ "$file" == *.deb ]]; then
        dpkg-sig --batch --yes \
            --key "$GPG_KEY" \
            --sign builder "$file"
    fi
    
    print_status "ok" "Signed: $basename"
}

# Generate checksums
generate_checksums() {
    local file="$1"
    local basename=$(basename "$file")
    
    print_status "info" "Generating checksums: $basename"
    
    if [ "$DRY_RUN" = true ]; then
        echo "Would generate checksums for: $file"
        return
    fi
    
    # SHA256
    sha256sum "$file" >> "${OUTPUT_DIR}/SHA256SUMS"
    sha256sum "$file" | tee -a "${OUTPUT_DIR}/SHA256SUMS.txt"
    
    # SHA512
    sha512sum "$file" >> "${OUTPUT_DIR}/SHA512SUMS"
    sha512sum "$file" | tee -a "${OUTPUT_DIR}/SHA512SUMS.txt"
    
    # MD5 (legacy)
    md5sum "$file" >> "${OUTPUT_DIR}/MD5SUMS"
    md5sum "$file" | tee -a "${OUTPUT_DIR}/MD5SUMS.txt"
    
    print_status "ok" "Checksums generated: $basename"
}

# Verify GPG signature
verify_gpg() {
    local file="$1"
    local basename=$(basename "$file")
    
    print_status "info" "Verifying GPG signature: $basename"
    
    if [ -f "${file}.sig" ]; then
        gpg --verify "${file}.sig" "$file" 2>&1 | grep -E "(Good|bad|ERROR)" || {
            print_status "warn" "Signature verification: $basename"
        }
    elif [ -f "${file}.bin.sig" ]; then
        gpg --verify "${file}.bin.sig" "$file" 2>&1 | grep -E "(Good|bad|ERROR)" || {
            print_status "warn" "Binary signature verification: $basename"
        }
    else
        print_status "warn" "No signature found for: $basename"
    fi
}

# Verify checksum
verify_checksum() {
    local file="$1"
    local basename=$(basename "$file")
    
    print_status "info" "Verifying checksum: $basename"
    
    if [ -f "${OUTPUT_DIR}/SHA256SUMS" ]; then
        if sha256sum -c "${OUTPUT_DIR}/SHA256SUMS" 2>&1 | grep -q "$basename: OK"; then
            print_status "ok" "SHA256 verified: $basename"
        else
            print_status "error" "SHA256 mismatch: $basename"
        fi
    else
        print_status "warn" "No checksum file found"
    fi
}

# Main function
main() {
    echo "================================"
    echo "REChain Signing Script"
    echo "================================"
    echo ""
    
    mkdir -p "$OUTPUT_DIR"
    
    # Clear previous checksums
    > "${OUTPUT_DIR}/SHA256SUMS"
    > "${OUTPUT_DIR}/SHA512SUMS"
    > "${OUTPUT_DIR}/MD5SUMS"
    > "${OUTPUT_DIR}/SHA256SUMS.txt"
    > "${OUTPUT_DIR}/SHA512SUMS.txt"
    > "${OUTPUT_DIR}/MD5SUMS.txt"
    
    # Get list of files to process
    local files=("$@")
    if [ ${#files[@]} -eq 0 ]; then
        # Use all files from output directory
        files=("${OUTPUT_DIR}"/rechain-*.tar.gz \
               "${OUTPUT_DIR}"/rechain-*.tar.xz \
               "${OUTPUT_DIR}"/rechain-*.zip \
               "${OUTPUT_DIR}"/rechain_*.deb \
               "${OUTPUT_DIR}"/rechain-*.rpm)
    fi
    
    for file in "${files[@]}"; do
        # Skip if file doesn't exist (glob didn't match)
        [ -f "$file" ] || continue
        
        if [ "$VERIFY" = true ]; then
            verify_gpg "$file"
            verify_checksum "$file"
        else
            if [ "$SIGN_GPG" = true ]; then
                sign_gpg "$file"
            fi
            
            if [ "$SIGN_CHECKSUM" = true ]; then
                generate_checksums "$file"
            fi
        fi
    done
    
    echo ""
    
    # Create signed checksums file
    if [ "$SIGN_GPG" = true ] && [ -f "${OUTPUT_DIR}/SHA256SUMS" ]; then
        print_status "info" "Signing checksums file..."
        sign_gpg "${OUTPUT_DIR}/SHA256SUMS"
    fi
    
    # List created files
    echo ""
    echo "Generated files:"
    ls -la "${OUTPUT_DIR}"/*.sig "${OUTPUT_DIR}"/*.bin.sig "${OUTPUT_DIR}"/*SUMS* 2>/dev/null || true
    
    echo ""
    if [ "$VERIFY" = true ]; then
        print_status "ok" "Verification complete!"
    else
        print_status "ok" "Signing complete!"
    fi
}

main "$@"
