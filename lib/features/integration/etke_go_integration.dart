import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Etke.cc Go Integration Service
/// Integrates etke.cc's Go libraries and tools into REChain
class EtkeGoIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Go services
  bool _ansibleEnabled = false;
  bool _apmEnabled = false;
  bool _validatorEnabled = false;
  bool _secgenEnabled = false;
  bool _linkpearlEnabled = false;
  bool _psdEnabled = false;
  bool _pricifyEnabled = false;
  bool _msc1929Enabled = false;

  EtkeGoIntegration({
    required String apiKey,
    String baseUrl = 'https://api.etke.cc/go',
    http.Client? client,
  })  : _apiKey = apiKey,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize Go services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[EtkeGoIntegration] Initializing Go services...');
      }

      // Test connection
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Etke.cc Go API is not available');
      }

      // Initialize individual services
      await _initializeAnsible();
      await _initializeAPM();
      await _initializeValidator();
      await _initializeSecGen();
      await _initializeLinkPearl();
      await _initializePSD();
      await _initializePricify();
      await _initializeMSC1929();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[EtkeGoIntegration] Go services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[EtkeGoIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Go API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Ansible Go library
  Future<void> _initializeAnsible() async {
    try {
      final response = await _makeRequest('GET', '/ansible/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _ansibleEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeGoIntegration] Ansible status: $_ansibleEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeGoIntegration] Ansible initialization failed: $e');
      }
    }
  }

  /// Initialize APM (Application Performance Monitoring)
  Future<void> _initializeAPM() async {
    try {
      final response = await _makeRequest('GET', '/apm/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _apmEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeGoIntegration] APM status: $_apmEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeGoIntegration] APM initialization failed: $e');
      }
    }
  }

  /// Initialize Validator
  Future<void> _initializeValidator() async {
    try {
      final response = await _makeRequest('GET', '/validator/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _validatorEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeGoIntegration] Validator status: $_validatorEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeGoIntegration] Validator initialization failed: $e');
      }
    }
  }

  /// Initialize SecGen (Security Generator)
  Future<void> _initializeSecGen() async {
    try {
      final response = await _makeRequest('GET', '/secgen/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _secgenEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeGoIntegration] SecGen status: $_secgenEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeGoIntegration] SecGen initialization failed: $e');
      }
    }
  }

  /// Initialize LinkPearl (Matrix library)
  Future<void> _initializeLinkPearl() async {
    try {
      final response = await _makeRequest('GET', '/linkpearl/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _linkpearlEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeGoIntegration] LinkPearl status: $_linkpearlEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeGoIntegration] LinkPearl initialization failed: $e');
      }
    }
  }

  /// Initialize PSD (Prometheus Service Discovery)
  Future<void> _initializePSD() async {
    try {
      final response = await _makeRequest('GET', '/psd/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _psdEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeGoIntegration] PSD status: $_psdEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeGoIntegration] PSD initialization failed: $e');
      }
    }
  }

  /// Initialize Pricify
  Future<void> _initializePricify() async {
    try {
      final response = await _makeRequest('GET', '/pricify/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _pricifyEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeGoIntegration] Pricify status: $_pricifyEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeGoIntegration] Pricify initialization failed: $e');
      }
    }
  }

  /// Initialize MSC1929 (Matrix Spec Change)
  Future<void> _initializeMSC1929() async {
    try {
      final response = await _makeRequest('GET', '/msc1929/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _msc1929Enabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[EtkeGoIntegration] MSC1929 status: $_msc1929Enabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[EtkeGoIntegration] MSC1929 initialization failed: $e');
      }
    }
  }

  /// Ansible Integration
  Future<Map<String, dynamic>> runAnsiblePlaybook({
    required String playbook,
    Map<String, dynamic>? inventory,
    Map<String, dynamic>? variables,
    Map<String, dynamic>? options,
  }) async {
    if (!_ansibleEnabled) {
      throw Exception('Ansible Go library is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/ansible/playbook',
        body: {
          'playbook': playbook,
          if (inventory != null) 'inventory': inventory,
          if (variables != null) 'variables': variables,
          if (options != null) 'options': options,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to run playbook: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// APM Integration
  Future<Map<String, dynamic>> getAPMMetrics({
    String? service,
    String? metric,
    Duration? timeRange,
    Map<String, dynamic>? filters,
  }) async {
    if (!_apmEnabled) {
      throw Exception('APM is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/apm/metrics',
        queryParams: {
          if (service != null) 'service': service,
          if (metric != null) 'metric': metric,
          if (timeRange != null) 'time_range': timeRange.inSeconds.toString(),
          if (filters != null) 'filters': jsonEncode(filters),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get APM metrics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// APM Health Check
  Future<Map<String, dynamic>> apmHealthCheck({
    String? service,
    Map<String, dynamic>? checks,
  }) async {
    if (!_apmEnabled) {
      throw Exception('APM is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/apm/health',
        body: {
          if (service != null) 'service': service,
          if (checks != null) 'checks': checks,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to perform health check: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Validator Integration
  Future<Map<String, dynamic>> validateData({
    required Map<String, dynamic> data,
    required Map<String, dynamic> schema,
    Map<String, dynamic>? rules,
  }) async {
    if (!_validatorEnabled) {
      throw Exception('Validator is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/validator/validate',
        body: {
          'data': data,
          'schema': schema,
          if (rules != null) 'rules': rules,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to validate data: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// SecGen Integration
  Future<Map<String, dynamic>> generateSecrets({
    required String type,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? options,
  }) async {
    if (!_secgenEnabled) {
      throw Exception('SecGen is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/secgen/generate',
        body: {
          'type': type,
          if (parameters != null) 'parameters': parameters,
          if (options != null) 'options': options,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to generate secrets: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// SecGen Password Generation
  Future<String> generatePassword({
    int length = 16,
    bool includeUppercase = true,
    bool includeLowercase = true,
    bool includeNumbers = true,
    bool includeSymbols = true,
  }) async {
    if (!_secgenEnabled) {
      throw Exception('SecGen is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/secgen/password',
        body: {
          'length': length,
          'include_uppercase': includeUppercase,
          'include_lowercase': includeLowercase,
          'include_numbers': includeNumbers,
          'include_symbols': includeSymbols,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['password'] ?? '';
      } else {
        throw Exception('Failed to generate password: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// SecGen SSH Key Generation
  Future<Map<String, String>> generateSSHKey({
    String type = 'rsa',
    int bits = 4096,
    String? comment,
  }) async {
    if (!_secgenEnabled) {
      throw Exception('SecGen is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/secgen/ssh-key',
        body: {
          'type': type,
          'bits': bits,
          if (comment != null) 'comment': comment,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'private_key': data['private_key'] ?? '',
          'public_key': data['public_key'] ?? '',
        };
      } else {
        throw Exception('Failed to generate SSH key: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// LinkPearl Matrix Integration
  Future<Map<String, dynamic>> linkPearlMatrixAction({
    required String action,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_linkpearlEnabled) {
      throw Exception('LinkPearl is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/linkpearl/matrix',
        body: {
          'action': action,
          if (parameters != null) 'parameters': parameters,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to perform Matrix action: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// PSD (Prometheus Service Discovery)
  Future<List<Map<String, dynamic>>> getPrometheusTargets({
    String? service,
    Map<String, dynamic>? filters,
  }) async {
    if (!_psdEnabled) {
      throw Exception('PSD is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/psd/targets',
        queryParams: {
          if (service != null) 'service': service,
          if (filters != null) 'filters': jsonEncode(filters),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['targets'] ?? []);
      } else {
        throw Exception('Failed to get Prometheus targets: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Pricify Integration
  Future<Map<String, dynamic>> getPricing({
    required String service,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_pricifyEnabled) {
      throw Exception('Pricify is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/pricify/calculate',
        body: {
          'service': service,
          if (parameters != null) 'parameters': parameters,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to calculate pricing: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// MSC1929 Integration
  Future<Map<String, dynamic>> msc1929Action({
    required String action,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_msc1929Enabled) {
      throw Exception('MSC1929 is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/msc1929/action',
        body: {
          'action': action,
          if (parameters != null) 'parameters': parameters,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to perform MSC1929 action: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'ansible': _ansibleEnabled,
    'apm': _apmEnabled,
    'validator': _validatorEnabled,
    'secgen': _secgenEnabled,
    'linkpearl': _linkpearlEnabled,
    'psd': _psdEnabled,
    'pricify': _pricifyEnabled,
    'msc1929': _msc1929Enabled,
  };

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
      'User-Agent': 'REChain-EtkeGo/1.0',
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