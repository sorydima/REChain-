// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:rechainonline/widgets/adaptive_dialogs/dialog_text_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../data/environment_constants.dart';
import '../utils/rechainonline_chat_tester.dart';
import 'auth_flows.dart';

Future<void> loginAndChatBackup(WidgetTester widgetTester) => widgetTester
    .startrechainonlineChatTest()
    .then((tester) => tester._loginAndChatBackup());

extension on rechainonlineChatTester {
  Future<void> _loginAndChatBackup() async {
    // Set up with only recovery key:
    await login();
    await tapOn('Skip', pumpAndSettle: false);
    await tapOn('Store in Android KeyStore');
    await tapOn('Continue');
    await skipNoNotificationsDialog();
    await logout();

    // Restore with recovery key from keystore:
    await login();
    await tapOn('Unlock');
    await skipNoNotificationsDialog();
    await logout();

    // Reset with passphrase:
    await login();
    await waitFor('Restore Crypto Identity');
    await tapOn('Reset account');
    await tapOn('Reset account', index: 1);
    await enterText(TextField, passphrase1, index: 0);
    await enterText(TextField, passphrase1, index: 1);
    await tapOn('Continue', pumpAndSettle: false);
    await waitFor('Please enter your password');
    await enterText(DialogTextField, user1Pw, pumpAndSettle: false);
    await tapOn('Ok');
    await tapOn('Continue');
    AuthFlows.userPassphrases[user1Name] = passphrase1;
    await logout();

    // Restore with passphrase:
    await ensureLoggedIn();

    // Reset passphrase
    await tapOn(Key('accounts_and_settings_buttons'));
    await tapOn('Settings');
    await tapOn('Chat backup');
    await tapOn('Reset recovery key');
    await enterText(TextField, passphrase1, index: 0);
    await enterText(TextField, passphrase1, index: 1);
    await tapOn('Continue', pumpAndSettle: false);
    await waitFor('Please enter your password');
    await enterText(DialogTextField, user1Pw, pumpAndSettle: false);
    await tapOn('Ok');
    await waitFor('You are ready to start!');
    await tapOn('Continue');
    AuthFlows.userPassphrases[user1Name] = passphrase1;
  }
}
