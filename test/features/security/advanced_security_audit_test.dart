import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

import 'package:rechainonline/features/security/advanced_security_audit.dart';
import 'package:rechainonline/features/security/security_manager.dart';

class MockClient extends Mock implements Client {}
class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockRoom extends Mock implements Room {}
class MockEvent extends Mock implements Event {}
class MockSecurityManager extends Mock implements SecurityManager {}
class MockDeviceKeys extends Mock implements DeviceKeys {}
class MockUserDeviceKeys extends Mock implements UserDeviceKeys {}

void main() {
  late AdvancedSecurityAudit securityAudit;
  late MockClient client;
  late MockSharedPreferences prefs;
  late MockSecurityManager securityManager;
  late List<MockRoom> mockRooms;

  setUp(() {
    client = MockClient();
    prefs = MockSharedPreferences();
    securityManager = MockSecurityManager();
    mockRooms = List.generate(3, (i) => MockRoom());

    when(client.rooms).thenReturn(mockRooms);
    when(prefs.getString(any)).thenReturn(null);
    when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));

    securityAudit = AdvancedSecurityAudit(
      client: client,
      store: prefs,
      securityManager: securityManager,
    );
  });

  group('Room Security Audit', () {
    test('should detect unencrypted rooms with sensitive content', () async {
      // Mock unencrypted room with sensitive content
      when(mockRooms[0].encrypted).thenReturn(false);
      when(mockRooms[0].displayname).thenReturn('Sensitive Room');
      when(mockRooms[0].requestHistory(limit: anyNamed('limit')))
          .thenAnswer((_) => Future.value([
                MockEvent()
                  ..content = {
                    'body': 'My SSN is 123-45-6789',
                    'msgtype': 'm.text',
                  },
              ]));

      await securityAudit.performComprehensiveAudit();

      final vulnerabilities = securityAudit.vulnerabilities;
      expect(
        vulnerabilities.any((v) =>
            v.type == SecurityVulnerabilityType.unencryptedRoom &&
            v.threatLevel == SecurityThreatLevel.high),
        isTrue,
      );
    });

    test('should detect rooms with too many unverified members', () async {
      // Mock room with unverified members
      final mockMembers = List.generate(
        10,
        (i) => User(client, '@user$i:example.com'),
      );

      when(mockRooms[0].getParticipants()).thenReturn(mockMembers);
      when(client.userDeviceKeys).thenReturn({
        for (var member in mockMembers)
          member.id: MockUserDeviceKeys()
            ..deviceKeys = {
              'device_id': MockDeviceKeys()..verified = false,
            },
      });

      await securityAudit.performComprehensiveAudit();

      final vulnerabilities = securityAudit.vulnerabilities;
      expect(
        vulnerabilities.any((v) =>
            v.type == SecurityVulnerabilityType.unverifiedDevice &&
            v.threatLevel == SecurityThreatLevel.medium),
        isTrue,
      );
    });
  });

  group('Device Security Audit', () {
    test('should detect unverified devices', () async {
      final mockDeviceKeys = {
        'device1': MockDeviceKeys()..verified = false,
        'device2': MockDeviceKeys()..verified = true,
      };

      when(client.userDeviceKeys).thenReturn({
        '@user:example.com': MockUserDeviceKeys()..deviceKeys = mockDeviceKeys,
      });

      await securityAudit.performComprehensiveAudit();

      final vulnerabilities = securityAudit.vulnerabilities;
      expect(
        vulnerabilities.any((v) =>
            v.type == SecurityVulnerabilityType.unverifiedDevice &&
            v.metadata['deviceId'] == 'device1'),
        isTrue,
      );
    });

    test('should detect outdated clients', () async {
      final mockDeviceKeys = {
        'old_device': MockDeviceKeys()
          ..verified = true
          ..keys = {},
      };

      when(client.userDeviceKeys).thenReturn({
        '@user:example.com': MockUserDeviceKeys()..deviceKeys = mockDeviceKeys,
      });

      await securityAudit.performComprehensiveAudit();

      final vulnerabilities = securityAudit.vulnerabilities;
      expect(
        vulnerabilities.any((v) =>
            v.type == SecurityVulnerabilityType.outdatedClient &&
            v.metadata['deviceId'] == 'old_device'),
        isTrue,
      );
    });
  });

  group('Network Security Audit', () {
    test('should detect insecure connections', () async {
      when(client.homeserver).thenReturn(Uri.parse('http://example.com'));

      await securityAudit.performComprehensiveAudit();

      final vulnerabilities = securityAudit.vulnerabilities;
      expect(
        vulnerabilities.any((v) =>
            v.type == SecurityVulnerabilityType.dataLeak &&
            v.threatLevel == SecurityThreatLevel.critical),
        isTrue,
      );
    });
  });

  group('Data Integrity Audit', () {
    test('should detect corrupted room state', () async {
      // Mock room with corrupted state
      when(mockRooms[0].getState(EventTypes.RoomPowerLevels))
          .thenReturn(Event.fromJson({}));

      await securityAudit.performComprehensiveAudit();

      final vulnerabilities = securityAudit.vulnerabilities;
      expect(
        vulnerabilities.any((v) => v.type == SecurityVulnerabilityType.dataLeak),
        isTrue,
      );
    });
  });

  group('Access Control Audit', () {
    test('should detect weak access controls in large rooms', () async {
      // Mock large room with weak permissions
      when(mockRooms[0].canSendDefaultMessages).thenReturn(true);
      when(mockRooms[0].summary.mJoinedMemberCount).thenReturn(150);
      when(mockRooms[0].getState(EventTypes.RoomPowerLevels))
          .thenReturn(Event.fromJson({
        'content': {'events_default': 0},
      }));

      await securityAudit.performComprehensiveAudit();

      final vulnerabilities = securityAudit.vulnerabilities;
      expect(
        vulnerabilities.any((v) =>
            v.type == SecurityVulnerabilityType.unauthorizedAccess &&
            v.threatLevel == SecurityThreatLevel.medium),
        isTrue,
      );
    });
  });

  group('Vulnerability Management', () {
    test('should resolve vulnerabilities', () async {
      // Create a test vulnerability
      final vulnerability = SecurityVulnerability(
        id: 'test_vuln',
        type: SecurityVulnerabilityType.unencryptedRoom,
        threatLevel: SecurityThreatLevel.high,
        title: 'Test Vulnerability',
        description: 'Test Description',
        recommendation: 'Test Recommendation',
        detectedAt: DateTime.now(),
      );

      // Add vulnerability through audit
      when(mockRooms[0].encrypted).thenReturn(false);
      await securityAudit.performComprehensiveAudit();

      // Resolve the first vulnerability
      final vulnId = securityAudit.vulnerabilities.first.id;
      await securityAudit.resolveVulnerability(vulnId);

      expect(
        securityAudit.vulnerabilities
            .firstWhere((v) => v.id == vulnId)
            .isResolved,
        isTrue,
      );
    });

    test('should persist vulnerability status', () async {
      // Create and resolve a vulnerability
      when(mockRooms[0].encrypted).thenReturn(false);
      await securityAudit.performComprehensiveAudit();
      final vulnId = securityAudit.vulnerabilities.first.id;
      await securityAudit.resolveVulnerability(vulnId);

      // Verify persistence
      verify(prefs.setString(any, any)).called(greaterThan(0));

      // Create new audit instance and verify loaded state
      final newAudit = AdvancedSecurityAudit(
        client: client,
        store: prefs,
        securityManager: securityManager,
      );

      expect(
        newAudit.vulnerabilities
            .firstWhere((v) => v.id == vulnId)
            .isResolved,
        isTrue,
      );
    });
  });

  group('Continuous Monitoring', () {
    test('should perform periodic audits', () async {
      // Fast-forward time to trigger periodic audit
      await Future.delayed(Duration(milliseconds: 100));
      
      verify(client.rooms).called(greaterThan(1));
    });

    test('should update vulnerability status on re-audit', () async {
      // Initial audit with unencrypted room
      when(mockRooms[0].encrypted).thenReturn(false);
      await securityAudit.performComprehensiveAudit();

      // Change room state
      when(mockRooms[0].encrypted).thenReturn(true);
      await securityAudit.performComprehensiveAudit();

      expect(
        securityAudit.vulnerabilities
            .where((v) =>
                v.type == SecurityVulnerabilityType.unencryptedRoom &&
                !v.isResolved)
            .isEmpty,
        isTrue,
      );
    });
  });

  group('Resource Management', () {
    test('should cleanup resources on disposal', () async {
      securityAudit.dispose();

      // Verify that periodic audits stop
      await Future.delayed(Duration(milliseconds: 100));
      verifyNever(client.rooms);
    });

    test('should handle concurrent audits', () async {
      // Attempt multiple concurrent audits
      final audits = await Future.wait([
        securityAudit.performComprehensiveAudit(),
        securityAudit.performComprehensiveAudit(),
        securityAudit.performComprehensiveAudit(),
      ]);

      // Verify no duplicate vulnerabilities
      final vulnIds = securityAudit.vulnerabilities.map((v) => v.id).toSet();
      expect(
        vulnIds.length,
        equals(securityAudit.vulnerabilities.length),
      );
    });
  });
}
