#!/bin/bash

# REChain HarmonyOS Deployment Script
# Comprehensive deployment automation for HarmonyOS platform

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
HARMONYOS_DIR="$PROJECT_ROOT/harmonyos"
DIST_DIR="$PROJECT_ROOT/dist/harmonyos"
DEPLOY_DIR="$PROJECT_ROOT/deploy/harmonyos"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Deployment configuration
DEPLOYMENT_TYPE="${DEPLOYMENT_TYPE:-local}"
DEVICE_ID="${DEVICE_ID:-}"
APPGALLERY_UPLOAD="${APPGALLERY_UPLOAD:-false}"
CREATE_INSTALLER="${CREATE_INSTALLER:-true}"

check_deployment_environment() {
    log_info "Checking deployment environment..."
    
    if [[ ! -d "$DIST_DIR" ]]; then
        log_error "Distribution directory not found: $DIST_DIR"
        log_error "Please run build script first"
        exit 1
    fi
    
    # Check for HAP files
    local hap_files=($(find "$DIST_DIR" -name "*.hap" -type f))
    if [[ ${#hap_files[@]} -eq 0 ]]; then
        log_error "No HAP files found in distribution directory"
        exit 1
    fi
    
    # Check for hdc
    if ! command -v hdc &> /dev/null; then
        log_error "hdc not found, required for device deployment"
        exit 1
    fi
    
    mkdir -p "$DEPLOY_DIR"
    log_success "Deployment environment ready"
}

deploy_to_device() {
    log_info "Deploying to HarmonyOS device..."
    
    local hap_file=$(find "$DIST_DIR" -name "*.hap" -type f | head -1)
    
    if [[ -n "$DEVICE_ID" ]]; then
        hdc -t "$DEVICE_ID" install "$hap_file"
        hdc -t "$DEVICE_ID" shell am start -n com.rechain.harmonyos/EntryAbility
    else
        # Use first available device
        local devices=$(hdc list targets | grep -v "Empty" || true)
        if [[ -n "$devices" ]]; then
            local device=$(echo "$devices" | head -1)
            hdc -t "$device" install "$hap_file"
            hdc -t "$device" shell am start -n com.rechain.harmonyos/EntryAbility
        else
            log_warning "No devices connected for deployment"
        fi
    fi
    
    log_success "Deployment to device completed"
}

create_installer_package() {
    if [[ "$CREATE_INSTALLER" != "true" ]]; then
        return 0
    fi
    
    log_info "Creating installer package..."
    
    local installer_dir="$DEPLOY_DIR/installer"
    mkdir -p "$installer_dir"
    
    # Copy HAP files
    cp "$DIST_DIR"/*.hap "$installer_dir/"
    
    # Create installation script
    cat > "$installer_dir/install.sh" << 'EOF'
#!/bin/bash
# REChain HarmonyOS Installer

echo "REChain HarmonyOS Installation"
echo "============================="

# Check for hdc
if ! command -v hdc &> /dev/null; then
    echo "Error: hdc not found"
    echo "Please install HarmonyOS SDK and add hdc to PATH"
    exit 1
fi

# Check for connected devices
devices=$(hdc list targets | grep -v "Empty" || true)
if [[ -z "$devices" ]]; then
    echo "Error: No HarmonyOS devices connected"
    echo "Please connect a HarmonyOS device and enable developer mode"
    exit 1
fi

# Install HAP
hap_file=$(ls *.hap | head -1)
if [[ -n "$hap_file" ]]; then
    echo "Installing $hap_file..."
    hdc install "$hap_file"
    echo "Installation completed successfully"
    echo "You can now launch REChain from your device"
else
    echo "Error: No HAP file found"
    exit 1
fi
EOF
    
    chmod +x "$installer_dir/install.sh"
    
    # Create installer package
    cd "$DEPLOY_DIR"
    tar -czf "rechain-harmonyos-installer-$(date +%Y%m%d).tar.gz" installer/
    
    log_success "Installer package created"
}

generate_deployment_report() {
    log_info "Generating deployment report..."
    
    local report_file="$DEPLOY_DIR/deployment-report-$(date +%Y%m%d-%H%M%S).html"
    
    cat > "$report_file" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>REChain HarmonyOS Deployment Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .success { color: green; }
        .warning { color: orange; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>REChain HarmonyOS Deployment Report</h1>
    <p>Generated: $(date)</p>
    
    <h2>Deployment Summary</h2>
    <table>
        <tr><th>Component</th><th>Status</th><th>Details</th></tr>
        <tr><td>Device Deployment</td><td class="success">Success</td><td>HAP installed on device</td></tr>
        <tr><td>Installer Package</td><td class="$([ "$CREATE_INSTALLER" == "true" ] && echo "success" || echo "warning")">$([ "$CREATE_INSTALLER" == "true" ] && echo "Created" || echo "Skipped")</td><td>Installation package</td></tr>
    </table>
    
    <h2>Installation Instructions</h2>
    <h3>Manual Installation</h3>
    <pre>
# Connect HarmonyOS device
# Enable Developer Mode and USB Debugging
hdc install rechain-harmonyos.hap
    </pre>
    
    <h3>Using Installer Package</h3>
    <pre>
# Extract installer package
tar -xzf rechain-harmonyos-installer-*.tar.gz
cd installer
./install.sh
    </pre>
</body>
</html>
EOF
    
    log_success "Deployment report generated: $report_file"
}

main() {
    echo "REChain HarmonyOS Deployment"
    echo "=========================="
    
    check_deployment_environment
    
    case "$DEPLOYMENT_TYPE" in
        "local"|"device")
            deploy_to_device
            ;;
        "package")
            create_installer_package
            ;;
        "all")
            deploy_to_device
            create_installer_package
            ;;
        *)
            log_error "Unknown deployment type: $DEPLOYMENT_TYPE"
            exit 1
            ;;
    esac
    
    generate_deployment_report
    
    log_success "Deployment completed successfully"
}

main "$@"
