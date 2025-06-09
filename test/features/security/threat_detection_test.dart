import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

import 'package:rechainonline/features/security/threat_detection.dart';
import 'package:rechainonline/features/security/advanced_security_audit.dart';

class MockClient extends Mock implements Client {}
class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockRoom extends Mock implements Room {}
class MockEvent extends Mock implements Event {
  @override
  String get eventId => 'test_event_id';
  
  @override
  String get roomId => '!test_room:example.com';
  
  @override
  String get senderId => '@test_user:example.com';
}

void main() {
  late ThreatDetectionEngine engine;
  late MockClient client;
  late MockSharedPreferences prefs;
  late StreamController<Event> eventController;

  setUp(() {
    client = MockClient();
    prefs = MockSharedPreferences();
    eventController = StreamController<Event>();
    
    when(client.onEvent).thenReturn(eventController.stream);
    when(prefs.getString(any)).thenReturn(null);
    when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));

    engine = ThreatDetectionEngine(
      client: client,
      store: prefs,
    );
  });

  tearDown(() {
    eventController.close();
    engine.dispose();
  });

  group('Rule Management', () {
    test('should initialize with default rules', () {
      expect(engine.rules, isNotEmpty);
      expect(
        engine.rules.any((r) => r.threatType == ThreatType.maliciousLink),
        isTrue,
      );
      expect(
        engine.rules.any((r) => r.threatType == ThreatType.phishingAttempt),
        isTrue,
      );
    });

    test('should add custom rule', () async {
      final customRule = ThreatDetectionRule(
        id: 'custom_rule_1',
        name: 'Custom Test Rule',
        threatType: ThreatType.malware,
        severity: SecurityThreatLevel.high,
        pattern: RegExp(r'malware_pattern'),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await engine.addCustomRule(customRule);

      expect(
        engine.rules.any((r) => r.id == 'custom_rule_1'),
        isTrue,
      );
    });

    test('should update existing rule', () async {
      final rule = engine.rules.first;
      final updatedRule = ThreatDetectionRule(
        id: rule.id,
        name: 'Updated Name',
        threatType: rule.threatType,
        severity: rule.severity,
        pattern: rule.pattern,
        createdAt: rule.createdAt,
        updatedAt: DateTime.now(),
      );

      await engine.updateRule(updatedRule);

      expect(
        engine.rules.firstWhere((r) => r.id == rule.id).name,
        equals('Updated Name'),
      );
    });

    test('should delete rule', () async {
      final ruleId = engine.rules.first.id;
      await engine.deleteRule(ruleId);

      expect(
        engine.rules.any((r) => r.id == ruleId),
        isFalse,
      );
    });
  });

  group('Threat Detection', () {
    test('should detect malicious links', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Check out this link: http://suspicious.tk/malware',
        'msgtype': 'm.text',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      expect(engine.alerts, isNotEmpty);
      expect(
        engine.alerts.any((a) => a.threatType == ThreatType.maliciousLink),
        isTrue,
      );
    });

    test('should detect phishing attempts', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Please verify your account by clicking here',
        'msgtype': 'm.text',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      expect(
        engine.alerts.any((a) => a.threatType == ThreatType.phishingAttempt),
        isTrue,
      );
    });

    test('should detect suspicious files', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Check this file',
        'filename': 'suspicious.exe',
        'msgtype': 'm.file',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      expect(
        engine.alerts.any((a) => a.threatType == ThreatType.suspiciousFile),
        isTrue,
      );
    });

    test('should detect social engineering attempts', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Trust me, send me your recovery phrase',
        'msgtype': 'm.text',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      expect(
        engine.alerts.any((a) => a.threatType == ThreatType.socialEngineering),
        isTrue,
      );
    });

    test('should detect cryptocurrency scams', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Send 1 BTC and get 2 BTC back! Limited time offer!',
        'msgtype': 'm.text',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      expect(
        engine.alerts.any((a) => a.threatType == ThreatType.cryptojacking),
        isTrue,
      );
    });
  });

  group('Behavioral Analysis', () {
    test('should detect rapid-fire messaging', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Spam message',
        'msgtype': 'm.text',
      });

      // Simulate rapid message sending
      for (var i = 0; i < 25; i++) {
        eventController.add(event);
        await Future.delayed(Duration(milliseconds: 10));
      }

      expect(
        engine.alerts.any((a) => a.threatType == ThreatType.spamMessage),
        isTrue,
      );
    });

    test('should track user threat scores', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Click here to verify your account http://suspicious.tk/scam',
        'msgtype': 'm.text',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      expect(
        engine.getUserThreatScore(event.senderId),
        greaterThan(0),
      );
    });

    test('should identify high-risk users', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Multiple suspicious messages',
        'msgtype': 'm.text',
      });

      // Simulate multiple suspicious activities
      for (var i = 0; i < 10; i++) {
        eventController.add(event);
        await Future.delayed(Duration(milliseconds: 10));
      }

      expect(
        engine.getHighRiskUsers(),
        contains(event.senderId),
      );
    });
  });

  group('Alert Management', () {
    test('should acknowledge alerts', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Suspicious content',
        'msgtype': 'm.text',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      final alert = engine.alerts.first;
      await engine.acknowledgeAlert(alert.id, '@admin:example.com');

      expect(
        engine.alerts.firstWhere((a) => a.id == alert.id).acknowledged,
        isTrue,
      );
    });

    test('should persist alerts', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Suspicious content',
        'msgtype': 'm.text',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      verify(prefs.setString(any, any)).called(greaterThan(0));
    });

    test('should load persisted alerts', () async {
      final alertJson = '''[{
        "id": "test_alert",
        "threatType": "maliciousLink",
        "severity": "high",
        "title": "Test Alert",
        "description": "Test Description",
        "eventId": "test_event",
        "roomId": "!test:example.com",
        "senderId": "@test:example.com",
        "detectedAt": "${DateTime.now().toIso8601String()}",
        "metadata": {},
        "acknowledged": false
      }]''';

      when(prefs.getString('threat_detection_alerts')).thenReturn(alertJson);

      final newEngine = ThreatDetectionEngine(
        client: client,
        store: prefs,
      );

      expect(newEngine.alerts, isNotEmpty);
      expect(newEngine.alerts.first.id, equals('test_alert'));
    });
  });

  group('Performance and Resource Management', () {
    test('should limit per-user activity tracking', () async {
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Test message',
        'msgtype': 'm.text',
      });

      // Generate many events
      for (var i = 0; i < 200; i++) {
        eventController.add(event);
        await Future.delayed(Duration(milliseconds: 1));
      }

      // Verify that activity tracking is limited
      final activities = await engine.getUserActivityCount(event.senderId);
      expect(activities, lessThanOrEqual(100));
    });

    test('should cleanup resources on disposal', () async {
      engine.dispose();
      
      // Verify that sending new events doesn't trigger alerts
      final event = MockEvent();
      when(event.content).thenReturn({
        'body': 'Suspicious content',
        'msgtype': 'm.text',
      });

      eventController.add(event);
      await Future.delayed(Duration(milliseconds: 100));

      expect(engine.alerts, isEmpty);
    });
  });
}
