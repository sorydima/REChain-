import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'advanced_security_audit.dart';

enum ThreatType {
  maliciousLink,
  phishingAttempt,
  socialEngineering,
  spamMessage,
  suspiciousFile,
  dataExfiltration,
  bruteForceAttempt,
  accountTakeover,
  cryptojacking,
  malware,
}

class ThreatDetectionRule {
  final String id;
  final String name;
  final ThreatType threatType;
  final SecurityThreatLevel severity;
  final RegExp? pattern;
  final List<String>? keywords;
  final bool enabled;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ThreatDetectionRule({
    required this.id,
    required this.name,
    required this.threatType,
    required this.severity,
    this.pattern,
    this.keywords,
    this.enabled = true,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'threatType': threatType.name,
      'severity': severity.name,
      'pattern': pattern?.pattern,
      'keywords': keywords,
      'enabled': enabled,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ThreatDetectionRule.fromJson(Map<String, dynamic> json) {
    return ThreatDetectionRule(
      id: json['id'] as String,
      name: json['name'] as String,
      threatType: ThreatType.values.firstWhere(
        (e) => e.name == json['threatType'],
        orElse: () => ThreatType.suspiciousFile,
      ),
      severity: SecurityThreatLevel.values.firstWhere(
        (e) => e.name == json['severity'],
        orElse: () => SecurityThreatLevel.medium,
      ),
      pattern: json['pattern'] != null ? RegExp(json['pattern'] as String) : null,
      keywords: (json['keywords'] as List?)?.cast<String>(),
      enabled: json['enabled'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

class ThreatDetectionAlert {
  final String id;
  final ThreatType threatType;
  final SecurityThreatLevel severity;
  final String title;
  final String description;
  final String eventId;
  final String roomId;
  final String senderId;
  final DateTime detectedAt;
  final Map<String, dynamic> metadata;
  final bool acknowledged;
  final DateTime? acknowledgedAt;
  final String? acknowledgedBy;

  const ThreatDetectionAlert({
    required this.id,
    required this.threatType,
    required this.severity,
    required this.title,
    required this.description,
    required this.eventId,
    required this.roomId,
    required this.senderId,
    required this.detectedAt,
    this.metadata = const {},
    this.acknowledged = false,
    this.acknowledgedAt,
    this.acknowledgedBy,
  });

  ThreatDetectionAlert copyWith({
    bool? acknowledged,
    DateTime? acknowledgedAt,
    String? acknowledgedBy,
  }) {
    return ThreatDetectionAlert(
      id: id,
      threatType: threatType,
      severity: severity,
      title: title,
      description: description,
      eventId: eventId,
      roomId: roomId,
      senderId: senderId,
      detectedAt: detectedAt,
      metadata: metadata,
      acknowledged: acknowledged ?? this.acknowledged,
      acknowledgedAt: acknowledgedAt ?? this.acknowledgedAt,
      acknowledgedBy: acknowledgedBy ?? this.acknowledgedBy,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'threatType': threatType.name,
      'severity': severity.name,
      'title': title,
      'description': description,
      'eventId': eventId,
      'roomId': roomId,
      'senderId': senderId,
      'detectedAt': detectedAt.toIso8601String(),
      'metadata': metadata,
      'acknowledged': acknowledged,
      'acknowledgedAt': acknowledgedAt?.toIso8601String(),
      'acknowledgedBy': acknowledgedBy,
    };
  }

  factory ThreatDetectionAlert.fromJson(Map<String, dynamic> json) {
    return ThreatDetectionAlert(
      id: json['id'] as String,
      threatType: ThreatType.values.firstWhere(
        (e) => e.name == json['threatType'],
        orElse: () => ThreatType.suspiciousFile,
      ),
      severity: SecurityThreatLevel.values.firstWhere(
        (e) => e.name == json['severity'],
        orElse: () => SecurityThreatLevel.medium,
      ),
      title: json['title'] as String,
      description: json['description'] as String,
      eventId: json['eventId'] as String,
      roomId: json['roomId'] as String,
      senderId: json['senderId'] as String,
      detectedAt: DateTime.parse(json['detectedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>? ?? {},
      acknowledged: json['acknowledged'] as bool? ?? false,
      acknowledgedAt: json['acknowledgedAt'] != null
          ? DateTime.parse(json['acknowledgedAt'] as String)
          : null,
      acknowledgedBy: json['acknowledgedBy'] as String?,
    );
  }
}

class ThreatDetectionEngine {
  final Client client;
  final SharedPreferences store;
  
  final List<ThreatDetectionRule> _rules = [];
  final List<ThreatDetectionAlert> _alerts = [];
  final Map<String, int> _userThreatScores = {};
  final Map<String, List<DateTime>> _userActivityTimestamps = {};
  
  StreamSubscription<Event>? _eventSubscription;
  
  ThreatDetectionEngine({
    required this.client,
    required this.store,
  }) {
    _initializeDefaultRules();
    _loadRules();
    _loadAlerts();
    _startRealTimeMonitoring();
  }

  List<ThreatDetectionRule> get rules => List.unmodifiable(_rules);
  List<ThreatDetectionAlert> get alerts => List.unmodifiable(_alerts);
  List<ThreatDetectionAlert> get unacknowledgedAlerts =>
      _alerts.where((alert) => !alert.acknowledged).toList();

  void _initializeDefaultRules() {
    final now = DateTime.now();
    
    _rules.addAll([
      // Malicious link detection
      ThreatDetectionRule(
        id: 'malicious_link_1',
        name: 'Suspicious URL Patterns',
        threatType: ThreatType.maliciousLink,
        severity: SecurityThreatLevel.high,
        pattern: RegExp(r'https?://[a-z0-9-]+\.(?:tk|ml|ga|cf|bit\.ly|tinyurl\.com|t\.co)/[a-zA-Z0-9]+'),
        createdAt: now,
        updatedAt: now,
      ),
      
      // Phishing detection
      ThreatDetectionRule(
        id: 'phishing_1',
        name: 'Phishing Keywords',
        threatType: ThreatType.phishingAttempt,
        severity: SecurityThreatLevel.critical,
        keywords: [
          'verify your account',
          'click here to login',
          'urgent action required',
          'suspended account',
          'confirm your identity',
          'update payment method',
          'security alert',
          'unauthorized access detected',
        ],
        createdAt: now,
        updatedAt: now,
      ),
      
      // Social engineering detection
      ThreatDetectionRule(
        id: 'social_engineering_1',
        name: 'Social Engineering Tactics',
        threatType: ThreatType.socialEngineering,
        severity: SecurityThreatLevel.high,
        keywords: [
          'send me your password',
          'share your recovery phrase',
          'trust me',
          'this is confidential',
          'don\'t tell anyone',
          'quick money',
          'investment opportunity',
          'guaranteed returns',
        ],
        createdAt: now,
        updatedAt: now,
      ),
      
      // Spam detection
      ThreatDetectionRule(
        id: 'spam_1',
        name: 'Spam Patterns',
        threatType: ThreatType.spamMessage,
        severity: SecurityThreatLevel.medium,
        keywords: [
          'buy now',
          'limited time offer',
          'act fast',
          'free money',
          'work from home',
          'make money fast',
          'no experience required',
        ],
        createdAt: now,
        updatedAt: now,
      ),
      
      // Cryptocurrency scam detection
      ThreatDetectionRule(
        id: 'crypto_scam_1',
        name: 'Cryptocurrency Scams',
        threatType: ThreatType.cryptojacking,
        severity: SecurityThreatLevel.high,
        keywords: [
          'double your bitcoin',
          'free cryptocurrency',
          'mining opportunity',
          'crypto giveaway',
          'send bitcoin to receive',
          'ethereum doubler',
        ],
        createdAt: now,
        updatedAt: now,
      ),
      
      // Suspicious file patterns
      ThreatDetectionRule(
        id: 'suspicious_file_1',
        name: 'Suspicious File Extensions',
        threatType: ThreatType.suspiciousFile,
        severity: SecurityThreatLevel.high,
        pattern: RegExp(r'\.(exe|scr|bat|cmd|com|pif|vbs|js|jar|apk)$', caseSensitive: false),
        createdAt: now,
        updatedAt: now,
      ),
    ]);
  }

  void _startRealTimeMonitoring() {
    _eventSubscription = client.onEvent.stream.listen((event) {
      if (event.type == EventTypes.Message) {
        _analyzeEvent(event);
      }
    });
  }

  Future<void> _analyzeEvent(Event event) async {
    final content = event.content['body'] as String?;
    if (content == null || content.isEmpty) return;

    // Track user activity for behavioral analysis
    _trackUserActivity(event.senderId);

    // Check against all enabled rules
    for (final rule in _rules.where((r) => r.enabled)) {
      final threat = await _checkRule(rule, event, content);
      if (threat != null) {
        await _createAlert(threat, event);
      }
    }

    // Perform behavioral analysis
    await _performBehavioralAnalysis(event);
  }

  Future<ThreatType?> _checkRule(ThreatDetectionRule rule, Event event, String content) async {
    // Check pattern-based rules
    if (rule.pattern != null && rule.pattern!.hasMatch(content)) {
      return rule.threatType;
    }

    // Check keyword-based rules
    if (rule.keywords != null) {
      final lowerContent = content.toLowerCase();
      for (final keyword in rule.keywords!) {
        if (lowerContent.contains(keyword.toLowerCase())) {
          return rule.threatType;
        }
      }
    }

    // Special checks for file attachments
    if (event.content['msgtype'] == 'm.file' || event.content['msgtype'] == 'm.image') {
      final filename = event.content['filename'] as String?;
      if (filename != null && rule.pattern != null && rule.pattern!.hasMatch(filename)) {
        return rule.threatType;
      }
    }

    return null;
  }

  Future<void> _createAlert(ThreatType threatType, Event event) async {
    final alertId = 'alert_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
    
    final rule = _rules.firstWhere((r) => r.threatType == threatType);
    
    final alert = ThreatDetectionAlert(
      id: alertId,
      threatType: threatType,
      severity: rule.severity,
      title: _getThreatTitle(threatType),
      description: _getThreatDescription(threatType, event),
      eventId: event.eventId,
      roomId: event.roomId!,
      senderId: event.senderId,
      detectedAt: DateTime.now(),
      metadata: {
        'content': event.content['body'],
        'msgtype': event.content['msgtype'],
        'ruleName': rule.name,
      },
    );

    _alerts.add(alert);
    await _saveAlerts();

    // Update user threat score
    _updateUserThreatScore(event.senderId, rule.severity);

    Logs().w('Threat detected: ${alert.title} from ${event.senderId} in room ${event.roomId}');
  }

  void _trackUserActivity(String userId) {
    final now = DateTime.now();
    _userActivityTimestamps[userId] ??= [];
    _userActivityTimestamps[userId]!.add(now);

    // Keep only last 100 activities per user
    if (_userActivityTimestamps[userId]!.length > 100) {
      _userActivityTimestamps[userId]!.removeAt(0);
    }
  }

  Future<void> _performBehavioralAnalysis(Event event) async {
    final userId = event.senderId;
    final activities = _userActivityTimestamps[userId] ?? [];
    
    if (activities.length < 10) return; // Need sufficient data

    // Check for rapid-fire messaging (potential spam)
    final recentActivities = activities.where(
      (timestamp) => DateTime.now().difference(timestamp).inMinutes < 5,
    ).toList();

    if (recentActivities.length > 20) {
      await _createAlert(ThreatType.spamMessage, event);
    }

    // Check for unusual activity patterns
    final hourlyDistribution = <int, int>{};
    for (final activity in activities) {
      final hour = activity.hour;
      hourlyDistribution[hour] = (hourlyDistribution[hour] ?? 0) + 1;
    }

    // Detect bot-like behavior (activity concentrated in specific hours)
    final maxHourlyActivity = hourlyDistribution.values.reduce(max);
    final totalActivity = activities.length;
    
    if (maxHourlyActivity > totalActivity * 0.8) {
      // More than 80% of activity in a single hour suggests bot behavior
      final suspiciousAlert = ThreatDetectionAlert(
        id: 'behavioral_${DateTime.now().millisecondsSinceEpoch}',
        threatType: ThreatType.suspiciousFile, // Using as general suspicious activity
        severity: SecurityThreatLevel.medium,
        title: 'Suspicious Activity Pattern',
        description: 'User $userId shows bot-like activity patterns',
        eventId: event.eventId,
        roomId: event.roomId!,
        senderId: userId,
        detectedAt: DateTime.now(),
        metadata: {
          'analysis': 'concentrated_activity',
          'maxHourlyPercentage': (maxHourlyActivity / totalActivity * 100).round(),
        },
      );

      _alerts.add(suspiciousAlert);
      await _saveAlerts();
    }
  }

  void _updateUserThreatScore(String userId, SecurityThreatLevel severity) {
    final currentScore = _userThreatScores[userId] ?? 0;
    int scoreIncrease;

    switch (severity) {
      case SecurityThreatLevel.low:
        scoreIncrease = 1;
        break;
      case SecurityThreatLevel.medium:
        scoreIncrease = 5;
        break;
      case SecurityThreatLevel.high:
        scoreIncrease = 15;
        break;
      case SecurityThreatLevel.critical:
        scoreIncrease = 50;
        break;
    }

    _userThreatScores[userId] = currentScore + scoreIncrease;
  }

  String _getThreatTitle(ThreatType threatType) {
    switch (threatType) {
      case ThreatType.maliciousLink:
        return 'Malicious Link Detected';
      case ThreatType.phishingAttempt:
        return 'Phishing Attempt Detected';
      case ThreatType.socialEngineering:
        return 'Social Engineering Attempt';
      case ThreatType.spamMessage:
        return 'Spam Message Detected';
      case ThreatType.suspiciousFile:
        return 'Suspicious File Attachment';
      case ThreatType.dataExfiltration:
        return 'Potential Data Exfiltration';
      case ThreatType.bruteForceAttempt:
        return 'Brute Force Attempt';
      case ThreatType.accountTakeover:
        return 'Account Takeover Attempt';
      case ThreatType.cryptojacking:
        return 'Cryptocurrency Scam Detected';
      case ThreatType.malware:
        return 'Malware Detected';
    }
  }

  String _getThreatDescription(ThreatType threatType, Event event) {
    final content = event.content['body'] as String? ?? '';
    final truncatedContent = content.length > 100 
        ? '${content.substring(0, 100)}...' 
        : content;

    switch (threatType) {
      case ThreatType.maliciousLink:
        return 'A potentially malicious link was detected in the message: "$truncatedContent"';
      case ThreatType.phishingAttempt:
        return 'Message contains phishing indicators: "$truncatedContent"';
      case ThreatType.socialEngineering:
        return 'Message shows signs of social engineering tactics: "$truncatedContent"';
      case ThreatType.spamMessage:
        return 'Message identified as spam: "$truncatedContent"';
      case ThreatType.suspiciousFile:
        return 'Suspicious file attachment detected';
      case ThreatType.dataExfiltration:
        return 'Potential attempt to extract sensitive data';
      case ThreatType.bruteForceAttempt:
        return 'Multiple failed authentication attempts detected';
      case ThreatType.accountTakeover:
        return 'Suspicious account activity suggesting takeover attempt';
      case ThreatType.cryptojacking:
        return 'Cryptocurrency scam detected: "$truncatedContent"';
      case ThreatType.malware:
        return 'Potential malware detected in attachment';
    }
  }

  Future<void> acknowledgeAlert(String alertId, String acknowledgedBy) async {
    final index = _alerts.indexWhere((alert) => alert.id == alertId);
    if (index != -1) {
      _alerts[index] = _alerts[index].copyWith(
        acknowledged: true,
        acknowledgedAt: DateTime.now(),
        acknowledgedBy: acknowledgedBy,
      );
      await _saveAlerts();
    }
  }

  int getUserThreatScore(String userId) {
    return _userThreatScores[userId] ?? 0;
  }

  List<String> getHighRiskUsers() {
    return _userThreatScores.entries
        .where((entry) => entry.value > 50)
        .map((entry) => entry.key)
        .toList();
  }

  Future<void> addCustomRule(ThreatDetectionRule rule) async {
    _rules.add(rule);
    await _saveRules();
  }

  Future<void> updateRule(ThreatDetectionRule rule) async {
    final index = _rules.indexWhere((r) => r.id == rule.id);
    if (index != -1) {
      _rules[index] = rule;
      await _saveRules();
    }
  }

  Future<void> deleteRule(String ruleId) async {
    _rules.removeWhere((rule) => rule.id == ruleId);
    await _saveRules();
  }

  Future<void> _loadRules() async {
    final rulesJson = store.getString('threat_detection_rules');
    if (rulesJson != null) {
      try {
        final rulesList = json.decode(rulesJson) as List;
        _rules.addAll(rulesList.map((r) => ThreatDetectionRule.fromJson(r)));
      } catch (e) {
        Logs().e('Failed to load threat detection rules: $e');
      }
    }
  }

  Future<void> _saveRules() async {
    try {
      final rulesJson = json.encode(_rules.map((r) => r.toJson()).toList());
      await store.setString('threat_detection_rules', rulesJson);
    } catch (e) {
      Logs().e('Failed to save threat detection rules: $e');
    }
  }

  Future<void> _loadAlerts() async {
    final alertsJson = store.getString('threat_detection_alerts');
    if (alertsJson != null) {
      try {
        final alertsList = json.decode(alertsJson) as List;
        _alerts.addAll(alertsList.map((a) => ThreatDetectionAlert.fromJson(a)));
      } catch (e) {
        Logs().e('Failed to load threat detection alerts: $e');
      }
    }
  }

  Future<void> _saveAlerts() async {
    try {
      final alertsJson = json.encode(_alerts.map((a) => a.toJson()).toList());
      await store.setString('threat_detection_alerts', alertsJson);
    } catch (e) {
      Logs().e('Failed to save threat detection alerts: $e');
    }
  }

  void dispose() {
    _eventSubscription?.cancel();
  }
}
