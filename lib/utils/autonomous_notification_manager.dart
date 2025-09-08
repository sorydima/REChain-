import 'package:flutter/services.dart';
import 'package:matrix/matrix.dart';
import 'package:rechainonline/utils/platform_infos.dart';

class AutonomousNotificationManager {
  static const MethodChannel _channel = MethodChannel('rechain.autonomous/notifications');
  
  static AutonomousNotificationManager? _instance;
  static AutonomousNotificationManager get instance {
    _instance ??= AutonomousNotificationManager._();
    return _instance!;
  }
  
  AutonomousNotificationManager._();
  
  // Показать общее уведомление
  Future<void> showNotification({
    required String type,
    required String title,
    required String message,
    Map<String, dynamic>? payload,
  }) async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('showNotification', {
        'type': type,
        'title': title,
        'message': message,
        'payload': payload ?? {},
      });
    } catch (e) {
      Logs().e('Error showing autonomous notification: $e');
    }
  }
  
  // Уведомление о новом сообщении
  Future<void> showMessageNotification({
    required String senderName,
    required String message,
    required String roomId,
  }) async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('showMessageNotification', {
        'senderName': senderName,
        'message': message,
        'roomId': roomId,
      });
    } catch (e) {
      Logs().e('Error showing message notification: $e');
    }
  }
  
  // Уведомление о входящем звонке
  Future<void> showCallNotification({
    required String callerName,
    required String callId,
  }) async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('showCallNotification', {
        'callerName': callerName,
        'callId': callId,
      });
    } catch (e) {
      Logs().e('Error showing call notification: $e');
    }
  }
  
  // Уведомление о присоединении пользователя
  Future<void> showUserJoinedNotification({
    required String userName,
    required String roomName,
  }) async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('showUserJoinedNotification', {
        'userName': userName,
        'roomName': roomName,
      });
    } catch (e) {
      Logs().e('Error showing user joined notification: $e');
    }
  }
  
  // Уведомление о загрузке файла
  Future<void> showFileUploadedNotification({
    required String fileName,
    required String roomName,
  }) async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('showFileUploadedNotification', {
        'fileName': fileName,
        'roomName': roomName,
      });
    } catch (e) {
      Logs().e('Error showing file uploaded notification: $e');
    }
  }
  
  // Уведомление об ошибке синхронизации
  Future<void> showSyncErrorNotification({
    required String error,
  }) async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('showSyncErrorNotification', {
        'error': error,
      });
    } catch (e) {
      Logs().e('Error showing sync error notification: $e');
    }
  }
  
  // Уведомление об успешном входе
  Future<void> showLoginSuccessNotification({
    required String userName,
  }) async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('showLoginSuccessNotification', {
        'userName': userName,
      });
    } catch (e) {
      Logs().e('Error showing login success notification: $e');
    }
  }
  
  // Отменить конкретное уведомление
  Future<void> cancelNotification(String type) async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('cancelNotification', {
        'type': type,
      });
    } catch (e) {
      Logs().e('Error cancelling notification: $e');
    }
  }
  
  // Отменить все уведомления
  Future<void> cancelAllNotifications() async {
    if (!PlatformInfos.isAndroid) return;
    
    try {
      await _channel.invokeMethod('cancelAllNotifications');
    } catch (e) {
      Logs().e('Error cancelling all notifications: $e');
    }
  }
  
  // Автоматические уведомления для событий Matrix
  void setupMatrixEventListeners(Client client) {
    client.onEvent.stream.listen((event) {
      _handleMatrixEvent(event);
    });
    
    client.onSync.stream.listen((syncUpdate) {
      _handleSyncUpdate(syncUpdate);
    });
    
    client.onLoginStateChanged.stream.listen((loginState) {
      _handleLoginStateChange(loginState, client);
    });
  }
  
  void _handleMatrixEvent(Event event) {
    switch (event.type) {
      case EventTypes.Message:
      case EventTypes.Encrypted:
        if (event.room.isDirectChat || event.room.pushRuleState == PushRuleState.notify) {
          showMessageNotification(
            senderName: event.senderFromMemoryOrFallback.calcDisplayname(),
            message: event.plaintextBody,
            roomId: event.roomId!,
          );
        }
        break;
        
      case EventTypes.RoomMember:
        final membership = event.content['membership'];
        if (membership == 'join' && event.stateKey != event.senderId) {
          showUserJoinedNotification(
            userName: event.senderFromMemoryOrFallback.calcDisplayname(),
            roomName: event.room.getLocalizedDisplayname(),
          );
        }
        break;
        
      case EventTypes.CallInvite:
        showCallNotification(
          callerName: event.senderFromMemoryOrFallback.calcDisplayname(),
          callId: event.eventId,
        );
        break;
        
      case 'm.file':
      case 'm.image':
      case 'm.video':
      case 'm.audio':
        final fileName = event.content['filename'] ?? event.content['body'] ?? 'Файл';
        showFileUploadedNotification(
          fileName: fileName,
          roomName: event.room.getLocalizedDisplayname(),
        );
        break;
        
      case 'm.reaction':
        final reaction = event.content['m.relates_to']?['key'] ?? '👍';
        showNotification(
          type: 'reaction_added',
          title: 'Новая реакция',
          message: '${event.senderFromMemoryOrFallback.calcDisplayname()} отреагировал $reaction в ${event.room.getLocalizedDisplayname()}',
          payload: {
            'userName': event.senderFromMemoryOrFallback.calcDisplayname(),
            'reaction': reaction,
            'roomName': event.room.getLocalizedDisplayname(),
          },
        );
        break;
    }
  }
  
  void _handleSyncUpdate(SyncUpdate syncUpdate) {
    if (syncUpdate.hasRoomUpdate) {
      // Обработка обновлений комнат
      for (final roomUpdate in syncUpdate.rooms?.join?.values ?? <JoinedRoomUpdate>[]) {
        // Можно добавить специфичные уведомления для обновлений комнат
      }
    }
  }
  
  void _handleLoginStateChange(LoginState loginState, Client client) {
    switch (loginState) {
      case LoginState.loggedIn:
        showLoginSuccessNotification(
          userName: client.userID ?? 'Пользователь',
        );
        break;
      case LoginState.loggedOut:
        cancelAllNotifications();
        break;
      default:
        break;
    }
  }
  
  // Уведомления для специфичных событий приложения
  Future<void> showRoomCreatedNotification(String roomName) async {
    await showNotification(
      type: 'room_created',
      title: 'Комната создана',
      message: 'Комната "$roomName" успешно создана',
      payload: {'roomName': roomName},
    );
  }
  
  Future<void> showRoomInviteNotification(String roomName, String inviterName) async {
    await showNotification(
      type: 'room_invited',
      title: 'Приглашение в комнату',
      message: '$inviterName пригласил вас в "$roomName"',
      payload: {'roomName': roomName, 'inviterName': inviterName},
    );
  }
  
  Future<void> showEncryptionEnabledNotification(String roomName) async {
    await showNotification(
      type: 'encryption_enabled',
      title: 'Шифрование включено',
      message: 'Шифрование включено в комнате "$roomName"',
      payload: {'roomName': roomName},
    );
  }
  
  Future<void> showBackupCreatedNotification() async {
    await showNotification(
      type: 'backup_created',
      title: 'Резервная копия создана',
      message: 'Ваши ключи безопасно сохранены',
    );
  }
  
  Future<void> showDeviceVerifiedNotification(String deviceName) async {
    await showNotification(
      type: 'device_verified',
      title: 'Устройство верифицировано',
      message: 'Устройство "$deviceName" успешно верифицировано',
      payload: {'deviceName': deviceName},
    );
  }
  
  Future<void> showSpaceJoinedNotification(String spaceName) async {
    await showNotification(
      type: 'space_joined',
      title: 'Присоединение к пространству',
      message: 'Вы присоединились к пространству "$spaceName"',
      payload: {'spaceName': spaceName},
    );
  }
}
