// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:convert';

import 'package:async/async.dart';
import 'package:rechainonline/utils/platform_infos.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:managed_configurations/managed_configurations.dart';
import 'package:matrix/matrix_api_lite/utils/logs.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppSettings<T> {
  textMessageMaxLength<int>('textMessageMaxLength', 16384),

  /// Max lines for unselected HTML/text bubbles; 0 = unlimited (no fade).
  messagePreviewMaxLines<int>('com.rechain.message_preview_max_lines', 50),
  audioRecordingNumChannels<int>('audioRecordingNumChannels', 1),
  audioRecordingAutoGain<bool>('audioRecordingAutoGain', true),
  audioRecordingEchoCancel<bool>('audioRecordingEchoCancel', true),
  audioRecordingNoiseSuppress<bool>('audioRecordingNoiseSuppress', true),
  audioRecordingBitRate<int>('audioRecordingBitRate', 64000),
  audioRecordingSamplingRate<int>('audioRecordingSamplingRate', 48000),
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
  autoplayImages<bool>('com.rechain.autoplay_images', true),
  sendTypingNotifications<bool>('com.rechain.send_typing_notifications', true),
  sendPublicReadReceipts<bool>('com.rechain.send_public_read_receipts', true),
  swipeRightToLeftToReply<bool>('com.rechain.swipeRightToLeftToReply', true),
  sendOnEnter<bool>('com.rechain.send_on_enter', false),
  displayNavigationRail<bool>('com.rechain.display_navigation_rail', true),
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
  emojiSuggestionLocale<String>('emoji_suggestion_locale', ''),
  enableSoftLogout<bool>('com.rechain.enable_soft_logout', true),
  enableMatrixNativeOIDC<bool>('com.rechain.enable_matrix_native_oidc', true),
  presetHomeserver<String>('com.rechain.preset_homeserver', ''),
  welcomeText<String>('com.rechain.welcome_text', ''),
  website<String>('com.rechain.website_url', 'https://chat.codemagic.app/'),
  logoUrl<String>(
    'com.rechain.logo_url',
    'https://github.com/sorydima/REChain-/blob/main/AppIcons/playstore.png?raw=true',
  ),
  privacyPolicy<String>(
    'com.rechain.privacy_policy_url',
    'https://raw.githubusercontent.com/sorydima/REChain-/refs/heads/main/PRIVACY.md',
  ),
  tos<String>('com.rechain.tos_url', 'https://raw.githubusercontent.com/sorydima/REChain-/refs/heads/main/REChain_EULA.txt'),
  sendTimelineEventTimeout<int>('com.rechain.send_timeline_event_timeout', 15),
  webNotificationSound<bool>('com.rechain.web_notification_sound', true),
  chatFilter<String>('com.rechain.chat_filter', 'allChats'),
  hideRoomsInSpaces<bool>('com.rechain.hideRoomsInSpaces', false),
  showThumbnailsInTimeline<bool>('com.rechain.showThumbnailsInTimeline', true),
  doubleTapToReact<bool>('com.rechain.double_tap_to_react', true),
  doubleTapReaction<String>('com.rechain.double_tap_reaction', '❤️'),
  benchmarksInLogs<bool>('com.rechain.benchmarks_in_logs', true),
  autoSendErrorReports<bool?>('com.rechain.auto_send_eror_reports', null),
  knownErrorHashes<List<String>>('com.rechain.known_crash_hashes', []),
  checkForUpdates<bool>('com.rechain.check_for_updates', true),
  lastUpdateCheckDate<String>('com.rechain.last_update_check_date', ''),
  fallbackLiveKitInstance<String>(
    'com.rechain.fallback_live_kit_instance',
    '',
  );

  final String key;
  final T _defaultValue;

  const AppSettings(this.key, this._defaultValue);

  static SharedPreferences get store => _store!;
  static SharedPreferences? _store;

  static Map<String, Object?>? _platformConfiguration;

  T get defaultValue {
    final platformConfig = _platformConfiguration?[name];
    if (platformConfig is T) return platformConfig;
    return _defaultValue;
  }

  static Future<void> reset({bool loadWebConfigFile = true}) async {
    await AppSettings._store!.clear();
    await init(loadWebConfigFile: loadWebConfigFile);
  }

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
    if (store.getBool(AppSettings.doubleTapToReact.key) == null) {
      await store.setBool(
        AppSettings.doubleTapToReact.key,
        PlatformInfos.isMobile,
      );
    }

    // Load configuration from config.json file or MDM:
    if (PlatformInfos.isMobile) {
      _platformConfiguration =
          await ManagedConfigurations().getManagedConfigurations;
    } else if (kIsWeb && loadWebConfigFile) {
      try {
        final configJsonString = utf8.decode(
          (await http.get(Uri.parse('config.json'))).bodyBytes,
        );
        _platformConfiguration =
            json.decode(configJsonString) as Map<String, Object?>;
      } on FormatException catch (_) {
        Logs().v('[ConfigLoader] config.json not found');
      } catch (e) {
        Logs().v('[ConfigLoader] config.json not found', e);
      }
    }

    return store;
  }
}

extension AppSettingsBoolNExtension on AppSettings<bool?> {
  bool? get value {
    final value = Result(() => AppSettings.store.getBool(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value;
  }

  Future<void> setItem(bool value) => AppSettings.store.setBool(key, value);
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

extension AppSettingsStringListExtension on AppSettings<List<String>> {
  List<String> get value {
    final value = Result(() => AppSettings.store.getStringList(key));
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

  Future<void> setItem(List<String> value) =>
      AppSettings.store.setStringList(key, value);
}
