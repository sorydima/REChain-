# REChain CI/CD Build Scripts

This directory contains scripts for setting up and building the REChain Flutter application in CI/CD environments.

## Overview

The REChain application uses the `vodozemac` cryptographic library, which requires Rust compilation. These scripts handle the complex setup process and address common build issues.

## Scripts

### Windows CI/CD

#### `build_windows_ci.ps1`
Complete Windows build script that handles:
- Rust installation and configuration
- Chocolatey package management
- Visual Studio Build Tools setup
- Flutter installation and configuration
- vodozemac compilation and binding generation
- Windows application build

**Usage:**
```powershell
.\scripts\build_windows_ci.ps1 -BuildType "Release" -FlutterVersion "3.32.8"
```

#### `setup_windows_ci.ps1`
Simplified setup script for Windows CI environments:
- Basic environment setup
- Dependency installation
- Flutter configuration

**Usage:**
```powershell
.\scripts\setup_windows_ci.ps1 -BuildType "Release"
```

### Linux CI/CD

#### `build_linux_ci.sh`
Complete Linux build script that handles:
- Rust installation and configuration
- System dependency installation
- Flutter installation
- vodozemac compilation and binding generation
- Linux application build

**Usage:**
```bash
chmod +x scripts/build_linux_ci.sh
./scripts/build_linux_ci.sh release "3.32.8"
```

## GitHub Actions Workflow

The `.github/workflows/build.yml` file provides a complete CI/CD pipeline that:
- Builds for Windows, Linux, macOS, Android, and Web
- Runs tests and linting
- Uploads artifacts for each platform
- Handles vodozemac compilation automatically

## Common Issues and Solutions

### 1. Rust Environment Issues

**Problem:** Rust fails to start due to environment variable issues
**Solution:** The scripts handle environment setup automatically, but if issues persist:
```bash
# Clear problematic environment variables
unset OWD APPIMAGE LD_LIBRARY_PATH APPDIR PERLLIB
source "$HOME/.cargo/env"
```

### 2. vodozemac Compilation Failures

**Problem:** `vodozemac_bindings_dart.dll` compilation fails
**Solution:** The scripts automatically:
- Clone the correct vodozemac repository
- Install required Rust components
- Generate proper bindings
- Copy files to the correct location

### 3. CMake Version Warnings

**Problem:** CMake deprecation warnings
**Solution:** The scripts install the latest CMake version and configure it properly.

### 4. Flutter Plugin Issues

**Problem:** `flutter_vodozemac` plugin compilation fails
**Solution:** The scripts ensure:
- Proper Rust toolchain installation
- Correct target architecture setup
- Required dependencies are installed

## Manual Build Process

If you need to build manually, follow these steps:

### Windows Manual Build

1. **Install Rust:**
   ```powershell
   Invoke-WebRequest -Uri "https://win.rustup.rs/x86_64" -OutFile "rustup-init.exe"
   Start-Process -FilePath "rustup-init.exe" -ArgumentList "-y" -Wait
   ```

2. **Install Chocolatey and dependencies:**
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force
   iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   choco install visualstudio2019buildtools flutter cmake -y
   ```

3. **Setup vodozemac:**
   ```powershell
   git clone https://github.com/matrix-org/vodozemac.git
   cd vodozemac
   cargo install wasm-pack
   wasm-pack build --target web
   cd ..
   
   git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
   cd .vodozemac
   cargo install flutter_rust_bridge_codegen
   flutter_rust_bridge_codegen build-web --dart-root dart --rust-root (Resolve-Path rust) --release
   cd ..
   
   Copy-Item ".vodozemac/dart/web/pkg/vodozemac_bindings_dart*" "assets/vodozemac/" -Force
   Remove-Item -Recurse -Force ".vodozemac"
   ```

4. **Build Flutter application:**
   ```powershell
   flutter pub get
   flutter build windows --release
   ```

### Linux Manual Build

1. **Install Rust:**
   ```bash
   curl https://sh.rustup.rs -sSf | sh -s -- -y
   source "$HOME/.cargo/env"
   ```

2. **Install system dependencies:**
   ```bash
   sudo apt-get update
   sudo apt-get install -y git curl wget build-essential cmake pkg-config libssl-dev
   ```

3. **Setup vodozemac:**
   ```bash
   git clone https://github.com/matrix-org/vodozemac.git
   cd vodozemac
   cargo install wasm-pack
   wasm-pack build --target web
   cd ..
   
   git clone https://github.com/famedly/dart-vodozemac.git .vodozemac
   cd .vodozemac
   cargo install flutter_rust_bridge_codegen
   flutter_rust_bridge_codegen build-web --dart-root dart --rust-root $(readlink -f rust) --release
   cd ..
   
   cp .vodozemac/dart/web/pkg/vodozemac_bindings_dart* assets/vodozemac/
   rm -rf .vodozemac
   ```

4. **Build Flutter application:**
   ```bash
   flutter pub get
   flutter build linux --release
   ```

## Troubleshooting

### Environment Issues

If you encounter environment-related issues:

1. **Clear environment variables:**
   ```bash
   unset OWD APPIMAGE LD_LIBRARY_PATH APPDIR PERLLIB
   ```

2. **Reinstall Rust:**
   ```bash
   rustup self uninstall -y
   curl https://sh.rustup.rs -sSf | sh -s -- -y
   source "$HOME/.cargo/env"
   ```

3. **Clean Flutter cache:**
   ```bash
   flutter clean
   flutter pub get
   ```

### Build Failures

If builds fail:

1. **Check Flutter doctor:**
   ```bash
   flutter doctor -v
   ```

2. **Verify Rust installation:**
   ```bash
   rustc --version
   cargo --version
   ```

3. **Check vodozemac bindings:**
   ```bash
   ls -la assets/vodozemac/
   ```

4. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   flutter build windows --debug  # Try debug build first
   ```

## Dependencies

The scripts handle installation of:
- Rust (latest stable)
- Flutter (configurable version)
- CMake (latest)
- Visual Studio Build Tools (Windows)
- System development tools (Linux)
- Chocolatey (Windows package manager)

## Support

For issues with these scripts:
1. Check the troubleshooting section above
2. Review the GitHub Actions logs for specific error messages
3. Ensure all prerequisites are met
4. Try the manual build process to isolate issues 