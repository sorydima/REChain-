# Simplified Windows CI Setup Script for REChain
# This script addresses the vodozemac compilation issues

param(
    [string]$BuildType = "Release"
)

Write-Host "Setting up REChain Windows CI environment..." -ForegroundColor Green

# Set error action preference
$ErrorActionPreference = "Stop"

# Step 1: Install Rust (Windows-specific approach)
Write-Host "Installing Rust..." -ForegroundColor Yellow
if (-not (Get-Command rustc -ErrorAction SilentlyContinue)) {
    # Download rustup-init.exe directly
    Invoke-WebRequest -Uri "https://win.rustup.rs/x86_64" -OutFile "rustup-init.exe"
    Start-Process -FilePath "rustup-init.exe" -ArgumentList "-y" -Wait -NoNewWindow
    Remove-Item "rustup-init.exe" -Force
    
    # Add Rust to PATH for current session
    $env:PATH = "$env:USERPROFILE\.cargo\bin;$env:PATH"
} else {
    Write-Host "Rust already installed" -ForegroundColor Green
}

# Step 2: Install Chocolatey
Write-Host "Installing Chocolatey..." -ForegroundColor Yellow
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
    refreshenv
} else {
    Write-Host "Chocolatey already installed" -ForegroundColor Green
}

# Step 3: Install Visual Studio Build Tools
Write-Host "Installing Visual Studio Build Tools..." -ForegroundColor Yellow
choco install visualstudio2019buildtools --package-parameters "--add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --passive --norestart" -y

# Step 4: Install Flutter and CMake
Write-Host "Installing Flutter and CMake..." -ForegroundColor Yellow
choco install flutter cmake --installargs 'ADD_CMAKE_TO_PATH=System' -y
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
refreshenv

# Step 5: Configure Rust environment
Write-Host "Configuring Rust environment..." -ForegroundColor Yellow
$env:PATH = "$env:USERPROFILE\.cargo\bin;$env:PATH"
rustup component add llvm-tools-preview
rustup target add wasm32-unknown-unknown

# Verify installations
Write-Host "Verifying installations..." -ForegroundColor Yellow
rustc --version
cargo --version
flutter --version

# Step 6: Configure Flutter
Write-Host "Configuring Flutter..." -ForegroundColor Yellow
flutter config --no-analytics
flutter doctor -v

# Step 7: Get Flutter dependencies
Write-Host "Getting Flutter dependencies..." -ForegroundColor Yellow
flutter pub get

Write-Host "Windows CI environment setup completed!" -ForegroundColor Green 