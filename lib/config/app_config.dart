import 'dart:ui';

import 'package:matrix/matrix.dart';

abstract class AppConfig {
  static String _applicationName = 'REChain 🪐';
  static String get applicationName => _applicationName;
  static String? _applicationWelcomeMessage;
  static String? get applicationWelcomeMessage => _applicationWelcomeMessage;
  static String _defaultHomeserver = 'matrix.katya.wtf';
  static String get defaultHomeserver => _defaultHomeserver;
  static double bubbleSizeFactor = 1;
  static double fontSizeFactor = 1;
  static const Color chatColor = primaryColor;
  static Color? colorSchemeSeed = primaryColor;
  static const double messageFontSize = 15.75;
  static const bool allowOtherHomeservers = true;
  static const bool enableRegistration = true;
  static const Color primaryColor = Color.fromARGB(255, 135, 103, 172);
  static const Color primaryColorLight = Color(0xFFCCBDEA);
  static const Color secondaryColor = Color(0xFF41a2bc);
  static String _privacyUrl = 'https://rechain.online/en/privacy.html';
  static String get privacyUrl => _privacyUrl;
  static const String enablePushTutorial = 'https://rechain.online/en/privacy.html';
  static const String encryptionTutorial = 'https://rechain.online/en/privacy.html#4';
  static const String appId = 'com.rechain.online';
  static const String appOpenUrlScheme = 'com.rechain';
  static String _webBaseUrl = 'https://rechain.online/web';
  static String get webBaseUrl => _webBaseUrl;
  static const String sourceCodeUrl = 'mailto:support@rechain.email';
  static const String supportUrl = 'mailto:support@rechain.email';
  static const bool enableSentry = true;
  static const String sentryDns = 'https://d46ee6f0fff24af391dee1220860b36d@o1288037.ingest.sentry.io/6504348';
  static bool renderHtml = true;
  static bool hideRedactedEvents = true;
  static bool hideUnknownEvents = true;
  static bool hideUnimportantStateEvents = true;
  static bool showDirectChatsInSpaces = true;
  static bool separateChatTypes = true;
  static bool autoplayImages = true;
  static bool sendOnEnter = false;
  static bool experimentalVoip = true;
  static const bool hideTypingUsernames = false;
  static const bool hideAllStateEvents = false;
  static const String inviteLinkPrefix = 'https://matrix.to/#/';
  static const String deepLinkPrefix = 'com.rechain://online/';
  static const String schemePrefix = 'matrix:';
  static const String pushNotificationsChannelId = 'rechainonline_push';
  static const String pushNotificationsChannelName = 'REChain 🪐 Push Channel!';
  static const String pushNotificationsChannelDescription = 'Push Notifications For The REChain 🪐 Platform!';
  static const String pushNotificationsAppId = 'com.rechain.online';
  static const String pushNotificationsGatewayUrl = 'https://matrix-client.matrix.org/_matrix/push/v1/notify';
  static const String pushNotificationsPusherFormat = 'event_id_only';
  static const String emojiFontName = 'Noto Emoji';
  static const String emojiFontUrl = 'https://github.com/googlefonts/noto-emoji/';
  static const double borderRadius = 16.0;
  static const double columnWidth = 360.0;

  static void loadFromJson(Map<String, dynamic> json) {
    if (json['chat_color'] != null) {
      try {
        colorSchemeSeed = Color(json['chat_color']);
      } catch (e) {
        Logs().w(
            'Invalid color! Please make sure to define the color in this format: "0xffdd0000"',
            e);
      }
    }
    if (json['application_name'] is String) {
      _applicationName = json['application_name'];
    }
    if (json['application_welcome_message'] is String) {
      _applicationWelcomeMessage = json['application_welcome_message'];
    }
    if (json['default_homeserver'] is String) {
      _defaultHomeserver = json['default_homeserver'];
    }
    if (json['privacy_url'] is String) {
      _webBaseUrl = json['privacy_url'];
    }
    if (json['web_base_url'] is String) {
      _privacyUrl = json['web_base_url'];
    }
    if (json['render_html'] is bool) {
      renderHtml = json['render_html'];
    }
    if (json['hide_redacted_events'] is bool) {
      hideRedactedEvents = json['hide_redacted_events'];
    }
    if (json['hide_unknown_events'] is bool) {
      hideUnknownEvents = json['hide_unknown_events'];
    }
  }
}
