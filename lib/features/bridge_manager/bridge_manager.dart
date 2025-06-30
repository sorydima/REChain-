import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bridge_config.dart';
import 'bridge_status.dart';

class BridgeManager {
  static const String _bridgeConfigKey = 'bridge_configurations';
  static const String _bridgeStatusKey = 'bridge_status';
  
  final SharedPreferences _prefs;
  final Client _client;
  final Map<String, BridgeConfig> _bridges = {};
  final Map<String, BridgeStatus> _bridgeStatuses = {};
  
  final StreamController<Map<String, BridgeStatus>> _statusController = 
      StreamController<Map<String, BridgeStatus>>.broadcast();
  
  Stream<Map<String, BridgeStatus>> get statusStream => _statusController.stream;
  
  Timer? _healthCheckTimer;
  
  BridgeManager(this._prefs, this._client) {
    _loadBridgeConfigurations();
    _startHealthChecking();
  }
  
  static const Map<String, BridgeInfo> supportedBridges = {
    'telegram': BridgeInfo(
      name: 'Telegram',
      description: 'Bridge to Telegram messaging',
      icon: '📱',
      port: 29328,
      configTemplate: 'telegram_config.yaml',
      registrationTemplate: 'telegram_registration.yaml',
    ),
    'signal': BridgeInfo(
      name: 'Signal',
      description: 'Bridge to Signal messaging',
      icon: '🔒',
      port: 29329,
      configTemplate: 'signal_config.yaml',
      registrationTemplate: 'signal_registration.yaml',
    ),
    'whatsapp': BridgeInfo(
      name: 'WhatsApp',
      description: 'Bridge to WhatsApp messaging',
      icon: '💬',
      port: 29330,
      configTemplate: 'whatsapp_config.yaml',
      registrationTemplate: 'whatsapp_registration.yaml',
    ),
    'discord': BridgeInfo(
      name: 'Discord',
      description: 'Bridge to Discord servers',
      icon: '🎮',
      port: 29331,
      configTemplate: 'discord_config.yaml',
      registrationTemplate: 'discord_registration.yaml',
    ),
    'facebook': BridgeInfo(
      name: 'Facebook Messenger',
      description: 'Bridge to Facebook Messenger',
      icon: '📘',
      port: 29332,
      configTemplate: 'facebook_config.yaml',
      registrationTemplate: 'facebook_registration.yaml',
    ),
    'instagram': BridgeInfo(
      name: 'Instagram',
      description: 'Bridge to Instagram DMs',
      icon: '📷',
      port: 29333,
      configTemplate: 'instagram_config.yaml',
      registrationTemplate: 'instagram_registration.yaml',
    ),
    'googlechat': BridgeInfo(
      name: 'Google Chat',
      description: 'Bridge to Google Chat/Hangouts',
      icon: '🔍',
      port: 29334,
      configTemplate: 'googlechat_config.yaml',
      registrationTemplate: 'googlechat_registration.yaml',
    ),
    'slack': BridgeInfo(
      name: 'Slack',
      description: 'Bridge to Slack workspaces',
      icon: '💼',
      port: 29335,
      configTemplate: 'slack_config.yaml',
      registrationTemplate: 'slack_registration.yaml',
    ),
    'twitter': BridgeInfo(
      name: 'Twitter/X',
      description: 'Bridge to Twitter/X DMs',
      icon: '🐦',
      port: 29336,
      configTemplate: 'twitter_config.yaml',
      registrationTemplate: 'twitter_registration.yaml',
    ),
    'bluesky': BridgeInfo(
      name: 'Bluesky',
      description: 'Bridge to Bluesky Social',
      icon: '🦋',
      port: 29337,
      configTemplate: 'bluesky_config.yaml',
      registrationTemplate: 'bluesky_registration.yaml',
    ),
    'email': BridgeInfo(
      name: 'Email',
      description: 'Bridge to Email systems',
      icon: '📧',
      port: 29339,
      configTemplate: 'email_config.yaml',
      registrationTemplate: 'email_registration.yaml',
    ),
    'xmpp': BridgeInfo(
      name: 'XMPP/Jabber',
      description: 'Bridge to XMPP networks',
      icon: '💭',
      port: 29343,
      configTemplate: 'xmpp_config.yaml',
      registrationTemplate: 'xmpp_registration.yaml',
    ),
  };
  
  Future<void> _loadBridgeConfigurations() async {
    final configJson = _prefs.getString(_bridgeConfigKey);
    if (configJson != null) {
      final Map<String, dynamic> configs = json.decode(configJson);
      for (final entry in configs.entries) {
        _bridges[entry.key] = BridgeConfig.fromJson(entry.value);
      }
    }
    
    final statusJson = _prefs.getString(_bridgeStatusKey);
    if (statusJson != null) {
      final Map<String, dynamic> statuses = json.decode(statusJson);
      for (final entry in statuses.entries) {
        _bridgeStatuses[entry.key] = BridgeStatus.fromJson(entry.value);
      }
    }
  }
  
  Future<void> _saveBridgeConfigurations() async {
    final configs = <String, dynamic>{};
    for (final entry in _bridges.entries) {
      configs[entry.key] = entry.value.toJson();
    }
    await _prefs.setString(_bridgeConfigKey, json.encode(configs));
    
    final statuses = <String, dynamic>{};
    for (final entry in _bridgeStatuses.entries) {
      statuses[entry.key] = entry.value.toJson();
    }
    await _prefs.setString(_bridgeStatusKey, json.encode(statuses));
  }
  
  Future<bool> configureBridge(String bridgeType, Map<String, dynamic> config) async {
    try {
      final bridgeInfo = supportedBridges[bridgeType];
      if (bridgeInfo == null) {
        throw Exception('Unsupported bridge type: $bridgeType');
      }
      
      final bridgeConfig = BridgeConfig(
        type: bridgeType,
        name: bridgeInfo.name,
        apiKey: config['api_key'] ?? '',
        settings: config,
        enabled: true,
        configuration: config,
        port: bridgeInfo.port,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      _bridges[bridgeType] = bridgeConfig;
      _bridgeStatuses[bridgeType] = BridgeStatus(
        type: bridgeType,
        status: BridgeConnectionStatus.configuring,
        lastChecked: DateTime.now(),
      );
      
      await _saveBridgeConfigurations();
      _statusController.add(Map.from(_bridgeStatuses));
      
      // Attempt to start the bridge
      return await _startBridge(bridgeType);
    } catch (e) {
      Logs().e('Failed to configure bridge $bridgeType: $e');
      return false;
    }
  }
  
  Future<bool> _startBridge(String bridgeType) async {
    try {
      final config = _bridges[bridgeType];
      if (config == null) return false;
      
      // Generate configuration files
      await _generateBridgeConfig(bridgeType, config);
      
      // Start bridge container (if using Docker)
      if (!kIsWeb && (Platform.isLinux || Platform.isMacOS)) {
        final result = await Process.run('docker-compose', [
          '-f', 'matrix_bridge_setup_bundle/docker-compose.bridges.yaml',
          'up', '-d', 'bridge_$bridgeType'
        ]);
        
        if (result.exitCode == 0) {
          _bridgeStatuses[bridgeType] = BridgeStatus(
            type: bridgeType,
            status: BridgeConnectionStatus.starting,
            lastChecked: DateTime.now(),
          );
        } else {
          _bridgeStatuses[bridgeType] = BridgeStatus(
            type: bridgeType,
            status: BridgeConnectionStatus.error,
            lastChecked: DateTime.now(),
            errorMessage: result.stderr.toString(),
          );
        }
      } else {
        // For web/mobile, mark as configured but not running
        _bridgeStatuses[bridgeType] = BridgeStatus(
          type: bridgeType,
          status: BridgeConnectionStatus.configured,
          lastChecked: DateTime.now(),
        );
      }
      
      await _saveBridgeConfigurations();
      _statusController.add(Map.from(_bridgeStatuses));
      
      return true;
    } catch (e) {
      Logs().e('Failed to start bridge $bridgeType: $e');
      _bridgeStatuses[bridgeType] = BridgeStatus(
        type: bridgeType,
        status: BridgeConnectionStatus.error,
        lastChecked: DateTime.now(),
        errorMessage: e.toString(),
      );
      _statusController.add(Map.from(_bridgeStatuses));
      return false;
    }
  }
  
  Future<void> _generateBridgeConfig(String bridgeType, BridgeConfig config) async {
    // Generate bridge-specific configuration
    final configContent = _generateConfigContent(bridgeType, config);
    final registrationContent = _generateRegistrationContent(bridgeType, config);
    
    // Write configuration files
    final configFile = File('bridges/${bridgeType}_config.yaml');
    final registrationFile = File('bridges/${bridgeType}_registration.yaml');
    
    await configFile.parent.create(recursive: true);
    await configFile.writeAsString(configContent);
    await registrationFile.writeAsString(registrationContent);
  }
  
  String _generateConfigContent(String bridgeType, BridgeConfig config) {
    // Generate YAML configuration based on bridge type
    switch (bridgeType) {
      case 'telegram':
        return '''
homeserver:
  address: ${config.configuration['homeserver_url'] ?? 'https://matrix.org'}
  domain: ${config.configuration['homeserver_domain'] ?? 'matrix.org'}

appservice:
  address: http://localhost:${config.port}
  hostname: 0.0.0.0
  port: ${config.port}
  database: sqlite:///data/mautrix-telegram.db

bridge:
  username_template: "telegram_{userid}"
  displayname_template: "{displayname} (Telegram)"
  
telegram:
  api_id: ${config.configuration['api_id'] ?? ''}
  api_hash: ${config.configuration['api_hash'] ?? ''}
  bot_token: ${config.configuration['bot_token'] ?? ''}

logging:
  version: 1
  formatters:
    colored:
      format: "[%(asctime)s] [%(levelname)s@%(name)s] %(message)s"
  handlers:
    console:
      class: logging.StreamHandler
      formatter: colored
  loggers:
    mau.telegram:
      level: DEBUG
  root:
    level: DEBUG
    handlers: [console]
''';
      case 'signal':
        return '''
homeserver:
  address: ${config.configuration['homeserver_url'] ?? 'https://matrix.org'}
  domain: ${config.configuration['homeserver_domain'] ?? 'matrix.org'}

appservice:
  address: http://localhost:${config.port}
  hostname: 0.0.0.0
  port: ${config.port}
  database: sqlite:///data/mautrix-signal.db

bridge:
  username_template: "signal_{userid}"
  displayname_template: "{displayname} (Signal)"

signal:
  socket_path: /signald/signald.sock

logging:
  version: 1
  formatters:
    colored:
      format: "[%(asctime)s] [%(levelname)s@%(name)s] %(message)s"
  handlers:
    console:
      class: logging.StreamHandler
      formatter: colored
  loggers:
    mau.signal:
      level: DEBUG
  root:
    level: DEBUG
    handlers: [console]
''';
      default:
        return '''
homeserver:
  address: ${config.configuration['homeserver_url'] ?? 'https://matrix.org'}
  domain: ${config.configuration['homeserver_domain'] ?? 'matrix.org'}

appservice:
  address: http://localhost:${config.port}
  hostname: 0.0.0.0
  port: ${config.port}
  database: sqlite:///data/mautrix-${bridgeType}.db

bridge:
  username_template: "${bridgeType}_{userid}"
  displayname_template: "{displayname} (${supportedBridges[bridgeType]?.name})"

logging:
  version: 1
  formatters:
    colored:
      format: "[%(asctime)s] [%(levelname)s@%(name)s] %(message)s"
  handlers:
    console:
      class: logging.StreamHandler
      formatter: colored
  root:
    level: DEBUG
    handlers: [console]
''';
    }
  }
  
  String _generateRegistrationContent(String bridgeType, BridgeConfig config) {
    return '''
id: ${bridgeType}
url: http://localhost:${config.port}
as_token: ${_generateToken()}
hs_token: ${_generateToken()}
sender_localpart: ${bridgeType}bot
rate_limited: false
namespaces:
  users:
  - exclusive: true
    regex: "@${bridgeType}_.*:.*"
  - exclusive: true
    regex: "@${bridgeType}bot:.*"
  aliases:
  - exclusive: true
    regex: "#${bridgeType}_.*:.*"
  rooms: []
''';
  }
  
  String _generateToken() {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(64, (index) => chars[random % chars.length]).join();
  }
  
  Future<void> _startHealthChecking() async {
    _healthCheckTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      _checkBridgeHealth();
    });
  }
  
  Future<void> _checkBridgeHealth() async {
    for (final bridgeType in _bridges.keys) {
      await _checkSingleBridgeHealth(bridgeType);
    }
    _statusController.add(Map.from(_bridgeStatuses));
  }
  
  Future<void> _checkSingleBridgeHealth(String bridgeType) async {
    try {
      final config = _bridges[bridgeType];
      if (config == null) return;
      
      final response = await http.get(
        Uri.parse('http://localhost:${config.port}/_matrix/mau/v1/ping'),
      ).timeout(const Duration(seconds: 10));
      
      if (response.statusCode == 200) {
        _bridgeStatuses[bridgeType] = BridgeStatus(
          type: bridgeType,
          status: BridgeConnectionStatus.connected,
          lastChecked: DateTime.now(),
        );
      } else {
        _bridgeStatuses[bridgeType] = BridgeStatus(
          type: bridgeType,
          status: BridgeConnectionStatus.error,
          lastChecked: DateTime.now(),
          errorMessage: 'HTTP ${response.statusCode}',
        );
      }
    } catch (e) {
      _bridgeStatuses[bridgeType] = BridgeStatus(
        type: bridgeType,
        status: BridgeConnectionStatus.disconnected,
        lastChecked: DateTime.now(),
        errorMessage: e.toString(),
      );
    }
  }
  
  Future<bool> removeBridge(String bridgeType) async {
    try {
      // Stop bridge container
      if (!kIsWeb && (Platform.isLinux || Platform.isMacOS)) {
        await Process.run('docker-compose', [
          '-f', 'matrix_bridge_setup_bundle/docker-compose.bridges.yaml',
          'stop', 'bridge_$bridgeType'
        ]);
        
        await Process.run('docker-compose', [
          '-f', 'matrix_bridge_setup_bundle/docker-compose.bridges.yaml',
          'rm', '-f', 'bridge_$bridgeType'
        ]);
      }
      
      _bridges.remove(bridgeType);
      _bridgeStatuses.remove(bridgeType);
      
      await _saveBridgeConfigurations();
      _statusController.add(Map.from(_bridgeStatuses));
      
      return true;
    } catch (e) {
      Logs().e('Failed to remove bridge $bridgeType: $e');
      return false;
    }
  }
  
  Map<String, BridgeConfig> get configuredBridges => Map.unmodifiable(_bridges);
  Map<String, BridgeStatus> get bridgeStatuses => Map.unmodifiable(_bridgeStatuses);
  
  void dispose() {
    _healthCheckTimer?.cancel();
    _statusController.close();
  }
  
  // Added methods to fix test errors
  Future<bool> createBridge(String bridgeType, Map<String, dynamic> config) async {
    return configureBridge(bridgeType, config);
  }
  
  List<BridgeConfig> listBridges() {
    return _bridges.values.toList();
  }
  
  Map<String, BridgeConfig> get bridges => Map.unmodifiable(_bridges);
}


class BridgeInfo {
  final String name;
  final String description;
  final String icon;
  final int port;
  final String configTemplate;
  final String registrationTemplate;
  
  const BridgeInfo({
    required this.name,
    required this.description,
    required this.icon,
    required this.port,
    required this.configTemplate,
    required this.registrationTemplate,
  });
}
