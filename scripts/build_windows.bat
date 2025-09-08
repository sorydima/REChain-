@echo off
setlocal enabledelayedexpansion

echo ========================================
echo REChain Windows Build Script
echo ========================================

set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%..
set WINDOWS_DIR=%PROJECT_ROOT%\windows

echo Project root: %PROJECT_ROOT%
echo Windows directory: %WINDOWS_DIR%

cd /d "%PROJECT_ROOT%"

echo.
echo [1/6] Cleaning previous builds...
if exist "%WINDOWS_DIR%\build" (
    rmdir /s /q "%WINDOWS_DIR%\build"
    echo Previous build directory removed
)

echo.
echo [2/6] Getting Flutter dependencies...
call flutter pub get
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to get Flutter dependencies
    exit /b 1
)

echo.
echo [3/6] Building Flutter for Windows (Debug)...
call flutter build windows --debug
if %ERRORLEVEL% neq 0 (
    echo ERROR: Debug build failed
    exit /b 1
)

echo.
echo [4/6] Building Flutter for Windows (Release)...
call flutter build windows --release
if %ERRORLEVEL% neq 0 (
    echo ERROR: Release build failed
    exit /b 1
)

echo.
echo [5/6] Creating distribution package...
set BUILD_DIR=%PROJECT_ROOT%\build\windows\x64\runner\Release
set DIST_DIR=%PROJECT_ROOT%\dist\windows

if not exist "%DIST_DIR%" mkdir "%DIST_DIR%"

if exist "%BUILD_DIR%" (
    echo Copying release build to distribution directory...
    xcopy "%BUILD_DIR%\*" "%DIST_DIR%\" /E /I /Y
    echo Release build copied successfully
) else (
    echo WARNING: Release build directory not found
)

echo.
echo [6/6] Build information...
echo Build completed at: %DATE% %TIME%
echo.
echo Build artifacts:
if exist "%BUILD_DIR%\REChain.exe" (
    echo   - Debug build: %PROJECT_ROOT%\build\windows\x64\runner\Debug\REChain.exe
    echo   - Release build: %BUILD_DIR%\REChain.exe
    echo   - Distribution: %DIST_DIR%\REChain.exe
) else (
    echo   - Build artifacts not found
)

echo.
echo ========================================
echo Windows build completed successfully!
echo ========================================
echo.
echo To run the application:
echo   Debug:   %PROJECT_ROOT%\build\windows\x64\runner\Debug\REChain.exe
echo   Release: %BUILD_DIR%\REChain.exe
echo.
echo To create installer, run:
echo   scripts\package_windows.bat
echo.
