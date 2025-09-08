@echo off
echo ========================================
echo REChain Android Test Script
echo ========================================

set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%..
set ANDROID_DIR=%PROJECT_ROOT%\android

echo Project root: %PROJECT_ROOT%
echo Android directory: %ANDROID_DIR%

cd /d "%PROJECT_ROOT%"

echo.
echo [1/4] Running Flutter tests...
call flutter test
if %ERRORLEVEL% neq 0 (
    echo WARNING: Flutter tests failed, continuing...
)

echo.
echo [2/4] Running Android unit tests...
cd /d "%ANDROID_DIR%"
call gradlew test
if %ERRORLEVEL% neq 0 (
    echo WARNING: Android unit tests failed, continuing...
)

echo.
echo [3/4] Running Android instrumentation tests...
call gradlew connectedAndroidTest
if %ERRORLEVEL% neq 0 (
    echo WARNING: Android instrumentation tests failed, continuing...
)

echo.
echo [4/4] Running lint checks...
call gradlew lint
if %ERRORLEVEL% neq 0 (
    echo WARNING: Lint checks failed, continuing...
)

echo.
echo ========================================
echo Test run completed!
echo ========================================
echo.
echo Check the following for detailed results:
echo - Flutter tests: test results in console
echo - Unit tests: android/app/build/reports/tests/
echo - Instrumentation tests: android/app/build/reports/androidTests/
echo - Lint: android/app/build/reports/lint-results.html
echo.

pause
