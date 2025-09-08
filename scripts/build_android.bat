@echo off
echo ========================================
echo REChain Android Build Script
echo ========================================

set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%..
set ANDROID_DIR=%PROJECT_ROOT%\android

echo Project root: %PROJECT_ROOT%
echo Android directory: %ANDROID_DIR%

cd /d "%PROJECT_ROOT%"

echo.
echo [1/6] Cleaning previous builds...
call flutter clean
if %ERRORLEVEL% neq 0 (
    echo ERROR: Flutter clean failed
    exit /b 1
)

echo.
echo [2/6] Getting Flutter dependencies...
call flutter pub get
if %ERRORLEVEL% neq 0 (
    echo ERROR: Flutter pub get failed
    exit /b 1
)

echo.
echo [3/6] Generating code...
call flutter packages pub run build_runner build --delete-conflicting-outputs
if %ERRORLEVEL% neq 0 (
    echo WARNING: Code generation failed, continuing...
)

echo.
echo [4/6] Building Android APK (Debug)...
call flutter build apk --debug
if %ERRORLEVEL% neq 0 (
    echo ERROR: Debug APK build failed
    exit /b 1
)

echo.
echo [5/6] Building Android APK (Release)...
call flutter build apk --release
if %ERRORLEVEL% neq 0 (
    echo ERROR: Release APK build failed
    exit /b 1
)

echo.
echo [6/6] Building Android App Bundle (Release)...
call flutter build appbundle --release
if %ERRORLEVEL% neq 0 (
    echo ERROR: App Bundle build failed
    exit /b 1
)

echo.
echo ========================================
echo Build completed successfully!
echo ========================================
echo.
echo Output files:
echo - Debug APK: build\app\outputs\flutter-apk\app-debug.apk
echo - Release APK: build\app\outputs\flutter-apk\app-release.apk
echo - App Bundle: build\app\outputs\bundle\release\app-release.aab
echo.

pause
