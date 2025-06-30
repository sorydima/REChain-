import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../features/integration/etke_matrix_integration.dart';
import '../../features/integration/etke_rust_integration.dart';
import '../../features/integration/etke_go_integration.dart';

/// Etke.cc Integration Dashboard
/// Comprehensive dashboard for all etke.cc services
class EtkeIntegrationDashboard extends StatefulWidget {
  const EtkeIntegrationDashboard({super.key});

  @override
  State<EtkeIntegrationDashboard> createState() => _EtkeIntegrationDashboardState();
}

class _EtkeIntegrationDashboardState extends State<EtkeIntegrationDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  String? _error;

  // Etke.cc services
  EtkeMatrixIntegration? _matrixIntegration;
  EtkeRustIntegration? _rustIntegration;
  EtkeGoIntegration? _goIntegration;

  // Dashboard data
  Map<String, dynamic>? _matrixHealth;
  Map<String, dynamic>? _rustHealth;
  Map<String, dynamic>? _goHealth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeEtkeServices();
  }

  Future<void> _initializeEtkeServices() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Initialize etke.cc services
      _matrixIntegration = EtkeMatrixIntegration(
        apiKey: 'your-etke-matrix-api-key',
        matrixClient: null, // Would need actual Matrix client
      );

      _rustIntegration = EtkeRustIntegration(
        apiKey: 'your-etke-rust-api-key',
      );

      _goIntegration = EtkeGoIntegration(
        apiKey: 'your-etke-go-api-key',
      );

      // Initialize services
      await Future.wait([
        _matrixIntegration!.initialize(),
        _rustIntegration!.initialize(),
        _goIntegration!.initialize(),
      ]);

      // Load health data
      await _loadHealthData();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to initialize etke.cc services: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadHealthData() async {
    try {
      final results = await Future.wait([
        _matrixIntegration!.getHealthStatus(),
        _rustIntegration!.getHealthStatus(),
        _goIntegration!.getHealthStatus(),
      ]);

      setState(() {
        _matrixHealth = results[0];
        _rustHealth = results[1];
        _goHealth = results[2];
      });
    } catch (e) {
      if (kDebugMode) {
        print('Failed to load health data: $e');
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _matrixIntegration?.dispose();
    _rustIntegration?.dispose();
    _goIntegration?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etke.cc Integration Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadHealthData,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Matrix Services'),
            Tab(text: 'Rust Services'),
            Tab(text: 'Go Services'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _error!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _initializeEtkeServices,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _buildMatrixServicesTab(),
                    _buildRustServicesTab(),
                    _buildGoServicesTab(),
                  ],
                ),
    );
  }

  Widget _buildMatrixServicesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Matrix Ecosystem Services'),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'BaiBot',
            'AI-powered Matrix bot with text-generation, TTS, STT, and image generation',
            Icons.smart_toy,
            _matrixHealth?['services']?['baibot'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'MRS',
            'Matrix Rooms Search engine and directory server',
            Icons.search,
            _matrixHealth?['services']?['mrs'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Postmoogle',
            'Matrix ↔ Email bridge (SMTP server)',
            Icons.email,
            _matrixHealth?['services']?['postmoogle'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Honoroit',
            'Helpdesk matrix bot',
            Icons.support_agent,
            _matrixHealth?['services']?['honoroit'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Synapse Admin',
            'Admin console for Matrix Synapse homeservers',
            Icons.admin_panel_settings,
            _matrixHealth?['services']?['synapse_admin'] ?? false,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Matrix Service Actions'),
          const SizedBox(height: 16),
          _buildMatrixActionButtons(),
        ],
      ),
    );
  }

  Widget _buildRustServicesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Rust AI Services'),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Anthropic Rust SDK',
            'Anthropic Claude integration with async support',
            Icons.psychology,
            _rustHealth?['services']?['anthropic'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'OpenAI Rust SDK',
            'OpenAI GPT integration with async support',
            Icons.auto_awesome,
            _rustHealth?['services']?['openai'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Async Services',
            'Batch processing and streaming capabilities',
            Icons.sync,
            _rustHealth?['services']?['async'] ?? false,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Rust AI Actions'),
          const SizedBox(height: 16),
          _buildRustActionButtons(),
        ],
      ),
    );
  }

  Widget _buildGoServicesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Go Development Services'),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Ansible',
            'Infrastructure automation and configuration management',
            Icons.settings_system_daydream,
            _goHealth?['services']?['ansible'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'APM',
            'Application Performance Monitoring with health checks',
            Icons.monitor_heart,
            _goHealth?['services']?['apm'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Validator',
            'Data validation and schema checking',
            Icons.verified,
            _goHealth?['services']?['validator'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'SecGen',
            'Security generation (passwords, SSH keys, DKIM)',
            Icons.security,
            _goHealth?['services']?['secgen'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'LinkPearl',
            'Matrix client library for Go',
            Icons.link,
            _goHealth?['services']?['linkpearl'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'PSD',
            'Prometheus Service Discovery',
            Icons.explore,
            _goHealth?['services']?['psd'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Pricify',
            'Pricing calculation service',
            Icons.attach_money,
            _goHealth?['services']?['pricify'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'MSC1929',
            'Matrix Spec Change implementation',
            Icons.change_circle,
            _goHealth?['services']?['msc1929'] ?? false,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Go Service Actions'),
          const SizedBox(height: 16),
          _buildGoActionButtons(),
        ],
      ),
    );
  }

  Widget _buildServiceOverviewCard(
    String title,
    String description,
    IconData icon,
    bool isEnabled,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 48,
              color: isEnabled ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isEnabled ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isEnabled ? 'Enabled' : 'Disabled',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatrixActionButtons() {
    return Column(
      children: [
        _buildActionButton(
          'Send BaiBot Message',
          Icons.send,
          () => _showMatrixActionDialog('baibot'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Search Matrix Rooms',
          Icons.search,
          () => _showMatrixActionDialog('mrs'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Send Email via Matrix',
          Icons.email,
          () => _showMatrixActionDialog('postmoogle'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Create Helpdesk Ticket',
          Icons.support_agent,
          () => _showMatrixActionDialog('honoroit'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Get Synapse Stats',
          Icons.analytics,
          () => _showMatrixActionDialog('synapse'),
        ),
      ],
    );
  }

  Widget _buildRustActionButtons() {
    return Column(
      children: [
        _buildActionButton(
          'Anthropic Chat',
          Icons.chat,
          () => _showRustActionDialog('anthropic'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'OpenAI Chat',
          Icons.auto_awesome,
          () => _showRustActionDialog('openai'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Generate Image',
          Icons.image,
          () => _showRustActionDialog('image'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Batch Process',
          Icons.batch_prediction,
          () => _showRustActionDialog('batch'),
        ),
      ],
    );
  }

  Widget _buildGoActionButtons() {
    return Column(
      children: [
        _buildActionButton(
          'Run Ansible Playbook',
          Icons.play_arrow,
          () => _showGoActionDialog('ansible'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Get APM Metrics',
          Icons.monitor_heart,
          () => _showGoActionDialog('apm'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Validate Data',
          Icons.verified,
          () => _showGoActionDialog('validator'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Generate Secrets',
          Icons.security,
          () => _showGoActionDialog('secgen'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Get Prometheus Targets',
          Icons.explore,
          () => _showGoActionDialog('psd'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Calculate Pricing',
          Icons.attach_money,
          () => _showGoActionDialog('pricify'),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    String title,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
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

  void _showMatrixActionDialog(String action) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Matrix $action Action'),
        content: Text('This would trigger a $action action in the Matrix ecosystem.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Matrix $action action triggered');
            },
            child: const Text('Execute'),
          ),
        ],
      ),
    );
  }

  void _showRustActionDialog(String action) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Rust $action Action'),
        content: Text('This would trigger a $action action using Rust services.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Rust $action action triggered');
            },
            child: const Text('Execute'),
          ),
        ],
      ),
    );
  }

  void _showGoActionDialog(String action) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Go $action Action'),
        content: Text('This would trigger a $action action using Go services.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Go $action action triggered');
            },
            child: const Text('Execute'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
} 