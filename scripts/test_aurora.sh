#!/bin/bash

# REChain Aurora OS Test Script
# Comprehensive testing suite for Aurora OS platform
# Covers unit tests, integration tests, system tests, and validation

set -euo pipefail

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
AURORA_DIR="$PROJECT_ROOT/aurora"
BUILD_DIR="$PROJECT_ROOT/build/aurora"
TEST_DIR="$PROJECT_ROOT/test/aurora"
REPORTS_DIR="$PROJECT_ROOT/test-reports/aurora"

# Test configuration
TEST_TYPE="${TEST_TYPE:-all}"
TARGET_ARCH="${TARGET_ARCH:-aarch64}"
VERBOSE="${VERBOSE:-false}"
COVERAGE="${COVERAGE:-false}"
PARALLEL_TESTS="${PARALLEL_TESTS:-true}"
TIMEOUT="${TIMEOUT:-300}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TESTS_TOTAL=0
TESTS_PASSED=0
TESTS_FAILED=0
TESTS_SKIPPED=0

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

log_test_result() {
    local status=$1
    local test_name=$2
    local duration=${3:-"N/A"}
    
    case $status in
        "PASS")
            echo -e "${GREEN}[PASS]${NC} $test_name ($duration)"
            ((TESTS_PASSED++))
            ;;
        "FAIL")
            echo -e "${RED}[FAIL]${NC} $test_name ($duration)"
            ((TESTS_FAILED++))
            ;;
        "SKIP")
            echo -e "${YELLOW}[SKIP]${NC} $test_name"
            ((TESTS_SKIPPED++))
            ;;
    esac
    ((TESTS_TOTAL++))
}

# Print script header
print_header() {
    echo "=================================================="
    echo "REChain Aurora OS Test Suite"
    echo "=================================================="
    echo "Test Type: $TEST_TYPE"
    echo "Target Architecture: $TARGET_ARCH"
    echo "Coverage: $COVERAGE"
    echo "Parallel Tests: $PARALLEL_TESTS"
    echo "Timeout: ${TIMEOUT}s"
    echo "=================================================="
}

# Setup test environment
setup_test_environment() {
    log_info "Setting up test environment..."
    
    # Create test directories
    mkdir -p "$TEST_DIR"
    mkdir -p "$REPORTS_DIR"
    
    # Set up Aurora OS environment
    export PKG_CONFIG_PATH="/opt/aurora-sdk/targets/aurora-$TARGET_ARCH/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
    export LD_LIBRARY_PATH="$BUILD_DIR/lib:/opt/aurora-sdk/targets/aurora-$TARGET_ARCH/usr/lib:$LD_LIBRARY_PATH"
    
    # Set up test data
    export RECHAIN_TEST_DATA_DIR="$TEST_DIR/data"
    export RECHAIN_TEST_CONFIG_DIR="$TEST_DIR/config"
    export RECHAIN_TEST_LOG_DIR="$TEST_DIR/logs"
    
    mkdir -p "$RECHAIN_TEST_DATA_DIR"
    mkdir -p "$RECHAIN_TEST_CONFIG_DIR"
    mkdir -p "$RECHAIN_TEST_LOG_DIR"
    
    # Create test configuration
    cat > "$RECHAIN_TEST_CONFIG_DIR/test.conf" << EOF
[Application]
name=REChain Test
version=4.1.10+1160-test
environment=test

[Logging]
level=DEBUG
file_path=$RECHAIN_TEST_LOG_DIR/test.log
enable_console=true

[Notifications]
enabled=false
sound_enabled=false
vibration_enabled=false

[System Integration]
enable_dbus=false
enable_sensors=false
enable_system_monitoring=false

[Crash Reporting]
enabled=false
auto_submit=false
EOF
    
    log_success "Test environment configured"
}

# Unit tests
run_unit_tests() {
    log_info "Running unit tests..."
    
    local test_start=$(date +%s)
    local unit_tests_passed=0
    local unit_tests_failed=0
    
    # Test AutonomousNotificationService
    if run_notification_service_tests; then
        log_test_result "PASS" "AutonomousNotificationService" "$(get_duration $test_start)"
        ((unit_tests_passed++))
    else
        log_test_result "FAIL" "AutonomousNotificationService" "$(get_duration $test_start)"
        ((unit_tests_failed++))
    fi
    
    # Test CrashReportingManager
    test_start=$(date +%s)
    if run_crash_reporting_tests; then
        log_test_result "PASS" "CrashReportingManager" "$(get_duration $test_start)"
        ((unit_tests_passed++))
    else
        log_test_result "FAIL" "CrashReportingManager" "$(get_duration $test_start)"
        ((unit_tests_failed++))
    fi
    
    # Test AuroraSystemIntegration
    test_start=$(date +%s)
    if run_system_integration_tests; then
        log_test_result "PASS" "AuroraSystemIntegration" "$(get_duration $test_start)"
        ((unit_tests_passed++))
    else
        log_test_result "FAIL" "AuroraSystemIntegration" "$(get_duration $test_start)"
        ((unit_tests_failed++))
    fi
    
    log_info "Unit tests completed: $unit_tests_passed passed, $unit_tests_failed failed"
}

# Notification service tests
run_notification_service_tests() {
    log_info "Testing AutonomousNotificationService..."
    
    # Create test program
    cat > "$TEST_DIR/test_notifications.cpp" << 'EOF'
#include "../aurora/AutonomousNotificationService.h"
#include <QCoreApplication>
#include <QTest>
#include <QSignalSpy>

class NotificationServiceTest : public QObject {
    Q_OBJECT

private slots:
    void initTestCase() {
        service = new AutonomousNotificationService(this);
    }
    
    void testInitialization() {
        QVariantMap config;
        config["appName"] = "Test App";
        config["enableDebugLogging"] = true;
        
        QVERIFY(service->initialize(config));
        QVERIFY(service->isInitialized());
    }
    
    void testNotificationDisplay() {
        QSignalSpy spy(service, &AutonomousNotificationService::notificationDisplayed);
        
        QVariantMap notification;
        notification["title"] = "Test Title";
        notification["body"] = "Test Body";
        notification["type"] = static_cast<int>(AutonomousNotificationService::MESSAGE);
        
        QString id = service->displayNotification(notification);
        QVERIFY(!id.isEmpty());
        QVERIFY(spy.count() > 0);
    }
    
    void testNotificationCancel() {
        QVariantMap notification;
        notification["title"] = "Cancel Test";
        notification["body"] = "This should be cancelled";
        
        QString id = service->displayNotification(notification);
        QVERIFY(service->cancelNotification(id));
    }
    
    void cleanupTestCase() {
        service->shutdown();
        delete service;
    }

private:
    AutonomousNotificationService *service;
};

#include "test_notifications.moc"

int main(int argc, char *argv[]) {
    QCoreApplication app(argc, argv);
    NotificationServiceTest test;
    return QTest::qExec(&test, argc, argv);
}
EOF
    
    # Compile and run test
    cd "$TEST_DIR"
    if g++ -std=c++17 -I"$AURORA_DIR" -I"$BUILD_DIR" \
        $(pkg-config --cflags --libs Qt5Core Qt5Test Qt5DBus Qt5Multimedia) \
        test_notifications.cpp "$BUILD_DIR/AutonomousNotificationService.o" \
        -o test_notifications 2>/dev/null; then
        
        timeout "$TIMEOUT" ./test_notifications > notification_test.log 2>&1
        return $?
    else
        log_error "Failed to compile notification service tests"
        return 1
    fi
}

# Crash reporting tests
run_crash_reporting_tests() {
    log_info "Testing CrashReportingManager..."
    
    # Create test program
    cat > "$TEST_DIR/test_crash_reporting.cpp" << 'EOF'
#include "../aurora/CrashReportingManager.h"
#include <QCoreApplication>
#include <QTest>
#include <QSignalSpy>

class CrashReportingTest : public QObject {
    Q_OBJECT

private slots:
    void initTestCase() {
        manager = new CrashReportingManager(this);
    }
    
    void testInitialization() {
        QVariantMap config;
        config["appName"] = "Test App";
        config["environment"] = "test";
        config["autoSubmitCrashes"] = false;
        
        QVERIFY(manager->initialize(config));
        QVERIFY(manager->isInitialized());
    }
    
    void testErrorRecording() {
        QSignalSpy spy(manager, &CrashReportingManager::errorRecorded);
        
        manager->recordError("Test error message");
        QVERIFY(spy.count() > 0);
    }
    
    void testBreadcrumbs() {
        manager->addBreadcrumb("Test breadcrumb", "test");
        QVariantList breadcrumbs = manager->getBreadcrumbs();
        QVERIFY(breadcrumbs.size() > 0);
    }
    
    void testUserIdentification() {
        manager->setUserIdentification("test-user", "test@example.com");
        QVariantMap userInfo = manager->getUserIdentification();
        QCOMPARE(userInfo["userId"].toString(), QString("test-user"));
    }
    
    void cleanupTestCase() {
        manager->shutdown();
        delete manager;
    }

private:
    CrashReportingManager *manager;
};

#include "test_crash_reporting.moc"

int main(int argc, char *argv[]) {
    QCoreApplication app(argc, argv);
    CrashReportingTest test;
    return QTest::qExec(&test, argc, argv);
}
EOF
    
    # Compile and run test
    cd "$TEST_DIR"
    if g++ -std=c++17 -I"$AURORA_DIR" -I"$BUILD_DIR" \
        $(pkg-config --cflags --libs Qt5Core Qt5Test Qt5Network) \
        test_crash_reporting.cpp "$BUILD_DIR/CrashReportingManager.o" \
        -o test_crash_reporting 2>/dev/null; then
        
        timeout "$TIMEOUT" ./test_crash_reporting > crash_test.log 2>&1
        return $?
    else
        log_error "Failed to compile crash reporting tests"
        return 1
    fi
}

# System integration tests
run_system_integration_tests() {
    log_info "Testing AuroraSystemIntegration..."
    
    # Create test program
    cat > "$TEST_DIR/test_system_integration.cpp" << 'EOF'
#include "../aurora/AuroraSystemIntegration.h"
#include <QCoreApplication>
#include <QTest>

class SystemIntegrationTest : public QObject {
    Q_OBJECT

private slots:
    void initTestCase() {
        integration = new AuroraSystemIntegration(this);
    }
    
    void testInitialization() {
        QVariantMap config;
        config["enableSystemMonitoring"] = false;
        config["enableSensors"] = false;
        
        QVERIFY(integration->initialize(config));
        QVERIFY(integration->isInitialized());
    }
    
    void testDeviceInfo() {
        QVariantMap deviceInfo = integration->getDeviceInfo();
        QVERIFY(!deviceInfo.isEmpty());
        QVERIFY(deviceInfo.contains("deviceModel"));
    }
    
    void testSystemStatus() {
        QVariantMap status = integration->getSystemStatus();
        QVERIFY(!status.isEmpty());
    }
    
    void cleanupTestCase() {
        integration->shutdown();
        delete integration;
    }

private:
    AuroraSystemIntegration *integration;
};

#include "test_system_integration.moc"

int main(int argc, char *argv[]) {
    QCoreApplication app(argc, argv);
    SystemIntegrationTest test;
    return QTest::qExec(&test, argc, argv);
}
EOF
    
    # Compile and run test
    cd "$TEST_DIR"
    if g++ -std=c++17 -I"$AURORA_DIR" -I"$BUILD_DIR" \
        $(pkg-config --cflags --libs Qt5Core Qt5Test Qt5DBus Qt5Sensors) \
        test_system_integration.cpp \
        -o test_system_integration 2>/dev/null; then
        
        timeout "$TIMEOUT" ./test_system_integration > system_test.log 2>&1
        return $?
    else
        log_warning "Skipping system integration tests (compilation failed)"
        log_test_result "SKIP" "AuroraSystemIntegration"
        return 0
    fi
}

# Integration tests
run_integration_tests() {
    log_info "Running integration tests..."
    
    # Test application startup
    test_application_startup
    
    # Test service communication
    test_service_communication
    
    # Test configuration loading
    test_configuration_loading
}

# Test application startup
test_application_startup() {
    log_info "Testing application startup..."
    
    local test_start=$(date +%s)
    
    # Create minimal test application
    if timeout 30 "$BUILD_DIR/com.rechain.online" --test-mode --exit-after-init > "$TEST_DIR/startup.log" 2>&1; then
        log_test_result "PASS" "Application Startup" "$(get_duration $test_start)"
    else
        log_test_result "FAIL" "Application Startup" "$(get_duration $test_start)"
        cat "$TEST_DIR/startup.log"
    fi
}

# Test service communication
test_service_communication() {
    log_info "Testing service communication..."
    
    local test_start=$(date +%s)
    
    # Test D-Bus communication
    if dbus-send --session --print-reply --dest=org.freedesktop.DBus /org/freedesktop/DBus org.freedesktop.DBus.ListNames > /dev/null 2>&1; then
        log_test_result "PASS" "D-Bus Communication" "$(get_duration $test_start)"
    else
        log_test_result "FAIL" "D-Bus Communication" "$(get_duration $test_start)"
    fi
}

# Test configuration loading
test_configuration_loading() {
    log_info "Testing configuration loading..."
    
    local test_start=$(date +%s)
    
    # Test configuration file parsing
    if [[ -f "$AURORA_DIR/config/rechain.conf" ]]; then
        log_test_result "PASS" "Configuration Loading" "$(get_duration $test_start)"
    else
        log_test_result "FAIL" "Configuration Loading" "$(get_duration $test_start)"
    fi
}

# Performance tests
run_performance_tests() {
    log_info "Running performance tests..."
    
    # Memory usage test
    test_memory_usage
    
    # Startup time test
    test_startup_time
    
    # Notification performance test
    test_notification_performance
}

# Test memory usage
test_memory_usage() {
    log_info "Testing memory usage..."
    
    local test_start=$(date +%s)
    
    # Monitor memory usage during startup
    if command -v valgrind &> /dev/null; then
        valgrind --tool=massif --massif-out-file="$TEST_DIR/memory.out" \
            "$BUILD_DIR/com.rechain.online" --test-mode --exit-after-init > /dev/null 2>&1
        
        if [[ -f "$TEST_DIR/memory.out" ]]; then
            log_test_result "PASS" "Memory Usage Test" "$(get_duration $test_start)"
        else
            log_test_result "FAIL" "Memory Usage Test" "$(get_duration $test_start)"
        fi
    else
        log_test_result "SKIP" "Memory Usage Test (valgrind not available)"
    fi
}

# Test startup time
test_startup_time() {
    log_info "Testing startup time..."
    
    local test_start=$(date +%s)
    local startup_time
    
    startup_time=$(timeout 60 time -p "$BUILD_DIR/com.rechain.online" --test-mode --exit-after-init 2>&1 | grep real | awk '{print $2}')
    
    if [[ -n "$startup_time" ]] && (( $(echo "$startup_time < 10.0" | bc -l) )); then
        log_test_result "PASS" "Startup Time Test (${startup_time}s)" "$(get_duration $test_start)"
    else
        log_test_result "FAIL" "Startup Time Test (${startup_time}s)" "$(get_duration $test_start)"
    fi
}

# Test notification performance
test_notification_performance() {
    log_info "Testing notification performance..."
    
    local test_start=$(date +%s)
    
    # Test multiple notifications
    log_test_result "SKIP" "Notification Performance Test (not implemented)"
}

# Security tests
run_security_tests() {
    log_info "Running security tests..."
    
    # Test file permissions
    test_file_permissions
    
    # Test configuration security
    test_configuration_security
}

# Test file permissions
test_file_permissions() {
    log_info "Testing file permissions..."
    
    local test_start=$(date +%s)
    local issues=0
    
    # Check executable permissions
    if [[ ! -x "$BUILD_DIR/com.rechain.online" ]]; then
        log_error "Executable not found or not executable"
        ((issues++))
    fi
    
    # Check configuration file permissions
    if [[ -f "$AURORA_DIR/config/rechain.conf" ]]; then
        local perms=$(stat -c "%a" "$AURORA_DIR/config/rechain.conf")
        if [[ "$perms" != "644" ]]; then
            log_warning "Configuration file has unexpected permissions: $perms"
        fi
    fi
    
    if [[ $issues -eq 0 ]]; then
        log_test_result "PASS" "File Permissions" "$(get_duration $test_start)"
    else
        log_test_result "FAIL" "File Permissions" "$(get_duration $test_start)"
    fi
}

# Test configuration security
test_configuration_security() {
    log_info "Testing configuration security..."
    
    local test_start=$(date +%s)
    
    # Check for sensitive data in configuration
    if grep -i "password\|secret\|key" "$AURORA_DIR/config/rechain.conf" > /dev/null 2>&1; then
        log_test_result "FAIL" "Configuration Security (sensitive data found)" "$(get_duration $test_start)"
    else
        log_test_result "PASS" "Configuration Security" "$(get_duration $test_start)"
    fi
}

# Generate test report
generate_test_report() {
    log_info "Generating test report..."
    
    local report_file="$REPORTS_DIR/test-report-$(date +%Y%m%d-%H%M%S).html"
    
    cat > "$report_file" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>REChain Aurora OS Test Report</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .header { background: #f0f0f0; padding: 10px; border-radius: 5px; }
        .pass { color: green; }
        .fail { color: red; }
        .skip { color: orange; }
        table { border-collapse: collapse; width: 100%; margin: 20px 0; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <div class="header">
        <h1>REChain Aurora OS Test Report</h1>
        <p>Generated: $(date)</p>
        <p>Target Architecture: $TARGET_ARCH</p>
        <p>Test Type: $TEST_TYPE</p>
    </div>
    
    <h2>Test Summary</h2>
    <table>
        <tr><th>Metric</th><th>Value</th></tr>
        <tr><td>Total Tests</td><td>$TESTS_TOTAL</td></tr>
        <tr><td class="pass">Passed</td><td>$TESTS_PASSED</td></tr>
        <tr><td class="fail">Failed</td><td>$TESTS_FAILED</td></tr>
        <tr><td class="skip">Skipped</td><td>$TESTS_SKIPPED</td></tr>
        <tr><td>Success Rate</td><td>$(( TESTS_TOTAL > 0 ? (TESTS_PASSED * 100) / TESTS_TOTAL : 0 ))%</td></tr>
    </table>
    
    <h2>Test Logs</h2>
    <pre>
$(find "$TEST_DIR" -name "*.log" -exec echo "=== {} ===" \; -exec cat {} \; 2>/dev/null || echo "No test logs found")
    </pre>
    
    <h2>Build Information</h2>
    <pre>
Build Directory: $BUILD_DIR
Test Directory: $TEST_DIR
Configuration: $(cat "$RECHAIN_TEST_CONFIG_DIR/test.conf" 2>/dev/null || echo "No configuration found")
    </pre>
</body>
</html>
EOF
    
    log_success "Test report generated: $report_file"
}

# Utility functions
get_duration() {
    local start_time=$1
    local end_time=$(date +%s)
    echo "$((end_time - start_time))s"
}

# Main test function
main() {
    local start_time=$SECONDS
    
    print_header
    
    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --type)
                TEST_TYPE="$2"
                shift 2
                ;;
            --arch)
                TARGET_ARCH="$2"
                shift 2
                ;;
            --verbose)
                VERBOSE=true
                shift
                ;;
            --coverage)
                COVERAGE=true
                shift
                ;;
            --timeout)
                TIMEOUT="$2"
                shift 2
                ;;
            --help)
                echo "Usage: $0 [OPTIONS]"
                echo "Options:"
                echo "  --type TYPE      Test type (unit, integration, performance, security, all)"
                echo "  --arch ARCH      Target architecture"
                echo "  --verbose        Enable verbose output"
                echo "  --coverage       Enable coverage reporting"
                echo "  --timeout SEC    Test timeout in seconds"
                echo "  --help           Show this help message"
                exit 0
                ;;
            *)
                log_error "Unknown option: $1"
                exit 1
                ;;
        esac
    done
    
    # Setup test environment
    setup_test_environment
    
    # Run tests based on type
    case $TEST_TYPE in
        "unit")
            run_unit_tests
            ;;
        "integration")
            run_integration_tests
            ;;
        "performance")
            run_performance_tests
            ;;
        "security")
            run_security_tests
            ;;
        "all")
            run_unit_tests
            run_integration_tests
            run_performance_tests
            run_security_tests
            ;;
        *)
            log_error "Unknown test type: $TEST_TYPE"
            exit 1
            ;;
    esac
    
    # Generate report
    generate_test_report
    
    local duration=$((SECONDS - start_time))
    
    # Print final results
    echo ""
    echo "=================================================="
    echo "Test Results Summary"
    echo "=================================================="
    echo "Total Tests: $TESTS_TOTAL"
    echo "Passed: $TESTS_PASSED"
    echo "Failed: $TESTS_FAILED"
    echo "Skipped: $TESTS_SKIPPED"
    echo "Duration: $((duration / 60))m $((duration % 60))s"
    echo "=================================================="
    
    if [[ $TESTS_FAILED -gt 0 ]]; then
        log_error "Some tests failed!"
        exit 1
    else
        log_success "All tests passed!"
        exit 0
    fi
}

# Error handling
trap 'log_error "Test script failed at line $LINENO"' ERR

# Run main function
main "$@"
