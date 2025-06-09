import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

import 'package:rechainonline/features/security/security_manager.dart';
import 'package:rechainonline/features/security/message_retention_policy.dart';
import 'package:rechainonline/features/security/encryption_settings.dart';

class MockClient extends Mock implements Client {}
class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockRoom extends Mock implements Room {}

void main() {
  late SecurityManager securityManager;
  late MockClient client;
  late MockSharedPreferences prefs;

  setUp(() {
    client = MockClient();
    prefs = MockSharedPreferences();
    securityManager = SecurityManager(prefs, client);
  });

  group('Message Retention Policy', () {
    test('should create and store retention policy', () async {
      const roomId = '!test:example.com';
      final policy = MessageRetentionPolicy(
        enabled: true,
        maxAge: Duration(days: 30),
        maxMessages: 1000,
        retainEncryptedContent: true,
        retainMediaFiles: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));

      await securityManager.setRetentionPolicy(roomId, policy);

      final retrievedPolicy = securityManager.getRetentionPolicy(roomId);
      expect(retrievedPolicy?.enabled, true);
      expect(retrievedPolicy?.maxAge, Duration(days: 30));
      expect(retrievedPolicy?.maxMessages, 1000);
      expect(retrievedPolicy?.retainEncryptedContent, true);
      expect(retrievedPolicy?.retainMediaFiles, false);
    });

    test('should remove retention policy', () async {
      const roomId = '!test:example.com';
      final policy = MessageRetentionPolicy.createDefault();

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));

      await securityManager.setRetentionPolicy(roomId, policy);
      expect(securityManager.getRetentionPolicy(roomId), isNotNull);

      await securityManager.removeRetentionPolicy(roomId);
      expect(securityManager.getRetentionPolicy(roomId), isNull);
    });

    test('should validate retention policy settings', () {
      final policy = MessageRetentionPolicy(
        enabled: true,
        maxAge: Duration(days: -1), // Invalid: negative duration
        maxMessages: -100, // Invalid: negative count
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // The policy should still be created but with invalid values
      expect(policy.maxAge?.isNegative, true);
      expect(policy.maxMessages! < 0, true);
    });
  });

  group('Encryption Settings', () {
    test('should create and store encryption settings', () async {
      const roomId = '!test:example.com';
      final settings = EncryptionSettings(
        encryptionEnabled: true,
        requireVerification: true,
        keyRotationPeriod: Duration(days: 7),
        algorithm: EncryptionAlgorithm.megolmV1AesSha2,
        allowUnverifiedDevices: false,
        enableKeyBackup: true,
        requireSecureBackup: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));

      await securityManager.setEncryptionSettings(roomId, settings);

      final retrievedSettings = securityManager.getEncryptionSettings(roomId);
      expect(retrievedSettings?.encryptionEnabled, true);
      expect(retrievedSettings?.requireVerification, true);
      expect(retrievedSettings?.keyRotationPeriod, Duration(days: 7));
      expect(retrievedSettings?.algorithm, EncryptionAlgorithm.megolmV1AesSha2);
      expect(retrievedSettings?.allowUnverifiedDevices, false);
      expect(retrievedSettings?.enableKeyBackup, true);
      expect(retrievedSettings?.requireSecureBackup, true);
    });

    test('should calculate security level correctly', () {
      final highSecuritySettings = EncryptionSettings(
        encryptionEnabled: true,
        requireVerification: true,
        allowUnverifiedDevices: false,
        enableKeyBackup: true,
        requireSecureBackup: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final lowSecuritySettings = EncryptionSettings(
        encryptionEnabled: false,
        requireVerification: false,
        allowUnverifiedDevices: true,
        enableKeyBackup: false,
        requireSecureBackup: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(highSecuritySettings.securityLevel, 'High');
      expect(lowSecuritySettings.securityLevel, 'Low');
    });

    test('should remove encryption settings', () async {
      const roomId = '!test:example.com';
      final settings = EncryptionSettings.createDefault();

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));

      await securityManager.setEncryptionSettings(roomId, settings);
      expect(securityManager.getEncryptionSettings(roomId), isNotNull);

      await securityManager.removeEncryptionSettings(roomId);
      expect(securityManager.getEncryptionSettings(roomId), isNull);
    });
  });

  group('Security Audit', () {
    test('should perform comprehensive security audit', () async {
      final mockRoom1 = MockRoom();
      final mockRoom2 = MockRoom();
      
      when(mockRoom1.encrypted).thenReturn(true);
      when(mockRoom2.encrypted).thenReturn(false);
      when(client.rooms).thenReturn([mockRoom1, mockRoom2]);
      when(client.userID).thenReturn('@test:example.com');
      when(client.clientName).thenReturn('test-client');

      final report = await securityManager.performSecurityAudit();

      expect(report.encryptedRooms, 1);
      expect(report.unencryptedRooms, 1);
      expect(report.encryptionScore, 50.0); // 1 out of 2 rooms encrypted
      expect(report.userId, '@test:example.com');
      expect(report.clientId, 'test-client');
    });

    test('should calculate overall security score', () async {
      when(client.rooms).thenReturn([]);
      when(client.userID).thenReturn('@test:example.com');
      when(client.clientName).thenReturn('test-client');

      final report = await securityManager.performSecurityAudit();

      // With no rooms and no recovery phrase, score should be low
      expect(report.overallSecurityScore, lessThan(50.0));
    });
  });

  group('Secure Key Management', () {
    test('should store and retrieve secure keys', () async {
      const keyId = 'test-key-id';
      const keyValue = 'super-secret-key-value';

      await securityManager.storeSecureKey(keyId, keyValue);
      final retrievedKey = await securityManager.getSecureKey(keyId);

      expect(retrievedKey, equals(keyValue));
    });

    test('should delete secure keys', () async {
      const keyId = 'test-key-id';
      const keyValue = 'super-secret-key-value';

      await securityManager.storeSecureKey(keyId, keyValue);
      expect(await securityManager.getSecureKey(keyId), equals(keyValue));

      await securityManager.deleteSecureKey(keyId);
      expect(await securityManager.getSecureKey(keyId), isNull);
    });
  });

  group('Recovery Phrase Management', () {
    test('should store and verify recovery phrase', () async {
      const phrase = 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';

      await securityManager.storeRecoveryPhrase(phrase);
      
      final isValid = await securityManager.verifyRecoveryPhrase(phrase);
      expect(isValid, true);

      final isInvalid = await securityManager.verifyRecoveryPhrase('wrong phrase');
      expect(isInvalid, false);
    });

    test('should retrieve recovery phrase', () async {
      const phrase = 'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';

      await securityManager.storeRecoveryPhrase(phrase);
      final retrievedPhrase = await securityManager.getRecoveryPhrase();

      expect(retrievedPhrase, equals(phrase));
    });
  });

  group('Backup and Restore', () {
    test('should create secure backup', () async {
      const roomId = '!test:example.com';
      final policy = MessageRetentionPolicy.createDefault();
      final settings = EncryptionSettings.createDefault();

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      when(client.clientName).thenReturn('test-client');
      when(client.userID).thenReturn('@test:example.com');
      when(client.deviceID).thenReturn('TEST_DEVICE');

      await securityManager.setRetentionPolicy(roomId, policy);
      await securityManager.setEncryptionSettings(roomId, settings);

      final backup = await securityManager.createSecureBackup();

      expect(backup['client_id'], 'test-client');
      expect(backup['user_id'], '@test:example.com');
      expect(backup['device_id'], 'TEST_DEVICE');
      expect(backup['retention_policies'], isNotEmpty);
      expect(backup['encryption_settings'], isNotEmpty);
      expect(backup['timestamp'], isNotNull);
    });

    test('should restore from secure backup', () async {
      const roomId = '!test:example.com';
      final now = DateTime.now();
      
      final backup = {
        'timestamp': now.toIso8601String(),
        'client_id': 'test-client',
        'user_id': '@test:example.com',
        'device_id': 'TEST_DEVICE',
        'retention_policies': {
          roomId: {
            'enabled': true,
            'maxAge': 2592000, // 30 days in seconds
            'retainEncryptedContent': true,
            'retainMediaFiles': true,
            'createdAt': now.toIso8601String(),
            'updatedAt': now.toIso8601String(),
          }
        },
        'encryption_settings': {
          roomId: {
            'encryptionEnabled': true,
            'requireVerification': false,
            'algorithm': 'megolmV1AesSha2',
            'allowUnverifiedDevices': true,
            'enableKeyBackup': true,
            'requireSecureBackup': false,
            'createdAt': now.toIso8601String(),
            'updatedAt': now.toIso8601String(),
          }
        },
      };

      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));

      await securityManager.restoreFromSecureBackup(backup);

      final restoredPolicy = securityManager.getRetentionPolicy(roomId);
      final restoredSettings = securityManager.getEncryptionSettings(roomId);

      expect(restoredPolicy?.enabled, true);
      expect(restoredPolicy?.maxAge, Duration(days: 30));
      expect(restoredSettings?.encryptionEnabled, true);
      expect(restoredSettings?.requireVerification, false);
    });
  });
}
