import 'dart:convert';

enum BridgeConnectionStatus {
  disconnected,
  connecting,
  connected,
  configuring,
  configured,
  starting,
  stopping,
  error,
  maintenance,
}

class BridgeStatus {
  final String type;
  final BridgeConnectionStatus status;
  final DateTime lastChecked;
  final String? errorMessage;
  final Map<String, dynamic>? metadata;
  final int? connectedUsers;
  final int? activeRooms;
  final DateTime? lastActivity;
  final double? uptime;

  const BridgeStatus({
    required this.type,
    required this.status,
    required this.lastChecked,
    this.errorMessage,
    this.metadata,
    this.connectedUsers,
    this.activeRooms,
    this.lastActivity,
    this.uptime,
  });

  BridgeStatus copyWith({
    String? type,
    BridgeConnectionStatus? status,
    DateTime? lastChecked,
    String? errorMessage,
    Map<String, dynamic>? metadata,
    int? connectedUsers,
    int? activeRooms,
    DateTime? lastActivity,
    double? uptime,
  }) {
    return BridgeStatus(
      type: type ?? this.type,
      status: status ?? this.status,
      lastChecked: lastChecked ?? this.lastChecked,
      errorMessage: errorMessage ?? this.errorMessage,
      metadata: metadata ?? this.metadata,
      connectedUsers: connectedUsers ?? this.connectedUsers,
      activeRooms: activeRooms ?? this.activeRooms,
      lastActivity: lastActivity ?? this.lastActivity,
      uptime: uptime ?? this.uptime,
    );
  }

  bool get isHealthy => status == BridgeConnectionStatus.connected;
  bool get hasError => status == BridgeConnectionStatus.error;
  bool get isConfigured => status != BridgeConnectionStatus.disconnected;

  String get statusText {
    switch (status) {
      case BridgeConnectionStatus.disconnected:
        return 'Disconnected';
      case BridgeConnectionStatus.connecting:
        return 'Connecting...';
      case BridgeConnectionStatus.connected:
        return 'Connected';
      case BridgeConnectionStatus.configuring:
        return 'Configuring...';
      case BridgeConnectionStatus.configured:
        return 'Configured';
      case BridgeConnectionStatus.starting:
        return 'Starting...';
      case BridgeConnectionStatus.stopping:
        return 'Stopping...';
      case BridgeConnectionStatus.error:
        return 'Error';
      case BridgeConnectionStatus.maintenance:
        return 'Maintenance';
    }
  }

  String get statusIcon {
    switch (status) {
      case BridgeConnectionStatus.disconnected:
        return '⚫';
      case BridgeConnectionStatus.connecting:
      case BridgeConnectionStatus.configuring:
      case BridgeConnectionStatus.starting:
        return '🟡';
      case BridgeConnectionStatus.connected:
        return '🟢';
      case BridgeConnectionStatus.configured:
        return '🔵';
      case BridgeConnectionStatus.stopping:
        return '🟠';
      case BridgeConnectionStatus.error:
        return '🔴';
      case BridgeConnectionStatus.maintenance:
        return '🟣';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'status': status.name,
      'lastChecked': lastChecked.toIso8601String(),
      'errorMessage': errorMessage,
      'metadata': metadata,
      'connectedUsers': connectedUsers,
      'activeRooms': activeRooms,
      'lastActivity': lastActivity?.toIso8601String(),
      'uptime': uptime,
    };
  }

  factory BridgeStatus.fromJson(Map<String, dynamic> json) {
    return BridgeStatus(
      type: json['type'] as String,
      status: BridgeConnectionStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => BridgeConnectionStatus.disconnected,
      ),
      lastChecked: DateTime.parse(json['lastChecked'] as String),
      errorMessage: json['errorMessage'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      connectedUsers: json['connectedUsers'] as int?,
      activeRooms: json['activeRooms'] as int?,
      lastActivity: json['lastActivity'] != null
          ? DateTime.parse(json['lastActivity'] as String)
          : null,
      uptime: json['uptime'] as double?,
    );
  }

  @override
  String toString() {
    return 'BridgeStatus(type: $type, status: $status, lastChecked: $lastChecked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BridgeStatus &&
        other.type == type &&
        other.status == status &&
        other.lastChecked == lastChecked;
  }

  @override
  int get hashCode {
    return type.hashCode ^ status.hashCode ^ lastChecked.hashCode;
  }
}

class BridgeHealthMetrics {
  final String bridgeType;
  final DateTime timestamp;
  final double cpuUsage;
  final double memoryUsage;
  final int messagesSent;
  final int messagesReceived;
  final int errors;
  final double responseTime;

  const BridgeHealthMetrics({
    required this.bridgeType,
    required this.timestamp,
    required this.cpuUsage,
    required this.memoryUsage,
    required this.messagesSent,
    required this.messagesReceived,
    required this.errors,
    required this.responseTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'bridgeType': bridgeType,
      'timestamp': timestamp.toIso8601String(),
      'cpuUsage': cpuUsage,
      'memoryUsage': memoryUsage,
      'messagesSent': messagesSent,
      'messagesReceived': messagesReceived,
      'errors': errors,
      'responseTime': responseTime,
    };
  }

  factory BridgeHealthMetrics.fromJson(Map<String, dynamic> json) {
    return BridgeHealthMetrics(
      bridgeType: json['bridgeType'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      cpuUsage: json['cpuUsage'] as double,
      memoryUsage: json['memoryUsage'] as double,
      messagesSent: json['messagesSent'] as int,
      messagesReceived: json['messagesReceived'] as int,
      errors: json['errors'] as int,
      responseTime: json['responseTime'] as double,
    );
  }
}

class BridgeStatistics {
  final String bridgeType;
  final DateTime startTime;
  final int totalMessages;
  final int totalUsers;
  final int totalRooms;
  final Map<String, int> messagesByType;
  final List<BridgeHealthMetrics> recentMetrics;

  const BridgeStatistics({
    required this.bridgeType,
    required this.startTime,
    required this.totalMessages,
    required this.totalUsers,
    required this.totalRooms,
    required this.messagesByType,
    required this.recentMetrics,
  });

  Duration get uptime => DateTime.now().difference(startTime);

  double get averageResponseTime {
    if (recentMetrics.isEmpty) return 0.0;
    return recentMetrics
            .map((m) => m.responseTime)
            .reduce((a, b) => a + b) /
        recentMetrics.length;
  }

  double get errorRate {
    if (recentMetrics.isEmpty) return 0.0;
    final totalErrors = recentMetrics.map((m) => m.errors).reduce((a, b) => a + b);
    final totalMessages = recentMetrics
        .map((m) => m.messagesSent + m.messagesReceived)
        .reduce((a, b) => a + b);
    return totalMessages > 0 ? (totalErrors / totalMessages) * 100 : 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      'bridgeType': bridgeType,
      'startTime': startTime.toIso8601String(),
      'totalMessages': totalMessages,
      'totalUsers': totalUsers,
      'totalRooms': totalRooms,
      'messagesByType': messagesByType,
      'recentMetrics': recentMetrics.map((m) => m.toJson()).toList(),
    };
  }

  factory BridgeStatistics.fromJson(Map<String, dynamic> json) {
    return BridgeStatistics(
      bridgeType: json['bridgeType'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      totalMessages: json['totalMessages'] as int,
      totalUsers: json['totalUsers'] as int,
      totalRooms: json['totalRooms'] as int,
      messagesByType: Map<String, int>.from(json['messagesByType'] as Map),
      recentMetrics: (json['recentMetrics'] as List)
          .map((m) => BridgeHealthMetrics.fromJson(m as Map<String, dynamic>))
          .toList(),
    );
  }
}
