import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';

import 'message_retention_policy.dart';
import 'encryption_settings.dart';

class SecurityManager {
  static const String _retentionPolicyKey = 'message_retention_policies';
  static const String _encryptionSettingsKey = 'encryption_settings';
  static const String _secureStoragePrefix = 'rechain_secure_';
  
  final SharedPreferences _prefs;
  final Client _client;
  final FlutterSecureStorage _secureStorage;
  
  final Map<String, MessageRetentionPolicy> _retentionPolicies = {};
  final Map<String, EncryptionSettings> _encryptionSettings = {};
  
  final StreamController<Map<String, MessageRetentionPolicy>> _retentionController = 
      StreamController<Map<String, MessageRetentionPolicy>>.broadcast();
  
  final StreamController<Map<String, EncryptionSettings>> _encryptionController = 
      StreamController<Map<String, EncryptionSettings>>.broadcast();
  
  Stream<Map<String, MessageRetentionPolicy>> get retentionPoliciesStream => 
      _retentionController.stream;
  
  Stream<Map<String, EncryptionSettings>> get encryptionSettingsStream => 
      _encryptionController.stream;
  
  Timer? _cleanupTimer;
  
  SecurityManager(this._prefs, this._client) 
      : _secureStorage = const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
          iOptions: IOSOptions(
            accessibility: KeychainAccessibility.first_unlock_this_device,
          ),
        ) {
    _loadSettings();
    _startCleanupTimer();
  }
  
  Future<void> _loadSettings() async {
    // Load retention policies
    final retentionJson = _prefs.getString(_retentionPolicyKey);
    if (retentionJson != null) {
      final Map<String, dynamic> policies = json.decode(retentionJson);
      for (final entry in policies.entries) {
        _retentionPolicies[entry.key] = MessageRetentionPolicy.fromJson(entry.value);
      }
    }
    
    // Load encryption settings
    final encryptionJson = _prefs.getString(_encryptionSettingsKey);
    if (encryptionJson != null) {
      final Map<String, dynamic> settings = json.decode(encryptionJson);
      for (final entry in settings.entries) {
        _encryptionSettings[entry.key] = EncryptionSettings.fromJson(entry.value);
      }
    }
    
    _retentionController.add(Map.from(_retentionPolicies));
    _encryptionController.add(Map.from(_encryptionSettings));
  }
  
  Future<void> _saveSettings() async {
    // Save retention policies
    final retentionMap = <String, dynamic>{};
    for (final entry in _retentionPolicies.entries) {
      retentionMap[entry.key] = entry.value.toJson();
    }
    await _prefs.setString(_retentionPolicyKey, json.encode(retentionMap));
    
    // Save encryption settings
    final encryptionMap = <String, dynamic>{};
    for (final entry in _encryptionSettings.entries) {
      encryptionMap[entry.key] = entry.value.toJson();
    }
    await _prefs.setString(_encryptionSettingsKey, json.encode(encryptionMap));
  }
  
  // Message Retention Management
  Future<void> setRetentionPolicy(String roomId, MessageRetentionPolicy policy) async {
    _retentionPolicies[roomId] = policy;
    await _saveSettings();
    _retentionController.add(Map.from(_retentionPolicies));
    
    // Apply policy immediately if needed
    if (policy.enabled) {
      await _applyRetentionPolicy(roomId, policy);
    }
  }
  
  Future<void> removeRetentionPolicy(String roomId) async {
    _retentionPolicies.remove(roomId);
    await _saveSettings();
    _retentionController.add(Map.from(_retentionPolicies));
  }
  
  MessageRetentionPolicy? getRetentionPolicy(String roomId) {
    return _retentionPolicies[roomId];
  }
  
  Future<void> _applyRetentionPolicy(String roomId, MessageRetentionPolicy policy) async {
    try {
      final room = _client.getRoomById(roomId);
      if (room == null) return;
      
      final timeline = await room.getTimeline();
      final events = timeline.events;
      
      final now = DateTime.now();
      final eventsToDelete = <Event>[];
      
      for (final event in events) {
        final eventAge = now.difference(event.originServerTs);
        
        // Check age-based retention
        if (policy.maxAge != null && eventAge > policy.maxAge!) {
          eventsToDelete.add(event);
          continue;
        }
        
        // Check count-based retention
        if (policy.maxMessages != null && 
            events.indexOf(event) >= policy.maxMessages!) {
          eventsToDelete.add(event);
          continue;
        }
        
        // Check type-based retention
        if (policy.retainTypes != null && 
            !policy.retainTypes!.contains(event.type)) {
          if (eventAge > (policy.typeRetentionDuration ?? const Duration(days: 1))) {
            eventsToDelete.add(event);
          }
        }
      }
      
      // Delete events (redact them)
      for (final event in eventsToDelete) {
        try {
          await event.redactEvent(reason: 'Automatic retention policy cleanup');
        } catch (e) {
          Logs().w('Failed to redact event ${event.eventId}: $e');
        }
      }
      
      Logs().i('Applied retention policy to room $roomId: ${eventsToDelete.length} events cleaned up');
    } catch (e) {
      Logs().e('Failed to apply retention policy to room $roomId: $e');
    }
  }
  
  void _startCleanupTimer() {
    _cleanupTimer = Timer.periodic(const Duration(hours: 6), (_) {
      _performScheduledCleanup();
    });
  }
  
  Future<void> _performScheduledCleanup() async {
    for (final entry in _retentionPolicies.entries) {
      if (entry.value.enabled) {
        await _applyRetentionPolicy(entry.key, entry.value);
      }
    }
  }
  
  // Enhanced Encryption Management
  Future<void> setEncryptionSettings(String roomId, EncryptionSettings settings) async {
    _encryptionSettings[roomId] = settings;
    await _saveSettings();
    _encryptionController.add(Map.from(_encryptionSettings));
    
    // Apply encryption settings to room
    await _applyEncryptionSettings(roomId, settings);
  }
  
  Future<void> removeEncryptionSettings(String roomId) async {
    _encryptionSettings.remove(roomId);
    await _saveSettings();
    _encryptionController.add(Map.from(_encryptionSettings));
  }
  
  EncryptionSettings? getEncryptionSettings(String roomId) {
    return _encryptionSettings[roomId];
  }
  
  Future<void> _applyEncryptionSettings(String roomId, EncryptionSettings settings) async {
    try {
      final room = _client.getRoomById(roomId);
      if (room == null) return;
      
      // Enable/disable encryption
      if (settings.encryptionEnabled && !room.encrypted) {
        await room.enableEncryption();
      }
      
      // Set key rotation period
      if (settings.keyRotationPeriod != null) {
        // This would require custom implementation in the Matrix SDK
        // For now, we'll store the setting for future use
        Logs().i('Key rotation period set for room $roomId: ${settings.keyRotationPeriod}');
      }
      
      // Configure verification requirements
      if (settings.requireVerification) {
        // Store verification requirement for this room
        await _secureStorage.write(
          key: '${_secureStoragePrefix}verification_required_$roomId',
          value: 'true',
        );
      }
      
    } catch (e) {
      Logs().e('Failed to apply encryption settings to room $roomId: $e');
    }
  }
  
  // Secure Key Management
  Future<void> storeSecureKey(String keyId, String key) async {
    await _secureStorage.write(
      key: '$_secureStoragePrefix$keyId',
      value: key,
    );
  }
  
  Future<String?> getSecureKey(String keyId) async {
    return await _secureStorage.read(key: '$_secureStoragePrefix$keyId');
  }
  
  Future<void> deleteSecureKey(String keyId) async {
    await _secureStorage.delete(key: '$_secureStoragePrefix$keyId');
  }
  
  // Recovery Phrase Management
  Future<void> storeRecoveryPhrase(String phrase) async {
    final hashedPhrase = sha256.convert(utf8.encode(phrase)).toString();
    await _secureStorage.write(
      key: '${_secureStoragePrefix}recovery_phrase_hash',
      value: hashedPhrase,
    );
    await _secureStorage.write(
      key: '${_secureStoragePrefix}recovery_phrase',
      value: phrase,
    );
  }
  
  Future<String?> getRecoveryPhrase() async {
    return await _secureStorage.read(key: '${_secureStoragePrefix}recovery_phrase');
  }
  
  Future<bool> verifyRecoveryPhrase(String phrase) async {
    final storedHash = await _secureStorage.read(
      key: '${_secureStoragePrefix}recovery_phrase_hash',
    );
    if (storedHash == null) return false;
    
    final inputHash = sha256.convert(utf8.encode(phrase)).toString();
    return storedHash == inputHash;
  }
  
  // Enhanced Backup Management
  Future<Map<String, dynamic>> createSecureBackup() async {
    try {
      final backup = <String, dynamic>{
        'timestamp': DateTime.now().toIso8601String(),
        'client_id': _client.clientName,
        'user_id': _client.userID,
        'device_id': _client.deviceID,
        'retention_policies': _retentionPolicies.map((k, v) => MapEntry(k, v.toJson())),
        'encryption_settings': _encryptionSettings.map((k, v) => MapEntry(k, v.toJson())),
      };
      
      // Add encrypted keys if available
      final recoveryPhrase = await getRecoveryPhrase();
      if (recoveryPhrase != null) {
        backup['has_recovery_phrase'] = true;
      }
      
      return backup;
    } catch (e) {
      Logs().e('Failed to create secure backup: $e');
      rethrow;
    }
  }
  
  Future<void> restoreFromSecureBackup(Map<String, dynamic> backup) async {
    try {
      // Restore retention policies
      if (backup['retention_policies'] != null) {
        final policies = backup['retention_policies'] as Map<String, dynamic>;
        _retentionPolicies.clear();
        for (final entry in policies.entries) {
          _retentionPolicies[entry.key] = MessageRetentionPolicy.fromJson(entry.value);
        }
      }
      
      // Restore encryption settings
      if (backup['encryption_settings'] != null) {
        final settings = backup['encryption_settings'] as Map<String, dynamic>;
        _encryptionSettings.clear();
        for (final entry in settings.entries) {
          _encryptionSettings[entry.key] = EncryptionSettings.fromJson(entry.value);
        }
      }
      
      await _saveSettings();
      _retentionController.add(Map.from(_retentionPolicies));
      _encryptionController.add(Map.from(_encryptionSettings));
      
      Logs().i('Successfully restored security settings from backup');
    } catch (e) {
      Logs().e('Failed to restore from secure backup: $e');
      rethrow;
    }
  }
  
  Map<String, MessageRetentionPolicy> get retentionPolicies => 
      Map.unmodifiable(_retentionPolicies);
  
  Map<String, EncryptionSettings> get encryptionSettings => 
      Map.unmodifiable(_encryptionSettings);
  
  /// Perform a comprehensive security audit
  Future<SecurityAuditReport> performSecurityAudit() async {
    final report = SecurityAuditReport(
      timestamp: DateTime.now(),
      clientId: _client.clientName,
      userId: _client.userID ?? 'unknown',
    );
    
    try {
      // Count encrypted vs unencrypted rooms
      for (final room in _client.rooms) {
        if (room.encrypted) {
          report.encryptedRooms++;
        } else {
          report.unencryptedRooms++;
        }
        
        // Check for retention policies
        if (_retentionPolicies.containsKey(room.id)) {
          report.roomsWithRetentionPolicies++;
        }
      }
      
      // Count verified vs unverified devices
      final devices = await _client.getDevices();
      if (devices != null) {
        for (final device in devices) {
          if (device.verified == true) {
            report.verifiedDevices++;
          } else {
            report.unverifiedDevices++;
          }
        }
      }
      
      // Check for recovery phrase
      final recoveryPhrase = await getRecoveryPhrase();
      report.hasRecoveryPhrase = recoveryPhrase != null;
      
      Logs().i('Security audit completed: ${report.overallSecurityScore}% overall score');
      return report;
    } catch (e) {
      Logs().e('Security audit failed: $e');
      rethrow;
    }
  }
  
  void dispose() {
    _cleanupTimer?.cancel();
    _retentionController.close();
    _encryptionController.close();
  }
}


class SecurityAlert {
  final String type;
  final String severity;
  final String message;
  final DateTime timestamp;

  SecurityAlert({
    required this.type,
    required this.severity,
    required this.message,
    required this.timestamp,
  });
}

class SecurityVulnerability {
  final String type;
  final String severity;
  final String description;

  SecurityVulnerability({
    required this.type,
    required this.severity,
    required this.description,
  });
}


class SecurityAuditReport {
  final DateTime timestamp;
  final String clientId;
  final String userId;
  int encryptedRooms = 0;
  int unencryptedRooms = 0;
  int roomsWithRetentionPolicies = 0;
  int verifiedDevices = 0;
  int unverifiedDevices = 0;
  bool hasRecoveryPhrase = false;
  
  SecurityAuditReport({
    required this.timestamp,
    required this.clientId,
    required this.userId,
  });
  
  double get encryptionScore {
    final total = encryptedRooms + unencryptedRooms;
    if (total == 0) return 0.0;
    return (encryptedRooms / total) * 100;
  }
  
  double get verificationScore {
    final total = verifiedDevices + unverifiedDevices;
    if (total == 0) return 0.0;
    return (verifiedDevices / total) * 100;
  }
  
  double get overallSecurityScore {
    double score = 0.0;
    int factors = 0;
    
    // Encryption score (40% weight)
    score += encryptionScore * 0.4;
    factors++;
    
    // Verification score (30% weight)
    score += verificationScore * 0.3;
    factors++;
    
    // Recovery phrase (20% weight)
    if (hasRecoveryPhrase) {
      score += 20.0;
    }
    factors++;
    
    // Retention policies (10% weight)
    if (roomsWithRetentionPolicies > 0) {
      score += 10.0;
    }
    factors++;
    
    return score;
  }
  
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
      'clientId': clientId,
      'userId': userId,
      'encryptedRooms': encryptedRooms,
      'unencryptedRooms': unencryptedRooms,
      'roomsWithRetentionPolicies': roomsWithRetentionPolicies,
      'verifiedDevices': verifiedDevices,
      'unverifiedDevices': unverifiedDevices,
      'hasRecoveryPhrase': hasRecoveryPhrase,
      'encryptionScore': encryptionScore,
      'verificationScore': verificationScore,
      'overallSecurityScore': overallSecurityScore,
    };
  }
}
