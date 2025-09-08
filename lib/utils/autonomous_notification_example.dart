import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:rechainonline/utils/autonomous_notification_integration.dart';

/// Пример использования автономных уведомлений в приложении
class AutonomousNotificationExample extends StatefulWidget {
  const AutonomousNotificationExample({super.key});

  @override
  State<AutonomousNotificationExample> createState() => _AutonomousNotificationExampleState();
}

class _AutonomousNotificationExampleState extends State<AutonomousNotificationExample> with WidgetsBindingObserver {
  final AutonomousNotificationIntegration _notificationIntegration = AutonomousNotificationIntegration.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeNotifications();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _initializeNotifications() async {
    await _notificationIntegration.initialize();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _notificationIntegration.onAppResumed();
        break;
      case AppLifecycleState.paused:
        _notificationIntegration.onAppPaused();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Автономные уведомления'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Тестирование автономных уведомлений',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onLoginSuccess('TestUser'),
            child: const Text('Тест: Успешный вход'),
          ),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onRoomCreated('Тестовая комната'),
            child: const Text('Тест: Комната создана'),
          ),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onFileUploadCompleted('test.pdf', 'Рабочая комната'),
            child: const Text('Тест: Файл загружен'),
          ),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onCallStarted('Конференц-зал'),
            child: const Text('Тест: Звонок начат'),
          ),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onCallEnded('Конференц-зал', const Duration(minutes: 5, seconds: 30)),
            child: const Text('Тест: Звонок завершен'),
          ),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onEncryptionEnabled('Секретная комната'),
            child: const Text('Тест: Шифрование включено'),
          ),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onSpaceJoined('Рабочее пространство'),
            child: const Text('Тест: Присоединение к пространству'),
          ),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onDeviceVerified('iPhone 15'),
            child: const Text('Тест: Устройство верифицировано'),
          ),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onSyncError('Ошибка подключения к серверу'),
            child: const Text('Тест: Ошибка синхронизации'),
          ),
          
          const SizedBox(height: 32),
          
          const Divider(),
          
          const Text(
            'Управление уведомлениями',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          
          const SizedBox(height: 16),
          
          ElevatedButton(
            onPressed: () => _notificationIntegration.onLogout(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Очистить все уведомления'),
          ),
        ],
      ),
    );
  }
}

/// Миксин для интеграции автономных уведомлений в существующие виджеты
mixin AutonomousNotificationMixin<T extends StatefulWidget> on State<T> {
  final AutonomousNotificationIntegration _notificationIntegration = AutonomousNotificationIntegration.instance;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    await _notificationIntegration.initialize();
  }

  // Методы для вызова из виджетов
  void notifyMessageSent(String roomName) {
    // Можно добавить уведомление об отправке сообщения
  }

  void notifyFileUploadStarted(String fileName, String roomName) {
    _notificationIntegration.onFileUploadStarted(fileName, roomName);
  }

  void notifyFileUploadCompleted(String fileName, String roomName) {
    _notificationIntegration.onFileUploadCompleted(fileName, roomName);
  }

  void notifyCallStarted(String roomName) {
    _notificationIntegration.onCallStarted(roomName);
  }

  void notifyCallEnded(String roomName, Duration duration) {
    _notificationIntegration.onCallEnded(roomName, duration);
  }

  void notifyRoomCreated(String roomName) {
    _notificationIntegration.onRoomCreated(roomName);
  }

  void notifyEncryptionEnabled(String roomName) {
    _notificationIntegration.onEncryptionEnabled(roomName);
  }

  void notifySpaceJoined(String spaceName) {
    _notificationIntegration.onSpaceJoined(spaceName);
  }

  void notifyDeviceVerified(String deviceName) {
    _notificationIntegration.onDeviceVerified(deviceName);
  }

  void notifySyncError(String error) {
    _notificationIntegration.onSyncError(error);
  }

  void notifyLoginSuccess(String userName) {
    _notificationIntegration.onLoginSuccess(userName);
  }
}
