import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/integration/matrix_ai_integration.dart';
import '../../features/integration/matrix_blockchain_integration.dart';
import '../../features/integration/matrix_iot_integration.dart';

class AdvancedMatrixDashboard extends StatefulWidget {
  const AdvancedMatrixDashboard({Key? key}) : super(key: key);

  @override
  State<AdvancedMatrixDashboard> createState() => _AdvancedMatrixDashboardState();
}

class _AdvancedMatrixDashboardState extends State<AdvancedMatrixDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isDarkMode = false;
  bool _isLoading = false;
  
  // Service instances
  late MatrixAIIntegration _aiIntegration;
  late MatrixBlockchainIntegration _blockchainIntegration;
  late MatrixIoTIntegration _iotIntegration;

  // Status data
  Map<String, dynamic> _aiStatus = {};
  Map<String, dynamic> _blockchainStatus = {};
  Map<String, dynamic> _iotStatus = {};
  List<Map<String, dynamic>> _logs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    setState(() => _isLoading = true);
    
    try {
      _aiIntegration = MatrixAIIntegration(
        apiKey: 'your-ai-api-key',
      );
      _blockchainIntegration = MatrixBlockchainIntegration(
        apiKey: 'your-blockchain-api-key',
      );
      _iotIntegration = MatrixIoTIntegration(
        apiKey: 'your-iot-api-key',
      );

      await Future.wait([
        _aiIntegration.initialize(),
        _blockchainIntegration.initialize(),
        _iotIntegration.initialize(),
      ]);

      await _refreshStatus();
      _addLog('Advanced Matrix services initialized successfully', 'success');
    } catch (e) {
      _addLog('Failed to initialize Advanced Matrix services: $e', 'error');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _refreshStatus() async {
    try {
      final results = await Future.wait([
        _aiIntegration.getHealthStatus(),
        _blockchainIntegration.getHealthStatus(),
        _iotIntegration.getHealthStatus(),
      ]);

      setState(() {
        _aiStatus = results[0];
        _blockchainStatus = results[1];
        _iotStatus = results[2];
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
        title: const Text('Advanced Matrix Dashboard'),
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
            Tab(text: 'AI Integration', icon: Icon(Icons.psychology)),
            Tab(text: 'Blockchain', icon: Icon(Icons.block)),
            Tab(text: 'IoT', icon: Icon(Icons.sensors)),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _buildAITab(),
                _buildBlockchainTab(),
                _buildIoTTab(),
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

  Widget _buildAITab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(
            'AI Integration Status',
            _aiStatus,
            Icons.psychology,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildServiceGrid([
            {'name': 'Message Analysis', 'icon': Icons.analytics, 'color': Colors.green},
            {'name': 'Content Moderation', 'icon': Icons.security, 'color': Colors.red},
            {'name': 'Translation', 'icon': Icons.translate, 'color': Colors.orange},
            {'name': 'Sentiment Analysis', 'icon': Icons.mood, 'color': Colors.purple},
            {'name': 'Auto Response', 'icon': Icons.smart_toy, 'color': Colors.cyan},
            {'name': 'Spam Detection', 'icon': Icons.block, 'color': Colors.grey},
            {'name': 'Intent Recognition', 'icon': Icons.psychology, 'color': Colors.indigo},
            {'name': 'Summarization', 'icon': Icons.summarize, 'color': Colors.teal},
          ]),
          const SizedBox(height: 16),
          _buildActionButtons([
            {'label': 'Analyze Message', 'icon': Icons.analytics, 'onTap': _analyzeMessage},
            {'label': 'Moderate Content', 'icon': Icons.security, 'onTap': _moderateContent},
            {'label': 'Translate Message', 'icon': Icons.translate, 'onTap': _translateMessage},
            {'label': 'Generate Response', 'icon': Icons.smart_toy, 'onTap': _generateResponse},
          ]),
        ],
      ),
    );
  }

  Widget _buildBlockchainTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(
            'Blockchain Integration Status',
            _blockchainStatus,
            Icons.block,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildServiceGrid([
            {'name': 'Decentralized Identity', 'icon': Icons.verified_user, 'color': Colors.green},
            {'name': 'Message Verification', 'icon': Icons.verified, 'color': Colors.blue},
            {'name': 'Smart Contracts', 'icon': Icons.code, 'color': Colors.purple},
            {'name': 'Token Integration', 'icon': Icons.token, 'color': Colors.orange},
            {'name': 'NFT Support', 'icon': Icons.image, 'color': Colors.cyan},
            {'name': 'Decentralized Storage', 'icon': Icons.storage, 'color': Colors.teal},
            {'name': 'Consensus Mechanism', 'icon': Icons.handshake, 'color': Colors.indigo},
            {'name': 'Cross Chain', 'icon': Icons.compare_arrows, 'color': Colors.red},
          ]),
          const SizedBox(height: 16),
          _buildActionButtons([
            {'label': 'Create DID', 'icon': Icons.verified_user, 'onTap': _createDID},
            {'label': 'Verify Message', 'icon': Icons.verified, 'onTap': _verifyMessage},
            {'label': 'Deploy Contract', 'icon': Icons.code, 'onTap': _deployContract},
            {'label': 'Transfer Tokens', 'icon': Icons.token, 'onTap': _transferTokens},
          ]),
        ],
      ),
    );
  }

  Widget _buildIoTTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusCard(
            'IoT Integration Status',
            _iotStatus,
            Icons.sensors,
            Colors.green,
          ),
          const SizedBox(height: 16),
          _buildServiceGrid([
            {'name': 'Device Management', 'icon': Icons.devices, 'color': Colors.blue},
            {'name': 'Sensor Data', 'icon': Icons.sensors, 'color': Colors.green},
            {'name': 'Automation', 'icon': Icons.auto_awesome, 'color': Colors.orange},
            {'name': 'MQTT Integration', 'icon': Icons.cloud, 'color': Colors.purple},
            {'name': 'Zigbee Integration', 'icon': Icons.wifi, 'color': Colors.cyan},
            {'name': 'Z-Wave Integration', 'icon': Icons.radio, 'color': Colors.teal},
            {'name': 'Home Assistant', 'icon': Icons.home, 'color': Colors.indigo},
            {'name': 'Edge Computing', 'icon': Icons.computer, 'color': Colors.red},
          ]),
          const SizedBox(height: 16),
          _buildActionButtons([
            {'label': 'Register Device', 'icon': Icons.devices, 'onTap': _registerDevice},
            {'label': 'Send Sensor Data', 'icon': Icons.sensors, 'onTap': _sendSensorData},
            {'label': 'Create Automation', 'icon': Icons.auto_awesome, 'onTap': _createAutomation},
            {'label': 'View Dashboard', 'icon': Icons.dashboard, 'onTap': _viewIoTDashboard},
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
                _buildQuickActionButton('Analyze Message', Icons.analytics, _analyzeMessage),
                _buildQuickActionButton('Create DID', Icons.verified_user, _createDID),
                _buildQuickActionButton('Register Device', Icons.devices, _registerDevice),
                _buildQuickActionButton('Deploy Contract', Icons.code, _deployContract),
                _buildQuickActionButton('Send Sensor Data', Icons.sensors, _sendSensorData),
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

  // AI Actions
  void _analyzeMessage() {
    _addLog('Analyzing message with AI...', 'info');
    // Implementation would go here
  }

  void _moderateContent() {
    _addLog('Moderating content with AI...', 'info');
    // Implementation would go here
  }

  void _translateMessage() {
    _addLog('Translating message with AI...', 'info');
    // Implementation would go here
  }

  void _generateResponse() {
    _addLog('Generating AI response...', 'info');
    // Implementation would go here
  }

  // Blockchain Actions
  void _createDID() {
    _addLog('Creating decentralized identity...', 'info');
    // Implementation would go here
  }

  void _verifyMessage() {
    _addLog('Verifying message on blockchain...', 'info');
    // Implementation would go here
  }

  void _deployContract() {
    _addLog('Deploying smart contract...', 'info');
    // Implementation would go here
  }

  void _transferTokens() {
    _addLog('Transferring tokens...', 'info');
    // Implementation would go here
  }

  // IoT Actions
  void _registerDevice() {
    _addLog('Registering IoT device...', 'info');
    // Implementation would go here
  }

  void _sendSensorData() {
    _addLog('Sending sensor data...', 'info');
    // Implementation would go here
  }

  void _createAutomation() {
    _addLog('Creating IoT automation...', 'info');
    // Implementation would go here
  }

  void _viewIoTDashboard() {
    _addLog('Viewing IoT dashboard...', 'info');
    // Implementation would go here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
} 