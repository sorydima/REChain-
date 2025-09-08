#!/bin/bash

# REChain Web Testing Script
# Comprehensive testing for web platform including unit tests, integration tests, and validation

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
TEST_MODE=${1:-all}
OUTPUT_DIR="test_results"
COVERAGE_DIR="coverage"

echo -e "${BLUE}REChain Web Testing Script${NC}"
echo -e "${BLUE}===========================${NC}"
echo "Test mode: $TEST_MODE"
echo ""

# Function to print status
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check dependencies
check_dependencies() {
    print_status "Checking test dependencies..."
    
    if ! command -v flutter &> /dev/null; then
        print_error "Flutter is not installed or not in PATH"
        exit 1
    fi
    
    if ! command -v node &> /dev/null; then
        print_warning "Node.js not found. JavaScript tests will be skipped."
    fi
    
    # Check Chrome for web testing
    if ! command -v google-chrome &> /dev/null && ! command -v chromium-browser &> /dev/null; then
        print_warning "Chrome/Chromium not found. Some web tests may fail."
    fi
    
    print_status "Dependencies check completed"
}

# Setup test environment
setup_test_environment() {
    print_status "Setting up test environment..."
    
    # Create output directories
    mkdir -p "$OUTPUT_DIR"
    mkdir -p "$COVERAGE_DIR"
    
    # Clean previous results
    rm -rf "$OUTPUT_DIR"/*
    rm -rf "$COVERAGE_DIR"/*
    
    # Get dependencies
    flutter pub get
    
    print_status "Test environment setup completed"
}

# Run Flutter unit tests
run_flutter_tests() {
    if [ "$TEST_MODE" = "all" ] || [ "$TEST_MODE" = "unit" ]; then
        print_status "Running Flutter unit tests..."
        
        local test_args="--coverage --reporter=json"
        
        # Run tests with coverage
        flutter test $test_args > "$OUTPUT_DIR/flutter_test_results.json" 2>&1
        
        if [ $? -eq 0 ]; then
            print_status "Flutter unit tests passed"
        else
            print_error "Flutter unit tests failed"
            cat "$OUTPUT_DIR/flutter_test_results.json"
            return 1
        fi
        
        # Move coverage data
        if [ -f "coverage/lcov.info" ]; then
            cp coverage/lcov.info "$COVERAGE_DIR/flutter_coverage.info"
        fi
    fi
}

# Run web integration tests
run_web_integration_tests() {
    if [ "$TEST_MODE" = "all" ] || [ "$TEST_MODE" = "integration" ]; then
        print_status "Running web integration tests..."
        
        # Run Flutter integration tests on Chrome
        flutter test integration_test --web-port=7357 --browser-name=chrome > "$OUTPUT_DIR/integration_test_results.txt" 2>&1
        
        if [ $? -eq 0 ]; then
            print_status "Web integration tests passed"
        else
            print_warning "Web integration tests had issues"
            cat "$OUTPUT_DIR/integration_test_results.txt"
        fi
    fi
}

# Test JavaScript modules
test_javascript_modules() {
    if [ "$TEST_MODE" = "all" ] || [ "$TEST_MODE" = "javascript" ]; then
        print_status "Testing JavaScript modules..."
        
        if ! command -v node &> /dev/null; then
            print_warning "Node.js not available, skipping JavaScript tests"
            return 0
        fi
        
        # Create test runner for JavaScript modules
        create_js_test_runner
        
        # Run JavaScript tests
        cd web && node test_runner.js > "../$OUTPUT_DIR/javascript_test_results.txt" 2>&1
        local js_result=$?
        cd ..
        
        if [ $js_result -eq 0 ]; then
            print_status "JavaScript module tests passed"
        else
            print_error "JavaScript module tests failed"
            cat "$OUTPUT_DIR/javascript_test_results.txt"
            return 1
        fi
    fi
}

# Create JavaScript test runner
create_js_test_runner() {
    cat > web/test_runner.js << 'EOF'
// REChain Web JavaScript Module Test Runner

const fs = require('fs');
const path = require('path');

// Mock browser APIs for Node.js testing
global.window = {
    addEventListener: () => {},
    removeEventListener: () => {},
    location: { href: 'http://localhost' },
    navigator: { userAgent: 'test' },
    document: {
        addEventListener: () => {},
        createElement: () => ({ addEventListener: () => {} }),
        head: { appendChild: () => {} }
    },
    Notification: {
        permission: 'granted',
        requestPermission: () => Promise.resolve('granted')
    },
    localStorage: {
        getItem: () => null,
        setItem: () => {},
        removeItem: () => {}
    },
    console: console
};

global.navigator = global.window.navigator;
global.document = global.window.document;
global.localStorage = global.window.localStorage;

// Test results
let testResults = {
    passed: 0,
    failed: 0,
    errors: []
};

// Test function
function test(name, fn) {
    try {
        console.log(`Running test: ${name}`);
        fn();
        testResults.passed++;
        console.log(`✓ ${name}`);
    } catch (error) {
        testResults.failed++;
        testResults.errors.push({ name, error: error.message });
        console.error(`✗ ${name}: ${error.message}`);
    }
}

// Assert function
function assert(condition, message) {
    if (!condition) {
        throw new Error(message || 'Assertion failed');
    }
}

// Load and test JavaScript modules
try {
    // Load modules
    eval(fs.readFileSync('js/AutonomousNotificationService.js', 'utf8'));
    eval(fs.readFileSync('js/CrashReportingManager.js', 'utf8'));
    eval(fs.readFileSync('js/WebSystemIntegration.js', 'utf8'));
    eval(fs.readFileSync('js/AutonomousNotificationIntegration.js', 'utf8'));
    
    // Test AutonomousNotificationService
    test('AutonomousNotificationService constructor', () => {
        const service = new AutonomousNotificationService();
        assert(service instanceof AutonomousNotificationService, 'Should create instance');
        assert(!service.isInitialized, 'Should not be initialized');
    });
    
    // Test CrashReportingManager
    test('CrashReportingManager constructor', () => {
        const manager = new CrashReportingManager();
        assert(manager instanceof CrashReportingManager, 'Should create instance');
        assert(!manager.isInitialized, 'Should not be initialized');
    });
    
    // Test WebSystemIntegration
    test('WebSystemIntegration constructor', () => {
        const integration = new WebSystemIntegration();
        assert(integration instanceof WebSystemIntegration, 'Should create instance');
        assert(!integration.isInitialized, 'Should not be initialized');
    });
    
    // Test AutonomousNotificationIntegration
    test('AutonomousNotificationIntegration constructor', () => {
        const integration = new AutonomousNotificationIntegration();
        assert(integration instanceof AutonomousNotificationIntegration, 'Should create instance');
        assert(!integration.isInitialized, 'Should not be initialized');
    });
    
    // Test configuration handling
    test('Configuration management', () => {
        const integration = new AutonomousNotificationIntegration();
        const config = integration.getConfiguration();
        assert(typeof config === 'object', 'Should return configuration object');
        assert(typeof config.enableNotifications === 'boolean', 'Should have enableNotifications setting');
    });
    
} catch (error) {
    console.error('Failed to load modules:', error.message);
    testResults.failed++;
    testResults.errors.push({ name: 'Module loading', error: error.message });
}

// Print results
console.log('\n=== Test Results ===');
console.log(`Passed: ${testResults.passed}`);
console.log(`Failed: ${testResults.failed}`);

if (testResults.errors.length > 0) {
    console.log('\nErrors:');
    testResults.errors.forEach(error => {
        console.log(`- ${error.name}: ${error.error}`);
    });
}

// Exit with appropriate code
process.exit(testResults.failed > 0 ? 1 : 0);
EOF
}

# Test PWA features
test_pwa_features() {
    if [ "$TEST_MODE" = "all" ] || [ "$TEST_MODE" = "pwa" ]; then
        print_status "Testing PWA features..."
        
        # Check manifest.json
        if [ -f "web/manifest.json" ]; then
            print_status "Validating manifest.json..."
            
            # Basic JSON validation
            if command -v node &> /dev/null; then
                node -e "JSON.parse(require('fs').readFileSync('web/manifest.json', 'utf8'))" 2>/dev/null
                if [ $? -eq 0 ]; then
                    print_status "manifest.json is valid JSON"
                else
                    print_error "manifest.json is invalid JSON"
                    return 1
                fi
            fi
        else
            print_error "manifest.json not found"
            return 1
        fi
        
        # Check service worker
        if [ -f "web/sw.js" ]; then
            print_status "Service worker found"
        else
            print_error "Service worker (sw.js) not found"
            return 1
        fi
        
        # Check required PWA assets
        local required_files=("icons/Icon-192.png" "icons/Icon-512.png")
        for file in "${required_files[@]}"; do
            if [ -f "web/$file" ]; then
                print_status "Required asset found: $file"
            else
                print_warning "Required asset missing: $file"
            fi
        done
    fi
}

# Test service worker functionality
test_service_worker() {
    if [ "$TEST_MODE" = "all" ] || [ "$TEST_MODE" = "sw" ]; then
        print_status "Testing service worker functionality..."
        
        if [ -f "web/sw.js" ]; then
            # Basic syntax check
            if command -v node &> /dev/null; then
                node -c web/sw.js 2>/dev/null
                if [ $? -eq 0 ]; then
                    print_status "Service worker syntax is valid"
                else
                    print_error "Service worker has syntax errors"
                    return 1
                fi
            fi
            
            # Check for required service worker features
            local required_features=("install" "activate" "fetch" "push" "notificationclick")
            for feature in "${required_features[@]}"; do
                if grep -q "addEventListener.*$feature" web/sw.js; then
                    print_status "Service worker has $feature handler"
                else
                    print_warning "Service worker missing $feature handler"
                fi
            done
        else
            print_error "Service worker not found"
            return 1
        fi
    fi
}

# Test build system
test_build_system() {
    if [ "$TEST_MODE" = "all" ] || [ "$TEST_MODE" = "build" ]; then
        print_status "Testing build system..."
        
        # Test debug build
        print_status "Testing debug build..."
        flutter build web --debug --web-renderer html > "$OUTPUT_DIR/debug_build.log" 2>&1
        
        if [ $? -eq 0 ]; then
            print_status "Debug build successful"
        else
            print_error "Debug build failed"
            cat "$OUTPUT_DIR/debug_build.log"
            return 1
        fi
        
        # Test release build
        print_status "Testing release build..."
        flutter build web --release --web-renderer canvaskit > "$OUTPUT_DIR/release_build.log" 2>&1
        
        if [ $? -eq 0 ]; then
            print_status "Release build successful"
        else
            print_error "Release build failed"
            cat "$OUTPUT_DIR/release_build.log"
            return 1
        fi
    fi
}

# Performance testing
test_performance() {
    if [ "$TEST_MODE" = "all" ] || [ "$TEST_MODE" = "performance" ]; then
        print_status "Running performance tests..."
        
        if command -v node &> /dev/null; then
            # Create performance test script
            create_performance_test
            
            # Run performance tests
            node web/performance_test.js > "$OUTPUT_DIR/performance_results.txt" 2>&1
            
            if [ $? -eq 0 ]; then
                print_status "Performance tests completed"
                cat "$OUTPUT_DIR/performance_results.txt"
            else
                print_warning "Performance tests had issues"
            fi
        else
            print_warning "Node.js not available, skipping performance tests"
        fi
    fi
}

# Create performance test script
create_performance_test() {
    cat > web/performance_test.js << 'EOF'
// REChain Web Performance Test

const fs = require('fs');
const path = require('path');

console.log('=== REChain Web Performance Analysis ===\n');

// Analyze JavaScript file sizes
console.log('JavaScript File Sizes:');
const jsFiles = ['js/AutonomousNotificationService.js', 'js/CrashReportingManager.js', 
                'js/WebSystemIntegration.js', 'js/AutonomousNotificationIntegration.js'];

let totalSize = 0;
jsFiles.forEach(file => {
    if (fs.existsSync(file)) {
        const stats = fs.statSync(file);
        const sizeKB = (stats.size / 1024).toFixed(2);
        console.log(`  ${file}: ${sizeKB} KB`);
        totalSize += stats.size;
    }
});

console.log(`  Total JS Size: ${(totalSize / 1024).toFixed(2)} KB\n`);

// Analyze service worker
if (fs.existsSync('sw.js')) {
    const swStats = fs.statSync('sw.js');
    console.log(`Service Worker Size: ${(swStats.size / 1024).toFixed(2)} KB\n`);
}

// Check for potential optimizations
console.log('Optimization Recommendations:');
jsFiles.forEach(file => {
    if (fs.existsSync(file)) {
        const content = fs.readFileSync(file, 'utf8');
        
        // Check for console.log statements
        const consoleCount = (content.match(/console\./g) || []).length;
        if (consoleCount > 10) {
            console.log(`  ${file}: Consider removing ${consoleCount} console statements for production`);
        }
        
        // Check for comments
        const commentLines = (content.match(/^\s*\/\//gm) || []).length;
        if (commentLines > 50) {
            console.log(`  ${file}: ${commentLines} comment lines could be removed for production`);
        }
    }
});

console.log('\nPerformance test completed.');
EOF
}

# Security testing
test_security() {
    if [ "$TEST_MODE" = "all" ] || [ "$TEST_MODE" = "security" ]; then
        print_status "Running security tests..."
        
        # Check for security headers in configuration files
        local security_issues=0
        
        if [ -f "build/web/.htaccess" ]; then
            if grep -q "X-Frame-Options" build/web/.htaccess; then
                print_status "X-Frame-Options header configured"
            else
                print_warning "X-Frame-Options header missing"
                ((security_issues++))
            fi
            
            if grep -q "X-Content-Type-Options" build/web/.htaccess; then
                print_status "X-Content-Type-Options header configured"
            else
                print_warning "X-Content-Type-Options header missing"
                ((security_issues++))
            fi
        fi
        
        # Check JavaScript for potential security issues
        local js_files=("web/js/AutonomousNotificationService.js" "web/js/CrashReportingManager.js")
        for file in "${js_files[@]}"; do
            if [ -f "$file" ]; then
                # Check for eval usage
                if grep -q "eval(" "$file"; then
                    print_warning "Found eval() usage in $file - potential security risk"
                    ((security_issues++))
                fi
                
                # Check for innerHTML usage
                if grep -q "innerHTML" "$file"; then
                    print_warning "Found innerHTML usage in $file - consider using textContent"
                    ((security_issues++))
                fi
            fi
        done
        
        if [ $security_issues -eq 0 ]; then
            print_status "No security issues found"
        else
            print_warning "Found $security_issues potential security issues"
        fi
    fi
}

# Generate test report
generate_test_report() {
    print_status "Generating test report..."
    
    local report_file="$OUTPUT_DIR/test_report.html"
    
    cat > "$report_file" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>REChain Web Test Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header { background: #0175C2; color: white; padding: 20px; border-radius: 5px; }
        .section { margin: 20px 0; padding: 15px; border: 1px solid #ddd; border-radius: 5px; }
        .pass { color: green; }
        .fail { color: red; }
        .warn { color: orange; }
        pre { background: #f5f5f5; padding: 10px; border-radius: 3px; overflow-x: auto; }
    </style>
</head>
<body>
    <div class="header">
        <h1>REChain Web Platform Test Report</h1>
        <p>Generated: $(date)</p>
        <p>Test Mode: $TEST_MODE</p>
    </div>
    
    <div class="section">
        <h2>Test Results Summary</h2>
        <ul>
EOF

    # Add test results to report
    for result_file in "$OUTPUT_DIR"/*.txt "$OUTPUT_DIR"/*.json; do
        if [ -f "$result_file" ]; then
            local filename=$(basename "$result_file")
            echo "            <li><a href=\"#$filename\">$filename</a></li>" >> "$report_file"
        fi
    done
    
    cat >> "$report_file" << EOF
        </ul>
    </div>
    
    <div class="section">
        <h2>Coverage Information</h2>
        <p>Coverage reports are available in the coverage directory.</p>
    </div>
EOF

    # Add detailed results
    for result_file in "$OUTPUT_DIR"/*.txt "$OUTPUT_DIR"/*.json; do
        if [ -f "$result_file" ]; then
            local filename=$(basename "$result_file")
            echo "    <div class=\"section\">" >> "$report_file"
            echo "        <h3 id=\"$filename\">$filename</h3>" >> "$report_file"
            echo "        <pre>$(cat "$result_file")</pre>" >> "$report_file"
            echo "    </div>" >> "$report_file"
        fi
    done
    
    echo "</body></html>" >> "$report_file"
    
    print_status "Test report generated: $report_file"
}

# Cleanup
cleanup() {
    print_status "Cleaning up test artifacts..."
    
    # Remove temporary test files
    if [ -f "web/test_runner.js" ]; then
        rm web/test_runner.js
    fi
    
    if [ -f "web/performance_test.js" ]; then
        rm web/performance_test.js
    fi
    
    print_status "Cleanup completed"
}

# Main testing process
main() {
    echo -e "${BLUE}Starting REChain web testing process...${NC}"
    echo ""
    
    local failed_tests=0
    
    check_dependencies
    setup_test_environment
    
    # Run tests based on mode
    if ! run_flutter_tests; then ((failed_tests++)); fi
    if ! run_web_integration_tests; then ((failed_tests++)); fi
    if ! test_javascript_modules; then ((failed_tests++)); fi
    if ! test_pwa_features; then ((failed_tests++)); fi
    if ! test_service_worker; then ((failed_tests++)); fi
    if ! test_build_system; then ((failed_tests++)); fi
    test_performance
    test_security
    
    generate_test_report
    cleanup
    
    echo ""
    if [ $failed_tests -eq 0 ]; then
        echo -e "${GREEN}✓ All REChain web tests completed successfully!${NC}"
    else
        echo -e "${YELLOW}⚠ REChain web tests completed with $failed_tests failed test suites${NC}"
    fi
    echo -e "${GREEN}✓ Test results: $OUTPUT_DIR${NC}"
    echo -e "${GREEN}✓ Coverage reports: $COVERAGE_DIR${NC}"
    echo ""
    
    exit $failed_tests
}

# Handle script interruption
trap cleanup EXIT

# Run main function
main "$@"
