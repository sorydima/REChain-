import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:rechainonline/features/bridge_manager/bridge_manager.dart';
import 'package:rechainonline/features/security/security_manager.dart';
import 'package:rechainonline/features/security/advanced_security_audit.dart';
import 'package:rechainonline/features/security/threat_detection.dart';
import 'package:rechainonline/features/message_scheduling/message_scheduler.dart';
import 'package:rechainonline/features/translation/translation_service.dart';
import 'package:rechainonline/utils/services_manager.dart';

import 'services_integration_test.mocks.dart';

@GenerateMocks([Client, SharedPreferences, Room, Event])
void main() {
  late ServicesManager servicesManager;
  late MockClient client;
  late MockSharedPreferences prefs;
  
  setUp(() {
    client = MockClient();
    prefs = MockSharedPreferences();
    
    when(prefs.getString(any)).thenReturn(null);
    when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
    
    servicesManager = ServicesManager(
      client: client,
      store: prefs,
    );
  });

  group('Service Lifecycle Integration', () {
    test('should initialize all services in correct order', () async {
      await servicesManager.initializeServices();

      expect(servicesManager.bridgeManager, isNotNull);
      expect(servicesManager.securityManager, isNotNull);
      expect(servicesManager.messageScheduler, isNotNull);
      expect(servicesManager.translationService, isNotNull);
      expect(servicesManager.securityAudit, isNotNull);
      expect(servicesManager.threatDetection, isNotNull);
    });

    test('should handle service dependencies', () async {
      await servicesManager.initializeServices();

      // Verify security audit has access to security manager
      expect(servicesManager.securityAudit.securityManager, 
             equals(servicesManager.securityManager));

      // Verify threat detection has access to security audit
      expect(servicesManager.threatDetection.client, equals(client));
    });

    test('should cleanup all services on disposal', () async {
      await servicesManager.initializeServices();
      await servicesManager.dispose();

      // Verify all services are properly disposed
      expect(servicesManager.bridgeManager, isNull);
      expect(servicesManager.securityManager, isNull);
      expect(servicesManager.messageScheduler, isNull);
      expect(servicesManager.translationService, isNull);
      expect(servicesManager.securityAudit, isNull);
      expect(servicesManager.threatDetection, isNull);
    });
  });

  group('Cross-Feature Interactions', () {
    test('should handle bridge security events', () async {
      await servicesManager.initializeServices();

      // Simulate bridge connection event
      final bridgeConfig = BridgeConfig(
        type: 'telegram',
        name: 'Test Bridge',
        apiKey: 'test_key',
        settings: {'bot_token': 'test_token'},
      );

      final result = await servicesManager.bridgeManager.createBridge(bridgeConfig);
      
      // Verify security audit captures the new bridge
      final vulnerabilities = servicesManager.securityAudit.vulnerabilities;
      expect(
        vulnerabilities.any((v) => 
          v.metadata['bridgeId'] == result.bridge?.id &&
          v.type == SecurityVulnerabilityType.unverifiedDevice
        ),
        isTrue,
      );
    });

    test('should integrate message scheduling with security checks', () async {
      await servicesManager.initializeServices();

      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      // Schedule a message with suspicious content
      final messageId = await servicesManager.messageScheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Click here to verify your account: http://suspicious.tk/verify',
        scheduledTime: scheduledTime,
      );

      // Verify threat detection caught the suspicious content
      expect(
        servicesManager.threatDetection.alerts.any((a) => 
          a.metadata['relatedMessageId'] == messageId &&
          a.threatType == ThreatType.phishingAttempt
        ),
        isTrue,
      );
    });

    test('should integrate translation with security scanning', () async {
      await servicesManager.initializeServices();

      // Translate potentially malicious content
      final result = await servicesManager.translationService.translateText(
        'Click here to double your bitcoin investment!',
        targetLanguage: 'es',
      );

      // Verify threat detection analyzes translated content
      expect(
        servicesManager.threatDetection.alerts.any((a) =>
          a.metadata['originalText'] == result.originalText &&
          a.threatType == ThreatType.cryptojacking
        ),
        isTrue,
      );
    });
  });

  group('Performance Integration', () {
    test('should handle concurrent service operations', () async {
      await servicesManager.initializeServices();

      // Perform multiple operations concurrently
      await Future.wait([
        servicesManager.securityAudit.performComprehensiveAudit(),
        servicesManager.messageScheduler.scheduleMessage(
          roomId: '!test:example.com',
          content: 'Test message',
          scheduledTime: DateTime.now().add(Duration(minutes: 5)),
        ),
        servicesManager.translationService.translateText(
          'Hello world',
          targetLanguage: 'es',
        ),
        servicesManager.bridgeManager.listBridges(),
      ]);

      // Verify all services remain responsive
      expect(servicesManager.securityAudit.vulnerabilities, isNotNull);
      expect(servicesManager.messageScheduler.scheduledMessages, isNotNull);
      expect(servicesManager.bridgeManager.bridges, isNotNull);
    });

    test('should handle high-load scenarios', () async {
      await servicesManager.initializeServices();

      // Simulate high load with many concurrent events
      final futures = List.generate(100, (i) => 
        servicesManager.messageScheduler.scheduleMessage(
          roomId: '!test:example.com',
          content: 'Test message $i',
          scheduledTime: DateTime.now().add(Duration(minutes: 5)),
        )
      );

      await Future.wait(futures);

      // Verify system remains stable
      expect(servicesManager.messageScheduler.scheduledMessages.length, equals(100));
      expect(servicesManager.threatDetection.alerts, isNotEmpty);
    });
  });

  group('Error Handling Integration', () {
    test('should handle service initialization failures gracefully', () async {
      // Mock client to throw on initialization
      when(client.rooms).thenThrow(Exception('Connection failed'));

      try {
        await servicesManager.initializeServices();
      } catch (e) {
        // Verify partial initialization
        expect(servicesManager.bridgeManager, isNull);
        expect(servicesManager.securityManager, isNotNull);
        expect(servicesManager.messageScheduler, isNotNull);
      }
    });

    test('should handle service operation failures', () async {
      await servicesManager.initializeServices();

      // Mock bridge operation failure
      when(client.sendTextEvent(any, any))
          .thenThrow(Exception('Network error'));

      // Attempt bridge operation
      final result = await servicesManager.bridgeManager.createBridge(
        BridgeConfig(
          type: 'telegram',
          name: 'Test Bridge',
          apiKey: 'test_key',
          settings: {'bot_token': 'test_token'},
        ),
      );

      // Verify error is captured in security audit
      expect(
        servicesManager.securityAudit.vulnerabilities.any((v) =>
          v.type == SecurityVulnerabilityType.unauthorizedAccess &&
          v.metadata['error']?.contains('Network error') == true
        ),
        isTrue,
      );
    });
  });

  group('Resource Management Integration', () {
    test('should handle memory pressure scenarios', () async {
      await servicesManager.initializeServices();

      // Simulate memory pressure with large number of operations
      final largeData = List.generate(10000, (i) => 'Data chunk $i').join(' ');
      
      // Perform memory-intensive operations
      await Future.wait([
        servicesManager.translationService.translateText(largeData, targetLanguage: 'es'),
        servicesManager.securityAudit.performComprehensiveAudit(),
        servicesManager.threatDetection.analyzeContent(largeData),
      ]);

      // Verify services remain responsive
      expect(servicesManager.translationService.isReady, isTrue);
      expect(servicesManager.securityAudit.isRunning, isFalse);
      expect(servicesManager.threatDetection.isActive, isTrue);
    });

    test('should cleanup resources properly', () async {
      await servicesManager.initializeServices();

      // Create some data in various services
      await servicesManager.messageScheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Test message',
        scheduledTime: DateTime.now().add(Duration(minutes: 5)),
      );

      await servicesManager.translationService.translateText(
        'Hello world',
        targetLanguage: 'es',
      );

      // Dispose services
      await servicesManager.dispose();

      // Verify all resources are cleaned up
      verify(prefs.setString(any, any)).called(greaterThan(0));
      expect(servicesManager.isDisposed, isTrue);
    });
  });
}
