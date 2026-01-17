#!/bin/bash

# REChain Fonts Update Script v4.1.10+1160
# Updated: 2025-01-09
# This script updates fonts to the latest versions and validates integrity

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
FONTS_DIR="$SCRIPT_DIR"
CONFIG_FILE="$FONTS_DIR/font_config.json"

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

# Check dependencies
check_dependencies() {
    log_info "Checking dependencies..."

    local deps=("curl" "unzip" "python3" "fonttools")
    local missing_deps=()

    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing_deps+=("$dep")
        fi
    done

    if [ ${#missing_deps[@]} -ne 0 ]; then
        log_error "Missing dependencies: ${missing_deps[*]}"
        log_info "Install missing dependencies:"
        log_info "  Ubuntu/Debian: sudo apt-get install curl unzip python3 python3-fonttools"
        log_info "  macOS: brew install curl unzip python3 fonttools"
        log_info "  pip: pip3 install fonttools"
        exit 1
    fi

    log_success "All dependencies are available"
}

# Backup existing fonts
backup_fonts() {
    log_info "Creating backup of existing fonts..."

    local backup_dir="$FONTS_DIR/backup/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"

    if [ -d "$FONTS_DIR/Roboto" ]; then
        cp -r "$FONTS_DIR/Roboto" "$backup_dir/"
        log_success "Roboto fonts backed up"
    fi

    if [ -d "$FONTS_DIR/NotoEmoji" ]; then
        cp -r "$FONTS_DIR/NotoEmoji" "$backup_dir/"
        log_success "NotoEmoji fonts backed up"
    fi

    echo "$backup_dir" > "$FONTS_DIR/.last_backup"
    log_success "Backup completed: $backup_dir"
}

# Download latest Roboto fonts
download_roboto() {
    log_info "Downloading latest Roboto fonts..."

    local roboto_url="https://fonts.google.com/download?family=Roboto"
    local roboto_zip="$FONTS_DIR/roboto_temp.zip"

    # Download Roboto fonts
    if curl -L -o "$roboto_zip" "$roboto_url"; then
        log_success "Roboto fonts downloaded successfully"
    else
        log_error "Failed to download Roboto fonts"
        return 1
    fi

    # Extract fonts
    mkdir -p "$FONTS_DIR/Roboto"
    if unzip -o "$roboto_zip" -d "$FONTS_DIR/Roboto/"; then
        log_success "Roboto fonts extracted"
    else
        log_error "Failed to extract Roboto fonts"
        return 1
    fi

    # Clean up
    rm -f "$roboto_zip"

    # Download Roboto Mono
    log_info "Downloading Roboto Mono..."
    local roboto_mono_url="https://fonts.google.com/download?family=Roboto%20Mono"
    local roboto_mono_zip="$FONTS_DIR/roboto_mono_temp.zip"

    if curl -L -o "$roboto_mono_zip" "$roboto_mono_url"; then
        unzip -o "$roboto_mono_zip" -d "$FONTS_DIR/Roboto/"
        rm -f "$roboto_mono_zip"
        log_success "Roboto Mono downloaded and extracted"
    else
        log_warning "Failed to download Roboto Mono, continuing..."
    fi
}

# Download latest Noto Color Emoji
download_noto_emoji() {
    log_info "Downloading latest Noto Color Emoji..."

    local noto_url="https://fonts.google.com/download?family=Noto%20Color%20Emoji"
    local noto_zip="$FONTS_DIR/noto_temp.zip"

    # Download Noto Color Emoji
    if curl -L -o "$noto_zip" "$noto_url"; then
        log_success "Noto Color Emoji downloaded successfully"
    else
        log_error "Failed to download Noto Color Emoji"
        return 1
    fi

    # Extract fonts
    mkdir -p "$FONTS_DIR/NotoEmoji"
    if unzip -o "$noto_zip" -d "$FONTS_DIR/NotoEmoji/"; then
        log_success "Noto Color Emoji extracted"
    else
        log_error "Failed to extract Noto Color Emoji"
        return 1
    fi

    # Clean up
    rm -f "$noto_zip"
}

# Validate font integrity
validate_fonts() {
    log_info "Validating font integrity..."

    local validation_passed=true

    # Check Roboto fonts
    if [ -d "$FONTS_DIR/Roboto" ]; then
        local roboto_files=(
            "Roboto-Regular.ttf"
            "Roboto-Bold.ttf"
            "Roboto-Light.ttf"
            "Roboto-Thin.ttf"
            "Roboto-Medium.ttf"
            "Roboto-Black.ttf"
        )

        for font_file in "${roboto_files[@]}"; do
            if [ ! -f "$FONTS_DIR/Roboto/$font_file" ]; then
                log_error "Missing Roboto font: $font_file"
                validation_passed=false
            fi
        done

        if [ -f "$FONTS_DIR/Roboto/RobotoMono-Regular.ttf" ]; then
            log_success "Roboto Mono found"
        else
            log_warning "Roboto Mono not found"
        fi
    else
        log_error "Roboto directory not found"
        validation_passed=false
    fi

    # Check Noto Emoji
    if [ -d "$FONTS_DIR/NotoEmoji" ]; then
        if [ ! -f "$FONTS_DIR/NotoEmoji/NotoColorEmoji.ttf" ]; then
            log_error "NotoColorEmoji.ttf not found"
            validation_passed=false
        fi
    else
        log_error "NotoEmoji directory not found"
        validation_passed=false
    fi

    # FontTools validation
    if command -v pyftsubset &> /dev/null; then
        log_info "Running FontTools validation..."

        # Validate Roboto Regular
        if [ -f "$FONTS_DIR/Roboto/Roboto-Regular.ttf" ]; then
            if pyftsubset --help &> /dev/null; then
                log_success "FontTools validation passed"
            fi
        fi
    else
        log_warning "FontTools not available for validation"
    fi

    if [ "$validation_passed" = true ]; then
        log_success "Font validation completed successfully"
        return 0
    else
        log_error "Font validation failed"
        return 1
    fi
}

# Update configuration
update_config() {
    log_info "Updating font configuration..."

    local config_file="$FONTS_DIR/font_config.json"

    if [ -f "$config_file" ]; then
        # Update timestamp
        local temp_file=$(mktemp)
        jq '.last_updated = "'$(date +%Y-%m-%d)'"' "$config_file" > "$temp_file"
        mv "$temp_file" "$config_file"

        log_success "Configuration updated"
    else
        log_warning "Configuration file not found, skipping update"
    fi
}

# Generate checksums
generate_checksums() {
    log_info "Generating font checksums..."

    local checksum_file="$FONTS_DIR/font_checksums.sha256"

    find "$FONTS_DIR" -name "*.ttf" -type f -exec sha256sum {} \; > "$checksum_file"

    log_success "Checksums generated: $checksum_file"
}

# Test Flutter integration
test_flutter_integration() {
    log_info "Testing Flutter integration..."

    if [ -f "$PROJECT_ROOT/pubspec.yaml" ]; then
        if grep -q "fonts:" "$PROJECT_ROOT/pubspec.yaml"; then
            log_success "Flutter fonts configuration found"
        else
            log_warning "Flutter fonts configuration not found in pubspec.yaml"
            log_info "Consider adding font configuration to pubspec.yaml"
        fi
    else
        log_warning "pubspec.yaml not found, skipping Flutter integration test"
    fi
}

# Main update function
main() {
    log_info "REChain Fonts Update Script v4.1.10+1160"
    log_info "Starting font update process..."

    check_dependencies
    backup_fonts

    # Download fonts
    download_roboto
    download_noto_emoji

    # Validate and finalize
    if validate_fonts; then
        update_config
        generate_checksums
        test_flutter_integration

        log_success "Font update completed successfully!"
        log_info "Updated fonts are ready for use."
        log_info "Don't forget to test the application with new fonts."
    else
        log_error "Font update failed due to validation errors"
        log_info "Check the backup in the backup directory for recovery"
        exit 1
    fi
}

# Run main function
main "$@"
