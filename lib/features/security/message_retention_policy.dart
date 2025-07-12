class MessageRetentionPolicy {
  final bool enabled;
  final Duration retentionPeriod;
  final bool deleteAfterRead;
  final bool autoDeleteMedia;
  final Duration mediaRetentionPeriod;
  final Duration? maxAge;
  final int? maxMessages;
  final List<String>? retainTypes;
  final Duration? typeRetentionDuration;
  final Map<String, dynamic>? additionalConfig;

  const MessageRetentionPolicy({
    required this.enabled,
    required this.retentionPeriod,
    this.deleteAfterRead = false,
    this.autoDeleteMedia = false,
    required this.mediaRetentionPeriod,
    this.maxAge,
    this.maxMessages,
    this.retainTypes,
    this.typeRetentionDuration,
    this.additionalConfig,
  });

  MessageRetentionPolicy copyWith({
    bool? enabled,
    Duration? retentionPeriod,
    bool? deleteAfterRead,
    bool? autoDeleteMedia,
    Duration? mediaRetentionPeriod,
    Duration? maxAge,
    int? maxMessages,
    List<String>? retainTypes,
    Duration? typeRetentionDuration,
    Map<String, dynamic>? additionalConfig,
  }) {
    return MessageRetentionPolicy(
      enabled: enabled ?? this.enabled,
      retentionPeriod: retentionPeriod ?? this.retentionPeriod,
      deleteAfterRead: deleteAfterRead ?? this.deleteAfterRead,
      autoDeleteMedia: autoDeleteMedia ?? this.autoDeleteMedia,
      mediaRetentionPeriod: mediaRetentionPeriod ?? this.mediaRetentionPeriod,
      maxAge: maxAge ?? this.maxAge,
      maxMessages: maxMessages ?? this.maxMessages,
      retainTypes: retainTypes ?? this.retainTypes,
      typeRetentionDuration: typeRetentionDuration ?? this.typeRetentionDuration,
      additionalConfig: additionalConfig ?? this.additionalConfig,
    );
  }

  static MessageRetentionPolicy createDefault() {
    return const MessageRetentionPolicy(
      enabled: false,
      retentionPeriod: Duration(days: 365),
      deleteAfterRead: false,
      autoDeleteMedia: false,
      mediaRetentionPeriod: Duration(days: 30),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'retentionPeriod': retentionPeriod.inMilliseconds,
      'deleteAfterRead': deleteAfterRead,
      'autoDeleteMedia': autoDeleteMedia,
      'mediaRetentionPeriod': mediaRetentionPeriod.inMilliseconds,
      'maxAge': maxAge?.inMilliseconds,
      'maxMessages': maxMessages,
      'retainTypes': retainTypes,
      'typeRetentionDuration': typeRetentionDuration?.inMilliseconds,
      'additionalConfig': additionalConfig,
    };
  }

  factory MessageRetentionPolicy.fromJson(Map<String, dynamic> json) {
    return MessageRetentionPolicy(
      enabled: json['enabled'] as bool,
      retentionPeriod: Duration(milliseconds: json['retentionPeriod'] as int),
      deleteAfterRead: json['deleteAfterRead'] as bool? ?? false,
      autoDeleteMedia: json['autoDeleteMedia'] as bool? ?? false,
      mediaRetentionPeriod: Duration(milliseconds: json['mediaRetentionPeriod'] as int),
      maxAge: json['maxAge'] != null 
          ? Duration(milliseconds: json['maxAge'] as int)
          : null,
      maxMessages: json['maxMessages'] as int?,
      retainTypes: (json['retainTypes'] as List<dynamic>?)?.cast<String>(),
      typeRetentionDuration: json['typeRetentionDuration'] != null 
          ? Duration(milliseconds: json['typeRetentionDuration'] as int)
          : null,
      additionalConfig: json['additionalConfig'] as Map<String, dynamic>?,
    );
  }
}
