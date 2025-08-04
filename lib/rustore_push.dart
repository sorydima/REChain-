import 'package:flutter/services.dart';

class RuStorePush {
  static const MethodChannel _initChannel = MethodChannel('ru.rustore.push/init');
  static const EventChannel _eventChannel = EventChannel('ru.rustore.push/events');

  static Future<void> initialize() async {
    try {
      final result = await _initChannel.invokeMethod('initializePushSdk');
      print('[RuStorePush] $result');
    } catch (e) {
      print('[RuStorePush] Initialization error: $e');
    }
  }

  static Stream<String> get pushStream {
    return _eventChannel.receiveBroadcastStream().map((event) => event.toString());
  }
}
