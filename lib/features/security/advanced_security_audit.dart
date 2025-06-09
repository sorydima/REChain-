import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';

import 'security_manager.dart';

enum SecurityThreatLevel {
  low,
  medium,
  high,
  critical,
}

enum SecurityVulnerabilityType {
  unencryptedRoom,
  unverifiedDevice,
  weakPassword,
  outdatedClient,
  suspiciousActivity,
  dataLeak,
  unauthorizedAccess,
  maliciousContent,
  phishingAttempt,
  socialEngineering,
}

class SecurityVulnerability {
  final String id;
  final SecurityVulnerabilityType type;
  final SecurityThreatLevel threatLevel;
  final String title;
  final String description;
  final String recommendation;
  final DateTime detectedAt;
  final Map<String, dynamic> metadata;
  final bool isResolved;
  final DateTime? resolvedAt;

  const SecurityVulnerability({
    required this.id,
    required this.type,
    required this.threatLevel,
    required this.title,
    required this.description,
    required this.recommendation,
    required this.detectedAt,
    this.metadata = const {},
    this.isResolved = false,
    this.resolvedAt,
  });

  SecurityVulnerability copyWith({
    String? id,
    SecurityVulnerabilityType? type,
    SecurityThreatLevel? threatLevel,
    String? title,
    String? description,
    String? recommendation,
    DateTime? detectedAt,
    Map<String, dynamic>? metadata,
    bool? isResolved,
    DateTime? resolvedAt,
  }) {
    return SecurityVulnerability(
      id: id ?? this.id,
      type: type ?? this.type,
      threatLevel: threatLevel ?? this.threatLevel,
      title: title ?? this.title,
      description: description ?? this.description,
      recommendation: recommendation ?? this.recommendation,
      detectedAt: detectedAt ?? this.detectedAt,
      metadata: metadata ?? this.metadata,
      isResolved: isResolved ?? this.isResolved,
      resolvedAt: resolvedAt ?? this.resolvedAt,
    );
  }

  String get threatLevelIcon {
    switch (threatLevel) {
      case SecurityThreatLevel.low:
        return '🟢';
      case SecurityThreatLevel.medium:
        return '🟡';
      case SecurityThreatLevel.high:
        return '🟠';
      case SecurityThreatLevel.critical:
        return '🔴';
    }
  }

  String get typeIcon {
    switch (type) {
      case SecurityVulnerabilityType.unencryptedRoom:
        return '🔓';
      case SecurityVulnerabilityType.unverifiedDevice:
        return '❓';
      case SecurityVulnerabilityType.weakPassword:
        return '🔑';
      case SecurityVulnerabilityType.outdatedClient:
        return '⏰';
      case SecurityVulnerabilityType.suspiciousActivity:
        return '👁️';
      case SecurityVulnerabilityType.dataLeak:
        return '💧';
      case SecurityVulnerabilityType.unauthorizedAccess:
        return '🚫';
      case SecurityVulnerabilityType.maliciousContent:
        return '☠️';
      case SecurityVulnerabilityType.phishingAttempt:
        return '🎣';
      case SecurityVulnerabilityType.socialEngineering:
        return '🎭';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'threatLevel': threatLevel.name,
      'title': title,
      'description': description,
      'recommendation': recommendation,
      'detectedAt': detectedAt.toIso8601String(),
      'metadata': metadata,
      'isResolved': isResolved,
      'resolvedAt': resolvedAt?.toIso8601String(),
    };
  }

  factory SecurityVulnerability.fromJson(Map<String, dynamic> json) {
    return SecurityVulnerability(
      id: json['id'] as String,
      type: SecurityVulnerabilityType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => SecurityVulnerabilityType.suspiciousActivity,
      ),
      threatLevel: SecurityThreatLevel.values.firstWhere(
        (e) => e.name == json['threatLevel'],
        orElse: () => SecurityThreatLevel.medium,
      ),
      title: json['title'] as String,
      description: json['description'] as String,
      recommendation: json['recommendation'] as String,
      detectedAt: DateTime.parse(json['detectedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? {},
      isResolved: json['isResolved'] as bool? ?? false,
      resolvedAt: json['resolvedAt'] != null 
          ? DateTime.parse(json['resolvedAt'] as String)
          : null,
    );
  }
}

class AdvancedSecurityAudit {
  final Client client;
  final SharedPreferences store;
  final SecurityManager securityManager;
  
  final List<SecurityVulnerability> _vulnerabilities = [];
  final Map<String, DateTime> _lastChecks = {};
  final Map<String, int> _suspiciousActivityCounts = {};
  
  Timer? _continuousMonitoringTimer;
  
  AdvancedSecurityAudit({
    required this.client,
    required this.store,
    required this.securityManager,
  }) {
    _loadVulnerabilities();
    _startContinuousMonitoring();
  }

  List<SecurityVulnerability> get vulnerabilities => List.unmodifiable(_vulnerabilities);
  
  List<SecurityVulnerability> get unresolvedVulnerabilities =>
      _vulnerabilities.where((v) => !v.isResolved).toList();
  
  List<SecurityVulnerability> get criticalVulnerabilities =>
      _vulnerabilities.where((v) => v.threatLevel == SecurityThreatLevel.critical && !v.isResolved).toList();

  Future<void> performComprehensiveAudit() async {
    Logs().i('Starting comprehensive security audit');
    
    await Future.wait([
      _auditRoomSecurity(),
      _auditDeviceSecurity(),
      _auditUserBehavior(),
      _auditNetworkSecurity(),
      _auditDataIntegrity(),
      _auditAccessControls(),
    ]);
    
    await _saveVulnerabilities();
    Logs().i('Comprehensive security audit completed. Found ${unresolvedVulnerabilities.length} unresolved vulnerabilities');
  }

  Future<void> _auditRoomSecurity() async {
    for (final room in client.rooms) {
      // Check for unencrypted rooms with sensitive content
      if (!room.encrypted) {
        final hasPersonalInfo = await _checkForPersonalInformation(room);
        if (hasPersonalInfo) {
          _addVulnerability(SecurityVulnerability(
            id: 'unencrypted_room_${room.id}',
            type: SecurityVulnerabilityType.unencryptedRoom,
            threatLevel: SecurityThreatLevel.high,
            title: 'Unencrypted Room with Sensitive Content',
            description: 'Room "${room.displayname}" contains potentially sensitive information but is not encrypted.',
            recommendation: 'Enable end-to-end encryption for this room to protect sensitive communications.',
            detectedAt: DateTime.now(),
            metadata: {
              'roomId': room.id,
              'roomName': room.displayname,
              'memberCount': room.summary.mJoinedMemberCount,
            },
          ));
        }
      }
      
      // Check for rooms with too many unverified members
      final unverifiedMembers = await _countUnverifiedMembers(room);
      if (unverifiedMembers > 5) {
        _addVulnerability(SecurityVulnerability(
          id: 'unverified_members_${room.id}',
          type: SecurityVulnerabilityType.unverifiedDevice,
          threatLevel: SecurityThreatLevel.medium,
          title: 'Multiple Unverified Members',
          description: 'Room "${room.displayname}" has $unverifiedMembers unverified members.',
          recommendation: 'Verify member identities or consider removing unverified users from sensitive rooms.',
          detectedAt: DateTime.now(),
          metadata: {
            'roomId': room.id,
            'roomName': room.displayname,
            'unverifiedCount': unverifiedMembers,
          },
        ));
      }
    }
  }

  Future<void> _auditDeviceSecurity() async {
    final userDeviceKeys = client.userDeviceKeys;
    
    for (final userId in userDeviceKeys.keys) {
      final deviceKeys = userDeviceKeys[userId];
      if (deviceKeys == null) continue;
      
      for (final deviceKey in deviceKeys.deviceKeys.values) {
        if (!deviceKey.verified) {
          _addVulnerability(SecurityVulnerability(
            id: 'unverified_device_${deviceKey.deviceId}',
            type: SecurityVulnerabilityType.unverifiedDevice,
            threatLevel: SecurityThreatLevel.medium,
            title: 'Unverified Device',
            description: 'Device ${deviceKey.deviceId} for user $userId is not verified.',
            recommendation: 'Verify this device through cross-signing or interactive verification.',
            detectedAt: DateTime.now(),
            metadata: {
              'userId': userId,
              'deviceId': deviceKey.deviceId,
              'deviceName': deviceKey.deviceDisplayName,
            },
          ));
        }
        
        // Check for outdated devices
        if (deviceKey.keys.isEmpty) {
          _addVulnerability(SecurityVulnerability(
            id: 'outdated_device_${deviceKey.deviceId}',
            type: SecurityVulnerabilityType.outdatedClient,
            threatLevel: SecurityThreatLevel.low,
            title: 'Potentially Outdated Device',
            description: 'Device ${deviceKey.deviceId} may be using an outdated client.',
            recommendation: 'Encourage the user to update their Matrix client to the latest version.',
            detectedAt: DateTime.now(),
            metadata: {
              'userId': userId,
              'deviceId': deviceKey.deviceId,
            },
          ));
        }
      }
    }
  }

  Future<void> _auditUserBehavior() async {
    // Analyze message patterns for suspicious activity
    final suspiciousPatterns = await _analyzeSuspiciousPatterns();
    
    for (final pattern in suspiciousPatterns) {
      _addVulnerability(SecurityVulnerability(
        id: 'suspicious_activity_${pattern['userId']}_${DateTime.now().millisecondsSinceEpoch}',
        type: SecurityVulnerabilityType.suspiciousActivity,
        threatLevel: SecurityThreatLevel.medium,
        title: 'Suspicious User Activity Detected',
        description: pattern['description'] as String,
        recommendation: 'Monitor this user\'s activity and consider additional verification.',
        detectedAt: DateTime.now(),
        metadata: pattern,
      ));
    }
  }

  Future<void> _auditNetworkSecurity() async {
    // Check for insecure connections
    final homeserverUrl = client.homeserver;
    if (homeserverUrl != null && !homeserverUrl.toString().startsWith('https://')) {
      _addVulnerability(SecurityVulnerability(
        id: 'insecure_connection',
        type: SecurityVulnerabilityType.dataLeak,
        threatLevel: SecurityThreatLevel.critical,
        title: 'Insecure Connection to Homeserver',
        description: 'Connection to homeserver is not using HTTPS encryption.',
        recommendation: 'Switch to a homeserver that supports HTTPS or configure SSL/TLS.',
        detectedAt: DateTime.now(),
        metadata: {
          'homeserver': homeserverUrl.toString(),
        },
      ));
    }
  }

  Future<void> _auditDataIntegrity() async {
    // Check for potential data corruption or tampering
    final corruptedRooms = await _checkDataIntegrity();
    
    for (final roomId in corruptedRooms) {
      _addVulnerability(SecurityVulnerability(
        id: 'data_integrity_$roomId',
        type: SecurityVulnerabilityType.dataLeak,
        threatLevel: SecurityThreatLevel.high,
        title: 'Data Integrity Issue',
        description: 'Potential data corruption detected in room $roomId.',
        recommendation: 'Verify room data integrity and consider re-syncing the room.',
        detectedAt: DateTime.now(),
        metadata: {
          'roomId': roomId,
        },
      ));
    }
  }

  Future<void> _auditAccessControls() async {
    // Check for weak access controls
    for (final room in client.rooms) {
      if (room.canSendDefaultMessages && room.summary.mJoinedMemberCount! > 100) {
        final powerLevels = room.getState(EventTypes.RoomPowerLevels);
        if (powerLevels?.content['events_default'] == null || 
            powerLevels!.content['events_default'] < 50) {
          _addVulnerability(SecurityVulnerability(
            id: 'weak_access_control_${room.id}',
            type: SecurityVulnerabilityType.unauthorizedAccess,
            threatLevel: SecurityThreatLevel.medium,
            title: 'Weak Access Controls',
            description: 'Large room "${room.displayname}" has permissive message sending permissions.',
            recommendation: 'Consider increasing power level requirements for sending messages in large rooms.',
            detectedAt: DateTime.now(),
            metadata: {
              'roomId': room.id,
              'roomName': room.displayname,
              'memberCount': room.summary.mJoinedMemberCount,
            },
          ));
        }
      }
    }
  }

  Future<bool> _checkForPersonalInformation(Room room) async {
    // Simple heuristic to detect personal information
    final recentEvents = await room.requestHistory(limit: 50);
    final personalInfoPatterns = [
      RegExp(r'\b\d{3}-\d{2}-\d{4}\b'), // SSN pattern
      RegExp(r'\b\d{4}\s?\d{4}\s?\d{4}\s?\d{4}\b'), // Credit card pattern
      RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'), // Email pattern
      RegExp(r'\b\d{3}-\d{3}-\d{4}\b'), // Phone number pattern
    ];
    
    for (final event in recentEvents) {
      final content = event.content['body'] as String?;
      if (content != null) {
        for (final pattern in personalInfoPatterns) {
          if (pattern.hasMatch(content)) {
            return true;
          }
        }
      }
    }
    
    return false;
  }

  Future<int> _countUnverifiedMembers(Room room) async {
    int unverifiedCount = 0;
    
    for (final member in room.getParticipants()) {
      final deviceKeys = client.userDeviceKeys[member.id];
      if (deviceKeys != null) {
        final hasVerifiedDevice = deviceKeys.deviceKeys.values
            .any((device) => device.verified);
        if (!hasVerifiedDevice) {
          unverifiedCount++;
        }
      } else {
        unverifiedCount++;
      }
    }
    
    return unverifiedCount;
  }

  Future<List<Map<String, dynamic>>> _analyzeSuspiciousPatterns() async {
    final suspiciousPatterns = <Map<String, dynamic>>[];
    final now = DateTime.now();
    
    // Analyze message frequency patterns
    final userMessageCounts = <String, int>{};
    final userLastSeen = <String, DateTime>{};
    
    for (final room in client.rooms) {
      final recentEvents = await room.requestHistory(limit: 100);
      
      for (final event in recentEvents) {
        if (event.type == EventTypes.Message) {
          final userId = event.senderId;
          userMessageCounts[userId] = (userMessageCounts[userId] ?? 0) + 1;
          userLastSeen[userId] = event.originServerTs;
        }
      }
    }
    
    // Detect spam-like behavior
    for (final entry in userMessageCounts.entries) {
      final userId = entry.key;
      final messageCount = entry.value;
      
      if (messageCount > 50) { // More than 50 messages in recent history
        final lastSeen = userLastSeen[userId];
        if (lastSeen != null && now.difference(lastSeen).inHours < 1) {
          suspiciousPatterns.add({
            'userId': userId,
            'type': 'high_frequency_messaging',
            'messageCount': messageCount,
            'description': 'User $userId sent $messageCount messages in a short time period.',
          });
        }
      }
    }
    
    return suspiciousPatterns;
  }

  Future<List<String>> _checkDataIntegrity() async {
    final corruptedRooms = <String>[];
    
    for (final room in client.rooms) {
      try {
        // Basic integrity check - verify room state consistency
        final powerLevels = room.getState(EventTypes.RoomPowerLevels);
        final roomName = room.getState(EventTypes.RoomName);
        
        if (powerLevels != null && powerLevels.content.isEmpty) {
          corruptedRooms.add(room.id);
        }
        
        if (roomName != null && roomName.content['name'] is! String) {
          corruptedRooms.add(room.id);
        }
      } catch (e) {
        corruptedRooms.add(room.id);
      }
    }
    
    return corruptedRooms;
  }

  void _addVulnerability(SecurityVulnerability vulnerability) {
    // Check if vulnerability already exists
    final existingIndex = _vulnerabilities.indexWhere((v) => v.id == vulnerability.id);
    
    if (existingIndex != -1) {
      // Update existing vulnerability
      _vulnerabilities[existingIndex] = vulnerability;
    } else {
      // Add new vulnerability
      _vulnerabilities.add(vulnerability);
    }
  }

  Future<void> resolveVulnerability(String vulnerabilityId) async {
    final index = _vulnerabilities.indexWhere((v) => v.id == vulnerabilityId);
    
    if (index != -1) {
      _vulnerabilities[index] = _vulnerabilities[index].copyWith(
        isResolved: true,
        resolvedAt: DateTime.now(),
      );
      
      await _saveVulnerabilities();
    }
  }

  Future<void> _startContinuousMonitoring() async {
    _continuousMonitoringTimer = Timer.periodic(
      const Duration(hours: 6),
      (_) => performComprehensiveAudit(),
    );
  }

  Future<void> _loadVulnerabilities() async {
    final vulnerabilitiesJson = store.getString('security_vulnerabilities');
    if (vulnerabilitiesJson != null) {
      try {
        final vulnerabilitiesList = json.decode(vulnerabilitiesJson) as List;
        _vulnerabilities.clear();
        _vulnerabilities.addAll(
          vulnerabilitiesList.map((v) => SecurityVulnerability.fromJson(v)),
        );
      } catch (e) {
        Logs().e('Failed to load security vulnerabilities: $e');
      }
    }
  }

  Future<void> _saveVulnerabilities() async {
    try {
      final vulnerabilitiesJson = json.encode(
        _vulnerabilities.map((v) => v.toJson()).toList(),
      );
      await store.setString('security_vulnerabilities', vulnerabilitiesJson);
    } catch (e) {
      Logs().e('Failed to save security vulnerabilities: $e');
    }
  }

  void dispose() {
    _continuousMonitoringTimer?.cancel();
  }
}
