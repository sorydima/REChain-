@echo off
setlocal enabledelayedexpansion

echo ========================================
echo REChain Windows Packaging Script
echo ========================================

set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%..
set WINDOWS_DIR=%PROJECT_ROOT%\windows
set BUILD_DIR=%PROJECT_ROOT%\build\windows\x64\runner\Release
set PACKAGE_DIR=%PROJECT_ROOT%\packages\windows

echo Project root: %PROJECT_ROOT%
echo Build directory: %BUILD_DIR%
echo Package directory: %PACKAGE_DIR%

if not exist "%BUILD_DIR%\REChain.exe" (
    echo ERROR: Release build not found. Please run build_windows.bat first.
    exit /b 1
)

echo.
echo [1/4] Preparing package directory...
if exist "%PACKAGE_DIR%" (
    rmdir /s /q "%PACKAGE_DIR%"
)
mkdir "%PACKAGE_DIR%"

echo.
echo [2/4] Copying application files...
xcopy "%BUILD_DIR%\*" "%PACKAGE_DIR%\" /E /I /Y
if %ERRORLEVEL% neq 0 (
    echo ERROR: Failed to copy application files
    exit /b 1
)

echo.
echo [3/4] Creating portable package...
set PORTABLE_DIR=%PACKAGE_DIR%\REChain-Portable
mkdir "%PORTABLE_DIR%"
xcopy "%PACKAGE_DIR%\*" "%PORTABLE_DIR%\" /E /I /Y /EXCLUDE:"%PORTABLE_DIR%"

echo Creating portable launcher...
(
echo @echo off
echo cd /d "%%~dp0"
echo start REChain.exe
) > "%PORTABLE_DIR%\Launch REChain.bat"

echo.
echo [4/4] Creating installer package...
if exist "%WINDOWS_DIR%\rechainonline.iss" (
    echo Inno Setup script found, creating installer...
    
    REM Check if Inno Setup is installed
    set INNO_SETUP=""
    if exist "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" (
        set INNO_SETUP="C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
    ) else if exist "C:\Program Files\Inno Setup 6\ISCC.exe" (
        set INNO_SETUP="C:\Program Files\Inno Setup 6\ISCC.exe"
    )
    
    if !INNO_SETUP! neq "" (
        echo Running Inno Setup compiler...
        !INNO_SETUP! "%WINDOWS_DIR%\rechainonline.iss"
        if %ERRORLEVEL% equ 0 (
            echo ✓ Installer created successfully
        ) else (
            echo WARNING: Installer creation failed
        )
    ) else (
        echo WARNING: Inno Setup not found, skipping installer creation
        echo Install Inno Setup from: https://jrsoftware.org/isinfo.php
    )
) else (
    echo No Inno Setup script found, skipping installer creation
)

echo.
echo ========================================
echo Packaging completed!
echo ========================================
echo.
echo Package contents:
if exist "%PORTABLE_DIR%" (
    echo   - Portable version: %PORTABLE_DIR%\
    echo   - Launcher: %PORTABLE_DIR%\Launch REChain.bat
)

if exist "%PROJECT_ROOT%\Output\REChainSetup.exe" (
    echo   - Installer: %PROJECT_ROOT%\Output\REChainSetup.exe
)

echo.
echo Application size:
for %%A in ("%PACKAGE_DIR%\REChain.exe") do echo   - Executable: %%~zA bytes

echo.
echo To distribute:
echo   1. Portable: Share the entire %PORTABLE_DIR% folder
echo   2. Installer: Share REChainSetup.exe from Output folder
echo.
