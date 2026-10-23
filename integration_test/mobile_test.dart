// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'flows/auth_flows.dart';
import 'flows/basic_messaging.dart';
import 'flows/chat_flows.dart';
import 'flows/login_and_chat_backup.dart';
import 'flows/multi_account.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('REChain.Online Integration Tests', () {
    testWidgets('Login and logout flow', loginAndChatBackup);
    testWidgets('Basic Messaging', basicMessaging);
    testWidgets('Multi-Account', multiAccount);
    testWidgets('Archive chats', archiveChats);
    testWidgets('Final logout', finalLogout);
  });
}
