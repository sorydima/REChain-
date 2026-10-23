// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../utils/rechainonline_chat_tester.dart';
import 'auth_flows.dart';
import 'chat_flows.dart';

Future<void> basicMessaging(WidgetTester widgetTester) => widgetTester
    .startrechainonlineChatTest()
    .then((tester) => tester._basicMessaging());

extension on rechainonlineChatTester {
  Future<void> _basicMessaging() async {
    await ensureLoggedIn();
    await ensureGroupChatCreated();

    await tapOn(ChatFlows.groupChatName);
    const testMessage = 'Hello from integration test!';
    await enterText(Key('chat_input_field'), testMessage);
    await tapOn(Key('send_button'));
    await waitFor(testMessage);
    await goBack();
  }
}
