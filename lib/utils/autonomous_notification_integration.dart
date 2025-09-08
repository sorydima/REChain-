import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:rechainonline/utils/autonomous_notification_manager.dart';
import 'package:rechainonline/utils/client_manager.dart';

/// Интеграция автономных уведомлений с основным приложением
class AutonomousNotificationIntegration {
  static AutonomousNotificationIntegration? _instance;
  static AutonomousNotificationIntegration get instance {
    _instance ??= AutonomousNotificationIntegration._();
    return _instance!;
  }
  
  AutonomousNotificationIntegration._();
  
  final AutonomousNotificationManager _notificationManager = AutonomousNotificationManager.instance;
  bool _isInitialized = false;
  
  /// Инициализация системы автономных уведомлений
  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      // Настройка слушателей для всех клиентов
      final clients = await ClientManager.getClients();
      for (final client in clients) {
        _setupClientListeners(client);
      }
      
      _isInitialized = true;
      Logs().i('Autonomous notification system initialized');
    } catch (e) {
      Logs().e('Failed to initialize autonomous notifications: $e');
    }
  }
  
  /// Настройка слушателей для конкретного клиента
  void _setupClientListeners(Client client) {
    _notificationManager.setupMatrixEventListeners(client);
    
    // Дополнительные слушатели для специфичных событий
    client.onRoomState.stream.listen((update) {
      _handleRoomStateUpdate(update);
    });
    
    client.onAccountData.stream.listen((update) {
      _handleAccountDataUpdate(update);
    });
    
    client.onDeviceUpdate.stream.listen((update) {
      _handleDeviceUpdate(update, client);
    });
  }
  
  void _handleRoomStateUpdate(RoomUpdate update) {
    // Обработка обновлений состояния комнаты
    if (update.membership == Membership.invite) {
      final room = update.room;
      final inviter = room.getState(EventTypes.RoomMember, room.client.userID!)?.sender;
      
      _notificationManager.showRoomInviteNotification(
        room.getLocalizedDisplayname(),
        inviter ?? 'Неизвестный пользователь',
      );
    }
  }
  
  void _handleAccountDataUpdate(AccountDataUpdate update) {
    // Обработка обновлений данных аккаунта
    if (update.type == 'm.secret_storage.default_key') {
      _notificationManager.showBackupCreatedNotification();
    }
  }
  
  void _handleDeviceUpdate(DeviceUpdate update, Client client) {
    // Обработка обновлений устройств
    if (update.deviceLists?.changed?.isNotEmpty == true) {
      for (final userId in update.deviceLists!.changed!) {
        if (userId == client.userID) {
          // Новое устройство добавлено
          _notificationManager.showNotification(
            type: 'device_added',
            title: 'Новое устройство',
            message: 'К вашему аккаунту добавлено новое устройство',
          );
        }
      }
    }
  }
  
  /// Уведомления для UI событий
  void onFileUploadStarted(String fileName, String roomName) {
    _notificationManager.showNotification(
      type: 'file_upload_started',
      title: 'Загрузка файла',
      message: 'Загружается "$fileName" в "$roomName"',
      payload: {'fileName': fileName, 'roomName': roomName},
    );
  }
  
  void onFileUploadCompleted(String fileName, String roomName) {
    _notificationManager.showFileUploadedNotification(
      fileName: fileName,
      roomName: roomName,
    );
  }
  
  void onCallStarted(String roomName) {
    _notificationManager.showNotification(
      type: 'call_started',
      title: 'Звонок начат',
      message: 'Звонок в "$roomName" начат',
      payload: {'roomName': roomName},
    );
  }
  
  void onCallEnded(String roomName, Duration duration) {
    _notificationManager.showNotification(
      type: 'call_ended',
      title: 'Звонок завершен',
      message: 'Звонок в "$roomName" длился ${_formatDuration(duration)}',
      payload: {'roomName': roomName, 'duration': duration.inSeconds},
    );
  }
  
  void onRoomCreated(String roomName) {
    _notificationManager.showRoomCreatedNotification(roomName);
  }
  
  void onEncryptionEnabled(String roomName) {
    _notificationManager.showEncryptionEnabledNotification(roomName);
  }
  
  void onSpaceJoined(String spaceName) {
    _notificationManager.showSpaceJoinedNotification(spaceName);
  }
  
  void onSyncError(String error) {
    _notificationManager.showSyncErrorNotification(error: error);
  }
  
  void onLoginSuccess(String userName) {
    _notificationManager.showLoginSuccessNotification(userName: userName);
  }
  
  void onDeviceVerified(String deviceName) {
    _notificationManager.showDeviceVerifiedNotification(deviceName);
  }
  
  /// Очистка уведомлений при выходе из приложения
  void onAppPaused() {
    // Можно добавить логику для обработки паузы приложения
  }
  
  void onAppResumed() {
    // Очистка уведомлений при возврате в приложение
    _notificationManager.cancelAllNotifications();
  }
  
  void onLogout() {
    _notificationManager.cancelAllNotifications();
  }
  
  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${hours}ч ${minutes}м ${seconds}с';
    } else if (minutes > 0) {
      return '${minutes}м ${seconds}с';
    } else {
      return '${seconds}с';
    }
  }
}
