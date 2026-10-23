#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
# SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

# SPDX-License-Identifier: AGPL-3.0-or-later

flutter pub add fcm_shared_isolate
flutter pub get

if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' 's,//<GOOGLE_SERVICES>,,g' lib/utils/background_push.dart
  sed -i '' -e 's,^/\*,,' -e 's,\*/$,,' android/app/src/main/kotlin/com/rechain/online/FcmPushService.kt
else
  sed -i 's,//<GOOGLE_SERVICES>,,g' lib/utils/background_push.dart
  sed -i -e 's,^/\*,,' -e 's,\*/$,,' android/app/src/main/kotlin/com/rechain/online/FcmPushService.kt
fi
