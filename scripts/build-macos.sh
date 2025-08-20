#!/usr/bin/env bash
git apply ./scripts/enable-android-google-services.patch
RECHAIN_ORIG_GROUP="com.rechain"
RECHAIN_ORIG_TEAM="ABCDE12345"
#RECHAIN_NEW_GROUP="com.rechain.online"
#RECHAIN_NEW_TEAM="ABCDE12345"

# In some cases (ie: running beta XCode releases) some pods haven't updated their minimum version
# but XCode will reject the package for using too old of a minimum version. 
# This will fix that, but. Well. Use at your own risk.
# export I_PROMISE_IM_REALLY_SMART=1

# If you want to automatically install the app
# export RECHAIN_INSTALL_IPA=1

### Rotate IDs ###
[ -n "${RECHAIN_NEW_GROUP}" ] && {
	# App group IDs
	sed -i "" "s/group.${RECHAIN_ORIG_GROUP}.app/group.${RECHAIN_NEW_GROUP}.app/g" "macos/Runner/Runner.entitlements"
	sed -i "" "s/group.${RECHAIN_ORIG_GROUP}.app/group.${RECHAIN_NEW_GROUP}.app/g" "macos/Runner.xcodeproj/project.pbxproj"
	# Bundle identifiers
	sed -i "" "s/${RECHAIN_ORIG_GROUP}.app/${RECHAIN_NEW_GROUP}.app/g" "macos/Runner.xcodeproj/project.pbxproj"
}

[ -n "${RECHAIN_NEW_TEAM}" ] && {
	# Code signing team
	sed -i "" "s/${RECHAIN_ORIG_TEAM}/${RECHAIN_NEW_TEAM}/g" "macos/Runner.xcodeproj/project.pbxproj"
}

### Make release build ###
flutter build macos --release

cp /usr/local/Cellar/libolm/**/lib/libolm.3.dylib build/macos/Build/Products/Release/REChain.app/Contents/Frameworks/libolm.3.dylib

echo "Build build/macos/Build/Products/Release/REChain.app"
