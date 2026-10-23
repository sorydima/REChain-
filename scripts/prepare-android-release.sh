#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
# SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

# SPDX-License-Identifier: AGPL-3.0-or-later

cd android
echo $FDROID_KEY | base64 --decode --ignore-garbage > key.jks
echo "storePassword=${FDROID_KEY_PASS}" >> key.properties
echo "keyPassword=${FDROID_KEY_PASS}" >> key.properties
echo "keyAlias=key" >> key.properties
echo "storeFile=../key.jks" >> key.properties
echo $PLAYSTORE_DEPLOY_KEY >> keys.json
ls | grep key
bundle install
bundle update fastlane
bundle exec fastlane set_build_code_internal
cd ..
