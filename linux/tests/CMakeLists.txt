# CMakeLists.txt for REChain Linux Tests

cmake_minimum_required(VERSION 3.10)
project(REChainLinuxTests LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required packages
find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK REQUIRED IMPORTED_TARGET gtk+-3.0)
pkg_check_modules(LIBNOTIFY REQUIRED IMPORTED_TARGET libnotify)
pkg_check_modules(GIO REQUIRED IMPORTED_TARGET gio-2.0)
pkg_check_modules(GLIB REQUIRED IMPORTED_TARGET glib-2.0)

# Find Google Test
find_package(GTest REQUIRED)
find_package(GMock REQUIRED)

# Include directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..)

# Test executable
add_executable(linux_tests
    LinuxTests.cc
    ../AutonomousNotificationService.cc
    ../CrashReportingManager.cc
    ../LinuxSystemIntegration.cc
)

# Link libraries
target_link_libraries(linux_tests
    PRIVATE
    GTest::GTest
    GTest::Main
    GMock::GMock
    PkgConfig::GTK
    PkgConfig::LIBNOTIFY
    PkgConfig::GIO
    PkgConfig::GLIB
)

# Compiler options
target_compile_options(linux_tests PRIVATE -Wall -Wextra)

# Add test
enable_testing()
add_test(NAME REChainLinuxTests COMMAND linux_tests)

# Custom target for running tests with verbose output
add_custom_target(test_verbose
    COMMAND ${CMAKE_CTEST_COMMAND} --verbose
    DEPENDS linux_tests
)
