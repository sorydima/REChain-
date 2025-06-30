import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix IoT Integration Service
/// Provides IoT features for Matrix communication
class MatrixIoTIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // IoT services
  bool _deviceManagementEnabled = false;
  bool _sensorDataEnabled = false;
  bool _automationEnabled = false;
  bool _mqttIntegrationEnabled = false;
  bool _zigbeeIntegrationEnabled = false;
  bool _zwaveIntegrationEnabled = false;
  bool _homeAssistantEnabled = false;
  bool _edgeComputingEnabled = false;

  MatrixIoTIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-iot.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix IoT services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Initializing Matrix IoT services...');
      }

      // Test connection to Matrix IoT API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix IoT API is not available');
      }

      // Initialize individual services
      await _initializeDeviceManagement();
      await _initializeSensorData();
      await _initializeAutomation();
      await _initializeMQTTIntegration();
      await _initializeZigbeeIntegration();
      await _initializeZWaveIntegration();
      await _initializeHomeAssistant();
      await _initializeEdgeComputing();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixIoTIntegration] Matrix IoT services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix IoT API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Device Management
  Future<void> _initializeDeviceManagement() async {
    try {
      final response = await _makeRequest('POST', '/iot/devices/initialize');
      if (response.statusCode == 200) {
        _deviceManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Device management initialization failed: $e');
      }
    }
  }

  /// Initialize Sensor Data
  Future<void> _initializeSensorData() async {
    try {
      final response = await _makeRequest('POST', '/iot/sensors/initialize');
      if (response.statusCode == 200) {
        _sensorDataEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Sensor data initialization failed: $e');
      }
    }
  }

  /// Initialize Automation
  Future<void> _initializeAutomation() async {
    try {
      final response = await _makeRequest('POST', '/iot/automation/initialize');
      if (response.statusCode == 200) {
        _automationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Automation initialization failed: $e');
      }
    }
  }

  /// Initialize MQTT Integration
  Future<void> _initializeMQTTIntegration() async {
    try {
      final response = await _makeRequest('POST', '/iot/mqtt/initialize');
      if (response.statusCode == 200) {
        _mqttIntegrationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] MQTT integration initialization failed: $e');
      }
    }
  }

  /// Initialize Zigbee Integration
  Future<void> _initializeZigbeeIntegration() async {
    try {
      final response = await _makeRequest('POST', '/iot/zigbee/initialize');
      if (response.statusCode == 200) {
        _zigbeeIntegrationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Zigbee integration initialization failed: $e');
      }
    }
  }

  /// Initialize Z-Wave Integration
  Future<void> _initializeZWaveIntegration() async {
    try {
      final response = await _makeRequest('POST', '/iot/zwave/initialize');
      if (response.statusCode == 200) {
        _zwaveIntegrationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Z-Wave integration initialization failed: $e');
      }
    }
  }

  /// Initialize Home Assistant
  Future<void> _initializeHomeAssistant() async {
    try {
      final response = await _makeRequest('POST', '/iot/home-assistant/initialize');
      if (response.statusCode == 200) {
        _homeAssistantEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Home Assistant initialization failed: $e');
      }
    }
  }

  /// Initialize Edge Computing
  Future<void> _initializeEdgeComputing() async {
    try {
      final response = await _makeRequest('POST', '/iot/edge-computing/initialize');
      if (response.statusCode == 200) {
        _edgeComputingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixIoTIntegration] Edge computing initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'device_management': _deviceManagementEnabled,
    'sensor_data': _sensorDataEnabled,
    'automation': _automationEnabled,
    'mqtt_integration': _mqttIntegrationEnabled,
    'zigbee_integration': _zigbeeIntegrationEnabled,
    'zwave_integration': _zwaveIntegrationEnabled,
    'home_assistant': _homeAssistantEnabled,
    'edge_computing': _edgeComputingEnabled,
  };

  /// Device Management - Register device
  Future<Map<String, dynamic>> registerDevice({
    required String deviceId,
    required String deviceType,
    required Map<String, dynamic> capabilities,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_deviceManagementEnabled) {
      throw Exception('Device management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/devices/register',
        body: {
          'device_id': deviceId,
          'device_type': deviceType,
          'capabilities': capabilities,
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to register device: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Device Management - Get device status
  Future<Map<String, dynamic>> getDeviceStatus({
    required String deviceId,
  }) async {
    if (!_deviceManagementEnabled) {
      throw Exception('Device management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/iot/devices/$deviceId/status',
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get device status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Sensor Data - Send sensor reading
  Future<Map<String, dynamic>> sendSensorReading({
    required String deviceId,
    required String sensorType,
    required dynamic value,
    String? unit,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_sensorDataEnabled) {
      throw Exception('Sensor data is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/sensors/reading',
        body: {
          'device_id': deviceId,
          'sensor_type': sensorType,
          'value': value,
          if (unit != null) 'unit': unit,
          if (metadata != null) 'metadata': metadata,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send sensor reading: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Sensor Data - Get sensor history
  Future<List<Map<String, dynamic>>> getSensorHistory({
    required String deviceId,
    required String sensorType,
    DateTime? startTime,
    DateTime? endTime,
    int? limit,
  }) async {
    if (!_sensorDataEnabled) {
      throw Exception('Sensor data is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/iot/sensors/history',
        queryParams: {
          'device_id': deviceId,
          'sensor_type': sensorType,
          if (startTime != null) 'start_time': startTime.toIso8601String(),
          if (endTime != null) 'end_time': endTime.toIso8601String(),
          if (limit != null) 'limit': limit.toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['readings'] ?? []);
      } else {
        throw Exception('Failed to get sensor history: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Automation - Create automation rule
  Future<Map<String, dynamic>> createAutomationRule({
    required String name,
    required Map<String, dynamic> trigger,
    required Map<String, dynamic> action,
    Map<String, dynamic>? conditions,
    bool enabled = true,
  }) async {
    if (!_automationEnabled) {
      throw Exception('Automation is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/automation/rules',
        body: {
          'name': name,
          'trigger': trigger,
          'action': action,
          if (conditions != null) 'conditions': conditions,
          'enabled': enabled,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create automation rule: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// MQTT Integration - Publish message
  Future<Map<String, dynamic>> publishMQTTMessage({
    required String topic,
    required String message,
    int qos = 0,
    bool retain = false,
  }) async {
    if (!_mqttIntegrationEnabled) {
      throw Exception('MQTT integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/mqtt/publish',
        body: {
          'topic': topic,
          'message': message,
          'qos': qos,
          'retain': retain,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to publish MQTT message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// MQTT Integration - Subscribe to topic
  Future<Map<String, dynamic>> subscribeToMQTTTopic({
    required String topic,
    int qos = 0,
    Map<String, dynamic>? callback,
  }) async {
    if (!_mqttIntegrationEnabled) {
      throw Exception('MQTT integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/mqtt/subscribe',
        body: {
          'topic': topic,
          'qos': qos,
          if (callback != null) 'callback': callback,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to subscribe to MQTT topic: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Zigbee Integration - Discover devices
  Future<List<Map<String, dynamic>>> discoverZigbeeDevices({
    int timeout = 30,
    Map<String, dynamic>? filters,
  }) async {
    if (!_zigbeeIntegrationEnabled) {
      throw Exception('Zigbee integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/zigbee/discover',
        body: {
          'timeout': timeout,
          if (filters != null) 'filters': filters,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['devices'] ?? []);
      } else {
        throw Exception('Failed to discover Zigbee devices: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Z-Wave Integration - Add device
  Future<Map<String, dynamic>> addZWaveDevice({
    required String deviceId,
    required Map<String, dynamic> deviceInfo,
  }) async {
    if (!_zwaveIntegrationEnabled) {
      throw Exception('Z-Wave integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/zwave/add-device',
        body: {
          'device_id': deviceId,
          'device_info': deviceInfo,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to add Z-Wave device: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Home Assistant Integration - Get entities
  Future<List<Map<String, dynamic>>> getHomeAssistantEntities({
    String? domain,
    Map<String, dynamic>? filters,
  }) async {
    if (!_homeAssistantEnabled) {
      throw Exception('Home Assistant integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/iot/home-assistant/entities',
        queryParams: {
          if (domain != null) 'domain': domain,
          if (filters != null) 'filters': jsonEncode(filters),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['entities'] ?? []);
      } else {
        throw Exception('Failed to get Home Assistant entities: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Home Assistant Integration - Call service
  Future<Map<String, dynamic>> callHomeAssistantService({
    required String domain,
    required String service,
    required Map<String, dynamic> serviceData,
  }) async {
    if (!_homeAssistantEnabled) {
      throw Exception('Home Assistant integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/home-assistant/call-service',
        body: {
          'domain': domain,
          'service': service,
          'service_data': serviceData,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to call Home Assistant service: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Edge Computing - Deploy edge function
  Future<Map<String, dynamic>> deployEdgeFunction({
    required String functionName,
    required String functionCode,
    required Map<String, dynamic> runtime,
    Map<String, dynamic>? environment,
  }) async {
    if (!_edgeComputingEnabled) {
      throw Exception('Edge computing is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/iot/edge-computing/deploy',
        body: {
          'function_name': functionName,
          'function_code': functionCode,
          'runtime': runtime,
          if (environment != null) 'environment': environment,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to deploy edge function: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get IoT dashboard data
  Future<Map<String, dynamic>> getIoTDashboard() async {
    try {
      final response = await _makeRequest('GET', '/iot/dashboard');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get IoT dashboard: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get registered devices
  Future<List<Map<String, dynamic>>> getRegisteredDevices() async {
    try {
      final response = await _makeRequest('GET', '/iot/devices');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['devices'] ?? []);
      } else {
        throw Exception('Failed to get registered devices: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service health
  Future<Map<String, dynamic>> getHealthStatus() async {
    try {
      final response = await _makeRequest('GET', '/health');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'status': 'healthy',
          'services': serviceStatus,
          'last_error': _lastError,
          'details': data,
        };
      } else {
        return {
          'status': 'unhealthy',
          'services': serviceStatus,
          'last_error': 'Health check failed',
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'services': serviceStatus,
        'last_error': e.toString(),
      };
    }
  }

  /// Make HTTP request
  Future<http.Response> _makeRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    final uri = Uri.parse('$_baseUrl$endpoint').replace(
      queryParameters: queryParams,
    );

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
      'User-Agent': 'REChain-MatrixIoT/1.0',
    };

    try {
      http.Response response;
      
      switch (method.toUpperCase()) {
        case 'GET':
          response = await _client.get(uri, headers: headers);
          break;
        case 'POST':
          response = await _client.post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      return response;
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    _client.close();
    _isInitialized = false;
  }
} 