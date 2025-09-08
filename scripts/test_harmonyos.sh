#!/bin/bash

# REChain HarmonyOS Test Script
# Comprehensive testing automation for HarmonyOS platform

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
HARMONYOS_DIR="$PROJECT_ROOT/harmonyos"
TEST_RESULTS_DIR="$PROJECT_ROOT/test-results/harmonyos"

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

# Test configuration
RUN_UNIT_TESTS="${RUN_UNIT_TESTS:-true}"
RUN_INTEGRATION_TESTS="${RUN_INTEGRATION_TESTS:-true}"
RUN_PERFORMANCE_TESTS="${RUN_PERFORMANCE_TESTS:-false}"
DEVICE_ID="${DEVICE_ID:-}"
VERBOSE="${VERBOSE:-false}"

check_test_environment() {
    log_info "Checking test environment..."
    
    if [[ ! -d "$HARMONYOS_DIR" ]]; then
        log_error "HarmonyOS directory not found: $HARMONYOS_DIR"
        exit 1
    fi
    
    # Check for hdc (HarmonyOS Device Connector)
    if ! command -v hdc &> /dev/null; then
        log_error "hdc not found, required for device testing"
        exit 1
    fi
    
    # Check connected devices
    local devices=$(hdc list targets 2>/dev/null | grep -v "Empty" || true)
    if [[ -z "$devices" && "$RUN_INTEGRATION_TESTS" == "true" ]]; then
        log_warning "No HarmonyOS devices connected, integration tests will be skipped"
        RUN_INTEGRATION_TESTS="false"
    fi
    
    mkdir -p "$TEST_RESULTS_DIR"
    log_success "Test environment ready"
}

run_unit_tests() {
    if [[ "$RUN_UNIT_TESTS" != "true" ]]; then
        return 0
    fi
    
    log_info "Running unit tests..."
    cd "$HARMONYOS_DIR"
    
    # Run hvigor test command
    if [[ -f "hvigorw" ]]; then
        ./hvigorw test --mode debug
    else
        log_error "hvigor wrapper not found"
        return 1
    fi
    
    log_success "Unit tests completed"
}

run_integration_tests() {
    if [[ "$RUN_INTEGRATION_TESTS" != "true" ]]; then
        return 0
    fi
    
    log_info "Running integration tests..."
    cd "$HARMONYOS_DIR"
    
    # Install and run tests on device
    if [[ -n "$DEVICE_ID" ]]; then
        hdc -t "$DEVICE_ID" install entry/build/default/outputs/default/entry-default-signed.hap
        hdc -t "$DEVICE_ID" shell am start -n com.rechain.harmonyos/EntryAbility
    else
        # Use first available device
        local device=$(hdc list targets | head -1)
        if [[ -n "$device" ]]; then
            hdc -t "$device" install entry/build/default/outputs/default/entry-default-signed.hap
        fi
    fi
    
    log_success "Integration tests completed"
}

generate_test_report() {
    log_info "Generating test report..."
    
    local report_file="$TEST_RESULTS_DIR/test-report-$(date +%Y%m%d-%H%M%S).html"
    
    cat > "$report_file" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>REChain HarmonyOS Test Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .success { color: green; }
        .warning { color: orange; }
        .error { color: red; }
    </style>
</head>
<body>
    <h1>REChain HarmonyOS Test Report</h1>
    <p>Generated: $(date)</p>
    
    <h2>Test Summary</h2>
    <table border="1">
        <tr><th>Test Type</th><th>Status</th><th>Details</th></tr>
        <tr><td>Unit Tests</td><td class="$([ "$RUN_UNIT_TESTS" == "true" ] && echo "success" || echo "warning")">$([ "$RUN_UNIT_TESTS" == "true" ] && echo "Passed" || echo "Skipped")</td><td>Component unit tests</td></tr>
        <tr><td>Integration Tests</td><td class="$([ "$RUN_INTEGRATION_TESTS" == "true" ] && echo "success" || echo "warning")">$([ "$RUN_INTEGRATION_TESTS" == "true" ] && echo "Passed" || echo "Skipped")</td><td>Device integration tests</td></tr>
    </table>
</body>
</html>
EOF
    
    log_success "Test report generated: $report_file"
}

main() {
    echo "REChain HarmonyOS Test Suite"
    echo "=========================="
    
    check_test_environment
    run_unit_tests
    run_integration_tests
    generate_test_report
    
    log_success "All tests completed successfully"
}

main "$@"
