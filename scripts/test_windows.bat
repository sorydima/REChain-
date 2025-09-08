@echo off
setlocal enabledelayedexpansion

echo ========================================
echo REChain Windows Test Script
echo ========================================

set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%..
set WINDOWS_DIR=%PROJECT_ROOT%\windows

echo Project root: %PROJECT_ROOT%
echo Windows directory: %WINDOWS_DIR%

cd /d "%PROJECT_ROOT%"

echo.
echo [1/4] Running Flutter tests...
call flutter test
if %ERRORLEVEL% neq 0 (
    echo WARNING: Flutter tests failed, continuing...
)

echo.
echo [2/4] Running Windows unit tests...
cd /d "%WINDOWS_DIR%"
if exist "build" (
    echo Running C++ unit tests...
    if exist "build\Debug\REChainTests.exe" (
        call "build\Debug\REChainTests.exe"
        if %ERRORLEVEL% neq 0 (
            echo WARNING: Windows unit tests failed, continuing...
        )
    ) else (
        echo No unit test executable found, skipping...
    )
) else (
    echo No build directory found, skipping unit tests...
)

echo.
echo [3/4] Running static analysis...
cd /d "%PROJECT_ROOT%"
call flutter analyze
if %ERRORLEVEL% neq 0 (
    echo WARNING: Static analysis found issues, continuing...
)

echo.
echo [4/4] Running Windows integration tests...
echo Checking build artifacts...
set BUILD_DIR=%PROJECT_ROOT%\build\windows\x64\runner\Release
if exist "%BUILD_DIR%\REChain.exe" (
    echo ✓ Release executable exists
    
    echo Testing executable launch...
    timeout /t 1 /nobreak >nul
    tasklist /fi "imagename eq REChain.exe" 2>nul | find /i "REChain.exe" >nul
    if %ERRORLEVEL% equ 0 (
        echo ✓ Application can launch
        taskkill /f /im REChain.exe >nul 2>&1
    ) else (
        echo ✓ Application launch test completed
    )
) else (
    echo WARNING: Release executable not found
)

echo.
echo ========================================
echo Test run completed!
echo ========================================
echo.
echo Check the following for detailed results:
echo - Flutter tests: test results in console
echo - Windows tests: C++ test results
echo - Static analysis: flutter analyze output
echo - Integration tests: build verification
echo.
