import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../features/integration/integration_manager.dart';
import '../../features/monitoring/prometheus_service.dart';
import '../../features/monitoring/grafana_service.dart';
import '../../features/ai/gigachat_service.dart';
import '../../features/ai/gigacode_service.dart';
import '../../features/development/sourcecraft_service.dart';
import '../../features/integration/github_service.dart';
import '../../features/integration/git_github_integration.dart';
import '../../features/integration/etke_matrix_integration.dart';
import '../../features/integration/etke_rust_integration.dart';
import '../../features/integration/etke_go_integration.dart';
import '../../features/integration/fluffychat_integration.dart';
import '../../features/integration/krille_chan_integration.dart';
import '../../features/integration/element_matrix_integration.dart';
import '../../features/integration/element_call_integration.dart';
import '../../features/integration/element_bridge_integration.dart';
import '../../features/integration/nheko_integration.dart';
import '../../features/integration/cinny_integration.dart';
import '../../features/integration/neochat_integration.dart';
import 'git_github_dashboard.dart';
import 'matrix_clients_dashboard.dart';
import 'matrix_servers_dashboard.dart';
import 'matrix_backend_dashboard.dart';
import 'advanced_matrix_dashboard.dart';
import 'specialized_matrix_dashboard.dart';
import '../auth/auth_dashboard.dart';
import '../ipfs/ipfs_dashboard.dart';

/// Integration Dashboard Page
class IntegrationDashboard extends StatefulWidget {
  const IntegrationDashboard({super.key});

  @override
  State<IntegrationDashboard> createState() => _IntegrationDashboardState();
}

class _IntegrationDashboardState extends State<IntegrationDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  IntegrationManager? _integrationManager;
  bool _isLoading = true;
  String? _error;
  bool _isDarkMode = false;
  final List<Map<String, dynamic>> _logs = [];

  // Dashboard data
  SystemHealthOverview? _systemHealth;
  MonitoringDashboardData? _monitoringData;
  BlockchainDevelopmentInsights? _developmentInsights;
  AICodeAnalysis? _codeAnalysis;
  SmartContractGenerationResult? _smartContractResult;
  DevelopmentReport? _developmentReport;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    _initializeIntegrationManager();
  }

  Future<void> _initializeIntegrationManager() async {
    try {
      // Initialize services with mock data for demonstration
      // In production, these would be configured with real API keys and endpoints
      final prometheusService = PrometheusService(
        baseUrl: 'https://prometheus.example.com',
        apiKey: 'your-prometheus-api-key',
      );

      final grafanaService = GrafanaService(
        baseUrl: 'https://grafana.example.com',
        apiKey: 'your-grafana-api-key',
      );

      final gigachatService = GigachatService(
        baseUrl: 'https://gigachat.example.com',
        apiKey: 'your-gigachat-api-key',
      );

      final gigacodeService = GigacodeService(
        baseUrl: 'https://gigacode.example.com',
        apiKey: 'your-gigacode-api-key',
      );

      final sourcecraftService = SourcecraftService(
        baseUrl: 'https://sourcecraft.example.com',
        apiKey: 'your-sourcecraft-api-key',
      );

      final githubService = GitHubService(
        apiKey: 'your-github-api-key',
      );

      final gitGitHubService = GitGitHubIntegration(
        clientId: 'your-github-client-id',
        clientSecret: 'your-github-client-secret',
        redirectUri: 'rechain://oauth/callback',
      );

      // Initialize Matrix clients
      final fluffyChatService = FluffyChatIntegration(
        apiKey: 'your-fluffychat-api-key',
      );

      final krilleChanService = KrilleChanIntegration(
        apiKey: 'your-krille-chan-api-key',
      );

      final elementMatrixService = ElementMatrixIntegration(
        apiKey: 'your-element-matrix-api-key',
      );

      final elementCallService = ElementCallIntegration(
        apiKey: 'your-element-call-api-key',
      );

      final elementBridgeService = ElementBridgeIntegration(
        apiKey: 'your-element-bridge-api-key',
      );

      final nhekoService = NhekoIntegration(
        apiKey: 'your-nheko-api-key',
      );

      final cinnyService = CinnyIntegration(
        apiKey: 'your-cinny-api-key',
      );

      final neoChatService = NeoChatIntegration(
        apiKey: 'your-neochat-api-key',
      );

      // Initialize etke.cc services
      final etkeMatrixIntegration = EtkeMatrixIntegration(
        apiKey: 'your-etke-matrix-api-key',
        matrixClient: null, // Would need actual Matrix client
      );

      final etkeRustIntegration = EtkeRustIntegration(
        apiKey: 'your-etke-rust-api-key',
      );

      final etkeGoIntegration = EtkeGoIntegration(
        apiKey: 'your-etke-go-api-key',
      );

      _integrationManager = IntegrationManager(
        prometheusService: prometheusService,
        grafanaService: grafanaService,
        gigachatService: gigachatService,
        gigacodeService: gigacodeService,
        sourcecraftService: sourcecraftService,
        githubService: githubService,
        gitGitHubService: gitGitHubService,
        fluffyChatIntegration: fluffyChatService,
        krilleChanIntegration: krilleChanService,
        elementMatrixIntegration: elementMatrixService,
        elementCallIntegration: elementCallService,
        elementBridgeIntegration: elementBridgeService,
        nhekoIntegration: nhekoService,
        cinnyIntegration: cinnyService,
        neoChatIntegration: neoChatService,
        etkeMatrixIntegration: etkeMatrixIntegration,
        etkeRustIntegration: etkeRustIntegration,
        etkeGoIntegration: etkeGoIntegration,
      );

      await _loadDashboardData();
    } catch (e) {
      setState(() {
        _error = 'Failed to initialize integration manager: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadDashboardData() async {
    if (_integrationManager == null) return;

    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Load all dashboard data concurrently
      final results = await Future.wait([
        _integrationManager!.getSystemHealthOverview(),
        _integrationManager!.getMonitoringDashboardData(appName: 'rechain'),
        _integrationManager!.getBlockchainDevelopmentInsights(
          repository: 'rechain/rechain-app',
        ),
        _integrationManager!.getAICodeAnalysis(
          code: '// Sample code for analysis\nclass SampleClass {\n  void sampleMethod() {\n    print("Hello World");\n  }\n}',
          language: 'dart',
        ),
        _integrationManager!.generateSmartContract(
          description: 'A simple ERC-20 token contract',
          blockchain: 'ethereum',
          language: 'solidity',
        ),
        _integrationManager!.getDevelopmentReport(
          repository: 'rechain/rechain-app',
        ),
      ]);

      setState(() {
        _systemHealth = results[0] as SystemHealthOverview;
        _monitoringData = results[1] as MonitoringDashboardData;
        _developmentInsights = results[2] as BlockchainDevelopmentInsights;
        _codeAnalysis = results[3] as AICodeAnalysis;
        _smartContractResult = results[4] as SmartContractGenerationResult;
        _developmentReport = results[5] as DevelopmentReport;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load dashboard data: $e';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _integrationManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.integration_instructions,
              color: Colors.blue[600],
            ),
            const SizedBox(width: 8),
            const Text(
              'Integration Dashboard',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: _isDarkMode ? Colors.grey[850] : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadServiceStatus,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue[600],
          labelColor: Colors.blue[600],
          unselectedLabelColor: Colors.grey[600],
          isScrollable: true,
          tabs: const [
            Tab(
              icon: Icon(Icons.dashboard),
              text: 'Overview',
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: 'Matrix Clients',
            ),
            Tab(
              icon: Icon(Icons.dns),
              text: 'Matrix Servers',
            ),
            Tab(
              icon: Icon(Icons.cloud),
              text: 'Serverless',
            ),
            Tab(
              icon: Icon(Icons.api),
              text: 'API',
            ),
            Tab(
              icon: Icon(Icons.psychology),
              text: 'Advanced Matrix',
            ),
            Tab(
              icon: Icon(Icons.dashboard_customize),
              text: 'Specialized',
            ),
            Tab(
              icon: Icon(Icons.security),
              text: 'Authentication',
            ),
            Tab(
              icon: Icon(Icons.cloud_upload),
              text: 'IPFS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          MatrixClientsDashboard(integrationManager: _integrationManager),
          MatrixServersDashboard(integrationManager: _integrationManager),
          ServerlessServicesDashboard(integrationManager: _integrationManager),
          ApiIntegrationDashboard(integrationManager: _integrationManager),
          AdvancedMatrixDashboard(integrationManager: _integrationManager),
          SpecializedMatrixDashboard(integrationManager: _integrationManager),
          const AuthDashboard(),
          IpfsDashboard(integrationManager: _integrationManager!),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showQuickActionsDialog(),
        icon: const Icon(Icons.flash_on),
        label: const Text('Quick Actions'),
        backgroundColor: Colors.blue[600],
      ),
    );
  }

  Widget _buildOverviewTab() {
    if (_systemHealth == null) {
      return const Center(child: Text('No system health data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('System Health Overview'),
          const SizedBox(height: 16),
          _buildServiceStatusCards(),
          const SizedBox(height: 24),
          if (_systemHealth!.healthData.isNotEmpty) ...[
            _buildSectionHeader('Health Metrics'),
            const SizedBox(height: 16),
            _buildHealthMetricsGrid(),
          ],
        ],
      ),
    );
  }

  Widget _buildServiceStatusCards() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: _systemHealth!.services.entries.map((entry) {
        final serviceName = entry.key;
        final isAvailable = entry.value;
        
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isAvailable ? Icons.check_circle : Icons.error,
                  size: 32,
                  color: isAvailable ? Colors.green : Colors.red,
                ),
                const SizedBox(height: 8),
                Text(
                  serviceName.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isAvailable ? 'Available' : 'Unavailable',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isAvailable ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildHealthMetricsGrid() {
    final prometheusData = _systemHealth!.healthData['prometheus'] as Map<String, dynamic>?;
    
    if (prometheusData == null) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('No Prometheus data available'),
        ),
      );
    }

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildMetricCard(
          'CPU Usage',
          '${prometheusData['cpu_usage']?.toStringAsFixed(1) ?? '0'}%',
          Icons.memory,
          _getMetricColor(prometheusData['cpu_usage'] ?? 0),
        ),
        _buildMetricCard(
          'Memory Usage',
          '${prometheusData['memory_usage']?.toStringAsFixed(1) ?? '0'}%',
          Icons.storage,
          _getMetricColor(prometheusData['memory_usage'] ?? 0),
        ),
        _buildMetricCard(
          'Disk Usage',
          '${prometheusData['disk_usage']?.toStringAsFixed(1) ?? '0'}%',
          Icons.storage,
          _getMetricColor(prometheusData['disk_usage'] ?? 0),
        ),
      ],
    );
  }

  Widget _buildMonitoringTab() {
    if (_monitoringData == null) {
      return const Center(child: Text('No monitoring data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Application Performance'),
          const SizedBox(height: 16),
          if (_monitoringData!.prometheusData != null) ...[
            _buildPerformanceMetrics(),
            const SizedBox(height: 24),
          ],
          if (_monitoringData!.grafanaData != null) ...[
            _buildSectionHeader('Grafana Dashboards'),
            const SizedBox(height: 16),
            _buildGrafanaDashboards(),
          ],
        ],
      ),
    );
  }

  Widget _buildPerformanceMetrics() {
    final data = _monitoringData!.prometheusData!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance Metrics',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Response Time (95th)',
                    '${data['response_time_95th']?.toStringAsFixed(2) ?? '0'}ms',
                    Icons.speed,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Request Rate',
                    '${data['request_rate']?.toStringAsFixed(1) ?? '0'}/s',
                    Icons.trending_up,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Error Rate',
                    '${data['error_rate']?.toStringAsFixed(2) ?? '0'}%',
                    Icons.error,
                    Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrafanaDashboards() {
    final data = _monitoringData!.grafanaData!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Dashboards (${data['dashboard_count']})',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            if (data['dashboards'] != null) ...[
              ...(data['dashboards'] as List<dynamic>).map((dashboard) {
                return ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: Text(dashboard['title'] ?? 'Unknown'),
                  subtitle: Text(dashboard['type'] ?? 'Unknown type'),
                  trailing: IconButton(
                    icon: const Icon(Icons.open_in_new),
                    onPressed: () {
                      // Open dashboard URL
                    },
                  ),
                );
              }).toList(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDevelopmentTab() {
    if (_developmentInsights == null) {
      return const Center(child: Text('No development insights available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Development Insights'),
          const SizedBox(height: 16),
          if (_developmentInsights!.githubData != null) ...[
            _buildGitHubInsights(),
            const SizedBox(height: 24),
          ],
          if (_developmentInsights!.sourcecraftData != null) ...[
            _buildSourcecraftInsights(),
          ],
        ],
      ),
    );
  }

  Widget _buildGitHubInsights() {
    final data = _developmentInsights!.githubData!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.code),
                const SizedBox(width: 8),
                Text(
                  'GitHub Activity',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Commits',
                    '${data['commit_count'] ?? 0}',
                    Icons.commit,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Contributors',
                    '${data['contributors'] ?? 0}',
                    Icons.people,
                    Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (data['recent_commits'] != null) ...[
              Text(
                'Recent Commits',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              ...(data['recent_commits'] as List<dynamic>).take(3).map((commit) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '• ${commit.toString()}',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSourcecraftInsights() {
    final data = _developmentInsights!.sourcecraftData!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.analytics),
                const SizedBox(width: 8),
                Text(
                  'Sourcecraft Analytics',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Velocity',
                    '${data['velocity']?.toStringAsFixed(1) ?? '0'}',
                    Icons.trending_up,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Efficiency',
                    '${data['efficiency']?.toStringAsFixed(1) ?? '0'}',
                    Icons.analytics,
                    Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAIAnalysisTab() {
    if (_codeAnalysis == null) {
      return const Center(child: Text('No AI analysis data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('AI Code Analysis'),
          const SizedBox(height: 16),
          if (_codeAnalysis!.gigacodeAnalysis != null) ...[
            _buildGigacodeAnalysis(),
            const SizedBox(height: 24),
          ],
          if (_codeAnalysis!.sourcecraftAnalysis != null) ...[
            _buildSourcecraftAnalysis(),
            const SizedBox(height: 24),
          ],
          if (_codeAnalysis!.aiExplanation != null) ...[
            _buildAIExplanation(),
          ],
        ],
      ),
    );
  }

  Widget _buildGigacodeAnalysis() {
    final data = _codeAnalysis!.gigacodeAnalysis!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome),
                const SizedBox(width: 8),
                Text(
                  'Gigacode Analysis',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Quality Score',
                    '${data['quality_score']?.toStringAsFixed(1) ?? '0'}/10',
                    Icons.star,
                    _getQualityColor(data['quality_score'] ?? 0),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Issues',
                    '${data['issues_count'] ?? 0}',
                    Icons.warning,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Suggestions',
                    '${data['suggestions_count'] ?? 0}',
                    Icons.lightbulb,
                    Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourcecraftAnalysis() {
    final data = _codeAnalysis!.sourcecraftAnalysis!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.assessment),
                const SizedBox(width: 8),
                Text(
                  'Sourcecraft Quality Analysis',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildMetricCard(
              'Overall Score',
              '${data['overall_score']?.toStringAsFixed(1) ?? '0'}/10',
              Icons.score,
              _getQualityColor(data['overall_score'] ?? 0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAIExplanation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.psychology),
                const SizedBox(width: 8),
                Text(
                  'AI Explanation',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _codeAnalysis!.aiExplanation!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSmartContractsTab() {
    if (_smartContractResult == null) {
      return const Center(child: Text('No smart contract data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Smart Contract Generation'),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contract Details',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Blockchain', _smartContractResult!.blockchain),
                  _buildInfoRow('Language', _smartContractResult!.language),
                  _buildInfoRow('Description', _smartContractResult!.description),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          if (_smartContractResult!.gigacodeResult != null) ...[
            _buildSectionHeader('Generated Contract'),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.code),
                        const SizedBox(width: 8),
                        Text(
                          'Contract Code',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _smartContractResult!.gigacodeResult!['contract_code'] ?? 'No code generated',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          const SizedBox(height: 24),
          if (_smartContractResult!.aiReview != null) ...[
            _buildSectionHeader('AI Review'),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.psychology),
                        const SizedBox(width: 8),
                        Text(
                          'AI Analysis',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _smartContractResult!.aiReview!['analysis'] ?? 'No analysis available',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    _buildMetricCard(
                      'Confidence',
                      '${(_smartContractResult!.aiReview!['confidence'] ?? 0) * 100}%',
                      Icons.verified,
                      Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReportsTab() {
    if (_developmentReport == null) {
      return const Center(child: Text('No development report available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Development Report'),
          const SizedBox(height: 16),
          if (_developmentReport!.githubData != null) ...[
            _buildGitHubReport(),
            const SizedBox(height: 24),
          ],
          if (_developmentReport!.sourcecraftData != null) ...[
            _buildSourcecraftReport(),
          ],
        ],
      ),
    );
  }

  Widget _buildGitHubReport() {
    final data = _developmentReport!.githubData!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.code),
                const SizedBox(width: 8),
                Text(
                  'GitHub Activity Report',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Commits',
                    '${data['commit_count'] ?? 0}',
                    Icons.commit,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Issues',
                    '${data['issue_count'] ?? 0}',
                    Icons.bug_report,
                    Colors.red,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Pull Requests',
                    '${data['pull_request_count'] ?? 0}',
                    Icons.merge,
                    Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourcecraftReport() {
    final data = _developmentReport!.sourcecraftData!;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.analytics),
                const SizedBox(width: 8),
                Text(
                  'Sourcecraft Development Report',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Velocity',
                    '${data['velocity']?.toStringAsFixed(1) ?? '0'}',
                    Icons.trending_up,
                    Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Efficiency',
                    '${data['efficiency']?.toStringAsFixed(1) ?? '0'}',
                    Icons.analytics,
                    Colors.purple,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricCard(
                    'Quality Score',
                    '${data['quality_score']?.toStringAsFixed(1) ?? '0'}/10',
                    Icons.star,
                    _getQualityColor(data['quality_score'] ?? 0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Color _getMetricColor(double value) {
    if (value < 50) return Colors.green;
    if (value < 80) return Colors.orange;
    return Colors.red;
  }

  Color _getQualityColor(double value) {
    if (value >= 8) return Colors.green;
    if (value >= 6) return Colors.orange;
    return Colors.red;
  }

  Widget _buildGitGitHubTab() {
    if (_integrationManager == null) {
      return const Center(child: Text('Integration manager not available'));
    }

    return GitGitHubDashboard(
      gitService: _integrationManager!._gitGitHubService!,
    );
  }

  Widget _buildMatrixClientsTab() {
    if (_integrationManager == null) {
      return const Center(child: Text('Integration manager not available'));
    }

    return MatrixClientsDashboard(
      integrationManager: _integrationManager!,
    );
  }

  Widget _buildMatrixServersTab() {
    if (_integrationManager == null) {
      return const Center(child: Text('Integration manager not available'));
    }

    return MatrixServersDashboard(
      integrationManager: _integrationManager!,
    );
  }

  Widget _buildMatrixBackendTab() {
    return const MatrixBackendDashboard();
  }

  Widget _buildAdvancedMatrixTab() {
    return const AdvancedMatrixDashboard();
  }

  Widget _buildServerlessServicesTab() {
    if (_integrationManager == null) {
      return const Center(child: Text('Integration manager not available'));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // Header
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.cloud,
                      color: Colors.white,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Serverless Services',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Manage cloud functions and serverless deployments',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Services',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // AWS Lambda
                  _buildServiceCard(
                    'AWS Lambda',
                    'Serverless compute service',
                    Icons.cloud,
                    Colors.orange,
                    'Configure AWS Lambda functions',
                    () => _showServiceConfigurationDialog('AWS Lambda'),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Azure Functions
                  _buildServiceCard(
                    'Azure Functions',
                    'Event-driven serverless compute',
                    Icons.cloud,
                    Colors.blue,
                    'Configure Azure Functions',
                    () => _showServiceConfigurationDialog('Azure Functions'),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Google Cloud Functions
                  _buildServiceCard(
                    'Google Cloud Functions',
                    'Event-driven serverless platform',
                    Icons.cloud,
                    Colors.green,
                    'Configure Google Cloud Functions',
                    () => _showServiceConfigurationDialog('Google Cloud Functions'),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Vercel
                  _buildServiceCard(
                    'Vercel',
                    'Serverless deployment platform',
                    Icons.cloud,
                    Colors.black,
                    'Configure Vercel deployment',
                    () => _showServiceConfigurationDialog('Vercel'),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Netlify
                  _buildServiceCard(
                    'Netlify',
                    'Web development platform',
                    Icons.cloud,
                    Colors.teal,
                    'Configure Netlify deployment',
                    () => _showServiceConfigurationDialog('Netlify'),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Firebase Functions
                  _buildServiceCard(
                    'Firebase Functions',
                    'Serverless backend functions',
                    Icons.cloud,
                    Colors.amber,
                    'Configure Firebase Functions',
                    () => _showServiceConfigurationDialog('Firebase Functions'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showServerlessConfigurationDialog,
        icon: const Icon(Icons.settings),
        label: const Text('Configure All'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildApiIntegrationTab() {
    if (_integrationManager == null) {
      return const Center(child: Text('Integration manager not available'));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // Header
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.api,
                      color: Colors.white,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'API Integration',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Manage REST, GraphQL, WebSocket, and gRPC APIs',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'API Protocols',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // REST API
                  _buildServiceCard(
                    'REST API',
                    'Representational State Transfer',
                    Icons.http,
                    Colors.blue,
                    'Configure REST API endpoints',
                    () => _showApiConfigurationDialog('REST'),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // GraphQL
                  _buildServiceCard(
                    'GraphQL',
                    'Query language for APIs',
                    Icons.query_stats,
                    Colors.purple,
                    'Configure GraphQL endpoints',
                    () => _showApiConfigurationDialog('GraphQL'),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // WebSocket
                  _buildServiceCard(
                    'WebSocket',
                    'Real-time bidirectional communication',
                    Icons.wifi,
                    Colors.green,
                    'Configure WebSocket connections',
                    () => _showApiConfigurationDialog('WebSocket'),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // gRPC
                  _buildServiceCard(
                    'gRPC',
                    'High-performance RPC framework',
                    Icons.speed,
                    Colors.orange,
                    'Configure gRPC services',
                    () => _showApiConfigurationDialog('gRPC'),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  Text(
                    'API Metrics',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Performance Overview',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildMetricCard(
                                  'Total Calls',
                                  '1,234',
                                  Icons.call_made,
                                  Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildMetricCard(
                                  'Avg Response',
                                  '245ms',
                                  Icons.timer,
                                  Colors.green,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildMetricCard(
                                  'Success Rate',
                                  '99.2%',
                                  Icons.check_circle,
                                  Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showApiConfigurationDialog,
        icon: const Icon(Icons.settings),
        label: const Text('Configure APIs'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    String description,
    IconData icon,
    Color color,
    String actionText,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    actionText,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: color,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showServiceConfigurationDialog(String serviceName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Configure $serviceName'),
        content: Text('Configuration dialog for $serviceName will be implemented here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showServerlessConfigurationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Serverless Configuration'),
        content: const Text('Configure all serverless services at once.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showApiConfigurationDialog([String? protocol]) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(protocol != null ? 'Configure $protocol API' : 'API Configuration'),
        content: Text(protocol != null 
            ? 'Configuration dialog for $protocol API will be implemented here.'
            : 'Configure all API protocols at once.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showQuickActionsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quick Actions'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Authentication Dashboard'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthDashboard(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Refresh All Services'),
              onTap: () {
                Navigator.pop(context);
                _loadServiceStatus();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Service Configuration'),
              onTap: () {
                Navigator.pop(context);
                _showServiceConfigurationDialog('All Services');
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('System Health Check'),
              onTap: () {
                Navigator.pop(context);
                _loadDashboardData();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _loadServiceStatus() {
    // Implementation of _loadServiceStatus method
  }
} 