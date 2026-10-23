// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:matrix/encryption.dart';
import 'package:matrix/matrix.dart';

class BootstrapViewModelState {
  String? recoveryKey;
  bool isLoading = false;
  Object? unlockWithError;
  ({
    bool connected,
    bool crossSigningEnabled,
    bool initialized,
    bool keyBackupEnabled,
  })?
  cryptoIdentityState;
  bool reset = false;
  KeyVerification? keyVerification;
  List<DeviceKeys>? connectedDevices;
  bool obscureText = true;
  bool waitingForSecrets = false;
  bool noSecretsreceived = false;

  bool newPassphraseEqualsRepeatPassphrase = false;
  bool newPassphraseLongEnough = false;
  bool newPassphraseUpperAndLowerCase = false;
  bool newPassphraseSpecialCharacters = false;
  bool newPassphraseNumbers = false;
  bool passphraseOrRecoveryKeyEntered = false;
  bool recoveryKeyDownloaded = false;
  bool recoveryKeyStoredInSecureStorage = false;
}
