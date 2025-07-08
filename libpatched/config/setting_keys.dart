import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingKeys {
  static const String renderHtml = 'com.rechain.renderHtml';
  static const String hideRedactedEvents = 'com.rechain.hideRedactedEvents';
  static const String hideUnknownEvents = 'com.rechain.hideUnknownEvents';
  static const String hideUnimportantStateEvents =
      'com.rechain.hideUnimportantStateEvents';
  static const String separateChatTypes = 'com.rechain.separateChatTypes';
  static const String sentry = 'sentry';
  static const String theme = 'theme';
  static const String amoledEnabled = 'amoled_enabled';
  static const String codeLanguage = 'code_language';
  static const String showNoGoogle = 'com.rechain.show_no_google';
  static const String fontSizeFactor = 'com.rechain.font_size_factor';
  static const String showNoPid = 'com.rechain.show_no_pid';
  static const String databasePassword = 'database-password';
  static const String appLockKey = 'com.rechain.app_lock';
  static const String unifiedPushRegistered =
      'com.rechain.unifiedpush.registered';
  static const String unifiedPushEndpoint = 'com.rechain.unifiedpush.endpoint';
  static const String ownStatusMessage = 'com.rechain.status_msg';
  static const String dontAskForBootstrapKey =
      'com.rechainchat.dont_ask_bootstrap';
  static const String autoplayImages = 'com.rechain.autoplay_images';
  static const String sendTypingNotifications =
      'com.rechain.send_typing_notifications';
  static const String sendPublicReadReceipts =
      'com.rechain.send_public_read_receipts';
  static const String sendOnEnter = 'com.rechain.send_on_enter';
  static const String swipeRightToLeftToReply =
      'com.rechain.swipeRightToLeftToReply';
  static const String experimentalVoip = 'com.rechain.experimental_voip';
  static const String showPresences = 'com.rechain.show_presences';
  static const String displayNavigationRail =
      'com.rechain.display_navigation_rail';
}

enum AppSettings<T> {
  audioRecordingNumChannels<int>('audioRecordingNumChannels', 1),
  audioRecordingAutoGain<bool>('audioRecordingAutoGain', true),
  audioRecordingEchoCancel<bool>('audioRecordingEchoCancel', false),
  audioRecordingNoiseSuppress<bool>('audioRecordingNoiseSuppress', true),
  audioRecordingBitRate<int>('audioRecordingBitRate', 64000),
  audioRecordingSamplingRate<int>('audioRecordingSamplingRate', 44100),
  pushNotificationsGatewayUrl<String>(
    'pushNotificationsGatewayUrl',
    'https://matrix-client.matrix.org/_matrix/push/v1/notify',
  ),
  pushNotificationsPusherFormat<String>(
    'pushNotificationsPusherFormat',
    'event_id_only',
  ),
  shareKeysWith<String>('com.rechain.share_keys_with_2', 'all'),
  noEncryptionWarningShown<bool>(
    'com.rechain.no_encryption_warning_shown',
    false,
  ),
  displayChatDetailsColumn(
    'com.rechain.display_chat_details_column',
    false,
  ),
  enableSoftLogout<bool>('com.rechain.enable_soft_logout', false);

  final String key;
  final T defaultValue;

  const AppSettings(this.key, this.defaultValue);
}

extension AppSettingsBoolExtension on AppSettings<bool> {
  bool getItem(SharedPreferences store) => store.getBool(key) ?? defaultValue;

  Future<void> setItem(SharedPreferences store, bool value) =>
      store.setBool(key, value);
}

extension AppSettingsStringExtension on AppSettings<String> {
  String getItem(SharedPreferences store) =>
      store.getString(key) ?? defaultValue;

  Future<void> setItem(SharedPreferences store, String value) =>
      store.setString(key, value);
}

extension AppSettingsIntExtension on AppSettings<int> {
  int getItem(SharedPreferences store) => store.getInt(key) ?? defaultValue;

  Future<void> setItem(SharedPreferences store, int value) =>
      store.setInt(key, value);
}

extension AppSettingsDoubleExtension on AppSettings<double> {
  double getItem(SharedPreferences store) =>
      store.getDouble(key) ?? defaultValue;

  Future<void> setItem(SharedPreferences store, double value) =>
      store.setDouble(key, value);
}
