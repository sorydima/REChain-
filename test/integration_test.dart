import 'dart:convert';
import 'dart:io';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matrix/matrix.dart';

import '../lib/utils/services_manager.dart';
import '../lib/features/message_scheduling/message_scheduler.dart';
import '../lib/features/message_scheduling/scheduled_message.dart';
import '../lib/features/translation/translation_service.dart';
import '../lib/features/security/encryption_settings.dart';
import '../lib/features/security/message_retention_policy.dart';
import '../lib/features/bridge_manager/bridge_info.dart';

void main() {
  group('Message Scheduling Tests', () {
    late MessageScheduler scheduler;
    late SharedPreferences prefs;
    late Client client;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      client = Client('test_client');
      scheduler = MessageScheduler(prefs, client);
    });

    test('Schedule text message', () async {
      final messageId = await scheduler.scheduleMessage(
        roomId: 'test_room',
        content: 'Hello, world!',
        scheduledTime: DateTime.now().add(Duration(minutes: 5)),
        messageType: MessageType.text,
      );

      expect(messageId, isNotEmpty);
      
      final messages = scheduler.getScheduledMessagesForRoom('test_room');
      expect(messages.length, equals(1));
      expect(messages.first.content, equals('Hello, world!'));
      expect(messages.first.messageType, equals(MessageType.text));
    });

    test('Schedule different message types', () async {
      final types = [
        MessageType.text,
        MessageType.notice,
        MessageType.emote,
        MessageType.file,
        MessageType.image,
        MessageType.video,
        MessageType.audio,
      ];

      for (final type in types) {
        await scheduler.scheduleMessage(
          roomId: 'test_room',
          content: 'Test ${type.name} message',
          scheduledTime: DateTime.now().add(Duration(minutes: 5)),
          messageType: type,
        );
      }

      final messages = scheduler.getScheduledMessagesForRoom('test_room');
      expect(messages.length, equals(types.length));
      
      for (int i = 0; i < types.length; i++) {
        expect(messages[i].messageType, equals(types[i]));
      }
    });

    test('Cancel scheduled message', () async {
      final messageId = await scheduler.scheduleMessage(
        roomId: 'test_room',
        content: 'To be cancelled',
        scheduledTime: DateTime.now().add(Duration(minutes: 5)),
      );

      final cancelled = await scheduler.cancelScheduledMessage(messageId);
      expect(cancelled, isTrue);

      final message = scheduler.scheduledMessages[messageId];
      expect(message?.status, equals(ScheduledMessageStatus.cancelled));
    });

    test('Reschedule message', () async {
      final messageId = await scheduler.scheduleMessage(
        roomId: 'test_room',
        content: 'To be rescheduled',
        scheduledTime: DateTime.now().add(Duration(minutes: 5)),
      );

      final newTime = DateTime.now().add(Duration(minutes: 10));
      final rescheduled = await scheduler.rescheduleMessage(messageId, newTime);
      expect(rescheduled, isTrue);

      final message = scheduler.scheduledMessages[messageId];
      expect(message?.scheduledTime, equals(newTime));
    });
  });

  group('Translation Service Tests', () {
    late TranslationService service;
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      service = TranslationService(prefs);
    });

    test('Set preferred language', () async {
      await service.setPreferredLanguage('es');
      expect(service.preferredLanguage, equals('es'));
    });

    test('Enable auto-translate', () async {
      await service.setAutoTranslateEnabled(true);
      expect(service.autoTranslateEnabled, isTrue);
    });

    test('Set translation provider', () async {
      await service.setTranslationProvider(TranslationProvider.deepl);
      expect(service.currentProvider, equals(TranslationProvider.deepl));
    });

    test('Clear expired cache', () async {
      await service.clearExpiredCache();
      // Should complete without error
    });
  });

  group('Security Settings Tests', () {
    test('Create default encryption settings', () {
      final settings = EncryptionSettings.createDefault();
      expect(settings.encryptionEnabled, isTrue);
      expect(settings.algorithm, equals('m.megolm.v1.aes-sha2'));
      expect(settings.backupEnabled, isTrue);
    });

    test('Encryption settings copyWith', () {
      final original = EncryptionSettings.createDefault();
      final modified = original.copyWith(encryptionEnabled: false);
      
      expect(modified.encryptionEnabled, isFalse);
      expect(modified.algorithm, equals(original.algorithm));
      expect(modified.backupEnabled, equals(original.backupEnabled));
    });

    test('Create default retention policy', () {
      final policy = MessageRetentionPolicy.createDefault();
      expect(policy.enabled, isFalse);
      expect(policy.retentionPeriod, equals(Duration(days: 365)));
      expect(policy.deleteAfterRead, isFalse);
    });

    test('Retention policy JSON serialization', () {
      final policy = MessageRetentionPolicy.createDefault();
      final json = policy.toJson();
      final restored = MessageRetentionPolicy.fromJson(json);
      
      expect(restored.enabled, equals(policy.enabled));
      expect(restored.retentionPeriod, equals(policy.retentionPeriod));
      expect(restored.deleteAfterRead, equals(policy.deleteAfterRead));
    });
  });

  group('Bridge Info Tests', () {
    test('Create bridge info', () {
      final bridge = BridgeInfo(
        id: 'test_bridge',
        name: 'Test Bridge',
        description: 'A test bridge',
        protocol: 'matrix',
        enabled: true,
      );

      expect(bridge.id, equals('test_bridge'));
      expect(bridge.name, equals('Test Bridge'));
      expect(bridge.enabled, isTrue);
    });

    test('Bridge info JSON serialization', () {
      final bridge = BridgeInfo(
        id: 'test_bridge',
        name: 'Test Bridge',
        description: 'A test bridge',
        protocol: 'matrix',
        enabled: true,
      );

      final json = bridge.toJson();
      final restored = BridgeInfo.fromJson(json);
      
      expect(restored.id, equals(bridge.id));
      expect(restored.name, equals(bridge.name));
      expect(restored.enabled, equals(bridge.enabled));
    });
  });

  group('Services Manager Tests', () {
    late ServicesManager manager;
    late SharedPreferences prefs;
    late Client client;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      client = Client('test_client');
      manager = ServicesManager(client: client, store: prefs);
    });

    test('Services initialization', () {
      expect(manager.bridgeManager, isNotNull);
      expect(manager.securityManager, isNotNull);
      expect(manager.messageScheduler, isNotNull);
      expect(manager.translationService, isNotNull);
    });

    test('Cleanup services', () async {
      await manager.cleanupServices();
      // Should complete without error
    });

    test('Dispose services', () async {
      await manager.dispose();
      // Should complete without error
    });
  });

  group('Scheduled Message Tests', () {
    test('Create scheduled message', () {
      final now = DateTime.now();
      final message = ScheduledMessage(
        id: 'test_id',
        roomId: 'test_room',
        content: 'Test message',
        messageType: MessageType.text,
        scheduledTime: now.add(Duration(minutes: 5)),
        createdAt: now,
        updatedAt: now,
        status: ScheduledMessageStatus.pending,
      );

      expect(message.id, equals('test_id'));
      expect(message.isPending, isTrue);
      expect(message.statusText, equals('Scheduled'));
      expect(message.statusIcon, equals('⏰'));
      expect(message.messageTypeIcon, equals('💬'));
    });

    test('Scheduled message status checks', () {
      final now = DateTime.now();
      final message = ScheduledMessage(
        id: 'test_id',
        roomId: 'test_room',
        content: 'Test message',
        messageType: MessageType.text,
        scheduledTime: now.subtract(Duration(minutes: 5)), // Past time
        createdAt: now,
        updatedAt: now,
        status: ScheduledMessageStatus.pending,
      );

      expect(message.isOverdue, isTrue);
      expect(message.statusText, equals('Overdue'));
      expect(message.statusIcon, equals('⚠️'));
    });

    test('Scheduled message JSON serialization', () {
      final now = DateTime.now();
      final message = ScheduledMessage(
        id: 'test_id',
        roomId: 'test_room',
        content: 'Test message',
        messageType: MessageType.text,
        scheduledTime: now,
        createdAt: now,
        updatedAt: now,
        status: ScheduledMessageStatus.pending,
      );

      final json = message.toJson();
      final restored = ScheduledMessage.fromJson(json);
      
      expect(restored.id, equals(message.id));
      expect(restored.content, equals(message.content));
      expect(restored.messageType, equals(message.messageType));
      expect(restored.status, equals(message.status));
    });
  });
}
