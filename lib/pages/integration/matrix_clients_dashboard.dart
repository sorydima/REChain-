import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/integration/integration_manager.dart';
import '../../features/integration/fluffychat_integration.dart';
import '../../features/integration/krille_chan_integration.dart';
import '../../features/integration/element_matrix_integration.dart';
import '../../features/integration/nheko_integration.dart';
import '../../features/integration/cinny_integration.dart';
import '../../features/integration/neochat_integration.dart';

/// Matrix Clients Dashboard
/// Provides unified interface for all Matrix clients with modern UI/UX
class MatrixClientsDashboard extends StatefulWidget {
  final IntegrationManager integrationManager;

  const MatrixClientsDashboard({
    Key? key,
    required this.integrationManager,
  }) : super(key: key);

  @override
  State<MatrixClientsDashboard> createState() => _MatrixClientsDashboardState();
}

class _MatrixClientsDashboardState extends State<MatrixClientsDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  MatrixClientServicesOverview? _servicesOverview;
  bool _isLoading = false;
  bool _isRefreshing = false;
  String? _error;
  bool _isDarkMode = false;
  bool _showLogs = false;
  final List<String> _logs = [];

  static const _tabLabels = [
    'FluffyChat',
    'Krille-chan',
    'Nheko',
    'Cinny',
    'NeoChat',
    'Element.io',
  ];
  
  static const _tabIcons = [
    Icons.chat_bubble_outline,
    Icons.speed,
    Icons.desktop_windows,
    Icons.web_asset,
    Icons.mobile_friendly,
    Icons.web,
  ];

  static const _tabColors = [
    Colors.purple,
    Colors.blue,
    Colors.deepPurple,
    Colors.orange,
    Colors.blueGrey,
    Colors.green,
  ];

  static const _tabDescriptions = [
    'Modern, cross-platform Matrix client',
    'Lightweight, fast Matrix client',
    'Native desktop Matrix client (Qt)',
    'Modern web Matrix client (PWA)',
    'KDE Plasma Matrix client',
    'Professional Matrix client suite',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabLabels.length, vsync: this);
    _loadServicesOverview();
    _addLog('Matrix Clients Dashboard initialized');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addLog(String message) {
    if (_showLogs) {
      setState(() {
        _logs.add('${DateTime.now().toString().substring(11, 19)}: $message');
        if (_logs.length > 100) _logs.removeAt(0);
      });
    }
  }

  Future<void> _loadServicesOverview() async {
    setState(() {
      _isLoading = true;
      _isRefreshing = true;
      _error = null;
    });

    _addLog('Loading Matrix client services...');

    try {
      final overview = await widget.integrationManager.getMatrixClientServicesOverview();
      setState(() {
        _servicesOverview = overview;
        _isLoading = false;
        _isRefreshing = false;
      });
      _addLog('Services loaded successfully');
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
        _isRefreshing = false;
      });
      _addLog('Error loading services: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.forum, color: Colors.white),
          const SizedBox(width: 8),
          const Text('Matrix Clients'),
          if (_isRefreshing) ...[
            const SizedBox(width: 16),
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ],
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      actions: [
        IconButton(
          icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: () {
            setState(() {
              _isDarkMode = !_isDarkMode;
            });
            _addLog('Theme switched to ${_isDarkMode ? 'dark' : 'light'} mode');
          },
          tooltip: 'Toggle Theme',
        ),
        IconButton(
          icon: Icon(_showLogs ? Icons.code : Icons.code_outlined),
          onPressed: () {
            setState(() {
              _showLogs = !_showLogs;
            });
            _addLog('Logs panel ${_showLogs ? 'enabled' : 'disabled'}');
          },
          tooltip: 'Toggle Logs',
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: _isRefreshing ? null : _loadServicesOverview,
          tooltip: 'Refresh Services',
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        isScrollable: true,
        tabs: List.generate(_tabLabels.length, (i) => 
          Tab(
            icon: Icon(_tabIcons[i]),
            text: _tabLabels[i],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return _buildLoadingView();
    }

    if (_error != null) {
      return _buildErrorView();
    }

    return Column(
      children: [
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildClientTab(0, _buildFluffyChatContent()),
              _buildClientTab(1, _buildKrilleChanContent()),
              _buildClientTab(2, _buildNhekoContent()),
              _buildClientTab(3, _buildCinnyContent()),
              _buildClientTab(4, _buildNeoChatContent()),
              _buildClientTab(5, _buildElementContent()),
            ],
          ),
        ),
        if (_showLogs) _buildLogsPanel(),
      ],
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading Matrix Clients...',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Connecting to services and checking status',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[400],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Connection Error',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              _error!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _loadServicesOverview,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildClientTab(int index, Widget content) {
    final clientData = _getClientData(index);
    final isHealthy = clientData?['status'] == 'healthy';
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildClientHeader(index, clientData),
          const SizedBox(height: 24),
          if (clientData != null) ...[
            _buildStatusOverview(clientData),
            const SizedBox(height: 16),
            _buildQuickActions(index),
            const SizedBox(height: 16),
            content,
          ] else ...[
            _buildServiceNotAvailableCard(_tabLabels[index]),
          ],
        ],
      ),
    );
  }

  Widget _buildClientHeader(int index, Map<String, dynamic>? clientData) {
    final isHealthy = clientData?['status'] == 'healthy';
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _tabColors[index].withOpacity(0.8),
            _tabColors[index].withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _tabColors[index].withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _tabIcons[index],
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _tabLabels[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _tabDescriptions[index],
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildStatusBadge(isHealthy),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(bool isHealthy) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isHealthy ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: (isHealthy ? Colors.green : Colors.red).withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isHealthy ? Icons.check_circle : Icons.error,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            isHealthy ? 'HEALTHY' : 'ERROR',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusOverview(Map<String, dynamic> clientData) {
    final services = clientData['services'] as Map<String, dynamic>? ?? {};
    final enabledServices = services.entries.where((e) => e.value == true).length;
    final totalServices = services.length;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.analytics, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Service Status',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '$enabledServices/$totalServices',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: totalServices > 0 ? enabledServices / totalServices : 0,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: services.entries.map((entry) {
                final isEnabled = entry.value == true;
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isEnabled 
                        ? Colors.green.withOpacity(0.1) 
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isEnabled ? Colors.green : Colors.red,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isEnabled ? Icons.check_circle : Icons.cancel,
                        color: isEnabled ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        entry.key.replaceAll('_', ' ').toUpperCase(),
                        style: TextStyle(
                          color: isEnabled ? Colors.green : Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(int index) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.flash_on, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildQuickActionButton(
                  'Create Session',
                  Icons.login,
                  () => _showSessionDialog(_getClientType(index)),
                  Colors.blue,
                ),
                _buildQuickActionButton(
                  'Health Check',
                  Icons.health_and_safety,
                  () => _performHealthCheck(index),
                  Colors.green,
                ),
                _buildQuickActionButton(
                  'Settings',
                  Icons.settings,
                  () => _showSettingsDialog(index),
                  Colors.orange,
                ),
                _buildQuickActionButton(
                  'Documentation',
                  Icons.help_outline,
                  () => _showDocumentation(index),
                  Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(String label, IconData icon, VoidCallback onPressed, Color color) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'sync_all',
          onPressed: _syncAllServices,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.sync, color: Colors.white),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          heroTag: 'new_session',
          onPressed: _showGlobalSessionDialog,
          backgroundColor: Colors.green,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildLogsPanel() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: _isDarkMode ? Colors.grey[800] : Colors.grey[100],
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _isDarkMode ? Colors.grey[700] : Colors.grey[200],
            ),
            child: Row(
              children: [
                Icon(Icons.code, size: 16),
                const SizedBox(width: 8),
                Text(
                  'Logs (${_logs.length})',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.clear, size: 16),
                  onPressed: _clearLogs,
                  tooltip: 'Clear Logs',
                ),
                IconButton(
                  icon: const Icon(Icons.download, size: 16),
                  onPressed: _exportLogs,
                  tooltip: 'Export Logs',
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _logs.length,
              itemBuilder: (context, index) {
                final log = _logs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    log,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'monospace',
                      color: _isDarkMode ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods
  Map<String, dynamic>? _getClientData(int index) {
    switch (index) {
      case 0: return _servicesOverview?.fluffyChatData;
      case 1: return _servicesOverview?.krilleChanData;
      case 2: return _servicesOverview?.nhekoData;
      case 3: return _servicesOverview?.cinnyData;
      case 4: return _servicesOverview?.neoChatData;
      case 5: return _servicesOverview?.elementData;
      default: return null;
    }
  }

  String _getClientType(int index) {
    switch (index) {
      case 0: return 'fluffychat';
      case 1: return 'krille_chan';
      case 2: return 'nheko';
      case 3: return 'cinny';
      case 4: return 'neochat';
      case 5: return 'element';
      default: return 'unknown';
    }
  }

  // Action methods
  void _showSessionDialog(String clientType) {
    _addLog('Opening session dialog for $clientType');
    showDialog(
      context: context,
      builder: (context) => _SessionDialog(
        clientType: clientType,
        onSessionCreated: (sessionData) {
          _addLog('Session created for $clientType: ${sessionData['sessionId']}');
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _performHealthCheck(int index) {
    _addLog('Performing health check for ${_tabLabels[index]}');
    showDialog(
      context: context,
      builder: (context) => _HealthCheckDialog(
        clientName: _tabLabels[index],
        clientType: _getClientType(index),
        onComplete: (results) {
          _addLog('Health check completed for ${_tabLabels[index]}: ${results['status']}');
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _showSettingsDialog(int index) {
    _addLog('Opening settings for ${_tabLabels[index]}');
    showDialog(
      context: context,
      builder: (context) => _SettingsDialog(
        clientName: _tabLabels[index],
        clientType: _getClientType(index),
        onSettingsSaved: (settings) {
          _addLog('Settings saved for ${_tabLabels[index]}');
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _showDocumentation(int index) {
    _addLog('Opening documentation for ${_tabLabels[index]}');
    final urls = {
      0: 'https://fluffychat.im/',
      1: 'https://github.com/krille-chan/krille-chan',
      2: 'https://nheko-reborn.github.io/',
      3: 'https://cinny.in/',
      4: 'https://apps.kde.org/neochat/',
      5: 'https://element.io/',
    };
    
    final url = urls[index];
    if (url != null) {
      // In a real app, you'd use url_launcher
      _addLog('Opening documentation URL: $url');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Opening documentation: $url'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
    }
  }

  void _syncAllServices() {
    _addLog('Syncing all Matrix client services');
    _loadServicesOverview();
  }

  void _showGlobalSessionDialog() {
    _addLog('Opening global session creation dialog');
    showDialog(
      context: context,
      builder: (context) => _GlobalSessionDialog(
        onSessionCreated: (sessionData) {
          _addLog('Global session created: ${sessionData['sessionId']}');
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _exportLogs() {
    _addLog('Exporting logs');
    final logContent = _logs.join('\n');
    Clipboard.setData(ClipboardData(text: logContent));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Logs copied to clipboard'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  void _clearLogs() {
    setState(() {
      _logs.clear();
    });
    _addLog('Logs cleared');
  }

  void _showFeatureInfo(String title, String description) {
    _addLog('Showing feature info for $title');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _configureService(String serviceName) {
    _addLog('Opening configuration for $serviceName');
    showDialog(
      context: context,
      builder: (context) => _ConfigurationDialog(
        serviceName: serviceName,
        onConfigured: (config) {
          _addLog('Service $serviceName configured');
          Navigator.of(context).pop();
        },
      ),
    );
  }

  // Content builders for each client
  Widget _buildFluffyChatContent() {
    return _buildClientContent('FluffyChat', [
      _buildFeatureCard('File Sharing', 'Upload and share files up to 100MB'),
      _buildFeatureCard('Voice Messages', 'Send audio messages up to 5 minutes'),
      _buildFeatureCard('Stickers', 'Use custom sticker packs'),
      _buildFeatureCard('Group Chats', 'Advanced group management'),
      _buildFeatureCard('Themes', 'Customizable UI themes'),
    ]);
  }

  Widget _buildKrilleChanContent() {
    return _buildClientContent('Krille-chan', [
      _buildFeatureCard('Minimal UI', 'Clean, distraction-free interface'),
      _buildFeatureCard('Performance Mode', 'Optimized for speed'),
      _buildFeatureCard('Resource Optimization', 'Low memory and CPU usage'),
      _buildFeatureCard('Fast Sync', 'Quick message synchronization'),
      _buildFeatureCard('Lightweight Mode', 'Reduced feature set'),
    ]);
  }

  Widget _buildNhekoContent() {
    return _buildClientContent('Nheko', [
      _buildFeatureCard('Desktop Client', 'Native Qt desktop app'),
      _buildFeatureCard('Native Integration', 'System tray, notifications'),
      _buildFeatureCard('Advanced Features', 'Power user features'),
      _buildFeatureCard('Keyboard Shortcuts', 'Customizable shortcuts'),
      _buildFeatureCard('Plugin System', 'Extendable via plugins'),
    ]);
  }

  Widget _buildCinnyContent() {
    return _buildClientContent('Cinny', [
      _buildFeatureCard('Web Client', 'Modern, elegant web app'),
      _buildFeatureCard('PWA Support', 'Installable as Progressive Web App'),
      _buildFeatureCard('Responsive Design', 'Works on all screen sizes'),
      _buildFeatureCard('Modern UI', 'Material design, smooth transitions'),
      _buildFeatureCard('Offline Support', 'Works offline'),
    ]);
  }

  Widget _buildNeoChatContent() {
    return _buildClientContent('NeoChat', [
      _buildFeatureCard('Desktop Client', 'KDE Plasma desktop app'),
      _buildFeatureCard('Mobile Client', 'Android support'),
      _buildFeatureCard('KDE Integration', 'KDE notifications, wallet'),
      _buildFeatureCard('Plasma Integration', 'Widgets, activities'),
      _buildFeatureCard('Cross Platform', 'Linux, Android, Windows, macOS'),
    ]);
  }

  Widget _buildElementContent() {
    return _buildClientContent('Element.io', [
      _buildFeatureCard('Matrix Client', 'Full Matrix protocol support'),
      _buildFeatureCard('Call Services', 'Voice and video calling'),
      _buildFeatureCard('Bridge Services', 'External platform integration'),
      _buildFeatureCard('End-to-End Encryption', 'Secure communication'),
      _buildFeatureCard('Professional Features', 'Enterprise-ready capabilities'),
    ]);
  }

  Widget _buildClientContent(String title, List<Widget> features) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title Features',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...features,
      ],
    );
  }

  Widget _buildFeatureCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Icon(Icons.check_circle, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () => _showFeatureInfo(title, description),
        ),
      ),
    );
  }

  Widget _buildServiceNotAvailableCard(String serviceName) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(
              Icons.cloud_off,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              '$serviceName Not Available',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'The $serviceName integration is not configured or not available.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _configureService(serviceName),
              icon: const Icon(Icons.settings),
              label: const Text('Configure Service'),
            ),
          ],
        ),
      ),
    );
  }
}

// Dialog Classes
class _SessionDialog extends StatefulWidget {
  final String clientType;
  final Function(Map<String, dynamic>) onSessionCreated;

  const _SessionDialog({
    required this.clientType,
    required this.onSessionCreated,
  });

  @override
  State<_SessionDialog> createState() => _SessionDialogState();
}

class _SessionDialogState extends State<_SessionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _homeserverController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.login, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text('Create ${widget.clientType} Session'),
        ],
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _homeserverController,
              decoration: const InputDecoration(
                labelText: 'Homeserver URL',
                hintText: 'https://matrix.example.com',
                prefixIcon: Icon(Icons.home),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter homeserver URL';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: '@user:example.com',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _createSession,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Create Session'),
        ),
      ],
    );
  }

  Future<void> _createSession() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      final sessionData = {
        'sessionId': 'session_${DateTime.now().millisecondsSinceEpoch}',
        'clientType': widget.clientType,
        'homeserver': _homeserverController.text,
        'username': _usernameController.text,
        'createdAt': DateTime.now().toIso8601String(),
      };

      widget.onSessionCreated(sessionData);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating session: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
}

class _HealthCheckDialog extends StatefulWidget {
  final String clientName;
  final String clientType;
  final Function(Map<String, dynamic>) onComplete;

  const _HealthCheckDialog({
    required this.clientName,
    required this.clientType,
    required this.onComplete,
  });

  @override
  State<_HealthCheckDialog> createState() => _HealthCheckDialogState();
}

class _HealthCheckDialogState extends State<_HealthCheckDialog> {
  bool _isChecking = false;
  Map<String, bool> _checkResults = {};
  final List<String> _checks = [
    'Connection Test',
    'Authentication',
    'API Endpoints',
    'Database',
    'File Storage',
    'Encryption',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.health_and_safety, color: Colors.green),
          const SizedBox(width: 8),
          Text('${widget.clientName} Health Check'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isChecking) ...[
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            const Text('Running health checks...'),
          ] else if (_checkResults.isNotEmpty) ...[
            ..._checks.map((check) => _buildCheckResult(check)),
            const SizedBox(height: 16),
            _buildOverallResult(),
          ] else ...[
            const Text('Click "Start Check" to begin health diagnostics.'),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        if (!_isChecking && _checkResults.isEmpty)
          ElevatedButton(
            onPressed: _startHealthCheck,
            child: const Text('Start Check'),
          ),
      ],
    );
  }

  Widget _buildCheckResult(String check) {
    final result = _checkResults[check];
    return ListTile(
      leading: Icon(
        result == true ? Icons.check_circle : Icons.error,
        color: result == true ? Colors.green : Colors.red,
      ),
      title: Text(check),
      trailing: result == true
          ? const Text('PASS', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
          : const Text('FAIL', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildOverallResult() {
    final passed = _checkResults.values.where((r) => r).length;
    final total = _checkResults.length;
    final isHealthy = passed == total;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isHealthy ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isHealthy ? Colors.green : Colors.red,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isHealthy ? Icons.check_circle : Icons.error,
            color: isHealthy ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            'Overall: $passed/$total checks passed',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isHealthy ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _startHealthCheck() async {
    setState(() => _isChecking = true);

    try {
      for (final check in _checks) {
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _checkResults[check] = check != 'Database'; // Simulate one failure
        });
      }

      final results = {
        'status': _checkResults.values.every((r) => r) ? 'healthy' : 'unhealthy',
        'checks': _checkResults,
        'timestamp': DateTime.now().toIso8601String(),
      };

      widget.onComplete(results);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Health check failed: $e')),
      );
    } finally {
      setState(() => _isChecking = false);
    }
  }
}

class _SettingsDialog extends StatefulWidget {
  final String clientName;
  final String clientType;
  final Function(Map<String, dynamic>) onSettingsSaved;

  const _SettingsDialog({
    required this.clientName,
    required this.clientType,
    required this.onSettingsSaved,
  });

  @override
  State<_SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<_SettingsDialog> {
  bool _enableNotifications = true;
  bool _enableEncryption = true;
  bool _enableFileSharing = true;
  bool _enableVoiceMessages = false;
  String _theme = 'auto';
  String _language = 'en';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.settings, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text('${widget.clientName} Settings'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: const Text('Enable Notifications'),
              subtitle: const Text('Receive push notifications'),
              value: _enableNotifications,
              onChanged: (value) => setState(() => _enableNotifications = value),
            ),
            SwitchListTile(
              title: const Text('End-to-End Encryption'),
              subtitle: const Text('Secure message encryption'),
              value: _enableEncryption,
              onChanged: (value) => setState(() => _enableEncryption = value),
            ),
            SwitchListTile(
              title: const Text('File Sharing'),
              subtitle: const Text('Allow file uploads and downloads'),
              value: _enableFileSharing,
              onChanged: (value) => setState(() => _enableFileSharing = value),
            ),
            SwitchListTile(
              title: const Text('Voice Messages'),
              subtitle: const Text('Send and receive voice messages'),
              value: _enableVoiceMessages,
              onChanged: (value) => setState(() => _enableVoiceMessages = value),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _theme,
              decoration: const InputDecoration(
                labelText: 'Theme',
                prefixIcon: Icon(Icons.palette),
              ),
              items: const [
                DropdownMenuItem(value: 'auto', child: Text('Auto')),
                DropdownMenuItem(value: 'light', child: Text('Light')),
                DropdownMenuItem(value: 'dark', child: Text('Dark')),
              ],
              onChanged: (value) => setState(() => _theme = value!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _language,
              decoration: const InputDecoration(
                labelText: 'Language',
                prefixIcon: Icon(Icons.language),
              ),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'es', child: Text('Español')),
                DropdownMenuItem(value: 'fr', child: Text('Français')),
                DropdownMenuItem(value: 'de', child: Text('Deutsch')),
              ],
              onChanged: (value) => setState(() => _language = value!),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveSettings,
          child: const Text('Save Settings'),
        ),
      ],
    );
  }

  void _saveSettings() {
    final settings = {
      'notifications': _enableNotifications,
      'encryption': _enableEncryption,
      'fileSharing': _enableFileSharing,
      'voiceMessages': _enableVoiceMessages,
      'theme': _theme,
      'language': _language,
      'clientType': widget.clientType,
      'updatedAt': DateTime.now().toIso8601String(),
    };

    widget.onSettingsSaved(settings);
  }
}

class _GlobalSessionDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onSessionCreated;

  const _GlobalSessionDialog({
    required this.onSessionCreated,
  });

  @override
  State<_GlobalSessionDialog> createState() => _GlobalSessionDialogState();
}

class _GlobalSessionDialogState extends State<_GlobalSessionDialog> {
  String _selectedClient = 'fluffychat';
  final _homeserverController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final Map<String, String> _clients = {
    'fluffychat': 'FluffyChat',
    'krille_chan': 'Krille-chan',
    'nheko': 'Nheko',
    'cinny': 'Cinny',
    'neochat': 'NeoChat',
    'element': 'Element.io',
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.add_circle, color: Colors.green),
          const SizedBox(width: 8),
          const Text('Create Global Session'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            value: _selectedClient,
            decoration: const InputDecoration(
              labelText: 'Select Client',
              prefixIcon: Icon(Icons.forum),
            ),
            items: _clients.entries.map((entry) => 
              DropdownMenuItem(
                value: entry.key,
                child: Text(entry.value),
              ),
            ).toList(),
            onChanged: (value) => setState(() => _selectedClient = value!),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _homeserverController,
            decoration: const InputDecoration(
              labelText: 'Homeserver URL',
              hintText: 'https://matrix.example.com',
              prefixIcon: Icon(Icons.home),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: '@user:example.com',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _createGlobalSession,
          child: const Text('Create Session'),
        ),
      ],
    );
  }

  void _createGlobalSession() {
    final sessionData = {
      'sessionId': 'global_${DateTime.now().millisecondsSinceEpoch}',
      'clientType': _selectedClient,
      'clientName': _clients[_selectedClient],
      'homeserver': _homeserverController.text,
      'username': _usernameController.text,
      'createdAt': DateTime.now().toIso8601String(),
    };

    widget.onSessionCreated(sessionData);
  }
}

class _ConfigurationDialog extends StatefulWidget {
  final String serviceName;
  final Function(Map<String, dynamic>) onConfigured;

  const _ConfigurationDialog({
    required this.serviceName,
    required this.onConfigured,
  });

  @override
  State<_ConfigurationDialog> createState() => _ConfigurationDialogState();
}

class _ConfigurationDialogState extends State<_ConfigurationDialog> {
  final _apiKeyController = TextEditingController();
  final _endpointController = TextEditingController();
  bool _enableService = true;
  bool _autoStart = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.build, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text('Configure ${widget.serviceName}'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            title: const Text('Enable Service'),
            subtitle: const Text('Activate this service'),
            value: _enableService,
            onChanged: (value) => setState(() => _enableService = value),
          ),
          SwitchListTile(
            title: const Text('Auto Start'),
            subtitle: const Text('Start service automatically'),
            value: _autoStart,
            onChanged: (value) => setState(() => _autoStart = value),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _endpointController,
            decoration: const InputDecoration(
              labelText: 'Service Endpoint',
              hintText: 'https://api.example.com',
              prefixIcon: Icon(Icons.link),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _apiKeyController,
            decoration: const InputDecoration(
              labelText: 'API Key',
              prefixIcon: Icon(Icons.key),
            ),
            obscureText: true,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveConfiguration,
          child: const Text('Save Configuration'),
        ),
      ],
    );
  }

  void _saveConfiguration() {
    final config = {
      'serviceName': widget.serviceName,
      'enabled': _enableService,
      'autoStart': _autoStart,
      'endpoint': _endpointController.text,
      'apiKey': _apiKeyController.text,
      'configuredAt': DateTime.now().toIso8601String(),
    };

    widget.onConfigured(config);
  }
} 