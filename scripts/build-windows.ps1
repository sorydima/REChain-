# SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
# SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

# SPDX-License-Identifier: AGPL-3.0-or-later

flutter doctor
flutter config --enable-windows-desktop
flutter clean
flutter pub get

flutter build windows --release -v

