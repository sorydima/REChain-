# REChain Aurora OS Build Configuration
# Version: 4.1.10+1160
# Last Updated: 2025-12-06

cmake_minimum_required(VERSION 3.16)
project(com.rechain.online LANGUAGES CXX)

#==============================================================================
# Project Information
#==============================================================================
set(PROJECT_VERSION "4.1.10+1160")
set(PROJECT_DESCRIPTION "REChain - Secure Matrix Client for Aurora OS")
set(PROJECT_HOMEPAGE "https://online.rechain.network")
set(PROJECT_AUTHOR "REChain Dream Team")
set(PROJECT_CONTACT "support@rechain.network")

#==============================================================================
# Build Configuration
#==============================================================================
# CMAKE_SYSTEM_PROCESSOR - CPU architecture (armv7l, aarch64, x86_64)
# CMAKE_BUILD_TYPE       - Build mode (debug, profile, release)
# PSDK_VERSION           - Aurora SDK version

# Default build type
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Setting build type to 'Release' as none was specified.")
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Build type" FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
        "Debug" "Release" "RelWithDebInfo" "MinSizeRel")
endif()

#==============================================================================
# Installation Directories
#==============================================================================
include(GNUInstallDirs)
set(BINARY_NAME ${CMAKE_PROJECT_NAME})
set(FLUTTER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/flutter)

#==============================================================================
# C++ Configuration
#==============================================================================
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compiler flags
set(CMAKE_CXX_FLAGS "-Wall -Wextra -Wpedantic")
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -DDEBUG -fsanitize=address,undefined")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG -ffast-math -funroll-loops")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g -DNDEBUG")

# Aurora OS specific optimizations
if(CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mfpu=neon -ftree-vectorize")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -march=armv7-a")
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a+crc+crypto")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -march=armv8-a")
endif()

# RPATH configuration
set(CMAKE_SKIP_RPATH OFF)
set(CMAKE_INSTALL_RPATH "\$ORIGIN/../share/${BINARY_NAME}/lib:\$ORIGIN/lib")
set(CMAKE_BUILD_RPATH "\$ORIGIN/../share/${BINARY_NAME}/lib:\$ORIGIN/lib")

#==============================================================================
# Find Required Packages
#==============================================================================
find_package(PkgConfig REQUIRED)
find_package(Qt5 5.15 REQUIRED COMPONENTS
    Core
    DBus
    Multimedia
    Network
    Sensors
    Sql
    Xml
)

#==============================================================================
# Flutter Embedder
#==============================================================================
pkg_check_modules(FlutterEmbedder REQUIRED IMPORTED_TARGET flutter-embedder)

#==============================================================================
# Aurora OS SDK
#==============================================================================
pkg_check_modules(AuroraSDK REQUIRED IMPORTED_TARGET aurora-sdk)

#==============================================================================
# Source Files
#==============================================================================
set(SOURCES
    main.cpp
    AutonomousNotificationService.cpp
    CrashReportingManager.cpp
    AuroraSystemIntegration.cpp
    ${FLUTTER_DIR}/generated_plugin_registrant.cpp
)

set(HEADERS
    AutonomousNotificationService.h
    CrashReportingManager.h
    AuroraSystemIntegration.h
)

set(HEADERS_PRIVATE
    ${FLUTTER_DIR}/flutter_aurora.h
    ${FLUTTER_DIR}/engine_method_channel.h
    ${FLUTTER_DIR}/plugin_registrar.h
)

#==============================================================================
# Create Executable
#==============================================================================
add_executable(${BINARY_NAME} ${SOURCES} ${HEADERS} ${HEADERS_PRIVATE})

#==============================================================================
# Link Libraries
#==============================================================================
target_link_libraries(${BINARY_NAME} PRIVATE
    PkgConfig::FlutterEmbedder
    PkgConfig::AuroraSDK
    Qt5::Core
    Qt5::DBus
    Qt5::Multimedia
    Qt5::Network
    Qt5::Sensors
    Qt5::Sql
    Qt5::Xml
    pthread
    dl
)

#==============================================================================
# Include Directories
#==============================================================================
target_include_directories(${BINARY_NAME} PRIVATE
    ${FLUTTER_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${Qt5Core_INCLUDE_DIRS}
    ${Qt5DBus_INCLUDE_DIRS}
    ${Qt5Multimedia_INCLUDE_DIRS}
    ${Qt5Network_INCLUDE_DIRS}
    ${Qt5Sensors_INCLUDE_DIRS}
    ${Qt5Sql_INCLUDE_DIRS}
    ${Qt5Xml_INCLUDE_DIRS}
)

#==============================================================================
# Compile Definitions
#==============================================================================
target_compile_definitions(${BINARY_NAME} PRIVATE
    QT_NO_KEYWORDS
    RECHAIN_VERSION="${PROJECT_FULL_VERSION}"
    RECHAIN_VERSION_MAJOR=${PROJECT_VERSION}
    AURORA_OS_BUILD
    FLUTTER_AURORA_BUILD
)

#==============================================================================
# Flutter Generated Plugins
#==============================================================================
include(flutter/generated_plugins.cmake)

#==============================================================================
# Installation Directories Configuration
#==============================================================================
set(PACKAGE_INSTALL_DIR    ${CMAKE_INSTALL_DATADIR}/${BINARY_NAME})
set(DESKTOP_INSTALL_DIR    ${CMAKE_INSTALL_DATADIR}/applications)
set(ICONS_INSTALL_ROOT_DIR ${CMAKE_INSTALL_DATADIR}/icons/hicolor)
set(CONFIG_INSTALL_DIR    ${CMAKE_INSTALL_SYSCONFDIR}/rechain)

#==============================================================================
# Bundle Configuration
#==============================================================================
set(BUNDLE_OUTPUT_DIR ${PROJECT_BINARY_DIR}/bundle)
set(BUNDLE_LIB_DIR ${BUNDLE_OUTPUT_DIR}/lib)
set(BUNDLE_ASSETS_DIR ${BUNDLE_OUTPUT_DIR}/flutter_assets)

#==============================================================================
# Post-build Commands
#==============================================================================

# Copy Flutter embedder library
add_custom_command(TARGET ${BINARY_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${BUNDLE_LIB_DIR}
    COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libflutter-embedder.so
        ${BUNDLE_LIB_DIR}/libflutter-embedder.so
    COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/libflutter-embedder-core.so
        ${BUNDLE_LIB_DIR}/libflutter-embedder-core.so
    COMMENT "Copying Flutter embedder libraries"
)

# Copy Qt libraries
add_custom_command(TARGET ${BINARY_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${BUNDLE_LIB_DIR}
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<TARGET_FILE:Qt5::Core>
        $<TARGET_FILE:Qt5::DBus>
        $<TARGET_FILE:Qt5::Multimedia>
        $<TARGET_FILE:Qt5::Network>
        $<TARGET_FILE:Qt5::Sensors>
        $<TARGET_FILE:Qt5::Sql>
        $<TARGET_FILE:Qt5::Xml>
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        $<TARGET_FILE:Qt5::Core>
        ${BUNDLE_LIB_DIR}/libQt5Core.so.5
    COMMENT "Copying Qt libraries"
)

# Copy ICU data file
add_custom_command(TARGET ${BINARY_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
        ${FLUTTER_DIR}/icudtl.dat
        ${BUNDLE_OUTPUT_DIR}/icudtl.dat
    COMMENT "Copying ICU data file"
)

# Generate build info
add_custom_command(TARGET ${BINARY_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "============================================="
    COMMAND ${CMAKE_COMMAND} -E echo "REChain Aurora OS Build Complete"
    COMMAND ${CMAKE_COMMAND} -E echo "Version: ${PROJECT_FULL_VERSION}"
    COMMAND ${CMAKE_COMMAND} -E echo "Build Type: ${CMAKE_BUILD_TYPE}"
    COMMAND ${CMAKE_COMMAND} -E echo "Architecture: ${CMAKE_SYSTEM_PROCESSOR}"
    COMMAND ${CMAKE_COMMAND} -E echo "============================================="
    COMMENT "Displaying build information"
)

# Generate version file
add_custom_command(TARGET ${BINARY_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${BUNDLE_OUTPUT_DIR}
    COMMAND ${CMAKE_COMMAND} -E echo "RECHAIN_VERSION=${PROJECT_FULL_VERSION}" > ${BUNDLE_OUTPUT_DIR}/version.txt
    COMMAND ${CMAKE_COMMAND} -E echo "BUILD_DATE=$(date -u +'%Y-%m-%d %H:%M:%S UTC')" >> ${BUNDLE_OUTPUT_DIR}/version.txt
    COMMAND ${CMAKE_COMMAND} -E echo "BUILD_TYPE=${CMAKE_BUILD_TYPE}" >> ${BUNDLE_OUTPUT_DIR}/version.txt
    COMMAND ${CMAKE_COMMAND} -E echo "ARCHITECTURE=${CMAKE_SYSTEM_PROCESSOR}" >> ${BUNDLE_OUTPUT_DIR}/version.txt
    COMMENT "Generating version file"
)

#==============================================================================
# Installation Rules
#==============================================================================

# Install bundle files
install(DIRECTORY ${BUNDLE_OUTPUT_DIR}/
    DESTINATION ${PACKAGE_INSTALL_DIR}
    FILES_MATCHING PATTERN "*"
)

# Install executable
install(TARGETS ${BINARY_NAME}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

# Install desktop file
install(FILES desktop/${BINARY_NAME}.desktop
    DESTINATION ${DESKTOP_INSTALL_DIR}
)

# Install configuration files
install(FILES
    config/rechain.conf
    config/logging.conf
    DESTINATION ${CONFIG_INSTALL_DIR}
)

# Install documentation
install(FILES
    ../README.md
    ../CHANGELOG.md
    ../LICENSE
    DESTINATION ${CMAKE_INSTALL_DOCDIR}/${BINARY_NAME}
)

# Install icons
foreach(ICONS_SIZE 86x86 108x108 128x128 172x172 256x256 512x512)
    install(FILES icons/${ICONS_SIZE}.png
        RENAME ${BINARY_NAME}.png
        DESTINATION ${ICONS_INSTALL_ROOT_DIR}/${ICONS_SIZE}/apps/
    )
endforeach()

# Install launcher script
install(FILES scripts/run-rechain.sh
    DESTINATION ${CMAKE_INSTALL_BINDIR}
    PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE
)

#==============================================================================
# Testing
#==============================================================================
enable_testing()
add_subdirectory(test)

#==============================================================================
# Packaging (CPack)
#==============================================================================
set(CPACK_PACKAGE_NAME "${BINARY_NAME}")
set(CPACK_PACKAGE_VENDOR "REChain Inc.")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION ${PROJECT_FULL_VERSION})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "${PROJECT_DESCRIPTION}")

set(CPACK_DEBIAN_PACKAGE_NAME "${BINARY_NAME}")
set(CPACK_DEBIAN_PACKAGE_VERSION ${CPACK_PACKAGE_VERSION})
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE "armhf")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "REChain Team <support@rechain.network>")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libqt5core5a (>= 5.15), libqt5dbus5 (>= 5.15), libqt5multimedia5 (>= 5.15), libqt5network5 (>= 5.15), libqt5sensors5 (>= 5.15)")

set(CPACK_RPM_PACKAGE_NAME "${BINARY_NAME}")
set(CPACK_RPM_PACKAGE_VERSION ${CPACK_PACKAGE_VERSION})
set(CPACK_RPM_PACKAGE_ARCHITECTURE "armv7hl")
set(CPACK_RPM_PACKAGE_LICENSE "Apache-2.0")
set(CPACK_RPM_PACKAGE_REQUIRES "qt5-qtcore >= 5.15, qt5-qtdbus >= 5.15, qt5-qtmultimedia >= 5.15, qt5-qtnetwork >= 5.15, qt5-qtsensors >= 5.15")

set(CPACK_SOURCE_IGNORE_FILES
    "/build/"
    "/.git/"
    "/.build/"
    "CMakeCache.txt"
    "CMakeFiles/"
    "Makefile"
    "cmake_install.cmake"
    "CTestTestfile.cmake"
)

include(CPack)

