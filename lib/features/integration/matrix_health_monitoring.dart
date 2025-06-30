import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Health Monitoring Service
/// Provides comprehensive health monitoring for all Matrix integrations
class MatrixHealthMonitoring {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Monitoring services
  bool _realTimeMonitoringEnabled = false;
  bool _alertingEnabled = false;
  bool _diagnosticsEnabled = false;
  bool _performanceMetricsEnabled = false;
  bool _securityMonitoringEnabled = false;
  bool _complianceMonitoringEnabled = false;
  bool _capacityPlanningEnabled = false;
  bool _incidentManagementEnabled = false;

  // Monitoring data
  final Map<String, dynamic> _healthMetrics = {};
  final List<Map<String, dynamic>> _alerts = [];
  final List<Map<String, dynamic>> _incidents = [];
  final Map<String, dynamic> _performanceData = {};

  // Stream controllers for real-time updates
  final StreamController<Map<String, dynamic>> _healthUpdateController = 
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _alertController = 
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _incidentController = 
      StreamController<Map<String, dynamic>>.broadcast();

  MatrixHealthMonitoring({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-health.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix health monitoring services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Initializing Matrix health monitoring services...');
      }

      // Test connection to Matrix Health API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Health API is not available');
      }

      // Initialize individual services
      await _initializeRealTimeMonitoring();
      await _initializeAlerting();
      await _initializeDiagnostics();
      await _initializePerformanceMetrics();
      await _initializeSecurityMonitoring();
      await _initializeComplianceMonitoring();
      await _initializeCapacityPlanning();
      await _initializeIncidentManagement();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Matrix health monitoring services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Health API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Real-time Monitoring
  Future<void> _initializeRealTimeMonitoring() async {
    try {
      final response = await _makeRequest('POST', '/monitoring/real-time/initialize');
      if (response.statusCode == 200) {
        _realTimeMonitoringEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Real-time monitoring initialization failed: $e');
      }
    }
  }

  /// Initialize Alerting
  Future<void> _initializeAlerting() async {
    try {
      final response = await _makeRequest('POST', '/monitoring/alerting/initialize');
      if (response.statusCode == 200) {
        _alertingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Alerting initialization failed: $e');
      }
    }
  }

  /// Initialize Diagnostics
  Future<void> _initializeDiagnostics() async {
    try {
      final response = await _makeRequest('POST', '/monitoring/diagnostics/initialize');
      if (response.statusCode == 200) {
        _diagnosticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Diagnostics initialization failed: $e');
      }
    }
  }

  /// Initialize Performance Metrics
  Future<void> _initializePerformanceMetrics() async {
    try {
      final response = await _makeRequest('POST', '/monitoring/performance/initialize');
      if (response.statusCode == 200) {
        _performanceMetricsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Performance metrics initialization failed: $e');
      }
    }
  }

  /// Initialize Security Monitoring
  Future<void> _initializeSecurityMonitoring() async {
    try {
      final response = await _makeRequest('POST', '/monitoring/security/initialize');
      if (response.statusCode == 200) {
        _securityMonitoringEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Security monitoring initialization failed: $e');
      }
    }
  }

  /// Initialize Compliance Monitoring
  Future<void> _initializeComplianceMonitoring() async {
    try {
      final response = await _makeRequest('POST', '/monitoring/compliance/initialize');
      if (response.statusCode == 200) {
        _complianceMonitoringEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Compliance monitoring initialization failed: $e');
      }
    }
  }

  /// Initialize Capacity Planning
  Future<void> _initializeCapacityPlanning() async {
    try {
      final response = await _makeRequest('POST', '/monitoring/capacity/initialize');
      if (response.statusCode == 200) {
        _capacityPlanningEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Capacity planning initialization failed: $e');
      }
    }
  }

  /// Initialize Incident Management
  Future<void> _initializeIncidentManagement() async {
    try {
      final response = await _makeRequest('POST', '/monitoring/incidents/initialize');
      if (response.statusCode == 200) {
        _incidentManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixHealthMonitoring] Incident management initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'real_time_monitoring': _realTimeMonitoringEnabled,
    'alerting': _alertingEnabled,
    'diagnostics': _diagnosticsEnabled,
    'performance_metrics': _performanceMetricsEnabled,
    'security_monitoring': _securityMonitoringEnabled,
    'compliance_monitoring': _complianceMonitoringEnabled,
    'capacity_planning': _capacityPlanningEnabled,
    'incident_management': _incidentManagementEnabled,
  };

  /// Get health update stream
  Stream<Map<String, dynamic>> get healthUpdateStream => _healthUpdateController.stream;

  /// Get alert stream
  Stream<Map<String, dynamic>> get alertStream => _alertController.stream;

  /// Get incident stream
  Stream<Map<String, dynamic>> get incidentStream => _incidentController.stream;

  /// Real-time Monitoring - Monitor service health
  Future<Map<String, dynamic>> monitorServiceHealth({
    required String serviceName,
    required Map<String, dynamic> metrics,
  }) async {
    if (!_realTimeMonitoringEnabled) {
      throw Exception('Real-time monitoring is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/monitoring/real-time/health',
        body: {
          'service_name': serviceName,
          'metrics': metrics,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _healthMetrics[serviceName] = data;
        _healthUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to monitor service health: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Alerting - Create alert
  Future<Map<String, dynamic>> createAlert({
    required String alertType,
    required String message,
    required String severity,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_alertingEnabled) {
      throw Exception('Alerting is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/monitoring/alerting/create',
        body: {
          'alert_type': alertType,
          'message': message,
          'severity': severity,
          if (metadata != null) 'metadata': metadata,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _alerts.add(data);
        _alertController.add(data);
        return data;
      } else {
        throw Exception('Failed to create alert: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Diagnostics - Run diagnostic test
  Future<Map<String, dynamic>> runDiagnosticTest({
    required String testType,
    required Map<String, dynamic> parameters,
  }) async {
    if (!_diagnosticsEnabled) {
      throw Exception('Diagnostics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/monitoring/diagnostics/run-test',
        body: {
          'test_type': testType,
          'parameters': parameters,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to run diagnostic test: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Performance Metrics - Collect performance data
  Future<Map<String, dynamic>> collectPerformanceMetrics({
    required String serviceName,
    required Map<String, dynamic> metrics,
  }) async {
    if (!_performanceMetricsEnabled) {
      throw Exception('Performance metrics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/monitoring/performance/collect',
        body: {
          'service_name': serviceName,
          'metrics': metrics,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _performanceData[serviceName] = data;
        return data;
      } else {
        throw Exception('Failed to collect performance metrics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Security Monitoring - Monitor security events
  Future<Map<String, dynamic>> monitorSecurityEvents({
    required String eventType,
    required Map<String, dynamic> eventData,
  }) async {
    if (!_securityMonitoringEnabled) {
      throw Exception('Security monitoring is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/monitoring/security/events',
        body: {
          'event_type': eventType,
          'event_data': eventData,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to monitor security events: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Compliance Monitoring - Check compliance status
  Future<Map<String, dynamic>> checkComplianceStatus({
    required String complianceType,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_complianceMonitoringEnabled) {
      throw Exception('Compliance monitoring is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/monitoring/compliance/check',
        body: {
          'compliance_type': complianceType,
          if (parameters != null) 'parameters': parameters,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to check compliance status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Capacity Planning - Analyze capacity
  Future<Map<String, dynamic>> analyzeCapacity({
    required String resourceType,
    required Map<String, dynamic> usageData,
  }) async {
    if (!_capacityPlanningEnabled) {
      throw Exception('Capacity planning is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/monitoring/capacity/analyze',
        body: {
          'resource_type': resourceType,
          'usage_data': usageData,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to analyze capacity: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Incident Management - Create incident
  Future<Map<String, dynamic>> createIncident({
    required String incidentType,
    required String description,
    required String severity,
    Map<String, dynamic>? affectedServices,
  }) async {
    if (!_incidentManagementEnabled) {
      throw Exception('Incident management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/monitoring/incidents/create',
        body: {
          'incident_type': incidentType,
          'description': description,
          'severity': severity,
          if (affectedServices != null) 'affected_services': affectedServices,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _incidents.add(data);
        _incidentController.add(data);
        return data;
      } else {
        throw Exception('Failed to create incident: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get health dashboard
  Future<Map<String, dynamic>> getHealthDashboard() async {
    try {
      final response = await _makeRequest('GET', '/monitoring/dashboard');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get health dashboard: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get active alerts
  Future<List<Map<String, dynamic>>> getActiveAlerts() async {
    try {
      final response = await _makeRequest('GET', '/monitoring/alerting/active');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['alerts'] ?? []);
      } else {
        throw Exception('Failed to get active alerts: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get active incidents
  Future<List<Map<String, dynamic>>> getActiveIncidents() async {
    try {
      final response = await _makeRequest('GET', '/monitoring/incidents/active');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['incidents'] ?? []);
      } else {
        throw Exception('Failed to get active incidents: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixHealth/1.0',
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
    _healthUpdateController.close();
    _alertController.close();
    _incidentController.close();
    _isInitialized = false;
  }
} 