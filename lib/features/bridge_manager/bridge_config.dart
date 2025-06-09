class BridgeConfig {
  final String type;
  final String name;
  final String apiKey;
  final Map<String, dynamic> settings;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int port;
  final Map<String, dynamic> configuration;
  final bool enabled;

  const BridgeConfig({
    required this.type,
    required this.name,
    required this.apiKey,
    required this.settings,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.port = 8080,
    this.configuration = const {},
    this.enabled = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'apiKey': apiKey,
      'settings': settings,
      'id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'port': port,
      'configuration': configuration,
      'enabled': enabled,
    };
  }

  factory BridgeConfig.fromJson(Map<String, dynamic> json) {
    return BridgeConfig(
      type: json['type'] as String,
      name: json['name'] as String,
      apiKey: json['apiKey'] as String,
      settings: Map<String, dynamic>.from(json['settings'] as Map),
      id: json['id'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null,
      port: json['port'] as int? ?? 8080,
      configuration: Map<String, dynamic>.from(json['configuration'] as Map? ?? {}),
      enabled: json['enabled'] as bool? ?? false,
    );
  }

  BridgeConfig copyWith({
    String? type,
    String? name,
    String? apiKey,
    Map<String, dynamic>? settings,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? port,
    Map<String, dynamic>? configuration,
    bool? enabled,
  }) {
    return BridgeConfig(
      type: type ?? this.type,
      name: name ?? this.name,
      apiKey: apiKey ?? this.apiKey,
      settings: settings ?? this.settings,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      port: port ?? this.port,
      configuration: configuration ?? this.configuration,
      enabled: enabled ?? this.enabled,
    );
  }
}
