// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../data/environment_constants.dart';
import '../utils/rechainonline_chat_tester.dart';
import 'auth_flows.dart';

Future<void> multiAccount(WidgetTester widgetTester) => widgetTester
    .startrechainonlineChatTest()
    .then((tester) => tester._multiAccountAndNotifications());

extension on rechainonlineChatTester {
  Future<void> _multiAccountAndNotifications() async {
    await ensureLoggedIn();

    // Login user 2
    await tapOn(Key('accounts_and_settings_buttons'));
    await tapOn('Add account');
    await login(username: user2Name, password: user2Pw);
    await initCryptoIdentity(username: user2Name);

    // Logout user 2
    await tapOn(Key('accounts_and_settings_buttons'));
    await tapOn(user2Name);
    await tapOn(Key('accounts_and_settings_buttons'));
    await tapOn('Settings');
    await scrollUntilVisible('Logout');
    await tapOn('Logout');
    await tapOn(Key('ok_cancel_alert_dialog_ok_button'));
    await waitFor('One of your clients has been logged out');
  }
}
