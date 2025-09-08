# REChain Aurora OS Build Configuration
# CMAKE_SYSTEM_PROCESSOR - CPU architecture name (armv7l, aarch64, x86_64)
# CMAKE_BUILD_TYPE       - Build mode (debug, profile, release)
# PSDK_VERSION           - Build psdk exact version
# PSDK_MAJOR             - Build psdk major version

cmake_minimum_required(VERSION 3.16)
project(com.rechain.online LANGUAGES CXX)

# Project information
set(PROJECT_VERSION "4.1.4")
set(PROJECT_DESCRIPTION "REChain - Secure Matrix Client for Aurora OS")
set(PROJECT_HOMEPAGE "https://rechain.com")
set(PROJECT_AUTHOR "REChain Team")

include(GNUInstallDirs)

set(BINARY_NAME ${CMAKE_PROJECT_NAME})
set(FLUTTER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/flutter)

# C++ Configuration
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compiler flags
set(CMAKE_CXX_FLAGS "-Wall -Wextra -Wpedantic -Wno-unused-parameter")
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -DDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g -DNDEBUG")

# Aurora OS specific flags
if(CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mfpu=neon")
endif()

set(CMAKE_SKIP_RPATH OFF)
set(CMAKE_INSTALL_RPATH "\$ORIGIN/../share/${BINARY_NAME}/lib")

# Find required packages
find_package(PkgConfig REQUIRED)
find_package(Qt5 REQUIRED COMPONENTS Core DBus Multimedia Network Sensors)

# Flutter embedder
pkg_check_modules(FlutterEmbedder REQUIRED IMPORTED_TARGET flutter-embedder)

# Aurora OS SDK
pkg_check_modules(AuroraSDK REQUIRED IMPORTED_TARGET aurora-sdk)

# Source files
set(SOURCES
    main.cpp
    AutonomousNotificationService.cpp
    CrashReportingManager.cpp
    AuroraSystemIntegration.cpp
    ${FLUTTER_DIR}/generated_plugin_registrant.cpp
)

# Header files
set(HEADERS
    AutonomousNotificationService.h
    CrashReportingManager.h
    AuroraSystemIntegration.h
)

# Create executable
add_executable(${BINARY_NAME} ${SOURCES} ${HEADERS})

# Link libraries
target_link_libraries(${BINARY_NAME} PRIVATE
    PkgConfig::FlutterEmbedder
    PkgConfig::AuroraSDK
    Qt5::Core
    Qt5::DBus
    Qt5::Multimedia
    Qt5::Network
    Qt5::Sensors
)

# Include directories
target_include_directories(${BINARY_NAME} PRIVATE
    ${FLUTTER_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${Qt5Core_INCLUDE_DIRS}
    ${Qt5DBus_INCLUDE_DIRS}
    ${Qt5Multimedia_INCLUDE_DIRS}
    ${Qt5Network_INCLUDE_DIRS}
    ${Qt5Sensors_INCLUDE_DIRS}
)

# Compile definitions
target_compile_definitions(${BINARY_NAME} PRIVATE
    QT_NO_KEYWORDS
    RECHAIN_VERSION="${PROJECT_VERSION}"
    AURORA_OS_BUILD
)

include(flutter/generated_plugins.cmake)

set(PACKAGE_INSTALL_DIR    ${CMAKE_INSTALL_DATADIR}/${BINARY_NAME})
set(DESKTOP_INSTALL_DIR    ${CMAKE_INSTALL_DATADIR}/applications)
set(ICONS_INSTALL_ROOT_DIR ${CMAKE_INSTALL_DATADIR}/icons/hicolor)

# Post-build commands
add_custom_command(TARGET ${BINARY_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libflutter-embedder.so
        ${PROJECT_BINARY_DIR}/bundle/lib/libflutter-embedder.so
    COMMENT "Copying Flutter embedder library"
)

# Copy Qt libraries
add_custom_command(TARGET ${BINARY_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<TARGET_FILE:Qt5::Core>
        $<TARGET_FILE:Qt5::DBus>
        $<TARGET_FILE:Qt5::Multimedia>
        $<TARGET_FILE:Qt5::Network>
        $<TARGET_FILE:Qt5::Sensors>
        ${PROJECT_BINARY_DIR}/bundle/lib/
    COMMENT "Copying Qt libraries"
)

# Generate build info
add_custom_command(TARGET ${BINARY_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo
        "Build completed: ${CMAKE_BUILD_TYPE} for ${CMAKE_SYSTEM_PROCESSOR}"
    COMMENT "Build information"
)

# Installation rules
install(FILES ${PROJECT_BINARY_DIR}/bundle/icudtl.dat DESTINATION ${PACKAGE_INSTALL_DIR})
install(DIRECTORY ${PROJECT_BINARY_DIR}/bundle/flutter_assets DESTINATION ${PACKAGE_INSTALL_DIR})
install(DIRECTORY ${PROJECT_BINARY_DIR}/bundle/lib DESTINATION ${PACKAGE_INSTALL_DIR})

# Install executable
install(TARGETS ${BINARY_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

# Install desktop file
install(FILES desktop/${BINARY_NAME}.desktop DESTINATION ${DESKTOP_INSTALL_DIR})

# Install configuration files
install(FILES
    config/rechain.conf
    config/logging.conf
    DESTINATION ${CMAKE_INSTALL_SYSCONFDIR}/rechain
    OPTIONAL
)

# Install documentation
install(FILES
    ../README.md
    ../CHANGELOG.md
    ../LICENSE
    DESTINATION ${CMAKE_INSTALL_DOCDIR}
    OPTIONAL
)

foreach(ICONS_SIZE 86x86 108x108 128x128 172x172)
    install(FILES icons/${ICONS_SIZE}.png
            RENAME ${BINARY_NAME}.png
            DESTINATION ${ICONS_INSTALL_ROOT_DIR}/${ICONS_SIZE}/apps/)
endforeach(ICONS_SIZE)
