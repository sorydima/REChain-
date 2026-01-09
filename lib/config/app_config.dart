import 'dart:ui';

abstract class AppConfig {
  // Const and final configuration values (immutable)
  static const Color primaryColor = Color(0xFF5625BA);
  static const Color primaryColorLight = Color(0xFFCCBDEA);
  static const Color secondaryColor = Color(0xFF41a2bc);

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
  static const double columnWidth = 360.0;

  static const String website = 'https://github.com/sorydima/REChain-';
  static const String enablePushTutorial =
      'https://github.com/sorydima/REChain-/wiki#-how-to-set-up-push-notifications-in-rechain-without-google-services';
  static const String encryptionTutorial =
      'https://github.com/sorydima/REChain-/wiki#bug-reporting-with-logs';
  static const String startChatTutorial =
      'https://github.com/sorydima/REChain-/REChain_wiki/How-to-Find-Users-in-REChain';
  static const String howDoIGetStickersTutorial =
      'https://github.com/sorydima/REChain-/wiki#emotes';
  static const String appId = 'com.rechain.online';
  static const String appOpenUrlScheme = 'com.rechain';

  static const String sourceCodeUrl =
      'https://github.com/sorydima/REChain-.git';
  static const String supportUrl =
      'https://github.com/sorydima/REChain-/issues';
  static const String changelogUrl = 'https://github.com/sorydima/REChain-/blob/main/CHANGELOG.md';
  static const String donationUrl = 'USDT_TON_UQAJ4CswZ6dWhyp46CABmWYEmKNVjPwwZYd1O8HWYRE7tG_X';

  static const Set<String> defaultReactions = {'👍', '❤️', '😂', '😮', '😢'};

  static final Uri newIssueUrl = Uri(
    scheme: 'https',
    host: 'github.com',
    path: '/sorydima/REChain-/issues/new',
  );

  static final Uri homeserverList = Uri(
    scheme: 'https',
    host: 'servers.joinmatrix.org',
    path: 'servers.json',
  );

  static final Uri privacyUrl = Uri(
    scheme: 'https',
    host: 'github.com',
    path: '/sorydima/REChain-/blob/main/PRIVACY.md',
  );

  static const String mainIsolatePortName = 'main_isolate';
  static const String pushIsolatePortName = 'push_isolate';
}
