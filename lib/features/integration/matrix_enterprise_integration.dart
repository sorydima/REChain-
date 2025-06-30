import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Enterprise Integration Service
/// Provides enterprise features for Matrix communication
class MatrixEnterpriseIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Enterprise services
  bool _businessCommunicationEnabled = false;
  bool _projectManagementEnabled = false;
  bool _teamCollaborationEnabled = false;
  bool _enterpriseSecurityEnabled = false;
  bool _complianceEnabled = false;
  bool _analyticsEnabled = false;
  bool _workflowAutomationEnabled = false;
  bool _integrationHubEnabled = false;

  MatrixEnterpriseIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-enterprise.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix enterprise services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Initializing Matrix enterprise services...');
      }

      // Test connection to Matrix Enterprise API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Enterprise API is not available');
      }

      // Initialize individual services
      await _initializeBusinessCommunication();
      await _initializeProjectManagement();
      await _initializeTeamCollaboration();
      await _initializeEnterpriseSecurity();
      await _initializeCompliance();
      await _initializeAnalytics();
      await _initializeWorkflowAutomation();
      await _initializeIntegrationHub();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Matrix enterprise services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Enterprise API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Business Communication
  Future<void> _initializeBusinessCommunication() async {
    try {
      final response = await _makeRequest('POST', '/enterprise/communication/initialize');
      if (response.statusCode == 200) {
        _businessCommunicationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Business communication initialization failed: $e');
      }
    }
  }

  /// Initialize Project Management
  Future<void> _initializeProjectManagement() async {
    try {
      final response = await _makeRequest('POST', '/enterprise/projects/initialize');
      if (response.statusCode == 200) {
        _projectManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Project management initialization failed: $e');
      }
    }
  }

  /// Initialize Team Collaboration
  Future<void> _initializeTeamCollaboration() async {
    try {
      final response = await _makeRequest('POST', '/enterprise/collaboration/initialize');
      if (response.statusCode == 200) {
        _teamCollaborationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Team collaboration initialization failed: $e');
      }
    }
  }

  /// Initialize Enterprise Security
  Future<void> _initializeEnterpriseSecurity() async {
    try {
      final response = await _makeRequest('POST', '/enterprise/security/initialize');
      if (response.statusCode == 200) {
        _enterpriseSecurityEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Enterprise security initialization failed: $e');
      }
    }
  }

  /// Initialize Compliance
  Future<void> _initializeCompliance() async {
    try {
      final response = await _makeRequest('POST', '/enterprise/compliance/initialize');
      if (response.statusCode == 200) {
        _complianceEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Compliance initialization failed: $e');
      }
    }
  }

  /// Initialize Analytics
  Future<void> _initializeAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/enterprise/analytics/initialize');
      if (response.statusCode == 200) {
        _analyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Workflow Automation
  Future<void> _initializeWorkflowAutomation() async {
    try {
      final response = await _makeRequest('POST', '/enterprise/workflow/initialize');
      if (response.statusCode == 200) {
        _workflowAutomationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Workflow automation initialization failed: $e');
      }
    }
  }

  /// Initialize Integration Hub
  Future<void> _initializeIntegrationHub() async {
    try {
      final response = await _makeRequest('POST', '/enterprise/integrations/initialize');
      if (response.statusCode == 200) {
        _integrationHubEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEnterpriseIntegration] Integration hub initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'business_communication': _businessCommunicationEnabled,
    'project_management': _projectManagementEnabled,
    'team_collaboration': _teamCollaborationEnabled,
    'enterprise_security': _enterpriseSecurityEnabled,
    'compliance': _complianceEnabled,
    'analytics': _analyticsEnabled,
    'workflow_automation': _workflowAutomationEnabled,
    'integration_hub': _integrationHubEnabled,
  };

  /// Business Communication - Create business channel
  Future<Map<String, dynamic>> createBusinessChannel({
    required String channelName,
    required String channelType,
    required List<String> members,
    Map<String, dynamic>? channelConfig,
  }) async {
    if (!_businessCommunicationEnabled) {
      throw Exception('Business communication is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/communication/create-channel',
        body: {
          'channel_name': channelName,
          'channel_type': channelType,
          'members': members,
          'channel_config': channelConfig ?? {
            'encryption': true,
            'message_retention': 365,
            'file_sharing': true,
            'voice_calls': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create business channel: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Business Communication - Send business message
  Future<Map<String, dynamic>> sendBusinessMessage({
    required String channelId,
    required String senderId,
    required String message,
    String? messageType,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_businessCommunicationEnabled) {
      throw Exception('Business communication is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/communication/send-message',
        body: {
          'channel_id': channelId,
          'sender_id': senderId,
          'message': message,
          'message_type': messageType ?? 'text',
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send business message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Project Management - Create project
  Future<Map<String, dynamic>> createProject({
    required String projectName,
    required String description,
    required String projectManager,
    required List<String> teamMembers,
    required DateTime startDate,
    required DateTime endDate,
    Map<String, dynamic>? projectConfig,
  }) async {
    if (!_projectManagementEnabled) {
      throw Exception('Project management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/projects/create',
        body: {
          'project_name': projectName,
          'description': description,
          'project_manager': projectManager,
          'team_members': teamMembers,
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
          'project_config': projectConfig ?? {
            'status': 'planning',
            'priority': 'medium',
            'budget': 0,
            'milestones': [],
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create project: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Project Management - Create task
  Future<Map<String, dynamic>> createTask({
    required String projectId,
    required String taskName,
    required String description,
    required String assignee,
    required DateTime dueDate,
    Map<String, dynamic>? taskConfig,
  }) async {
    if (!_projectManagementEnabled) {
      throw Exception('Project management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/projects/create-task',
        body: {
          'project_id': projectId,
          'task_name': taskName,
          'description': description,
          'assignee': assignee,
          'due_date': dueDate.toIso8601String(),
          'task_config': taskConfig ?? {
            'priority': 'medium',
            'status': 'todo',
            'estimated_hours': 8,
            'dependencies': [],
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create task: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Team Collaboration - Create workspace
  Future<Map<String, dynamic>> createWorkspace({
    required String workspaceName,
    required String ownerId,
    required List<String> members,
    Map<String, dynamic>? workspaceConfig,
  }) async {
    if (!_teamCollaborationEnabled) {
      throw Exception('Team collaboration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/collaboration/create-workspace',
        body: {
          'workspace_name': workspaceName,
          'owner_id': ownerId,
          'members': members,
          'workspace_config': workspaceConfig ?? {
            'channels': [],
            'file_storage': true,
            'wiki_enabled': true,
            'calendar_enabled': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create workspace: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enterprise Security - Configure security policies
  Future<Map<String, dynamic>> configureSecurityPolicies({
    required String organizationId,
    required Map<String, dynamic> policies,
  }) async {
    if (!_enterpriseSecurityEnabled) {
      throw Exception('Enterprise security is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/security/configure-policies',
        body: {
          'organization_id': organizationId,
          'policies': policies,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to configure security policies: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Enterprise Security - Audit access
  Future<Map<String, dynamic>> auditAccess({
    required String userId,
    required String resourceId,
    required String action,
    Map<String, dynamic>? context,
  }) async {
    if (!_enterpriseSecurityEnabled) {
      throw Exception('Enterprise security is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/security/audit-access',
        body: {
          'user_id': userId,
          'resource_id': resourceId,
          'action': action,
          if (context != null) 'context': context,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to audit access: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Compliance - Generate compliance report
  Future<Map<String, dynamic>> generateComplianceReport({
    required String reportType,
    required DateTime startDate,
    required DateTime endDate,
    Map<String, dynamic>? filters,
  }) async {
    if (!_complianceEnabled) {
      throw Exception('Compliance is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/compliance/generate-report',
        body: {
          'report_type': reportType,
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
          if (filters != null) 'filters': filters,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to generate compliance report: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Analytics - Get business analytics
  Future<Map<String, dynamic>> getBusinessAnalytics({
    required String metricType,
    DateTime? startDate,
    DateTime? endDate,
    Map<String, dynamic>? dimensions,
  }) async {
    if (!_analyticsEnabled) {
      throw Exception('Analytics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/enterprise/analytics/business',
        queryParams: {
          'metric_type': metricType,
          if (startDate != null) 'start_date': startDate.toIso8601String(),
          if (endDate != null) 'end_date': endDate.toIso8601String(),
          if (dimensions != null) 'dimensions': jsonEncode(dimensions),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get business analytics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Workflow Automation - Create workflow
  Future<Map<String, dynamic>> createWorkflow({
    required String workflowName,
    required List<Map<String, dynamic>> steps,
    required Map<String, dynamic> triggers,
    Map<String, dynamic>? workflowConfig,
  }) async {
    if (!_workflowAutomationEnabled) {
      throw Exception('Workflow automation is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/workflow/create',
        body: {
          'workflow_name': workflowName,
          'steps': steps,
          'triggers': triggers,
          'workflow_config': workflowConfig ?? {
            'enabled': true,
            'timeout': 3600,
            'retry_count': 3,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create workflow: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Integration Hub - Connect external service
  Future<Map<String, dynamic>> connectExternalService({
    required String serviceName,
    required String serviceType,
    required Map<String, dynamic> credentials,
    Map<String, dynamic>? config,
  }) async {
    if (!_integrationHubEnabled) {
      throw Exception('Integration hub is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/enterprise/integrations/connect',
        body: {
          'service_name': serviceName,
          'service_type': serviceType,
          'credentials': credentials,
          'config': config ?? {
            'sync_enabled': true,
            'webhook_enabled': true,
            'data_mapping': {},
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to connect external service: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get enterprise dashboard
  Future<Map<String, dynamic>> getEnterpriseDashboard() async {
    try {
      final response = await _makeRequest('GET', '/enterprise/dashboard');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get enterprise dashboard: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get connected services
  Future<List<Map<String, dynamic>>> getConnectedServices() async {
    try {
      final response = await _makeRequest('GET', '/enterprise/integrations/connected');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['services'] ?? []);
      } else {
        throw Exception('Failed to get connected services: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixEnterprise/1.0',
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