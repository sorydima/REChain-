import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

import 'package:rechainonline/features/bridge_manager/bridge_manager.dart';
import 'package:rechainonline/features/bridge_manager/bridge_config.dart';
import 'package:rechainonline/features/bridge_manager/bridge_status.dart';

class MockClient extends Mock implements Client {}
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late BridgeManager bridgeManager;
  late MockClient client;
  late MockSharedPreferences prefs;

  setUp(() {
    client = MockClient();
    prefs = MockSharedPreferences();
    bridgeManager = BridgeManager(prefs, client);
  });

  group('Bridge Configuration', () {
    test('should create bridge with valid configuration', () async {
      final config = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'test_key',
        settings: {
          'bot_token': 'test_token',
          'chat_id': '123456789',
        },
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      
      final result = await bridgeManager.createBridge(config);
      
      expect(result.isSuccess, true);
      expect(result.bridge?.type, equals('telegram'));
      expect(result.bridge?.name, equals('Test Bridge'));
    });

    test('should validate required fields', () async {
      final config = BridgeConfig(
        type: 'telegram',
        name: '', // Invalid: empty name
        apiKey: '', // Invalid: empty API key
        settings: {},
      );

      final result = await bridgeManager.createBridge(config);
      
      expect(result.isSuccess, false);
      expect(result.error, contains('name'));
      expect(result.error, contains('API key'));
    });

    test('should handle duplicate bridge names', () async {
      final config1 = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'test_key1',
        settings: {'bot_token': 'token1'},
      );

      final config2 = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge', // Same name as config1
        apiKey: 'test_key2',
        settings: {'bot_token': 'token2'},
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      
      await bridgeManager.createBridge(config1);
      final result = await bridgeManager.createBridge(config2);
      
      expect(result.isSuccess, false);
      expect(result.error, contains('already exists'));
    });
  });

  group('Bridge Status Monitoring', () {
    test('should monitor bridge status correctly', () async {
      final config = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'test_key',
        settings: {'bot_token': 'test_token'},
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      
      final createResult = await bridgeManager.createBridge(config);
      expect(createResult.isSuccess, true);

      // Initial status should be connecting
      BridgeStatus? status = await bridgeManager.getBridgeStatus(createResult.bridge!.id);
      expect(status?.state, equals(BridgeState.connecting));

      // Simulate successful connection
      await bridgeManager.updateBridgeStatus(
        createResult.bridge!.id,
        BridgeStatus(
          state: BridgeState.connected,
          lastSyncTime: DateTime.now(),
          connectedUsers: 1,
          activeChats: 2,
          messagesSynced: 10,
        ),
      );

      // Check updated status
      status = await bridgeManager.getBridgeStatus(createResult.bridge!.id);
      expect(status?.state, equals(BridgeState.connected));
      expect(status?.connectedUsers, equals(1));
      expect(status?.activeChats, equals(2));
      expect(status?.messagesSynced, equals(10));
    });

    test('should handle bridge errors', () async {
      final config = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'invalid_key',
        settings: {'bot_token': 'invalid_token'},
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      
      final createResult = await bridgeManager.createBridge(config);
      expect(createResult.isSuccess, true);

      // Simulate error state
      await bridgeManager.updateBridgeStatus(
        createResult.bridge!.id,
        BridgeStatus(
          state: BridgeState.error,
          lastSyncTime: DateTime.now(),
          error: 'Invalid API key',
        ),
      );

      // Check error status
      final status = await bridgeManager.getBridgeStatus(createResult.bridge!.id);
      expect(status?.state, equals(BridgeState.error));
      expect(status?.error, contains('Invalid API key'));
    });
  });

  group('Bridge Lifecycle Management', () {
    test('should start and stop bridge correctly', () async {
      final config = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'test_key',
        settings: {'bot_token': 'test_token'},
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      
      final createResult = await bridgeManager.createBridge(config);
      expect(createResult.isSuccess, true);

      // Start bridge
      final startResult = await bridgeManager.startBridge(createResult.bridge!.id);
      expect(startResult.isSuccess, true);

      var status = await bridgeManager.getBridgeStatus(createResult.bridge!.id);
      expect(status?.state, equals(BridgeState.connected));

      // Stop bridge
      final stopResult = await bridgeManager.stopBridge(createResult.bridge!.id);
      expect(stopResult.isSuccess, true);

      status = await bridgeManager.getBridgeStatus(createResult.bridge!.id);
      expect(status?.state, equals(BridgeState.stopped));
    });

    test('should handle bridge deletion', () async {
      final config = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'test_key',
        settings: {'bot_token': 'test_token'},
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      when(prefs.remove(any)).thenAnswer((_) => Future.value(true));
      
      final createResult = await bridgeManager.createBridge(config);
      expect(createResult.isSuccess, true);

      // Delete bridge
      final deleteResult = await bridgeManager.deleteBridge(createResult.bridge!.id);
      expect(deleteResult.isSuccess, true);

      // Verify bridge is deleted
      final bridges = await bridgeManager.listBridges();
      expect(bridges.any((b) => b.id == createResult.bridge!.id), false);
    });
  });

  group('Bridge Settings Management', () {
    test('should update bridge settings', () async {
      final config = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'test_key',
        settings: {'bot_token': 'test_token'},
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      
      final createResult = await bridgeManager.createBridge(config);
      expect(createResult.isSuccess, true);

      // Update settings
      final updateResult = await bridgeManager.updateBridgeSettings(
        createResult.bridge!.id,
        {'bot_token': 'new_token', 'chat_id': '987654321'},
      );
      expect(updateResult.isSuccess, true);

      // Verify settings are updated
      final bridge = await bridgeManager.getBridge(createResult.bridge!.id);
      expect(bridge?.settings['bot_token'], equals('new_token'));
      expect(bridge?.settings['chat_id'], equals('987654321'));
    });

    test('should validate settings updates', () async {
      final config = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'test_key',
        settings: {'bot_token': 'test_token'},
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      
      final createResult = await bridgeManager.createBridge(config);
      expect(createResult.isSuccess, true);

      // Try to update with invalid settings
      final updateResult = await bridgeManager.updateBridgeSettings(
        createResult.bridge!.id,
        {'bot_token': ''}, // Invalid: empty token
      );
      expect(updateResult.isSuccess, false);
      expect(updateResult.error, contains('bot_token'));
    });
  });
}
