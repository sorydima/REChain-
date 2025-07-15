import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../monitoring/prometheus_service.dart';
import '../monitoring/grafana_service.dart';
import '../ai/gigachat_service.dart';
import '../ai/gigacode_service.dart';
import '../development/sourcecraft_service.dart';
import 'github_service.dart';
import 'etke_matrix_integration.dart';
import 'etke_rust_integration.dart';
import 'etke_go_integration.dart';
import 'element_matrix_integration.dart';
import 'element_call_integration.dart';
import 'element_bridge_integration.dart';
import 'fluffychat_integration.dart';
import 'krille_chan_integration.dart';
import 'nheko_integration.dart';
import 'cinny_integration.dart';
import 'neochat_integration.dart';
import 'feature_integration.dart';
import 'git_github_integration.dart';
import 'etke_integration.dart';
import 'element_integration.dart';
import 'matrix_protocol_extensions.dart';
import 'matrix_bridges_integration.dart';
import 'matrix_federation_integration.dart';
import 'matrix_appservices_integration.dart';
import 'matrix_ai_integration.dart';
import 'matrix_blockchain_integration.dart';
import 'matrix_iot_integration.dart';
import 'matrix_gaming_integration.dart';
import 'matrix_education_integration.dart';
import 'matrix_enterprise_integration.dart';
import '../auth/ton_auth_service.dart';
import '../auth/telegram_auth_service.dart';
import '../auth/bitget_auth_service.dart';
import '../auth/web3_auth_service.dart';
import '../ipfs/ipfs_service.dart';
import '../ipfs/ipfs_provider_registry.dart';

/// Integration Manager for coordinating external services
class IntegrationManager extends ChangeNotifier {
  final PrometheusService? _prometheusService;
  final GrafanaService? _grafanaService;
  final GigachatService? _gigachatService;
  final GigacodeService? _gigacodeService;
  final SourcecraftService? _sourcecraftService;
  final GitHubService? _githubService;
  final EtkeMatrixIntegration? _etkeMatrixIntegration;
  final EtkeRustIntegration? _etkeRustIntegration;
  final EtkeGoIntegration? _etkeGoIntegration;
  final ElementMatrixIntegration? _elementMatrixIntegration;
  final ElementCallIntegration? _elementCallIntegration;
  final ElementBridgeIntegration? _elementBridgeIntegration;
  final FluffyChatIntegration? _fluffyChatIntegration;
  final NeoChatIntegration? _neoChatIntegration;
  final GitGitHubIntegration? _gitGitHubService;

  // Matrix Client Integrations
  EtkeIntegration? _etkeIntegration;
  ElementIntegration? _elementIntegration;
  FluffyChatIntegration? _fluffychatIntegration;
  KrilleChanIntegration? _krilleChanIntegration;
  NhekoIntegration? _nhekoIntegration;
  CinnyIntegration? _cinnyIntegration;
  NeoChatIntegration? _neochatIntegration;

  // Matrix Server Integrations
  DendriteIntegration? _dendriteIntegration;

  // Matrix Backend Integrations
  MatrixProtocolExtensions? _matrixProtocolExtensions;
  MatrixBridgesIntegration? _matrixBridgesIntegration;
  MatrixFederationIntegration? _matrixFederationIntegration;
  MatrixAppServicesIntegration? _matrixAppServicesIntegration;

  // Advanced Matrix Integrations
  MatrixAIIntegration? _matrixAIIntegration;
  MatrixBlockchainIntegration? _matrixBlockchainIntegration;
  MatrixIoTIntegration? _matrixIoTIntegration;

  // Serverless Services Integration
  ServerlessServicesIntegration? _serverlessServicesIntegration;

  // API Integration
  ApiIntegration? _apiIntegration;

  // Configuration
  final Map<String, dynamic> _config = {};
  final List<Map<String, dynamic>> _logs = [];
  final Map<String, bool> _serviceStatus = {};

  // Event streams
  final StreamController<Map<String, dynamic>> _eventController = 
      StreamController<Map<String, dynamic>>.broadcast();

  // Gaming, Education, and Enterprise integrations
  MatrixGamingIntegration? _matrixGamingIntegration;
  MatrixEducationIntegration? _matrixEducationIntegration;
  MatrixEnterpriseIntegration? _matrixEnterpriseIntegration;

  // Auth services
  TONAuthService? _tonAuthService;
  TelegramAuthService? _telegramAuthService;
  BitgetAuthService? _bitgetAuthService;
  Web3AuthService? _web3AuthService;

  // IPFS Integration
  IpfsService? _ipfsService;
  String? _currentIpfsProvider;
  Map<String, dynamic>? _ipfsConfig;

  IntegrationManager({
    PrometheusService? prometheusService,
    GrafanaService? grafanaService,
    GigachatService? gigachatService,
    GigacodeService? gigacodeService,
    SourcecraftService? sourcecraftService,
    GitHubService? githubService,
    EtkeMatrixIntegration? etkeMatrixIntegration,
    EtkeRustIntegration? etkeRustIntegration,
    EtkeGoIntegration? etkeGoIntegration,
    ElementMatrixIntegration? elementMatrixIntegration,
    ElementCallIntegration? elementCallIntegration,
    ElementBridgeIntegration? elementBridgeIntegration,
    FluffyChatIntegration? fluffyChatIntegration,
    TONAuthService? tonAuthService,
    TelegramAuthService? telegramAuthService,
    BitgetAuthService? bitgetAuthService,
    Web3AuthService? web3AuthService,
    KrilleChanIntegration? krilleChanIntegration,
    NhekoIntegration? nhekoIntegration,
    CinnyIntegration? cinnyIntegration,
    NeoChatIntegration? neoChatIntegration,
    GitGitHubIntegration? gitGitHubService,
  })  : _prometheusService = prometheusService,
        _grafanaService = grafanaService,
        _gigachatService = gigachatService,
        _gigacodeService = gigacodeService,
        _sourcecraftService = sourcecraftService,
        _githubService = githubService,
        _etkeMatrixIntegration = etkeMatrixIntegration,
        _etkeRustIntegration = etkeRustIntegration,
        _etkeGoIntegration = etkeGoIntegration,
        _elementMatrixIntegration = elementMatrixIntegration,
        _elementCallIntegration = elementCallIntegration,
        _elementBridgeIntegration = elementBridgeIntegration,
        _fluffyChatIntegration = fluffyChatIntegration,
        _krilleChanIntegration = krilleChanIntegration,
        _nhekoIntegration = nhekoIntegration,
        _cinnyIntegration = cinnyIntegration,
        _neoChatIntegration = neoChatIntegration,
        _gitGitHubService = gitGitHubService,
        _tonAuthService = tonAuthService,
        _telegramAuthService = telegramAuthService,
        _bitgetAuthService = bitgetAuthService,
        _web3AuthService = web3AuthService;

  @override
  void dispose() {
    _etkeIntegration?.dispose();
    _elementIntegration?.dispose();
    _fluffyChatIntegration?.dispose();
    _krilleChanIntegration?.dispose();
    _nhekoIntegration?.dispose();
    _cinnyIntegration?.dispose();
    _neoChatIntegration?.dispose();
    _synapseIntegration?.dispose();
    _dendriteIntegration?.dispose();
    _gitGitHubService?.dispose();
    _serverlessServicesIntegration?.dispose();
    _apiIntegration?.dispose();
    
    _eventController.close();
    super.dispose();
  }

  /// Get Matrix Clients Dashboard Data
  Future<Map<String, dynamic>> getMatrixClientsDashboardData() async {
    final data = <String, dynamic>{};

    // Get status for all Matrix clients
    if (_etkeIntegration != null) {
      data['etke'] = await _etkeIntegration!.getServiceStatus();
    }
    if (_elementIntegration != null) {
      data['element'] = await _elementIntegration!.getServiceStatus();
    }
    if (_fluffyChatIntegration != null) {
      data['fluffychat'] = await _fluffyChatIntegration!.getServiceStatus();
    }
    if (_krilleChanIntegration != null) {
      data['krilleChan'] = await _krilleChanIntegration!.getServiceStatus();
    }
    if (_nhekoIntegration != null) {
      data['nheko'] = await _nhekoIntegration!.getServiceStatus();
    }
    if (_cinnyIntegration != null) {
      data['cinny'] = await _cinnyIntegration!.getServiceStatus();
    }
    if (_neoChatIntegration != null) {
      data['neochat'] = await _neoChatIntegration!.getServiceStatus();
    }

    return data;
  }

  /// Get Matrix Servers Dashboard Data
  Future<Map<String, dynamic>> getMatrixServersDashboardData() async {
    final data = <String, dynamic>{};

    // Get status for all Matrix servers
    // if (_synapseIntegration != null) {
    //   data['synapse'] = await _synapseIntegration!.getServerStatus();
    // }
    // if (_dendriteIntegration != null) {
    //   data['dendrite'] = await _dendriteIntegration!.getServerStatus();
    // }

    return data;
  }

  /// Get Git/GitHub Dashboard Data
  Future<Map<String, dynamic>> getGitGitHubDashboardData() async {
    if (_gitGitHubService != null) {
      return await _gitGitHubService!.getDashboardData();
    }
    return {};
  }

  /// Get Serverless Services Dashboard Data
  Future<Map<String, dynamic>> getServerlessServicesDashboardData() async {
    if (_serverlessServicesIntegration != null) {
      return {
        'availableServices': _serverlessServicesIntegration!.getAvailableServices(),
        'serviceStatus': await _serverlessServicesIntegration!.getServiceStatus(),
      };
    }
    return {};
  }

  /// Get API Integration Dashboard Data
  Future<Map<String, dynamic>> getApiIntegrationDashboardData() async {
    if (_apiIntegration != null) {
      return {
        'metrics': _apiIntegration!.getApiMetrics(),
        'cacheStatus': _apiIntegration!.getCacheStatus(),
      };
    }
    return {};
  }

  /// Configure service
  Future<bool> configureService(String serviceName, Map<String, dynamic> config) async {
    try {
      _log('Configuring service: $serviceName', 'info');

      switch (serviceName) {
        case 'etke':
          if (_etkeIntegration != null) {
            return await _etkeIntegration!.initialize(
              serverUrl: config['serverUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'element':
          if (_elementIntegration != null) {
            return await _elementIntegration!.initialize(
              serverUrl: config['serverUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'fluffychat':
          if (_fluffyChatIntegration != null) {
            return await _fluffyChatIntegration!.initialize(
              serverUrl: config['serverUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'krilleChan':
          if (_krilleChanIntegration != null) {
            return await _krilleChanIntegration!.initialize(
              serverUrl: config['serverUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'nheko':
          if (_nhekoIntegration != null) {
            return await _nhekoIntegration!.initialize(
              serverUrl: config['serverUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'cinny':
          if (_cinnyIntegration != null) {
            return await _cinnyIntegration!.initialize(
              serverUrl: config['serverUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'neochat':
          if (_neoChatIntegration != null) {
            return await _neoChatIntegration!.initialize(
              serverUrl: config['serverUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'synapse':
          if (_synapseIntegration != null) {
            return await _synapseIntegration!.initialize(
              serverUrl: config['serverUrl'],
              adminUrl: config['adminUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'dendrite':
          if (_dendriteIntegration != null) {
            return await _dendriteIntegration!.initialize(
              serverUrl: config['serverUrl'],
              adminUrl: config['adminUrl'],
              accessToken: config['accessToken'],
            );
          }
          break;

        case 'gitGitHub':
          if (_gitGitHubService != null) {
            return await _gitGitHubService!.initialize(
              githubToken: config['githubToken'],
              localRepoPath: config['localRepoPath'],
            );
          }
          break;

        case 'serverless':
          if (_serverlessServicesIntegration != null) {
            // Configure serverless services
            _config['serverless'] = config;
            return true;
          }
          break;

        case 'api':
          if (_apiIntegration != null) {
            // Configure API integration
            _config['api'] = config;
            return true;
          }
          break;
      }

      return false;
    } catch (e) {
      _log('Error configuring service $serviceName: $e', 'error');
      return false;
    }
  }

  /// Get service instance
  dynamic getService(String serviceName) {
    switch (serviceName) {
      case 'etke':
        return _etkeIntegration;
      case 'element':
        return _elementIntegration;
      case 'fluffychat':
        return _fluffyChatIntegration;
      case 'krilleChan':
        return _krilleChanIntegration;
      case 'nheko':
        return _nhekoIntegration;
      case 'cinny':
        return _cinnyIntegration;
      case 'neochat':
        return _neoChatIntegration;
      case 'synapse':
        return _synapseIntegration;
      case 'dendrite':
        return _dendriteIntegration;
      case 'gitGitHub':
        return _gitGitHubService;
      case 'serverless':
        return _serverlessServicesIntegration;
      case 'api':
        return _apiIntegration;
      case 'tonAuth':
        return _tonAuthService;
      case 'telegramAuth':
        return _telegramAuthService;
      case 'bitgetAuth':
        return _bitgetAuthService;
      case 'web3Auth':
        return _web3AuthService;
      default:
        return null;
    }
  }

  /// Get logs
  List<Map<String, dynamic>> getLogs() => List.unmodifiable(_logs);

  /// Get service status map
  Map<String, bool> getServiceStatus() => Map.unmodifiable(_serviceStatus);

  /// Get event stream
  Stream<Map<String, dynamic>> get eventStream => _eventController.stream;

  /// Log message
  void _log(String message, String level) {
    final logEntry = {
      'timestamp': DateTime.now().toIso8601String(),
      'level': level,
      'message': message,
    };
    
    _logs.add(logEntry);
    
    // Keep only last 1000 logs
    if (_logs.length > 1000) {
      _logs.removeAt(0);
    }
    
    // Emit event
    _eventController.add({
      'type': 'log',
      'data': logEntry,
    });
    
    notifyListeners();
  }

  /// Clear logs
  void clearLogs() {
    _logs.clear();
    notifyListeners();
  }

  /// Dispose resources
  @override
  void dispose() {
    _etkeIntegration?.dispose();
    _elementIntegration?.dispose();
    _fluffyChatIntegration?.dispose();
    _krilleChanIntegration?.dispose();
    _nhekoIntegration?.dispose();
    _cinnyIntegration?.dispose();
    _neoChatIntegration?.dispose();
    _synapseIntegration?.dispose();
    _dendriteIntegration?.dispose();
    _gitGitHubService?.dispose();
    _serverlessServicesIntegration?.dispose();
    _apiIntegration?.dispose();
    
    _eventController.close();
    super.dispose();
  }

  /// Get comprehensive system health overview
  Future<SystemHealthOverview> getSystemHealthOverview() async {
    try {
      final healthData = <String, dynamic>{};

      // Get Prometheus metrics if available
      if (_prometheusService != null) {
        try {
          final systemHealth = await _prometheusService!.getSystemHealth();
          healthData['prometheus'] = {
            'cpu_usage': systemHealth.cpuUsage,
            'memory_usage': systemHealth.memoryUsage,
            'disk_usage': systemHealth.diskUsage,
            'timestamp': systemHealth.timestamp.toIso8601String(),
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Prometheus health: $e');
          }
        }
      }

      // Get Grafana dashboards if available
      if (_grafanaService != null) {
        try {
          final dashboards = await _grafanaService!.getDashboards();
          healthData['grafana'] = {
            'dashboard_count': dashboards.length,
            'dashboards': dashboards.map((d) => d.title).toList(),
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Grafana dashboards: $e');
          }
        }
      }

      // Get etke.cc Matrix integration health
      if (_etkeMatrixIntegration != null) {
        try {
          final matrixHealth = await _etkeMatrixIntegration!.getHealthStatus();
          healthData['etke_matrix'] = matrixHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get etke.cc Matrix health: $e');
          }
        }
      }

      // Get etke.cc Rust integration health
      if (_etkeRustIntegration != null) {
        try {
          final rustHealth = await _etkeRustIntegration!.getHealthStatus();
          healthData['etke_rust'] = rustHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get etke.cc Rust health: $e');
          }
        }
      }

      // Get etke.cc Go integration health
      if (_etkeGoIntegration != null) {
        try {
          final goHealth = await _etkeGoIntegration!.getHealthStatus();
          healthData['etke_go'] = goHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get etke.cc Go health: $e');
          }
        }
      }

      // Get Element.io Matrix integration health
      if (_elementMatrixIntegration != null) {
        try {
          final elementMatrixHealth = await _elementMatrixIntegration!.getHealthStatus();
          healthData['element_matrix'] = elementMatrixHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Element.io Matrix health: $e');
          }
        }
      }

      // Get Element Call integration health
      if (_elementCallIntegration != null) {
        try {
          final elementCallHealth = await _elementCallIntegration!.getHealthStatus();
          healthData['element_call'] = elementCallHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Element Call health: $e');
          }
        }
      }

      // Get Element Bridge integration health
      if (_elementBridgeIntegration != null) {
        try {
          final elementBridgeHealth = await _elementBridgeIntegration!.getHealthStatus();
          healthData['element_bridge'] = elementBridgeHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Element Bridge health: $e');
          }
        }
      }

      // Get FluffyChat integration health
      if (_fluffyChatIntegration != null) {
        try {
          final fluffyChatHealth = await _fluffyChatIntegration!.getHealthStatus();
          healthData['fluffychat'] = fluffyChatHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get FluffyChat health: $e');
          }
        }
      }

      // Get Krille-chan integration health
      if (_krilleChanIntegration != null) {
        try {
          final krilleChanHealth = await _krilleChanIntegration!.getHealthStatus();
          healthData['krille_chan'] = krilleChanHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Krille-chan health: $e');
          }
        }
      }

      // Get Nheko integration health
      if (_nhekoIntegration != null) {
        try {
          final nhekoHealth = await _nhekoIntegration!.getHealthStatus();
          healthData['nheko'] = nhekoHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Nheko health: $e');
          }
        }
      }

      // Get Cinny integration health
      if (_cinnyIntegration != null) {
        try {
          final cinnyHealth = await _cinnyIntegration!.getHealthStatus();
          healthData['cinny'] = cinnyHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Cinny health: $e');
          }
        }
      }

      // Get NeoChat integration health
      if (_neoChatIntegration != null) {
        try {
          final neoChatHealth = await _neoChatIntegration!.getHealthStatus();
          healthData['neochat'] = neoChatHealth;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get NeoChat health: $e');
          }
        }
      }

      return SystemHealthOverview(
        timestamp: DateTime.now(),
        healthData: healthData,
        services: {
          'prometheus': _prometheusService != null,
          'grafana': _grafanaService != null,
          'gigachat': _gigachatService != null,
          'gigacode': _gigacodeService != null,
          'sourcecraft': _sourcecraftService != null,
          'github': _githubService != null,
          'etke_matrix': _etkeMatrixIntegration != null,
          'etke_rust': _etkeRustIntegration != null,
          'etke_go': _etkeGoIntegration != null,
          'element_matrix': _elementMatrixIntegration != null,
          'element_call': _elementCallIntegration != null,
          'element_bridge': _elementBridgeIntegration != null,
          'fluffychat': _fluffyChatIntegration != null,
          'krille_chan': _krilleChanIntegration != null,
          'nheko': _nhekoIntegration != null,
          'cinny': _cinnyIntegration != null,
          'neochat': _neoChatIntegration != null,
        },
      );
    } catch (e) {
      throw Exception('Error getting system health overview: $e');
    }
  }

  /// Get blockchain development insights
  Future<BlockchainDevelopmentInsights> getBlockchainDevelopmentInsights({
    required String repository,
    Duration period = const Duration(days: 30),
  }) async {
    try {
      final insights = BlockchainDevelopmentInsights(
        repository: repository,
        period: period,
        timestamp: DateTime.now(),
      );

      // Get GitHub analytics
      if (_githubService != null) {
        try {
          final commits = await _githubService!.getRepositoryCommits(
            owner: repository.split('/').first,
            repo: repository.split('/').last,
            since: DateTime.now().subtract(period),
          );
          insights.githubData = {
            'commit_count': commits.length,
            'recent_commits': commits.take(10).map((c) => c.message).toList(),
            'contributors': commits.map((c) => c.author.name).toSet().length,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get GitHub data: $e');
          }
        }
      }

      // Get Sourcecraft analytics
      if (_sourcecraftService != null) {
        try {
          final analytics = await _sourcecraftService!.getDevelopmentAnalytics(
            repository: repository,
            period: period,
          );
          insights.sourcecraftData = {
            'velocity': analytics.velocity,
            'efficiency': analytics.efficiency,
            'commits': analytics.commits,
            'pull_requests': analytics.pullRequests,
            'issues': analytics.issues,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Sourcecraft data: $e');
          }
        }
      }

      return insights;
    } catch (e) {
      throw Exception('Error getting blockchain development insights: $e');
    }
  }

  /// Get AI-powered code analysis
  Future<AICodeAnalysis> getAICodeAnalysis({
    required String code,
    required String language,
    String? context,
  }) async {
    try {
      final analysis = AICodeAnalysis(
        code: code,
        language: language,
        timestamp: DateTime.now(),
      );

      // Get Gigacode analysis
      if (_gigacodeService != null) {
        try {
          final codeAnalysis = await _gigacodeService!.analyzeCode(
            code: code,
            language: language,
            analysisTypes: ['security', 'performance', 'style'],
          );
          analysis.gigacodeAnalysis = {
            'quality_score': codeAnalysis.qualityScore,
            'issues_count': codeAnalysis.issues.length,
            'suggestions_count': codeAnalysis.suggestions.length,
            'issues': codeAnalysis.issues.map((i) => i.message).toList(),
            'suggestions': codeAnalysis.suggestions.map((s) => s.description).toList(),
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Gigacode analysis: $e');
          }
        }
      }

      // Get Sourcecraft quality analysis
      if (_sourcecraftService != null) {
        try {
          final qualityAnalysis = await _sourcecraftService!.analyzeCodeQuality(
            code: code,
            language: language,
          );
          analysis.sourcecraftAnalysis = {
            'overall_score': qualityAnalysis.overallScore,
            'metrics_count': qualityAnalysis.metrics.length,
            'issues_count': qualityAnalysis.issues.length,
            'metrics': qualityAnalysis.metrics.map((m) => {
              'name': m.name,
              'value': m.value,
              'is_good': m.isGood,
            }).toList(),
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Sourcecraft analysis: $e');
          }
        }
      }

      // Get AI explanation
      if (_gigachatService != null) {
        try {
          final explanation = await _gigachatService!.explainCode(
            code: code,
            language: language,
            explanationType: 'detailed',
          );
          analysis.aiExplanation = explanation.explanation;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get AI explanation: $e');
          }
        }
      }

      return analysis;
    } catch (e) {
      throw Exception('Error getting AI code analysis: $e');
    }
  }

  /// Get monitoring dashboard data
  Future<MonitoringDashboardData> getMonitoringDashboardData({
    required String appName,
    Duration period = const Duration(hours: 24),
  }) async {
    try {
      final dashboardData = MonitoringDashboardData(
        appName: appName,
        period: period,
        timestamp: DateTime.now(),
      );

      // Get Prometheus metrics
      if (_prometheusService != null) {
        try {
          final appPerformance = await _prometheusService!.getAppPerformance(
            appName: appName,
            period: period,
          );
          dashboardData.prometheusData = {
            'response_time_95th': appPerformance.responseTime95th.isNotEmpty 
                ? appPerformance.responseTime95th.last.value 
                : 0.0,
            'request_rate': appPerformance.requestRate.isNotEmpty 
                ? appPerformance.requestRate.last.value 
                : 0.0,
            'error_rate': appPerformance.errorRate.isNotEmpty 
                ? appPerformance.errorRate.last.value 
                : 0.0,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Prometheus data: $e');
          }
        }
      }

      // Get Grafana dashboards
      if (_grafanaService != null) {
        try {
          final dashboards = await _grafanaService!.getDashboards();
          dashboardData.grafanaData = {
            'dashboard_count': dashboards.length,
            'dashboards': dashboards.map((d) => {
              'title': d.title,
              'url': d.url,
              'type': d.type,
            }).toList(),
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Grafana data: $e');
          }
        }
      }

      return dashboardData;
    } catch (e) {
      throw Exception('Error getting monitoring dashboard data: $e');
    }
  }

  /// Get blockchain metrics
  Future<BlockchainMetricsData> getBlockchainMetrics({
    required String network,
    Duration period = const Duration(hours: 24),
  }) async {
    try {
      final metricsData = BlockchainMetricsData(
        network: network,
        period: period,
        timestamp: DateTime.now(),
      );

      // Get Prometheus blockchain metrics
      if (_prometheusService != null) {
        try {
          final blockchainMetrics = await _prometheusService!.getBlockchainMetrics(
            network: network,
            period: period,
          );
          metricsData.prometheusData = {
            'transaction_rate': blockchainMetrics.transactionRate.isNotEmpty 
                ? blockchainMetrics.transactionRate.last.value 
                : 0.0,
            'gas_price': blockchainMetrics.gasPrice.isNotEmpty 
                ? blockchainMetrics.gasPrice.last.value 
                : 0.0,
            'block_time': blockchainMetrics.blockTime.isNotEmpty 
                ? blockchainMetrics.blockTime.last.value 
                : 0.0,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Prometheus blockchain metrics: $e');
          }
        }
      }

      return metricsData;
    } catch (e) {
      throw Exception('Error getting blockchain metrics: $e');
    }
  }

  /// Generate smart contract with AI assistance
  Future<SmartContractGenerationResult> generateSmartContract({
    required String description,
    required String blockchain,
    required String language,
    Map<String, dynamic>? requirements,
  }) async {
    try {
      final result = SmartContractGenerationResult(
        description: description,
        blockchain: blockchain,
        language: language,
        timestamp: DateTime.now(),
      );

      // Generate contract with Gigacode
      if (_gigacodeService != null) {
        try {
          final contract = await _gigacodeService!.generateSmartContract(
            description: description,
            blockchain: blockchain,
            language: language,
            requirements: requirements,
          );
          result.gigacodeResult = {
            'contract_code': contract.contractCode,
            'security_score': contract.securityScore,
            'functions': contract.functions,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to generate contract with Gigacode: $e');
          }
        }
      }

      // Get AI review
      if (_gigachatService != null && result.gigacodeResult != null) {
        try {
          final analysis = await _gigachatService!.analyzeBlockchainData(
            data: result.gigacodeResult!['contract_code'],
            analysisType: 'smart_contract_review',
            context: {
              'blockchain': blockchain,
              'language': language,
              'requirements': requirements,
            },
          );
          result.aiReview = {
            'analysis': analysis.analysis,
            'confidence': analysis.confidence,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get AI review: $e');
          }
        }
      }

      return result;
    } catch (e) {
      throw Exception('Error generating smart contract: $e');
    }
  }

  /// Get comprehensive development report
  Future<DevelopmentReport> getDevelopmentReport({
    required String repository,
    Duration period = const Duration(days: 30),
  }) async {
    try {
      final report = DevelopmentReport(
        repository: repository,
        period: period,
        timestamp: DateTime.now(),
      );

      // Get GitHub data
      if (_githubService != null) {
        try {
          final commits = await _githubService!.getRepositoryCommits(
            owner: repository.split('/').first,
            repo: repository.split('/').last,
            since: DateTime.now().subtract(period),
          );
          final issues = await _githubService!.getIssues(
            owner: repository.split('/').first,
            repo: repository.split('/').last,
            state: 'open',
          );
          final pullRequests = await _githubService!.getPullRequests(
            owner: repository.split('/').first,
            repo: repository.split('/').last,
            state: 'open',
          );

          report.githubData = {
            'commit_count': commits.length,
            'issue_count': issues.length,
            'pull_request_count': pullRequests.length,
            'recent_activity': commits.take(5).map((c) => {
              'message': c.message,
              'author': c.author.name,
              'date': c.date.toIso8601String(),
            }).toList(),
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get GitHub data: $e');
          }
        }
      }

      // Get Sourcecraft data
      if (_sourcecraftService != null) {
        try {
          final analytics = await _sourcecraftService!.getDevelopmentAnalytics(
            repository: repository,
            period: period,
          );
          final quality = await _sourcecraftService!.getCodeQualityAnalysis(
            code: '', // Would need actual code here
            language: 'dart',
          );

          report.sourcecraftData = {
            'velocity': analytics.velocity,
            'efficiency': analytics.efficiency,
            'quality_score': quality.overallScore,
            'developer_activity': analytics.developerActivity.map((d) => {
              'developer': d.developer,
              'commits': d.commits,
              'impact': d.impact,
            }).toList(),
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Sourcecraft data: $e');
          }
        }
      }

      return report;
    } catch (e) {
      throw Exception('Error getting development report: $e');
    }
  }

  /// Get Matrix client services overview
  Future<MatrixClientServicesOverview> getMatrixClientServicesOverview() async {
    try {
      final overview = MatrixClientServicesOverview(
        timestamp: DateTime.now(),
      );

      // Get FluffyChat services
      if (_fluffyChatIntegration != null) {
        try {
          final fluffyChatStatus = _fluffyChatIntegration!.serviceStatus;
          final fluffyChatHealth = await _fluffyChatIntegration!.getHealthStatus();
          
          overview.fluffyChatData = {
            'status': fluffyChatHealth['status'],
            'services': fluffyChatStatus,
            'health_details': fluffyChatHealth,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get FluffyChat data: $e');
          }
        }
      }

      // Get Krille-chan services
      if (_krilleChanIntegration != null) {
        try {
          final krilleChanStatus = _krilleChanIntegration!.serviceStatus;
          final krilleChanHealth = await _krilleChanIntegration!.getHealthStatus();
          
          overview.krilleChanData = {
            'status': krilleChanHealth['status'],
            'services': krilleChanStatus,
            'health_details': krilleChanHealth,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Krille-chan data: $e');
          }
        }
      }

      // Get Nheko services
      if (_nhekoIntegration != null) {
        try {
          final nhekoStatus = _nhekoIntegration!.serviceStatus;
          final nhekoHealth = await _nhekoIntegration!.getHealthStatus();
          
          overview.nhekoData = {
            'status': nhekoHealth['status'],
            'services': nhekoStatus,
            'health_details': nhekoHealth,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Nheko data: $e');
          }
        }
      }

      // Get Cinny services
      if (_cinnyIntegration != null) {
        try {
          final cinnyStatus = _cinnyIntegration!.serviceStatus;
          final cinnyHealth = await _cinnyIntegration!.getHealthStatus();
          
          overview.cinnyData = {
            'status': cinnyHealth['status'],
            'services': cinnyStatus,
            'health_details': cinnyHealth,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Cinny data: $e');
          }
        }
      }

      // Get NeoChat services
      if (_neoChatIntegration != null) {
        try {
          final neoChatStatus = _neoChatIntegration!.serviceStatus;
          final neoChatHealth = await _neoChatIntegration!.getHealthStatus();
          
          overview.neoChatData = {
            'status': neoChatHealth['status'],
            'services': neoChatStatus,
            'health_details': neoChatHealth,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get NeoChat data: $e');
          }
        }
      }

      // Get Element.io services
      if (_elementMatrixIntegration != null) {
        try {
          final elementStatus = await _elementMatrixIntegration!.getHealthStatus();
          
          overview.elementData = {
            'status': elementStatus['status'],
            'services': elementStatus['services'] ?? {},
            'health_details': elementStatus,
          };
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get Element.io data: $e');
          }
        }
      }

      return overview;
    } catch (e) {
      throw Exception('Error getting Matrix client services overview: $e');
    }
  }

  /// Create unified Matrix session
  Future<UnifiedMatrixSession> createUnifiedMatrixSession({
    required String userId,
    required String password,
    required String clientType, // 'fluffychat', 'krille_chan', 'nheko', 'cinny', 'neochat', 'element'
    Map<String, dynamic>? deviceInfo,
    Map<String, dynamic>? settings,
  }) async {
    try {
      final session = UnifiedMatrixSession(
        userId: userId,
        clientType: clientType,
        timestamp: DateTime.now(),
      );

      switch (clientType.toLowerCase()) {
        case 'fluffychat':
          if (_fluffyChatIntegration != null) {
            try {
              final result = await _fluffyChatIntegration!.createWebSession(
                userId: userId,
                password: password,
                deviceInfo: deviceInfo,
              );
              session.sessionData = result;
              session.status = 'active';
            } catch (e) {
              session.status = 'error';
              session.error = e.toString();
            }
          } else {
            session.status = 'error';
            session.error = 'FluffyChat integration not available';
          }
          break;

        case 'krille_chan':
          if (_krilleChanIntegration != null) {
            try {
              final result = await _krilleChanIntegration!.createWebSession(
                userId: userId,
                password: password,
                deviceInfo: deviceInfo,
                enableMinimalUI: settings?['minimal_ui'] ?? true,
                enablePerformanceMode: settings?['performance_mode'] ?? true,
              );
              session.sessionData = result;
              session.status = 'active';
            } catch (e) {
              session.status = 'error';
              session.error = e.toString();
            }
          } else {
            session.status = 'error';
            session.error = 'Krille-chan integration not available';
          }
          break;

        case 'nheko':
          if (_nhekoIntegration != null) {
            try {
              final result = await _nhekoIntegration!.createDesktopSession(
                userId: userId,
                password: password,
                deviceInfo: deviceInfo,
                desktopSettings: settings,
              );
              session.sessionData = result;
              session.status = 'active';
            } catch (e) {
              session.status = 'error';
              session.error = e.toString();
            }
          } else {
            session.status = 'error';
            session.error = 'Nheko integration not available';
          }
          break;

        case 'cinny':
          if (_cinnyIntegration != null) {
            try {
              final result = await _cinnyIntegration!.createWebSession(
                userId: userId,
                password: password,
                deviceInfo: deviceInfo,
                webSettings: settings,
              );
              session.sessionData = result;
              session.status = 'active';
            } catch (e) {
              session.status = 'error';
              session.error = e.toString();
            }
          } else {
            session.status = 'error';
            session.error = 'Cinny integration not available';
          }
          break;

        case 'neochat':
          if (_neoChatIntegration != null) {
            try {
              final result = await _neoChatIntegration!.createDesktopSession(
                userId: userId,
                password: password,
                deviceInfo: deviceInfo,
                desktopSettings: settings,
              );
              session.sessionData = result;
              session.status = 'active';
            } catch (e) {
              session.status = 'error';
              session.error = e.toString();
            }
          } else {
            session.status = 'error';
            session.error = 'NeoChat integration not available';
          }
          break;

        case 'element':
          if (_elementMatrixIntegration != null) {
            try {
              final result = await _elementMatrixIntegration!.createSession(
                userId: userId,
                password: password,
                deviceInfo: deviceInfo,
              );
              session.sessionData = result;
              session.status = 'active';
            } catch (e) {
              session.status = 'error';
              session.error = e.toString();
            }
          } else {
            session.status = 'error';
            session.error = 'Element.io integration not available';
          }
          break;

        default:
          session.status = 'error';
          session.error = 'Unsupported client type: $clientType';
      }

      return session;
    } catch (e) {
      throw Exception('Error creating unified Matrix session: $e');
    }
  }

  /// Get Git/GitHub services overview
  Future<GitGitHubServicesOverview> getGitGitHubServicesOverview() async {
    try {
      final repoStatus = await _gitGitHubService!.getRepositoryStatus();
      final repositories = await _gitGitHubService!.fetchRepositories();
      final activities = await _gitGitHubService!.getActivityFeed();
      final currentUser = _gitGitHubService!.getCurrentUser();

      return GitGitHubServicesOverview(
        repositoryStatus: repoStatus,
        repositories: repositories,
        activities: activities,
        currentUser: currentUser,
        isAuthenticated: _gitGitHubService!.isAuthenticated,
      );
    } catch (e) {
      throw Exception('Failed to get Git/GitHub services overview: $e');
    }
  }

  /// Initialize all services
  Future<void> initializeAllServices() async {
    try {
      // Initialize core services
      await _gitGitHubService!.initializeGitRepository('./rechain-repo');
      
      // Initialize Matrix clients
      await _fluffyChatIntegration!.initialize();
      await _krilleChanIntegration!.initialize();
      await _elementMatrixIntegration!.initialize();
      await _elementCallIntegration!.initialize();
      await _elementBridgeIntegration!.initialize();
      await _nhekoIntegration!.initialize();
      await _cinnyIntegration!.initialize();
      await _neoChatIntegration!.initialize();
      
      // Initialize Etke services
      await _etkeMatrixIntegration!.initialize();
      await _etkeGoIntegration!.initialize();
      await _etkeRustIntegration!.initialize();
    } catch (e) {
      throw Exception('Failed to initialize services: $e');
    }
  }

  /// Dispose all services
  void disposeAllServices() {
    _prometheusService?.dispose();
    _grafanaService?.dispose();
    _gigachatService?.dispose();
    _gigacodeService?.dispose();
    _sourcecraftService?.dispose();
    _githubService?.dispose();
    _etkeMatrixIntegration?.dispose();
    _etkeRustIntegration?.dispose();
    _etkeGoIntegration?.dispose();
    _elementMatrixIntegration?.dispose();
    _elementCallIntegration?.dispose();
    _elementBridgeIntegration?.dispose();
    _fluffyChatIntegration?.dispose();
    _krilleChanIntegration?.dispose();
    _nhekoIntegration?.dispose();
    _cinnyIntegration?.dispose();
    _neoChatIntegration?.dispose();
    _gitGitHubService?.dispose();
    _serverlessServicesIntegration?.dispose();
    _apiIntegration?.dispose();
    _tonAuthService?.dispose();
    _telegramAuthService?.dispose();
    _bitgetAuthService?.dispose();
    _web3AuthService?.dispose();
  }

  /// Get Matrix Backend services overview
  Future<Map<String, dynamic>> getMatrixBackendServicesOverview() async {
    try {
      final protocolExtensionsStatus = await _matrixProtocolExtensions?.getHealthStatus();
      final bridgesStatus = await _matrixBridgesIntegration?.getHealthStatus();
      final federationStatus = await _matrixFederationIntegration?.getHealthStatus();
      final appServicesStatus = await _matrixAppServicesIntegration?.getHealthStatus();

      return {
        'protocol_extensions': protocolExtensionsStatus,
        'bridges': bridgesStatus,
        'federation': federationStatus,
        'app_services': appServicesStatus,
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      throw Exception('Failed to get Matrix Backend services overview: $e');
    }
  }

  /// Create Matrix Protocol Extension
  Future<Map<String, dynamic>> createMatrixProtocolExtension({
    required String extensionType,
    required Map<String, dynamic> config,
    Map<String, dynamic>? options,
  }) async {
    try {
      switch (extensionType) {
        case 'msc_extension':
          return await _matrixProtocolExtensions?.createAdvancedRoom(
            name: config['name'],
            topic: config['topic'],
            inviteUsers: config['invite_users'],
            mscFeatures: config['msc_features'],
            roomConfig: config['room_config'],
          ) ?? {};
        case 'bridge':
          return await _matrixProtocolExtensions?.createBridge(
            bridgeType: config['bridge_type'],
            roomId: config['room_id'],
            config: config['config'],
            options: options,
          ) ?? {};
        case 'app_service':
          return await _matrixProtocolExtensions?.registerAppService(
            serviceName: config['service_name'],
            serviceUrl: config['service_url'],
            asToken: config['as_token'],
            hsToken: config['hs_token'],
            config: config['config'],
          ) ?? {};
        default:
          throw Exception('Unsupported extension type: $extensionType');
      }
    } catch (e) {
      throw Exception('Failed to create Matrix Protocol Extension: $e');
    }
  }

  /// Create Matrix Bridge
  Future<Map<String, dynamic>> createMatrixBridge({
    required String bridgeType,
    required Map<String, dynamic> config,
  }) async {
    try {
      switch (bridgeType) {
        case 'irc':
          return await _matrixBridgesIntegration?.connectIrcBridge(
            matrixRoomId: config['matrix_room_id'],
            ircChannel: config['irc_channel'],
            ircServer: config['irc_server'],
            ircNick: config['irc_nick'],
            options: config['options'],
          ) ?? {};
        case 'discord':
          return await _matrixBridgesIntegration?.connectDiscordBridge(
            matrixRoomId: config['matrix_room_id'],
            discordChannelId: config['discord_channel_id'],
            discordToken: config['discord_token'],
            options: config['options'],
          ) ?? {};
        case 'telegram':
          return await _matrixBridgesIntegration?.connectTelegramBridge(
            matrixRoomId: config['matrix_room_id'],
            telegramChatId: config['telegram_chat_id'],
            telegramToken: config['telegram_token'],
            options: config['options'],
          ) ?? {};
        case 'slack':
          return await _matrixBridgesIntegration?.connectSlackBridge(
            matrixRoomId: config['matrix_room_id'],
            slackChannelId: config['slack_channel_id'],
            slackToken: config['slack_token'],
            options: config['options'],
          ) ?? {};
        case 'whatsapp':
          return await _matrixBridgesIntegration?.connectWhatsappBridge(
            matrixRoomId: config['matrix_room_id'],
            whatsappNumber: config['whatsapp_number'],
            whatsappToken: config['whatsapp_token'],
            options: config['options'],
          ) ?? {};
        case 'signal':
          return await _matrixBridgesIntegration?.connectSignalBridge(
            matrixRoomId: config['matrix_room_id'],
            signalNumber: config['signal_number'],
            signalDeviceId: config['signal_device_id'],
            options: config['options'],
          ) ?? {};
        case 'email':
          return await _matrixBridgesIntegration?.connectEmailBridge(
            matrixRoomId: config['matrix_room_id'],
            emailAddress: config['email_address'],
            smtpConfig: config['smtp_config'],
            options: config['options'],
          ) ?? {};
        case 'xmpp':
          return await _matrixBridgesIntegration?.connectXmppBridge(
            matrixRoomId: config['matrix_room_id'],
            xmppJid: config['xmpp_jid'],
            xmppPassword: config['xmpp_password'],
            xmppServer: config['xmpp_server'],
            options: config['options'],
          ) ?? {};
        case 'mastodon':
          return await _matrixBridgesIntegration?.connectMastodonBridge(
            matrixRoomId: config['matrix_room_id'],
            mastodonInstance: config['mastodon_instance'],
            mastodonToken: config['mastodon_token'],
            options: config['options'],
          ) ?? {};
        case 'twitter':
          return await _matrixBridgesIntegration?.connectTwitterBridge(
            matrixRoomId: config['matrix_room_id'],
            twitterApiKey: config['twitter_api_key'],
            twitterApiSecret: config['twitter_api_secret'],
            twitterAccessToken: config['twitter_access_token'],
            twitterAccessSecret: config['twitter_access_secret'],
            options: config['options'],
          ) ?? {};
        default:
          throw Exception('Unsupported bridge type: $bridgeType');
      }
    } catch (e) {
      throw Exception('Failed to create Matrix Bridge: $e');
    }
  }

  /// Configure Matrix Federation
  Future<Map<String, dynamic>> configureMatrixFederation({
    required String domain,
    required Map<String, dynamic> config,
    List<String>? allowedDomains,
    List<String>? blockedDomains,
    Map<String, dynamic>? rateLimits,
  }) async {
    try {
      return await _matrixFederationIntegration?.configureFederation(
        domain: domain,
        config: config,
        allowedDomains: allowedDomains,
        blockedDomains: blockedDomains,
        rateLimits: rateLimits,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to configure Matrix Federation: $e');
    }
  }

  /// Create Matrix App Service
  Future<Map<String, dynamic>> createMatrixAppService({
    required String serviceType,
    required Map<String, dynamic> config,
  }) async {
    try {
      switch (serviceType) {
        case 'app_service':
          return await _matrixAppServicesIntegration?.registerAppService(
            serviceName: config['service_name'],
            serviceUrl: config['service_url'],
            asToken: config['as_token'],
            hsToken: config['hs_token'],
            config: config['config'],
            namespaces: config['namespaces'],
          ) ?? {};
        case 'bot':
          return await _matrixAppServicesIntegration?.createBot(
            botName: config['bot_name'],
            botUrl: config['bot_url'],
            capabilities: config['capabilities'],
            config: config['config'],
            permissions: config['permissions'],
            webhookConfig: config['webhook_config'],
          ) ?? {};
        case 'webhook':
          return await _matrixAppServicesIntegration?.createWebhook(
            webhookUrl: config['webhook_url'],
            eventTypes: config['event_types'],
            filters: config['filters'],
            headers: config['headers'],
          ) ?? {};
        default:
          throw Exception('Unsupported app service type: $serviceType');
      }
    } catch (e) {
      throw Exception('Failed to create Matrix App Service: $e');
    }
  }

  /// Get available bridges
  Future<List<Map<String, dynamic>>> getAvailableBridges() async {
    try {
      return await _matrixBridgesIntegration?.getAvailableBridges() ?? [];
    } catch (e) {
      throw Exception('Failed to get available bridges: $e');
    }
  }

  /// Get federation status
  Future<Map<String, dynamic>> getFederationStatus() async {
    try {
      return await _matrixFederationIntegration?.getFederationStatus() ?? {};
    } catch (e) {
      throw Exception('Failed to get federation status: $e');
    }
  }

  /// Get active bridges
  Future<List<Map<String, dynamic>>> getActiveBridges() async {
    try {
      return await _matrixBridgesIntegration?.getActiveBridges() ?? [];
    } catch (e) {
      throw Exception('Failed to get active bridges: $e');
    }
  }

  /// Get registered app services
  Future<List<Map<String, dynamic>>> getRegisteredAppServices() async {
    try {
      return await _matrixAppServicesIntegration?.getRegisteredAppServices() ?? [];
    } catch (e) {
      throw Exception('Failed to get registered app services: $e');
    }
  }

  /// Get active bots
  Future<List<Map<String, dynamic>>> getActiveBots() async {
    try {
      return await _matrixAppServicesIntegration?.getActiveBots() ?? [];
    } catch (e) {
      throw Exception('Failed to get active bots: $e');
    }
  }

  /// Get analytics data
  Future<Map<String, dynamic>> getAnalyticsData({
    String? eventName,
    DateTime? startTime,
    DateTime? endTime,
    String? groupBy,
  }) async {
    try {
      return await _matrixAppServicesIntegration?.getAnalyticsData(
        eventName: eventName,
        startTime: startTime,
        endTime: endTime,
        groupBy: groupBy,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to get analytics data: $e');
    }
  }

  /// Get Advanced Matrix services overview
  Future<Map<String, dynamic>> getAdvancedMatrixServicesOverview() async {
    try {
      final aiStatus = await _matrixAIIntegration?.getHealthStatus();
      final blockchainStatus = await _matrixBlockchainIntegration?.getHealthStatus();
      final iotStatus = await _matrixIoTIntegration?.getHealthStatus();

      return {
        'ai_integration': aiStatus,
        'blockchain_integration': blockchainStatus,
        'iot_integration': iotStatus,
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      throw Exception('Failed to get Advanced Matrix services overview: $e');
    }
  }

  /// AI Integration - Analyze message
  Future<Map<String, dynamic>> analyzeMessageWithAI({
    required String message,
    required String roomId,
    String? userId,
    Map<String, dynamic>? context,
  }) async {
    try {
      return await _matrixAIIntegration?.analyzeMessage(
        message: message,
        roomId: roomId,
        userId: userId,
        context: context,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to analyze message with AI: $e');
    }
  }

  /// AI Integration - Moderate content
  Future<Map<String, dynamic>> moderateContentWithAI({
    required String message,
    required String roomId,
    String? userId,
    Map<String, dynamic>? rules,
  }) async {
    try {
      return await _matrixAIIntegration?.moderateContent(
        message: message,
        roomId: roomId,
        userId: userId,
        rules: rules,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to moderate content with AI: $e');
    }
  }

  /// AI Integration - Translate message
  Future<Map<String, dynamic>> translateMessageWithAI({
    required String message,
    required String targetLanguage,
    String? sourceLanguage,
  }) async {
    try {
      return await _matrixAIIntegration?.translateMessage(
        message: message,
        targetLanguage: targetLanguage,
        sourceLanguage: sourceLanguage,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to translate message with AI: $e');
    }
  }

  /// Blockchain Integration - Create decentralized identity
  Future<Map<String, dynamic>> createDecentralizedIdentity({
    required String userId,
    required Map<String, dynamic> identityData,
  }) async {
    try {
      return await _matrixBlockchainIntegration?.createDecentralizedIdentity(
        userId: userId,
        identityData: identityData,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to create decentralized identity: $e');
    }
  }

  /// Blockchain Integration - Verify message
  Future<Map<String, dynamic>> verifyMessageOnBlockchain({
    required String message,
    required String signature,
    required String publicKey,
  }) async {
    try {
      return await _matrixBlockchainIntegration?.verifyMessage(
        message: message,
        signature: signature,
        publicKey: publicKey,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to verify message on blockchain: $e');
    }
  }

  /// Blockchain Integration - Deploy smart contract
  Future<Map<String, dynamic>> deploySmartContract({
    required String contractName,
    required String contractCode,
    required Map<String, dynamic> constructorArgs,
  }) async {
    try {
      return await _matrixBlockchainIntegration?.deploySmartContract(
        contractName: contractName,
        contractCode: contractCode,
        constructorArgs: constructorArgs,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to deploy smart contract: $e');
    }
  }

  /// IoT Integration - Register device
  Future<Map<String, dynamic>> registerIoTDevice({
    required String deviceId,
    required String deviceType,
    required Map<String, dynamic> capabilities,
  }) async {
    try {
      return await _matrixIoTIntegration?.registerDevice(
        deviceId: deviceId,
        deviceType: deviceType,
        capabilities: capabilities,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to register IoT device: $e');
    }
  }

  /// IoT Integration - Send sensor reading
  Future<Map<String, dynamic>> sendSensorReading({
    required String deviceId,
    required String sensorType,
    required dynamic value,
    String? unit,
  }) async {
    try {
      return await _matrixIoTIntegration?.sendSensorReading(
        deviceId: deviceId,
        sensorType: sensorType,
        value: value,
        unit: unit,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to send sensor reading: $e');
    }
  }

  /// IoT Integration - Create automation rule
  Future<Map<String, dynamic>> createIoTAutomation({
    required String name,
    required Map<String, dynamic> trigger,
    required Map<String, dynamic> action,
  }) async {
    try {
      return await _matrixIoTIntegration?.createAutomationRule(
        name: name,
        trigger: trigger,
        action: action,
      ) ?? {};
    } catch (e) {
      throw Exception('Failed to create IoT automation: $e');
    }
  }

  /// Get AI models
  Future<List<Map<String, dynamic>>> getAvailableAIModels() async {
    try {
      return await _matrixAIIntegration?.getAvailableModels() ?? [];
    } catch (e) {
      throw Exception('Failed to get available AI models: $e');
    }
  }

  /// Get blockchain status
  Future<Map<String, dynamic>> getBlockchainStatus() async {
    try {
      return await _matrixBlockchainIntegration?.getBlockchainStatus() ?? {};
    } catch (e) {
      throw Exception('Failed to get blockchain status: $e');
    }
  }

  /// Get IoT dashboard
  Future<Map<String, dynamic>> getIoTDashboard() async {
    try {
      return await _matrixIoTIntegration?.getIoTDashboard() ?? {};
    } catch (e) {
      throw Exception('Failed to get IoT dashboard: $e');
    }
  }

  /// Get Matrix Gaming Integration
  MatrixGamingIntegration? get matrixGamingIntegration => _matrixGamingIntegration;

  /// Get Matrix Education Integration
  MatrixEducationIntegration? get matrixEducationIntegration => _matrixEducationIntegration;

  /// Get Matrix Enterprise Integration
  MatrixEnterpriseIntegration? get matrixEnterpriseIntegration => _matrixEnterpriseIntegration;

  /// Get all service statuses
  Map<String, Map<String, bool>> getAllServiceStatuses() {
    return {
      'matrix_clients': _matrixClientsIntegration?.serviceStatus ?? {},
      'matrix_servers': _matrixServersIntegration?.serviceStatus ?? {},
      'serverless_services': _serverlessServicesIntegration?.serviceStatus ?? {},
      'api_integration': _apiIntegration?.serviceStatus ?? {},
      'matrix_protocol_extensions': _matrixProtocolExtensions?.serviceStatus ?? {},
      'matrix_bridges': _matrixBridgesIntegration?.serviceStatus ?? {},
      'matrix_federation': _matrixFederationIntegration?.serviceStatus ?? {},
      'matrix_application_services': _matrixAppServicesIntegration?.serviceStatus ?? {},
      'matrix_ai': _matrixAIIntegration?.serviceStatus ?? {},
      'matrix_blockchain': _matrixBlockchainIntegration?.serviceStatus ?? {},
      'matrix_iot': _matrixIoTIntegration?.serviceStatus ?? {},
      'matrix_gaming': _matrixGamingIntegration?.serviceStatus ?? {},
      'matrix_education': _matrixEducationIntegration?.serviceStatus ?? {},
      'matrix_enterprise': _matrixEnterpriseIntegration?.serviceStatus ?? {},
    };
  }

  /// Dispose all services
  Future<void> dispose() async {
    try {
      // Dispose existing services
      await _matrixClientsIntegration?.dispose();
      await _matrixServersIntegration?.dispose();
      await _serverlessServicesIntegration?.dispose();
      await _apiIntegration?.dispose();
      await _matrixProtocolExtensions?.dispose();
      await _matrixBridgesIntegration?.dispose();
      await _matrixFederationIntegration?.dispose();
      await _matrixApplicationServicesIntegration?.dispose();
      await _matrixAIIntegration?.dispose();
      await _matrixBlockchainIntegration?.dispose();
      await _matrixIoTIntegration?.dispose();

      // Dispose new services
      await _matrixGamingIntegration?.dispose();
      await _matrixEducationIntegration?.dispose();
      await _matrixEnterpriseIntegration?.dispose();

      if (kDebugMode) {
        print('[IntegrationManager] All services disposed successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[IntegrationManager] Error disposing services: $e');
      }
    }
  }

  // Optionally, add methods to get each auth service directly
  TONAuthService? get tonAuthService => _tonAuthService;
  TelegramAuthService? get telegramAuthService => _telegramAuthService;
  BitgetAuthService? get bitgetAuthService => _bitgetAuthService;
  Web3AuthService? get web3AuthService => _web3AuthService;

  // IPFS Methods
  Future<void> initializeIpfs({required String provider, required Map<String, dynamic> config}) async {
    _ipfsService = IpfsProviderRegistry.create(provider);
    _currentIpfsProvider = provider;
    _ipfsConfig = config;
    await _ipfsService!.initialize(config: config);
  }

  Future<void> switchIpfsProvider(String provider, Map<String, dynamic> config) async {
    await initializeIpfs(provider: provider, config: config);
  }

  IpfsService? get ipfsService => _ipfsService;
  String? get currentIpfsProvider => _currentIpfsProvider;
  List<String> get availableIpfsProviders => IpfsProviderRegistry.availableProviders;

  Future<String?> uploadToIpfs({required List<int> fileBytes, required String fileName, Map<String, String>? metadata}) async {
    if (_ipfsService == null) return null;
    return await _ipfsService!.uploadFile(fileBytes: fileBytes, fileName: fileName, metadata: metadata);
  }

  Future<List<int>?> downloadFromIpfs(String cid) async {
    if (_ipfsService == null) return null;
    return await _ipfsService!.downloadFile(cid);
  }

  Future<bool?> pinIpfsFile(String cid) async {
    if (_ipfsService == null) return null;
    return await _ipfsService!.pinFile(cid);
  }

  Future<bool?> unpinIpfsFile(String cid) async {
    if (_ipfsService == null) return null;
    return await _ipfsService!.unpinFile(cid);
  }

  Future<List<IpfsFileInfo>?> listIpfsPinnedFiles() async {
    if (_ipfsService == null) return null;
    return await _ipfsService!.listPinnedFiles();
  }

  Future<IpfsProviderStatus?> getIpfsStatus() async {
    if (_ipfsService == null) return null;
    return await _ipfsService!.getStatus();
  }
}

/// System Health Overview
class SystemHealthOverview {
  final DateTime timestamp;
  final Map<String, dynamic> healthData;
  final Map<String, bool> services;

  SystemHealthOverview({
    required this.timestamp,
    required this.healthData,
    required this.services,
  });
}

/// Blockchain Development Insights
class BlockchainDevelopmentInsights {
  final String repository;
  final Duration period;
  final DateTime timestamp;
  Map<String, dynamic>? githubData;
  Map<String, dynamic>? sourcecraftData;

  BlockchainDevelopmentInsights({
    required this.repository,
    required this.period,
    required this.timestamp,
    this.githubData,
    this.sourcecraftData,
  });
}

/// AI Code Analysis
class AICodeAnalysis {
  final String code;
  final String language;
  final DateTime timestamp;
  Map<String, dynamic>? gigacodeAnalysis;
  Map<String, dynamic>? sourcecraftAnalysis;
  String? aiExplanation;

  AICodeAnalysis({
    required this.code,
    required this.language,
    required this.timestamp,
    this.gigacodeAnalysis,
    this.sourcecraftAnalysis,
    this.aiExplanation,
  });
}

/// Monitoring Dashboard Data
class MonitoringDashboardData {
  final String appName;
  final Duration period;
  final DateTime timestamp;
  Map<String, dynamic>? prometheusData;
  Map<String, dynamic>? grafanaData;

  MonitoringDashboardData({
    required this.appName,
    required this.period,
    required this.timestamp,
    this.prometheusData,
    this.grafanaData,
  });
}

/// Blockchain Metrics Data
class BlockchainMetricsData {
  final String network;
  final Duration period;
  final DateTime timestamp;
  Map<String, dynamic>? prometheusData;

  BlockchainMetricsData({
    required this.network,
    required this.period,
    required this.timestamp,
    this.prometheusData,
  });
}

/// Smart Contract Generation Result
class SmartContractGenerationResult {
  final String description;
  final String blockchain;
  final String language;
  final DateTime timestamp;
  Map<String, dynamic>? gigacodeResult;
  Map<String, dynamic>? aiReview;

  SmartContractGenerationResult({
    required this.description,
    required this.blockchain,
    required this.language,
    required this.timestamp,
    this.gigacodeResult,
    this.aiReview,
  });
}

/// Development Report
class DevelopmentReport {
  final String repository;
  final Duration period;
  final DateTime timestamp;
  Map<String, dynamic>? githubData;
  Map<String, dynamic>? sourcecraftData;

  DevelopmentReport({
    required this.repository,
    required this.period,
    required this.timestamp,
    this.githubData,
    this.sourcecraftData,
  });
}

/// Matrix Client Services Overview
class MatrixClientServicesOverview {
  final DateTime timestamp;
  Map<String, dynamic>? fluffyChatData;
  Map<String, dynamic>? krilleChanData;
  Map<String, dynamic>? nhekoData;
  Map<String, dynamic>? cinnyData;
  Map<String, dynamic>? neoChatData;
  Map<String, dynamic>? elementData;

  MatrixClientServicesOverview({
    required this.timestamp,
    this.fluffyChatData,
    this.krilleChanData,
    this.nhekoData,
    this.cinnyData,
    this.neoChatData,
    this.elementData,
  });
}

/// Unified Matrix Session
class UnifiedMatrixSession {
  final String userId;
  final String clientType;
  final DateTime timestamp;
  String status = 'pending';
  String? error;
  Map<String, dynamic>? sessionData;

  UnifiedMatrixSession({
    required this.userId,
    required this.clientType,
    required this.timestamp,
    this.status = 'pending',
    this.error,
    this.sessionData,
  });
}

/// Git/GitHub Services Overview
class GitGitHubServicesOverview {
  final Map<String, dynamic>? repositoryStatus;
  final List<Map<String, dynamic>> repositories;
  final List<Map<String, dynamic>> activities;
  final Map<String, dynamic>? currentUser;
  final bool isAuthenticated;

  GitGitHubServicesOverview({
    this.repositoryStatus,
    required this.repositories,
    required this.activities,
    this.currentUser,
    required this.isAuthenticated,
  });
} 