import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/integration/matrix_protocol_extensions.dart';
import '../../features/integration/matrix_bridges_integration.dart';
import '../../features/integration/matrix_federation_integration.dart';
import '../../features/integration/matrix_appservices_integration.dart';

class MatrixBackendDashboard extends StatefulWidget {
  const MatrixBackendDashboard({Key? key}) : super(key: key);

  @override
  State<MatrixBackendDashboard> createState() => _MatrixBackendDashboardState();
}

class _MatrixBackendDashboardState extends State<MatrixBackendDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isDarkMode = false;
  bool _isLoading = false;
  String _selectedService = 'All';
  
  // Service instances
  late MatrixProtocolExtensions _protocolExtensions;
  late MatrixBridgesIntegration _bridgesIntegration;
  late MatrixFederationIntegration _federationIntegration;
  late MatrixAppServicesIntegration _appServicesIntegration;

  // Status data
  Map<String, dynamic> _protocolExtensionsStatus = {};
  Map<String, dynamic> _bridgesStatus = {};
  Map<String, dynamic> _federationStatus = {};
  Map<String, dynamic> _appServicesStatus = {};
  List<Map<String, dynamic>> _logs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    setState(() => _isLoading = true);
    
    try {
      _protocolExtensions = MatrixProtocolExtensions(
        apiKey: 'your-protocol-extensions-api-key',
      );
      _bridgesIntegration = MatrixBridgesIntegration(
        apiKey: 'your-bridges-api-key',
      );
      _federationIntegration = MatrixFederationIntegration(
        apiKey: 'your-federation-api-key',
      );
      _appServicesIntegration = MatrixAppServicesIntegration(
        apiKey: 'your-appservices-api-key',
      );

      await Future.wait([
        _protocolExtensions.initialize(),
        _bridgesIntegration.initialize(),
        _federationIntegration.initialize(),
        _appServicesIntegration.initialize(),
      ]);

      await _refreshStatus();
      _addLog('Matrix Backend services initialized successfully', 'success');
    } catch (e) {
      _addLog('Failed to initialize Matrix Backend services: $e', 'error');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _refreshStatus() async {
    try {
      final results = await Future.wait([
        _protocolExtensions.getHealthStatus(),
        _bridgesIntegration.getHealthStatus(),
        _federationIntegration.getHealthStatus(),
        _appServicesIntegration.getHealthStatus(),
      ]);

      setState(() {
        _protocolExtensionsStatus = results[0];
        _bridgesStatus = results[1];
        _federationStatus = results[2];
        _appServicesStatus = results[3];
      });
    } catch (e) {
      _addLog('Failed to refresh status: $e', 'error');
    }
  }

  void _addLog(String message, String level) {
    setState(() {
      _logs.insert(0, {
        'message': message,
        'level': level,
        'timestamp': DateTime.now().toIso8601String(),
      });
      if (_logs.length > 100) _logs.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix Backend Dashboard'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshStatus,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Protocol Extensions', icon: Icon(Icons.extension)),
            Tab(text: 'Bridges', icon: Icon(Icons.bridge)),
            Tab(text: 'Federation', icon: Icon(Icons.cloud)),
            Tab(text: 'App Services', icon: Icon(Icons.apps)),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _buildProtocolExtensionsTab(),
                _buildBridgesTab(),
                _buildFederationTab(),
                _buildAppServicesTab(),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showQuickActions,
        label: const Text('Quick Actions'),
        icon: const Icon(Icons.flash_on),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildProtocolExtensionsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(
            'Protocol Extensions Status',
            _protocolExtensionsStatus,
            Icons.extension,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildServiceGrid([
            {'name': 'MSC Extensions', 'icon': Icons.code, 'color': Colors.green},
            {'name': 'Bridges', 'icon': Icons.bridge, 'color': Colors.orange},
            {'name': 'App Services', 'icon': Icons.apps, 'color': Colors.purple},
            {'name': 'Federation', 'icon': Icons.cloud, 'color': Colors.blue},
            {'name': 'Encryption', 'icon': Icons.security, 'color': Colors.red},
            {'name': 'Voice/Video', 'icon': Icons.videocam, 'color': Colors.indigo},
            {'name': 'File Sharing', 'icon': Icons.file_copy, 'color': Colors.teal},
            {'name': 'Bot Framework', 'icon': Icons.smart_toy, 'color': Colors.cyan},
          ]),
          const SizedBox(height: 16),
          _buildActionButtons([
            {'label': 'Create MSC Extension', 'icon': Icons.add, 'onTap': _createMSCExtension},
            {'label': 'Setup Bridge', 'icon': Icons.bridge, 'onTap': _setupBridge},
            {'label': 'Register App Service', 'icon': Icons.app_registration, 'onTap': _registerAppService},
            {'label': 'Configure Federation', 'icon': Icons.settings, 'onTap': _configureFederation},
          ]),
        ],
      ),
    );
  }

  Widget _buildBridgesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(
            'Bridges Status',
            _bridgesStatus,
            Icons.bridge,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildBridgeGrid([
            {'name': 'IRC', 'icon': Icons.chat, 'color': Colors.green},
            {'name': 'Discord', 'icon': Icons.discord, 'color': Colors.indigo},
            {'name': 'Telegram', 'icon': Icons.telegram, 'color': Colors.blue},
            {'name': 'Slack', 'icon': Icons.slack, 'color': Colors.purple},
            {'name': 'WhatsApp', 'icon': Icons.whatsapp, 'color': Colors.green},
            {'name': 'Signal', 'icon': Icons.signal_cellular_alt, 'color': Colors.orange},
            {'name': 'Email', 'icon': Icons.email, 'color': Colors.grey},
            {'name': 'XMPP', 'icon': Icons.message, 'color': Colors.teal},
            {'name': 'Mastodon', 'icon': Icons.cloud, 'color': Colors.purple},
            {'name': 'Twitter', 'icon': Icons.flutter_dash, 'color': Colors.blue},
          ]),
          const SizedBox(height: 16),
          _buildActionButtons([
            {'label': 'Connect IRC', 'icon': Icons.link, 'onTap': () => _connectBridge('irc')},
            {'label': 'Connect Discord', 'icon': Icons.link, 'onTap': () => _connectBridge('discord')},
            {'label': 'Connect Telegram', 'icon': Icons.link, 'onTap': () => _connectBridge('telegram')},
            {'label': 'View Active Bridges', 'icon': Icons.list, 'onTap': _viewActiveBridges},
          ]),
        ],
      ),
    );
  }

  Widget _buildFederationTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(
            'Federation Status',
            _federationStatus,
            Icons.cloud,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildServiceGrid([
            {'name': 'Federation', 'icon': Icons.cloud, 'color': Colors.blue},
            {'name': 'Server Discovery', 'icon': Icons.search, 'color': Colors.green},
            {'name': 'Key Verification', 'icon': Icons.vpn_key, 'color': Colors.orange},
            {'name': 'Event Exchange', 'icon': Icons.swap_horiz, 'color': Colors.purple},
            {'name': 'Room Directory', 'icon': Icons.folder, 'color': Colors.teal},
            {'name': 'User Directory', 'icon': Icons.people, 'color': Colors.indigo},
            {'name': 'Media Proxy', 'icon': Icons.image, 'color': Colors.red},
            {'name': 'Federation Metrics', 'icon': Icons.analytics, 'color': Colors.cyan},
          ]),
          const SizedBox(height: 16),
          _buildActionButtons([
            {'label': 'Configure Federation', 'icon': Icons.settings, 'onTap': _configureFederation},
            {'label': 'Discover Servers', 'icon': Icons.search, 'onTap': _discoverServers},
            {'label': 'Verify Keys', 'icon': Icons.security, 'onTap': _verifyKeys},
            {'label': 'View Connected Servers', 'icon': Icons.cloud_done, 'onTap': _viewConnectedServers},
          ]),
        ],
      ),
    );
  }

  Widget _buildAppServicesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(
            'App Services Status',
            _appServicesStatus,
            Icons.apps,
            Colors.purple,
          ),
          const SizedBox(height: 16),
          _buildServiceGrid([
            {'name': 'App Services', 'icon': Icons.apps, 'color': Colors.purple},
            {'name': 'Bot Framework', 'icon': Icons.smart_toy, 'color': Colors.blue},
            {'name': 'Webhook Support', 'icon': Icons.webhook, 'color': Colors.green},
            {'name': 'Custom Events', 'icon': Icons.event, 'color': Colors.orange},
            {'name': 'Room Management', 'icon': Icons.room, 'color': Colors.teal},
            {'name': 'User Management', 'icon': Icons.person_add, 'color': Colors.indigo},
            {'name': 'Media Handling', 'icon': Icons.media_bluetooth_on, 'color': Colors.red},
            {'name': 'Analytics', 'icon': Icons.analytics, 'color': Colors.cyan},
          ]),
          const SizedBox(height: 16),
          _buildActionButtons([
            {'label': 'Register App Service', 'icon': Icons.app_registration, 'onTap': _registerAppService},
            {'label': 'Create Bot', 'icon': Icons.smart_toy, 'onTap': _createBot},
            {'label': 'Create Webhook', 'icon': Icons.webhook, 'onTap': _createWebhook},
            {'label': 'View Analytics', 'icon': Icons.analytics, 'onTap': _viewAnalytics},
          ]),
        ],
      ),
    );
  }

  Widget _buildStatusCard(String title, Map<String, dynamic> status, IconData icon, Color color) {
    final isHealthy = status['status'] == 'healthy';
    
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        isHealthy ? Icons.check_circle : Icons.error,
                        color: isHealthy ? Colors.green : Colors.red,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isHealthy ? 'Healthy' : 'Unhealthy',
                        style: TextStyle(
                          color: isHealthy ? Colors.green : Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  if (status['last_error'] != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Error: ${status['last_error']}',
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceGrid(List<Map<String, dynamic>> services) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Card(
          child: InkWell(
            onTap: () => _showServiceDetails(service['name']),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(service['icon'], size: 32, color: service['color']),
                  const SizedBox(height: 8),
                  Text(
                    service['name'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBridgeGrid(List<Map<String, dynamic>> bridges) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: bridges.length,
      itemBuilder: (context, index) {
        final bridge = bridges[index];
        return Card(
          child: InkWell(
            onTap: () => _connectBridge(bridge['name'].toLowerCase()),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(bridge['icon'], size: 32, color: bridge['color']),
                  const SizedBox(height: 8),
                  Text(
                    bridge['name'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Tap to connect',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(List<Map<String, dynamic>> actions) {
    return Column(
      children: actions.map((action) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: action['onTap'],
            icon: Icon(action['icon']),
            label: Text(action['label']),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      )).toList(),
    );
  }

  void _showQuickActions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Quick Actions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildQuickActionButton('Create Bot', Icons.smart_toy, _createBot),
                _buildQuickActionButton('Connect IRC', Icons.chat, () => _connectBridge('irc')),
                _buildQuickActionButton('Setup Federation', Icons.cloud, _configureFederation),
                _buildQuickActionButton('Register Service', Icons.app_registration, _registerAppService),
                _buildQuickActionButton('View Analytics', Icons.analytics, _viewAnalytics),
                _buildQuickActionButton('Health Check', Icons.health_and_safety, _refreshStatus),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.deepPurple.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.deepPurple),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  void _showServiceDetails(String serviceName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$serviceName Details'),
        content: Text('Detailed information about $serviceName service.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  // Action methods
  void _createMSCExtension() {
    _addLog('Creating MSC Extension...', 'info');
    // Implementation would go here
  }

  void _setupBridge() {
    _addLog('Setting up bridge...', 'info');
    // Implementation would go here
  }

  void _registerAppService() {
    _addLog('Registering app service...', 'info');
    // Implementation would go here
  }

  void _configureFederation() {
    _addLog('Configuring federation...', 'info');
    // Implementation would go here
  }

  void _connectBridge(String bridgeType) {
    _addLog('Connecting to $bridgeType bridge...', 'info');
    // Implementation would go here
  }

  void _viewActiveBridges() {
    _addLog('Viewing active bridges...', 'info');
    // Implementation would go here
  }

  void _discoverServers() {
    _addLog('Discovering servers...', 'info');
    // Implementation would go here
  }

  void _verifyKeys() {
    _addLog('Verifying keys...', 'info');
    // Implementation would go here
  }

  void _viewConnectedServers() {
    _addLog('Viewing connected servers...', 'info');
    // Implementation would go here
  }

  void _createBot() {
    _addLog('Creating bot...', 'info');
    // Implementation would go here
  }

  void _createWebhook() {
    _addLog('Creating webhook...', 'info');
    // Implementation would go here
  }

  void _viewAnalytics() {
    _addLog('Viewing analytics...', 'info');
    // Implementation would go here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
} 