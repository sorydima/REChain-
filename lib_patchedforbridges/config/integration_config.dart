/// Integration Configuration
class IntegrationConfig {
  // Prometheus Configuration
  static const String prometheusBaseUrl = String.fromEnvironment(
    'PROMETHEUS_BASE_URL',
    defaultValue: 'https://prometheus.example.com',
  );
  static const String prometheusApiKey = String.fromEnvironment(
    'PROMETHEUS_API_KEY',
    defaultValue: '',
  );

  // Grafana Configuration
  static const String grafanaBaseUrl = String.fromEnvironment(
    'GRAFANA_BASE_URL',
    defaultValue: 'https://grafana.example.com',
  );
  static const String grafanaApiKey = String.fromEnvironment(
    'GRAFANA_API_KEY',
    defaultValue: '',
  );

  // Gigachat Configuration
  static const String gigachatBaseUrl = String.fromEnvironment(
    'GIGACHAT_BASE_URL',
    defaultValue: 'https://gigachat.example.com',
  );
  static const String gigachatApiKey = String.fromEnvironment(
    'GIGACHAT_API_KEY',
    defaultValue: '',
  );

  // Gigacode Configuration
  static const String gigacodeBaseUrl = String.fromEnvironment(
    'GIGACODE_BASE_URL',
    defaultValue: 'https://gigacode.example.com',
  );
  static const String gigacodeApiKey = String.fromEnvironment(
    'GIGACODE_API_KEY',
    defaultValue: '',
  );

  // Sourcecraft Configuration
  static const String sourcecraftBaseUrl = String.fromEnvironment(
    'SOURCECRAFT_BASE_URL',
    defaultValue: 'https://sourcecraft.example.com',
  );
  static const String sourcecraftApiKey = String.fromEnvironment(
    'SOURCECRAFT_API_KEY',
    defaultValue: '',
  );

  // GitHub Configuration
  static const String githubApiKey = String.fromEnvironment(
    'GITHUB_API_KEY',
    defaultValue: '',
  );

  // Feature Flags
  static const bool enablePrometheus = bool.fromEnvironment(
    'ENABLE_PROMETHEUS',
    defaultValue: true,
  );
  static const bool enableGrafana = bool.fromEnvironment(
    'ENABLE_GRAFANA',
    defaultValue: true,
  );
  static const bool enableGigachat = bool.fromEnvironment(
    'ENABLE_GIGACHAT',
    defaultValue: true,
  );
  static const bool enableGigacode = bool.fromEnvironment(
    'ENABLE_GIGACODE',
    defaultValue: true,
  );
  static const bool enableSourcecraft = bool.fromEnvironment(
    'ENABLE_SOURCECRAFT',
    defaultValue: true,
  );
  static const bool enableGitHub = bool.fromEnvironment(
    'ENABLE_GITHUB',
    defaultValue: true,
  );

  // Default Repository Configuration
  static const String defaultRepository = String.fromEnvironment(
    'DEFAULT_REPOSITORY',
    defaultValue: 'rechain/rechain-app',
  );

  // Default Application Name
  static const String defaultAppName = String.fromEnvironment(
    'DEFAULT_APP_NAME',
    defaultValue: 'rechain',
  );

  /// Check if all required API keys are configured
  static bool get isFullyConfigured {
    return prometheusApiKey.isNotEmpty &&
           grafanaApiKey.isNotEmpty &&
           gigachatApiKey.isNotEmpty &&
           gigacodeApiKey.isNotEmpty &&
           sourcecraftApiKey.isNotEmpty &&
           githubApiKey.isNotEmpty;
  }

  /// Get configuration status for each service
  static Map<String, bool> get serviceStatus {
    return {
      'prometheus': enablePrometheus && prometheusApiKey.isNotEmpty,
      'grafana': enableGrafana && grafanaApiKey.isNotEmpty,
      'gigachat': enableGigachat && gigachatApiKey.isNotEmpty,
      'gigacode': enableGigacode && gigacodeApiKey.isNotEmpty,
      'sourcecraft': enableSourcecraft && sourcecraftApiKey.isNotEmpty,
      'github': enableGitHub && githubApiKey.isNotEmpty,
    };
  }

  /// Get missing API keys
  static List<String> get missingApiKeys {
    final missing = <String>[];
    
    if (enablePrometheus && prometheusApiKey.isEmpty) {
      missing.add('PROMETHEUS_API_KEY');
    }
    if (enableGrafana && grafanaApiKey.isEmpty) {
      missing.add('GRAFANA_API_KEY');
    }
    if (enableGigachat && gigachatApiKey.isEmpty) {
      missing.add('GIGACHAT_API_KEY');
    }
    if (enableGigacode && gigacodeApiKey.isEmpty) {
      missing.add('GIGACODE_API_KEY');
    }
    if (enableSourcecraft && sourcecraftApiKey.isEmpty) {
      missing.add('SOURCECRAFT_API_KEY');
    }
    if (enableGitHub && githubApiKey.isEmpty) {
      missing.add('GITHUB_API_KEY');
    }
    
    return missing;
  }

  /// Get configuration summary
  static Map<String, dynamic> get configurationSummary {
    return {
      'fully_configured': isFullyConfigured,
      'service_status': serviceStatus,
      'missing_api_keys': missingApiKeys,
      'enabled_services': serviceStatus.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList(),
      'disabled_services': serviceStatus.entries
          .where((entry) => !entry.value)
          .map((entry) => entry.key)
          .toList(),
    };
  }
} 