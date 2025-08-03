#!/bin/bash
set -euo pipefail

echo "=== Fixing macOS Code Signing Configuration ==="

# Navigate to the macOS directory
cd macos

# Backup the original project.pbxproj file
cp Runner.xcodeproj/project.pbxproj Runner.xcodeproj/project.pbxproj.backup

echo "Creating temporary file for modifications..."
cp Runner.xcodeproj/project.pbxproj Runner.xcodeproj/project.pbxproj.new

# Fix 1: Set CODE_SIGN_IDENTITY to "-" for all configurations
echo "Setting CODE_SIGN_IDENTITY to - for all configurations..."
sed -i 's/CODE_SIGN_IDENTITY = "[^"]*"/CODE_SIGN_IDENTITY = "-"/g' Runner.xcodeproj/project.pbxproj.new
sed -i 's/"CODE_SIGN_IDENTITY\[sdk=macosx\*\]" = "[^"]*"/"CODE_SIGN_IDENTITY\[sdk=macosx\*\]" = "-"/g' Runner.xcodeproj/project.pbxproj.new

# Fix 2: Set CODE_SIGN_STYLE to Manual for all configurations
echo "Setting CODE_SIGN_STYLE to Manual for all configurations..."
sed -i 's/CODE_SIGN_STYLE = Automatic/CODE_SIGN_STYLE = Manual/g' Runner.xcodeproj/project.pbxproj.new

# Fix 3: Set DEVELOPMENT_TEAM to empty for all configurations
echo "Setting DEVELOPMENT_TEAM to empty for all configurations..."
sed -i 's/DEVELOPMENT_TEAM = [^;]*;/DEVELOPMENT_TEAM = "";/g' Runner.xcodeproj/project.pbxproj.new

# Fix 4: Set PROVISIONING_PROFILE_SPECIFIER to empty for all configurations
echo "Setting PROVISIONING_PROFILE_SPECIFIER to empty for all configurations..."
sed -i 's/PROVISIONING_PROFILE_SPECIFIER = [^;]*;/PROVISIONING_PROFILE_SPECIFIER = "";/g' Runner.xcodeproj/project.pbxproj.new

# Fix 5: Ensure CODE_SIGNING_REQUIRED is set to NO
echo "Setting CODE_SIGNING_REQUIRED to NO..."
if ! grep -q "CODE_SIGNING_REQUIRED" Runner.xcodeproj/project.pbxproj.new; then
    # Add to the build settings section
    sed -i '/buildSettings = {/a \                CODE_SIGNING_REQUIRED = NO;' Runner.xcodeproj/project.pbxproj.new
else
    sed -i 's/CODE_SIGNING_REQUIRED = [^;]*;/CODE_SIGNING_REQUIRED = NO;/g' Runner.xcodeproj/project.pbxproj.new
fi

# Fix 6: Ensure CODE_SIGNING_ALLOWED is set to NO
echo "Setting CODE_SIGNING_ALLOWED to NO..."
if ! grep -q "CODE_SIGNING_ALLOWED" Runner.xcodeproj/project.pbxproj.new; then
    # Add to the build settings section
    sed -i '/buildSettings = {/a \                CODE_SIGNING_ALLOWED = NO;' Runner.xcodeproj/project.pbxproj.new
else
    sed -i 's/CODE_SIGNING_ALLOWED = [^;]*;/CODE_SIGNING_ALLOWED = NO;/g' Runner.xcodeproj/project.pbxproj.new
fi

# Replace the original file with the modified one
mv Runner.xcodeproj/project.pbxproj.new Runner.xcodeproj/project.pbxproj

echo "Verifying changes..."
if grep -q 'CODE_SIGN_IDENTITY = "-"' Runner.xcodeproj/project.pbxproj; then
    echo "✓ CODE_SIGN_IDENTITY correctly set to -"
else
    echo "✗ Failed to set CODE_SIGN_IDENTITY"
fi

if grep -q 'CODE_SIGN_STYLE = Manual' Runner.xcodeproj/project.pbxproj; then
    echo "✓ CODE_SIGN_STYLE correctly set to Manual"
else
    echo "✗ Failed to set CODE_SIGN_STYLE to Manual"
fi

if grep -q 'CODE_SIGNING_REQUIRED = NO' Runner.xcodeproj/project.pbxproj; then
    echo "✓ CODE_SIGNING_REQUIRED correctly set to NO"
else
    echo "✗ Failed to set CODE_SIGNING_REQUIRED to NO"
fi

if grep -q 'CODE_SIGNING_ALLOWED = NO' Runner.xcodeproj/project.pbxproj; then
    echo "✓ CODE_SIGNING_ALLOWED correctly set to NO"
else
    echo "✗ Failed to set CODE_SIGNING_ALLOWED to NO"
fi

echo "macOS code signing configuration fixed successfully!"
cd ..
