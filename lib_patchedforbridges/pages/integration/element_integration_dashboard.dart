import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../features/integration/element_matrix_integration.dart';
import '../../features/integration/element_call_integration.dart';
import '../../features/integration/element_bridge_integration.dart';

/// Element.io Integration Dashboard
/// Comprehensive dashboard for all Element.io services
class ElementIntegrationDashboard extends StatefulWidget {
  const ElementIntegrationDashboard({super.key});

  @override
  State<ElementIntegrationDashboard> createState() => _ElementIntegrationDashboardState();
}

class _ElementIntegrationDashboardState extends State<ElementIntegrationDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  String? _error;

  // Element.io services
  ElementMatrixIntegration? _matrixIntegration;
  ElementCallIntegration? _callIntegration;
  ElementBridgeIntegration? _bridgeIntegration;

  // Dashboard data
  Map<String, dynamic>? _matrixHealth;
  Map<String, dynamic>? _callHealth;
  Map<String, dynamic>? _bridgeHealth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeElementServices();
  }

  Future<void> _initializeElementServices() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Initialize Element.io services
      _matrixIntegration = ElementMatrixIntegration(
        apiKey: 'your-element-matrix-api-key',
        matrixClient: null, // Would need actual Matrix client
      );

      _callIntegration = ElementCallIntegration(
        apiKey: 'your-element-call-api-key',
      );

      _bridgeIntegration = ElementBridgeIntegration(
        apiKey: 'your-element-bridge-api-key',
      );

      // Initialize services
      await Future.wait([
        _matrixIntegration!.initialize(),
        _callIntegration!.initialize(),
        _bridgeIntegration!.initialize(),
      ]);

      // Load health data
      await _loadHealthData();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to initialize Element.io services: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _loadHealthData() async {
    try {
      final results = await Future.wait([
        _matrixIntegration!.getHealthStatus(),
        _callIntegration!.getHealthStatus(),
        _bridgeIntegration!.getHealthStatus(),
      ]);

      setState(() {
        _matrixHealth = results[0];
        _callHealth = results[1];
        _bridgeHealth = results[2];
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
    _callIntegration?.dispose();
    _bridgeIntegration?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Element.io Integration Dashboard'),
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
            Tab(text: 'Matrix Client'),
            Tab(text: 'Call Services'),
            Tab(text: 'Bridge Services'),
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
                        onPressed: _initializeElementServices,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _buildMatrixClientTab(),
                    _buildCallServicesTab(),
                    _buildBridgeServicesTab(),
                  ],
                ),
    );
  }

  Widget _buildMatrixClientTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Element Matrix Client Services'),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Element Web',
            'Web-based Matrix client with full messaging capabilities',
            Icons.web,
            _matrixHealth?['services']?['element_web'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Element Mobile',
            'Mobile Matrix client with push notifications',
            Icons.mobile_friendly,
            _matrixHealth?['services']?['element_mobile'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Element Server',
            'Self-hosted Matrix server management',
            Icons.dns,
            _matrixHealth?['services']?['element_server'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Element Widgets',
            'Embedded widgets for Matrix rooms',
            Icons.widgets,
            _matrixHealth?['services']?['element_widgets'] ?? false,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Matrix Client Actions'),
          const SizedBox(height: 16),
          _buildMatrixActionButtons(),
        ],
      ),
    );
  }

  Widget _buildCallServicesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Element Call Services'),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Voice Calls',
            'High-quality voice calling with noise suppression',
            Icons.call,
            _callHealth?['services']?['voice_call'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Video Calls',
            'HD video calling with screen sharing',
            Icons.videocam,
            _callHealth?['services']?['video_call'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Screen Sharing',
            'Real-time screen sharing capabilities',
            Icons.screen_share,
            _callHealth?['services']?['screen_share'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Call Recording',
            'Record calls with transcription',
            Icons.fiber_manual_record,
            _callHealth?['services']?['recording'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Live Transcription',
            'Real-time speech-to-text during calls',
            Icons.translate,
            _callHealth?['services']?['transcription'] ?? false,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Call Service Actions'),
          const SizedBox(height: 16),
          _buildCallActionButtons(),
        ],
      ),
    );
  }

  Widget _buildBridgeServicesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Element Bridge Services'),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Slack Bridge',
            'Connect Matrix rooms with Slack channels',
            Icons.slack,
            _bridgeHealth?['services']?['slack_bridge'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Discord Bridge',
            'Bridge Matrix rooms with Discord servers',
            Icons.discord,
            _bridgeHealth?['services']?['discord_bridge'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Telegram Bridge',
            'Connect Matrix with Telegram chats',
            Icons.telegram,
            _bridgeHealth?['services']?['telegram_bridge'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'WhatsApp Bridge',
            'Bridge Matrix with WhatsApp groups',
            Icons.whatsapp,
            _bridgeHealth?['services']?['whatsapp_bridge'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Signal Bridge',
            'Connect Matrix with Signal groups',
            Icons.signal_cellular_alt,
            _bridgeHealth?['services']?['signal_bridge'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'IRC Bridge',
            'Bridge Matrix rooms with IRC channels',
            Icons.terminal,
            _bridgeHealth?['services']?['irc_bridge'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'Email Bridge',
            'Connect Matrix with email communication',
            Icons.email,
            _bridgeHealth?['services']?['email_bridge'] ?? false,
          ),
          const SizedBox(height: 16),
          _buildServiceOverviewCard(
            'GitHub Bridge',
            'Bridge Matrix with GitHub repositories',
            Icons.code,
            _bridgeHealth?['services']?['github_bridge'] ?? false,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Bridge Service Actions'),
          const SizedBox(height: 16),
          _buildBridgeActionButtons(),
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
          'Create Web Session',
          Icons.web,
          () => _showMatrixActionDialog('web_session'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Create Mobile Session',
          Icons.mobile_friendly,
          () => _showMatrixActionDialog('mobile_session'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Get Matrix Rooms',
          Icons.room,
          () => _showMatrixActionDialog('get_rooms'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Configure Push Notifications',
          Icons.notifications,
          () => _showMatrixActionDialog('push_notifications'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Get Server Info',
          Icons.info,
          () => _showMatrixActionDialog('server_info'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Create Server User',
          Icons.person_add,
          () => _showMatrixActionDialog('create_user'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Create Widget',
          Icons.widgets,
          () => _showMatrixActionDialog('create_widget'),
        ),
      ],
    );
  }

  Widget _buildCallActionButtons() {
    return Column(
      children: [
        _buildActionButton(
          'Create Voice Call',
          Icons.call,
          () => _showCallActionDialog('voice_call'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Create Video Call',
          Icons.videocam,
          () => _showCallActionDialog('video_call'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Join Call',
          Icons.call_merge,
          () => _showCallActionDialog('join_call'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Toggle Audio',
          Icons.mic,
          () => _showCallActionDialog('toggle_audio'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Toggle Video',
          Icons.videocam_off,
          () => _showCallActionDialog('toggle_video'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Start Screen Share',
          Icons.screen_share,
          () => _showCallActionDialog('screen_share'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Start Recording',
          Icons.fiber_manual_record,
          () => _showCallActionDialog('start_recording'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Get Transcription',
          Icons.translate,
          () => _showCallActionDialog('get_transcription'),
        ),
      ],
    );
  }

  Widget _buildBridgeActionButtons() {
    return Column(
      children: [
        _buildActionButton(
          'Configure Slack Bridge',
          Icons.slack,
          () => _showBridgeActionDialog('slack'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Configure Discord Bridge',
          Icons.discord,
          () => _showBridgeActionDialog('discord'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Configure Telegram Bridge',
          Icons.telegram,
          () => _showBridgeActionDialog('telegram'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Configure WhatsApp Bridge',
          Icons.whatsapp,
          () => _showBridgeActionDialog('whatsapp'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Configure Signal Bridge',
          Icons.signal_cellular_alt,
          () => _showBridgeActionDialog('signal'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Configure IRC Bridge',
          Icons.terminal,
          () => _showBridgeActionDialog('irc'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Configure Email Bridge',
          Icons.email,
          () => _showBridgeActionDialog('email'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Configure GitHub Bridge',
          Icons.code,
          () => _showBridgeActionDialog('github'),
        ),
        const SizedBox(height: 8),
        _buildActionButton(
          'Get Bridge Status',
          Icons.info,
          () => _showBridgeActionDialog('status'),
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
        content: Text('This would trigger a $action action in the Element Matrix client.'),
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

  void _showCallActionDialog(String action) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Call $action Action'),
        content: Text('This would trigger a $action action using Element Call services.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Call $action action triggered');
            },
            child: const Text('Execute'),
          ),
        ],
      ),
    );
  }

  void _showBridgeActionDialog(String action) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Bridge $action Action'),
        content: Text('This would trigger a $action action using Element Bridge services.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar('Bridge $action action triggered');
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