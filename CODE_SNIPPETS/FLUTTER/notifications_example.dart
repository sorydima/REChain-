import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rechain_matrix/rechain_matrix.dart';

/// Notifications Example
///
/// Demonstrates push notification setup and handling for Matrix events.
///
/// Usage:
/// ```dart
/// final notifications = NotificationsExample(client: client);
/// await notifications.initialize();
/// ```
class NotificationsExample {
  final Client client;
  final FlutterLocalNotificationsPlugin _notifications;

  // Notification channels
  static const String _channelId = 'rechain_messages';
  static const String _channelName = 'Messages';
  static const String _channelDescription =
      'Notifications for incoming Matrix messages';

  // Notification icons
  static const String _icon = '@mipmap/ic_launcher';

  NotificationsExample({required this.client})
      : _notifications = FlutterLocalNotificationsPlugin();

  /// Initialize the notification system
  Future<void> initialize() async {
    // Initialize the notification plugin
    const settings = InitializationSettings(
      android: AndroidInitializationSettings(_icon),
      iOS: DarwinInitializationSettings(),
    );

    await _notifications.initialize(settings);

    // Create notification channel for Android
    await _createNotificationChannel();

    // Request permission
    await _requestPermissions();

    // Set up event listeners
    _setupEventListeners();

    if (kDebugMode) {
      print('Notifications initialized');
    }
  }

  /// Create notification channel for Android
  Future<void> _createNotificationChannel() async {
    if (Platform.isAndroid) {
      const channel = AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDescription,
        importance: Importance.high,
        showBadge: true,
        enableVibration: true,
        enableLights: true,
      );

      await _notifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
  }

  /// Request notification permissions
  Future<bool> _requestPermissions() async {
    if (Platform.isIOS) {
      final settings = await _notifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      return settings?.alert ?? false;
    }

    if (Platform.isAndroid) {
      final permission = await _notifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
      return permission ?? false;
    }

    return false;
  }

  /// Set up event listeners for notifications
  void _setupEventListeners() {
    client.onEvent.add((event) {
      if (event.type == EventTypes.message ||
          event.type == EventTypes.encrypted) {
        _showMessageNotification(event);
      }
    });

    client.onSyncUpdate.add((update) {
      // Update badge count based on unread rooms
      _updateBadgeCount();
    });
  }

  /// Show notification for incoming message
  Future<void> _showMessageNotification(Event event) async {
    final room = client.getRoomById(event.roomId);
    if (room == null) return;

    // Check if room is muted
    if (room.notificationSettings == RoomNotificationState.mute) {
      return;
    }

    // Get sender display name
    final senderName = event.senderId == client.userID
        ? 'You'
        : room.getMember(event.senderId)?.displayName ?? event.senderId;

    // Get message preview
    final messagePreview = _getMessagePreview(event);

    // Create notification
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
        icon: _icon,
        // Large icon for sender avatar
        largeIcon: DrawableResourceAndroidIcon(_icon),
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _notifications.show(
      event.eventId.hashCode,
      senderName,
      messagePreview,
      notificationDetails,
      payload: event.roomId,
    );
  }

  /// Get message preview text from event
  String _getMessagePreview(Event event) {
    final content = event.content;

    switch (content['msgtype']) {
      case MessageTypes.text:
        return content['body'] ?? '';

      case MessageTypes.image:
        return 'Sent an image';

      case MessageTypes.video:
        return 'Sent a video';

      case MessageTypes.audio:
        return 'Sent an audio message';

      case MessageTypes.file:
        return 'Sent a file: ${content['filename'] ?? 'attachment'}';

      case MessageTypes.location:
        return 'Shared a location';

      case MessageTypes.emote:
        return '* ${content['body'] ?? ''}';

      default:
        return 'Sent a message';
    }
  }

  /// Update app badge with unread room count
  Future<void> _updateBadgeCount() async {
    final unreadCount = client.rooms
        .where((room) => room.isJoined && room.notificationCount > 0)
        .length;

    if (Platform.isIOS) {
      await _notifications
          .resolvePlatformImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.setBadgeCount(unreadCount);
    }
  }

  /// Show notification for room invitation
  Future<void> showInvitationNotification(
    String roomId,
    String inviterName,
    String roomName,
  ) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.high,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _notifications.show(
      roomId.hashCode,
      'New Room Invitation',
      '$inviterName invited you to $roomName',
      notificationDetails,
      payload: 'invite:$roomId',
    );
  }

  /// Show notification for mention
  Future<void> showMentionNotification(
    String roomId,
    String senderName,
    String message,
  ) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.high,
        priority: Priority.high,
        styleInformation: BigTextStyleInformation(message),
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch,
      '$senderName mentioned you',
      message,
      notificationDetails,
      payload: 'mention:$roomId',
    );
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Cancel notification for specific room
  Future<void> cancelRoomNotifications(String roomId) async {
    await _notifications.cancel(roomId.hashCode);
  }

  /// Schedule a notification
  Future<void> scheduleNotification({
    required String id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _notifications.zonedSchedule(
      id.hashCode,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exact,
      payload: id,
    );
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  /// Check if notifications are enabled
  Future<bool> areNotificationsEnabled() async {
    final settings = await _notifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.getNotificationSettings();

    return settings?.alert ?? false;
  }

  /// Open notification settings
  Future<void> openNotificationSettings() async {
    if (Platform.isAndroid) {
      await _notifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    if (Platform.isIOS) {
      // iOS doesn't have a direct way to open settings
      // You would need to use url_launcher to open app settings
    }
  }
}

// Import timezone for scheduled notifications
import 'package:timezone/data/latest.dart' as tz;

/// Notification handler for when app is in foreground
class NotificationHandler {
  /// Handle notification when app is opened
  static Future<void> onNotificationOpened(String payload) async {
    if (kDebugMode) {
      print('Notification opened with payload: $payload');
    }

    // Parse payload
    if (payload.startsWith('invite:')) {
      final roomId = payload.substring(7);
      // Navigate to room invitation screen
    } else if (payload.startsWith('mention:')) {
      final roomId = payload.substring(8);
      // Navigate to mentioned message
    } else {
      // Open the room
    }
  }

  /// Handle notification when app is in background
  static Future<void> onBackgroundNotification(
    NotificationResponse response,
  ) async {
    if (kDebugMode) {
      print('Background notification: ${response.payload}');
    }

    await onNotificationOpened(response.payload ?? '');
  }
}

/// Extension for notification state
extension NotificationState on RoomNotificationState {
  bool get isMuted => this == RoomNotificationState.mute;
  bool get isAllMessages => this == RoomNotificationState.allMessages;
  bool get isMentionsOnly => this == RoomNotificationState.mentionsOnly;
  bool get isDefault => this == RoomNotificationState.defaultNotify;

  String get displayName {
    switch (this) {
      case RoomNotificationState.mute:
        return 'Muted';
      case RoomNotificationState.allMessages:
        return 'All Messages';
      case RoomNotificationState.mentionsOnly:
        return 'Mentions Only';
      case RoomNotificationState.defaultNotify:
        return 'Default';
    }
  }
}

