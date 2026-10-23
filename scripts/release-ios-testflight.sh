#!/bin/sh -ve

# SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
# SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

# SPDX-License-Identifier: AGPL-3.0-or-later

# Enable FCM and get packages
flutter pub add fcm_shared_isolate
sed -i '' 's,//<GOOGLE_SERVICES>,,g' lib/utils/background_push.dart
flutter clean
flutter pub get

# Compile release build
flutter build ipa

# Publish to testflight
(
  cd ios
  fastlane beta
)