class BridgeInfo {
  final String id;
  final String name;
  final String description;
  final String protocol;
  final bool enabled;
  final Map<String, dynamic>? config;
  final Map<String, dynamic>? metadata;

  const BridgeInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.protocol,
    this.enabled = false,
    this.config,
    this.metadata,
  });

  BridgeInfo copyWith({
    String? id,
    String? name,
    String? description,
    String? protocol,
    bool? enabled,
    Map<String, dynamic>? config,
    Map<String, dynamic>? metadata,
  }) {
    return BridgeInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      protocol: protocol ?? this.protocol,
      enabled: enabled ?? this.enabled,
      config: config ?? this.config,
      metadata: metadata ?? this.metadata,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'protocol': protocol,
      'enabled': enabled,
      'config': config,
      'metadata': metadata,
    };
  }

  factory BridgeInfo.fromJson(Map<String, dynamic> json) {
    return BridgeInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      protocol: json['protocol'] as String,
      enabled: json['enabled'] as bool? ?? false,
      config: json['config'] as Map<String, dynamic>?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }
}
