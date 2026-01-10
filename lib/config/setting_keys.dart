import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix_api_lite/utils/logs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rechainonline/utils/platform_infos.dart';

enum AppSettings<T> {
  textMessageMaxLength<int>('textMessageMaxLength', 16384),
  audioRecordingNumChannels<int>('audioRecordingNumChannels', 1),
  audioRecordingAutoGain<bool>('audioRecordingAutoGain', true),
  audioRecordingEchoCancel<bool>('audioRecordingEchoCancel', true),
  audioRecordingNoiseSuppress<bool>('audioRecordingNoiseSuppress', true),
  audioRecordingBitRate<int>('audioRecordingBitRate', 64000),
  audioRecordingSamplingRate<int>('audioRecordingSamplingRate', 44100),
  showNoGoogle<bool>('com.rechain.show_no_google', true),
  unifiedPushRegistered<bool>('com.rechain.unifiedpush.registered', true),
  unifiedPushEndpoint<String>('com.rechain.unifiedpush.endpoint', 'https://push.services.mozilla.com/_matrix/push/v1/notify'),
  pushNotificationsGatewayUrl<String>(
    'pushNotificationsGatewayUrl',
    'https://push.services.mozilla.com/_matrix/push/v1/notify',
  ),
  pushNotificationsPusherFormat<String>(
    'pushNotificationsPusherFormat',
    'event_id_only',
  ),
  renderHtml<bool>('com.rechain.renderHtml', true),
  fontSizeFactor<double>('com.rechain.font_size_factor', 1.0),
  hideRedactedEvents<bool>('com.rechain.hideRedactedEvents', false),
  hideUnknownEvents<bool>('com.rechain.hideUnknownEvents', false),
  separateChatTypes<bool>('com.rechain.separateChatTypes', true),
  autoplayImages<bool>('com.rechain.autoplay_images', true),
  sendTypingNotifications<bool>('com.rechain.send_typing_notifications', true),
  sendPublicReadReceipts<bool>('com.rechain.send_public_read_receipts', true),
  swipeRightToLeftToReply<bool>('com.rechain.swipeRightToLeftToReply', true),
  sendOnEnter<bool>('com.rechain.send_on_enter', true),
  showPresences<bool>('com.rechain.show_presences', true),
  displayNavigationRail<bool>('com.rechain.display_navigation_rail', true),
  experimentalVoip<bool>('com.rechain.experimental_voip', true),
  shareKeysWith<String>('com.rechain.share_keys_with_2', 'all'),
  noEncryptionWarningShown<bool>(
    'com.rechain.no_encryption_warning_shown',
    false,
  ),
  displayChatDetailsColumn('com.rechain.display_chat_details_column', true),
  // AppConfig-mirrored settings
  applicationName<String>('com.rechain.application_name', 'REChain'),
  defaultHomeserver<String>('com.rechain.default_homeserver', 'matrix.digitalprivacy.diy'),
  // colorSchemeSeed stored as ARGB int
  colorSchemeSeedInt<int>('com.rechain.color_scheme_seed', 0xFF5625BA),
  emojiSuggestionLocale<String>('emoji_suggestion_locale', 'en'),
  enableSoftLogout<bool>('com.rechain.enable_soft_logout', true),
  appLockKey<String>('com.rechain.app_lock_key', '');

  final String key;
  final T defaultValue;

  const AppSettings(this.key, this.defaultValue);

  static SharedPreferences get store => _store!;
  static SharedPreferences? _store;

  static Future<SharedPreferences> init({bool loadWebConfigFile = true}) async {
    if (AppSettings._store != null) return AppSettings.store;

    final store = AppSettings._store = await SharedPreferences.getInstance();

    // Migrate wrong datatype for fontSizeFactor
    final fontSizeFactorString = Result(
      () => store.getString(AppSettings.fontSizeFactor.key),
    ).asValue?.value;
    if (fontSizeFactorString != null) {
      Logs().i('Migrate wrong datatype for fontSizeFactor!');
      await store.remove(AppSettings.fontSizeFactor.key);
      final fontSizeFactor = double.tryParse(fontSizeFactorString);
      if (fontSizeFactor != null) {
        await store.setDouble(AppSettings.fontSizeFactor.key, fontSizeFactor);
      }
    }

    if (store.getBool(AppSettings.sendOnEnter.key) == null) {
      await store.setBool(AppSettings.sendOnEnter.key, !PlatformInfos.isMobile);
    }
    if (kIsWeb && loadWebConfigFile) {
      try {
        final configJsonString = utf8.decode(
          (await http.get(Uri.parse('config.json'))).bodyBytes,
        );
        final configJson =
            json.decode(configJsonString) as Map<String, Object?>;
        for (final setting in AppSettings.values) {
          if (store.get(setting.key) != null) continue;
          final configValue = configJson[setting.name];
          if (configValue == null) continue;
          if (configValue is bool) {
            await store.setBool(setting.key, configValue);
          }
          if (configValue is String) {
            await store.setString(setting.key, configValue);
          }
          if (configValue is int) {
            await store.setInt(setting.key, configValue);
          }
          if (configValue is double) {
            await store.setDouble(setting.key, configValue);
          }
        }
      } on FormatException catch (_) {
        Logs().v('[ConfigLoader] config.json not found!');
      } catch (e) {
        Logs().v('[ConfigLoader] config.json not found!', e);
      }
    }

    return store;
  }
}

extension AppSettingsBoolExtension on AppSettings<bool> {
  bool get value {
    final value = Result(() => AppSettings.store.getBool(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value ?? defaultValue;
  }

  Future<void> setItem(bool value) => AppSettings.store.setBool(key, value);
}

extension AppSettingsStringExtension on AppSettings<String> {
  String get value {
    final value = Result(() => AppSettings.store.getString(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value ?? defaultValue;
  }

  Future<void> setItem(String value) => AppSettings.store.setString(key, value);
}

extension AppSettingsIntExtension on AppSettings<int> {
  int get value {
    final value = Result(() => AppSettings.store.getInt(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value ?? defaultValue;
  }

  Future<void> setItem(int value) => AppSettings.store.setInt(key, value);
}

extension AppSettingsDoubleExtension on AppSettings<double> {
  double get value {
    final value = Result(() => AppSettings.store.getDouble(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value ?? defaultValue;
  }

  Future<void> setItem(double value) => AppSettings.store.setDouble(key, value);
}
