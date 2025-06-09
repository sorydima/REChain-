class EncryptionSettings {
  final bool encryptionEnabled;
  final String algorithm;
  final bool backupEnabled;
  final Duration? keyRotationPeriod;
  final bool requireVerification;
  final Map<String, dynamic>? additionalConfig;

  const EncryptionSettings({
    required this.encryptionEnabled,
    this.algorithm = 'm.megolm.v1.aes-sha2',
    this.backupEnabled = true,
    this.keyRotationPeriod,
    this.requireVerification = false,
    this.additionalConfig,
  });

  EncryptionSettings copyWith({
    bool? encryptionEnabled,
    String? algorithm,
    bool? backupEnabled,
    Duration? keyRotationPeriod,
    bool? requireVerification,
    Map<String, dynamic>? additionalConfig,
  }) {
    return EncryptionSettings(
      encryptionEnabled: encryptionEnabled ?? this.encryptionEnabled,
      algorithm: algorithm ?? this.algorithm,
      backupEnabled: backupEnabled ?? this.backupEnabled,
      keyRotationPeriod: keyRotationPeriod ?? this.keyRotationPeriod,
      requireVerification: requireVerification ?? this.requireVerification,
      additionalConfig: additionalConfig ?? this.additionalConfig,
    );
  }

  static EncryptionSettings createDefault() {
    return const EncryptionSettings(
      encryptionEnabled: true,
      algorithm: 'm.megolm.v1.aes-sha2',
      backupEnabled: true,
      keyRotationPeriod: Duration(days: 7),
      requireVerification: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'encryptionEnabled': encryptionEnabled,
      'algorithm': algorithm,
      'backupEnabled': backupEnabled,
      'keyRotationPeriod': keyRotationPeriod?.inMilliseconds,
      'requireVerification': requireVerification,
      'additionalConfig': additionalConfig,
    };
  }

  factory EncryptionSettings.fromJson(Map<String, dynamic> json) {
    return EncryptionSettings(
      encryptionEnabled: json['encryptionEnabled'] as bool,
      algorithm: json['algorithm'] as String,
      backupEnabled: json['backupEnabled'] as bool,
      keyRotationPeriod: json['keyRotationPeriod'] != null 
          ? Duration(milliseconds: json['keyRotationPeriod'] as int)
          : null,
      requireVerification: json['requireVerification'] as bool? ?? false,
      additionalConfig: json['additionalConfig'] as Map<String, dynamic>?,
    );
  }
}
