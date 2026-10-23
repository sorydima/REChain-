// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:ui';

abstract class AppConfig {
  static const Color primaryColor = Color(0xFF261386);

  static const Color chatColor = primaryColor;
  static const double messageFontSize = 16.0;
  static const bool allowOtherHomeservers = true;
  static const bool enableRegistration = true;
  static const bool hideTypingUsernames = false;

  static const String inviteLinkPrefix = 'https://matrix.to/#/';
  static const String deepLinkPrefix = 'com.rechain://chat/';
  static const String schemePrefix = 'matrix:';
  static const String pushNotificationsChannelId = 'rechainonline_push';
  static const String pushNotificationsAppId = 'com.rechain.online';
  static const double borderRadius = 18.0;
  static const double spaceBorderRadius = 11.0;
  static const double columnWidth = 360.0;

  static const String enablePushTutorial =
      'https://github.com/sorydima/REChain-/wiki#-how-to-set-up-push-notifications-in-rechain-without-google-services';
  static const String encryptionTutorial =
      'https://github.com/sorydima/REChain-/wiki#bug-reporting-with-logs';
  static const String howDoIGetStickersTutorial =
      'https://github.com/sorydima/REChain-/wiki#emotes';
  static const String appId = 'com.rechain.online';
  static const String appOpenUrlScheme = 'com.rechain';
  static const String appSsoUrlScheme = 'com.rechain.auth';
  // Identifies the notification activation callback on Windows. Never change!
  static const String windowsNotificationGuid =
      '';

  static const String sourceCodeUrl =
      'https://github.com/sorydima/REChain-.git';
  static const String supportUrl =
      'https://github.com/sorydima/REChain-/issues';
  static const String changelogUrl = 'https://github.com/sorydima/REChain-/blob/main/CHANGELOG.md';
  static const String latestReleaseApiUrl =
      'https://api.github.com/repos/sorydima/REChain-/releases/latest';
  static const String helpUrl =
      'USDT_TON_UQAJ4CswZ6dWhyp46CABmWYEmKNVjPwwZYd1O8HWYRE7tG_X';

  static const Set<String> defaultReactions = {'👍', '❤️', '😂', '😮', '😢'};

  static final Uri newIssueUrl = Uri(
    scheme: 'https',
    host: 'github.com',
    path: '/sorydima/REChain-/issues/new',
  );

  static final Uri homeserverList = Uri(
    scheme: 'https',
    host: 'raw.githubusercontent.com',
    path: 'sorydima/REChain-/refs/heads/main/recommended_homeservers.json',
  );

  static final Uri crashReportEndpoint = Uri(
    scheme: 'https',
    host: 'github.com/sorydima/REChain-/issues/new',
  );

  static const String mainIsolatePortName = 'main_isolate';
  static const String pushIsolatePortName = 'push_isolate';
  static const String pushHelperCrashReportKey = 'push_helper_crash_report';

  static const String vodozemacVersion = '0.8.1';
}
