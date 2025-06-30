import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Analytics Integration Service
/// Provides comprehensive analytics for Matrix communication
class MatrixAnalyticsIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Analytics services
  bool _businessIntelligenceEnabled = false;
  bool _userBehaviorAnalysisEnabled = false;
  bool _predictiveAnalyticsEnabled = false;
  bool _performanceAnalyticsEnabled = false;
  bool _contentAnalyticsEnabled = false;
  bool _networkAnalyticsEnabled = false;
  bool _trendAnalysisEnabled = false;
  bool _reportingEnabled = false;

  MatrixAnalyticsIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-analytics.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix analytics services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Initializing Matrix analytics services...');
      }

      // Test connection to Matrix Analytics API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Analytics API is not available');
      }

      // Initialize individual services
      await _initializeBusinessIntelligence();
      await _initializeUserBehaviorAnalysis();
      await _initializePredictiveAnalytics();
      await _initializePerformanceAnalytics();
      await _initializeContentAnalytics();
      await _initializeNetworkAnalytics();
      await _initializeTrendAnalysis();
      await _initializeReporting();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Matrix analytics services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Analytics API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Business Intelligence
  Future<void> _initializeBusinessIntelligence() async {
    try {
      final response = await _makeRequest('POST', '/analytics/business-intelligence/initialize');
      if (response.statusCode == 200) {
        _businessIntelligenceEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Business intelligence initialization failed: $e');
      }
    }
  }

  /// Initialize User Behavior Analysis
  Future<void> _initializeUserBehaviorAnalysis() async {
    try {
      final response = await _makeRequest('POST', '/analytics/user-behavior/initialize');
      if (response.statusCode == 200) {
        _userBehaviorAnalysisEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] User behavior analysis initialization failed: $e');
      }
    }
  }

  /// Initialize Predictive Analytics
  Future<void> _initializePredictiveAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/analytics/predictive/initialize');
      if (response.statusCode == 200) {
        _predictiveAnalyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Predictive analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Performance Analytics
  Future<void> _initializePerformanceAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/analytics/performance/initialize');
      if (response.statusCode == 200) {
        _performanceAnalyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Performance analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Content Analytics
  Future<void> _initializeContentAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/analytics/content/initialize');
      if (response.statusCode == 200) {
        _contentAnalyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Content analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Network Analytics
  Future<void> _initializeNetworkAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/analytics/network/initialize');
      if (response.statusCode == 200) {
        _networkAnalyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Network analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Trend Analysis
  Future<void> _initializeTrendAnalysis() async {
    try {
      final response = await _makeRequest('POST', '/analytics/trends/initialize');
      if (response.statusCode == 200) {
        _trendAnalysisEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Trend analysis initialization failed: $e');
      }
    }
  }

  /// Initialize Reporting
  Future<void> _initializeReporting() async {
    try {
      final response = await _makeRequest('POST', '/analytics/reporting/initialize');
      if (response.statusCode == 200) {
        _reportingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixAnalyticsIntegration] Reporting initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'business_intelligence': _businessIntelligenceEnabled,
    'user_behavior_analysis': _userBehaviorAnalysisEnabled,
    'predictive_analytics': _predictiveAnalyticsEnabled,
    'performance_analytics': _performanceAnalyticsEnabled,
    'content_analytics': _contentAnalyticsEnabled,
    'network_analytics': _networkAnalyticsEnabled,
    'trend_analysis': _trendAnalysisEnabled,
    'reporting': _reportingEnabled,
  };

  /// Business Intelligence - Generate business insights
  Future<Map<String, dynamic>> generateBusinessInsights({
    required String insightType,
    required Map<String, dynamic> data,
    Map<String, dynamic>? parameters,
  }) async {
    if (!_businessIntelligenceEnabled) {
      throw Exception('Business intelligence is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/business-intelligence/insights',
        body: {
          'insight_type': insightType,
          'data': data,
          if (parameters != null) 'parameters': parameters,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to generate business insights: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// User Behavior Analysis - Analyze user behavior
  Future<Map<String, dynamic>> analyzeUserBehavior({
    required String userId,
    required Map<String, dynamic> behaviorData,
    Map<String, dynamic>? analysisParams,
  }) async {
    if (!_userBehaviorAnalysisEnabled) {
      throw Exception('User behavior analysis is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/user-behavior/analyze',
        body: {
          'user_id': userId,
          'behavior_data': behaviorData,
          if (analysisParams != null) 'analysis_params': analysisParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to analyze user behavior: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Predictive Analytics - Generate predictions
  Future<Map<String, dynamic>> generatePredictions({
    required String predictionType,
    required Map<String, dynamic> historicalData,
    Map<String, dynamic>? predictionParams,
  }) async {
    if (!_predictiveAnalyticsEnabled) {
      throw Exception('Predictive analytics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/predictive/generate',
        body: {
          'prediction_type': predictionType,
          'historical_data': historicalData,
          if (predictionParams != null) 'prediction_params': predictionParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to generate predictions: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Performance Analytics - Analyze performance metrics
  Future<Map<String, dynamic>> analyzePerformance({
    required String metricType,
    required Map<String, dynamic> performanceData,
    Map<String, dynamic>? analysisParams,
  }) async {
    if (!_performanceAnalyticsEnabled) {
      throw Exception('Performance analytics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/performance/analyze',
        body: {
          'metric_type': metricType,
          'performance_data': performanceData,
          if (analysisParams != null) 'analysis_params': analysisParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to analyze performance: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Content Analytics - Analyze content engagement
  Future<Map<String, dynamic>> analyzeContentEngagement({
    required String contentId,
    required Map<String, dynamic> engagementData,
    Map<String, dynamic>? analysisParams,
  }) async {
    if (!_contentAnalyticsEnabled) {
      throw Exception('Content analytics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/content/engagement',
        body: {
          'content_id': contentId,
          'engagement_data': engagementData,
          if (analysisParams != null) 'analysis_params': analysisParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to analyze content engagement: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Network Analytics - Analyze network patterns
  Future<Map<String, dynamic>> analyzeNetworkPatterns({
    required String networkId,
    required Map<String, dynamic> networkData,
    Map<String, dynamic>? analysisParams,
  }) async {
    if (!_networkAnalyticsEnabled) {
      throw Exception('Network analytics is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/network/patterns',
        body: {
          'network_id': networkId,
          'network_data': networkData,
          if (analysisParams != null) 'analysis_params': analysisParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to analyze network patterns: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Trend Analysis - Analyze trends
  Future<Map<String, dynamic>> analyzeTrends({
    required String trendType,
    required Map<String, dynamic> trendData,
    Map<String, dynamic>? analysisParams,
  }) async {
    if (!_trendAnalysisEnabled) {
      throw Exception('Trend analysis is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/trends/analyze',
        body: {
          'trend_type': trendType,
          'trend_data': trendData,
          if (analysisParams != null) 'analysis_params': analysisParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to analyze trends: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Reporting - Generate reports
  Future<Map<String, dynamic>> generateReport({
    required String reportType,
    required Map<String, dynamic> reportData,
    Map<String, dynamic>? reportParams,
  }) async {
    if (!_reportingEnabled) {
      throw Exception('Reporting is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/analytics/reporting/generate',
        body: {
          'report_type': reportType,
          'report_data': reportData,
          if (reportParams != null) 'report_params': reportParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to generate report: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get analytics dashboard
  Future<Map<String, dynamic>> getAnalyticsDashboard() async {
    try {
      final response = await _makeRequest('GET', '/analytics/dashboard');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get analytics dashboard: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get analytics metrics
  Future<Map<String, dynamic>> getAnalyticsMetrics({
    String? metricType,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/analytics/metrics',
        queryParams: {
          if (metricType != null) 'metric_type': metricType,
          if (startDate != null) 'start_date': startDate.toIso8601String(),
          if (endDate != null) 'end_date': endDate.toIso8601String(),
        },
      );
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get analytics metrics: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixAnalytics/1.0',
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