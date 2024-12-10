#!/usr/bin/env bash

# generate a temporary signing key adn apply its configuration
cd android
KEYFILE="$(pwd)/key.jks"
echo "Generating signing configuration with $KEYFILE..."
keytool -genkey -keyalg RSA -alias key -keysize 4096 -dname "cn=REChain CI, ou=Head of bad integration tests, o=REChain HQ, c=TLH" -keypass REChain -storepass REChain -validity 1 -keystore "$KEYFILE" -storetype "pkcs12"
echo "storePassword=REChain" >> key.properties
echo "keyPassword=REChain" >> key.properties
echo "keyAlias=key" >> key.properties
echo "storeFile=$KEYFILE" >> key.properties
ls | grep key
cd ..

# build release mode APK
flutter pub get
flutter build apk --release

# install and launch APK
flutter install
adb shell am start -n com.rechain.online/com.rechain.online.MainActivity

sleep 5

# check whether REChain runs
adb shell ps | awk '{print $9}' | grep com.rechain.online
