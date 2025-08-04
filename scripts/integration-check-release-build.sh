#!/usr/bin/env bash

# Flutter path
FLUTTER_PATH="/home/sorydev/flutter/bin/flutter"

# generate a temporary signing key adn apply its configuration
cd android
KEYFILE="$(pwd)/key.jks"
echo "Generating signing configuration with $KEYFILE..."
keytool -genkey -keyalg RSA -alias key -keysize 4096 -dname "cn=REChain CI, ou=Head of bad integration tests, o=REChain HQ, c=TLH" -keypass RECHAIN -storepass RECHAIN -validity 1 -keystore "$KEYFILE" -storetype "pkcs12"
echo "storePassword=RECHAIN" >> key.properties
echo "keyPassword=RECHAIN" >> key.properties
echo "keyAlias=key" >> key.properties
echo "storeFile=$KEYFILE" >> key.properties
ls | grep key
cd ..

# build release mode APK
"$FLUTTER_PATH" pub get
"$FLUTTER_PATH" build apk --release

# install and launch APK
"$FLUTTER_PATH" install
adb shell am start -n com.rechain.online/com.rechain.online.MainActivity

sleep 5

# check whether REChain runs
adb shell ps | awk '{print $9}' | grep com.rechain.online
