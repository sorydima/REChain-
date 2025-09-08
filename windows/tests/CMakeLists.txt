cmake_minimum_required(VERSION 3.14)
project(REChainWindowsTests LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find required packages
find_package(GTest REQUIRED)

# Include directories
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../runner)
include_directories(${GTEST_INCLUDE_DIRS})

# Add executable for tests
add_executable(REChainTests
    WindowsTests.cpp
    ../runner/AutonomousNotificationService.cpp
    ../runner/CrashReportingManager.cpp
    ../runner/BuildConfigHelper.cpp
    ../runner/WindowsSystemIntegration.cpp
)

# Link libraries
target_link_libraries(REChainTests 
    ${GTEST_LIBRARIES}
    ${GTEST_MAIN_LIBRARIES}
    windowsapp
    psapi
    dbghelp
    shell32
    ole32
)

# Add Windows Runtime support
target_compile_definitions(REChainTests PRIVATE WINRT_LEAN_AND_MEAN)

# Enable testing
enable_testing()
add_test(NAME WindowsUnitTests COMMAND REChainTests)
