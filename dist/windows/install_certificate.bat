@echo off
echo ============================================
echo    REChain Certificate Installer
echo ============================================
echo.
echo This will install the REChain certificate to
echo allow installation of the MSIX package.
echo.
echo Administrator privileges are required.
echo.
pause

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Install certificate to Trusted People store
echo.
echo Installing certificate...
certutil -addstore "TrustedPeople" "%~dp0REChain.cer"

if %errorlevel% equ 0 (
    echo.
    echo ============================================
    echo    Certificate installed successfully!
    echo ============================================
    echo.
    echo You can now install REChain by double-clicking
    echo the rechainonline.msix file.
    echo.
) else (
    echo.
    echo ============================================
    echo    Error installing certificate
    echo ============================================
    echo.
    echo Please try running this script as Administrator.
    echo.
)

pause
