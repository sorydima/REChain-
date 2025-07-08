import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/integration/integration_manager.dart';

/// Specialized Matrix Dashboard
/// Provides UI for Gaming, Education, and Enterprise Matrix integrations
class SpecializedMatrixDashboard extends StatefulWidget {
  final IntegrationManager integrationManager;

  const SpecializedMatrixDashboard({
    Key? key,
    required this.integrationManager,
  }) : super(key: key);

  @override
  State<SpecializedMatrixDashboard> createState() => _SpecializedMatrixDashboardState();
}

class _SpecializedMatrixDashboardState extends State<SpecializedMatrixDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isDarkMode = false;
  final List<Map<String, dynamic>> _logs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadServiceStatus();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadServiceStatus() async {
    setState(() {
      _logs.add({
        'timestamp': DateTime.now(),
        'level': 'info',
        'message': 'Loading specialized Matrix service status...',
      });
    });
  }

  void _addLog(String message, String level) {
    setState(() {
      _logs.add({
        'timestamp': DateTime.now(),
        'level': level,
        'message': message,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.dashboard_customize,
              color: Colors.blue[600],
            ),
            const SizedBox(width: 8),
            const Text(
              'Specialized Matrix',
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
          tabs: const [
            Tab(
              icon: Icon(Icons.sports_esports),
              text: 'Gaming',
            ),
            Tab(
              icon: Icon(Icons.school),
              text: 'Education',
            ),
            Tab(
              icon: Icon(Icons.business),
              text: 'Enterprise',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildGamingTab(),
          _buildEducationTab(),
          _buildEnterpriseTab(),
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

  Widget _buildGamingTab() {
    final gamingService = widget.integrationManager.matrixGamingIntegration;
    final status = gamingService?.serviceStatus ?? {};

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceHeader(
            'Matrix Gaming Integration',
            'Gaming features for Matrix communication',
            Icons.sports_esports,
            status.isNotEmpty,
          ),
          const SizedBox(height: 16),
          
          // Service Status Cards
          _buildServiceStatusGrid(status),
          const SizedBox(height: 24),

          // Quick Actions
          _buildQuickActionsSection([
            {
              'title': 'Create Game Server',
              'icon': Icons.dns,
              'onTap': () => _showCreateGameServerDialog(),
            },
            {
              'title': 'Create Game Room',
              'icon': Icons.meeting_room,
              'onTap': () => _showCreateGameRoomDialog(),
            },
            {
              'title': 'Voice Channel',
              'icon': Icons.record_voice_over,
              'onTap': () => _showCreateVoiceChannelDialog(),
            },
            {
              'title': 'Leaderboard',
              'icon': Icons.leaderboard,
              'onTap': () => _showCreateLeaderboardDialog(),
            },
          ]),
          const SizedBox(height: 24),

          // Gaming Dashboard
          _buildDashboardCard(
            'Gaming Dashboard',
            Icons.dashboard,
            () => _showGamingDashboard(),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationTab() {
    final educationService = widget.integrationManager.matrixEducationIntegration;
    final status = educationService?.serviceStatus ?? {};

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceHeader(
            'Matrix Education Integration',
            'Education features for Matrix communication',
            Icons.school,
            status.isNotEmpty,
          ),
          const SizedBox(height: 16),
          
          // Service Status Cards
          _buildServiceStatusGrid(status),
          const SizedBox(height: 24),

          // Quick Actions
          _buildQuickActionsSection([
            {
              'title': 'Create Classroom',
              'icon': Icons.class_,
              'onTap': () => _showCreateClassroomDialog(),
            },
            {
              'title': 'Create Assignment',
              'icon': Icons.assignment,
              'onTap': () => _showCreateAssignmentDialog(),
            },
            {
              'title': 'Study Group',
              'icon': Icons.group,
              'onTap': () => _showCreateStudyGroupDialog(),
            },
            {
              'title': 'Parent Notification',
              'icon': Icons.notification_important,
              'onTap': () => _showParentNotificationDialog(),
            },
          ]),
          const SizedBox(height: 24),

          // Education Dashboard
          _buildDashboardCard(
            'Education Dashboard',
            Icons.dashboard,
            () => _showEducationDashboard(),
          ),
        ],
      ),
    );
  }

  Widget _buildEnterpriseTab() {
    final enterpriseService = widget.integrationManager.matrixEnterpriseIntegration;
    final status = enterpriseService?.serviceStatus ?? {};

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceHeader(
            'Matrix Enterprise Integration',
            'Enterprise features for Matrix communication',
            Icons.business,
            status.isNotEmpty,
          ),
          const SizedBox(height: 16),
          
          // Service Status Cards
          _buildServiceStatusGrid(status),
          const SizedBox(height: 24),

          // Quick Actions
          _buildQuickActionsSection([
            {
              'title': 'Business Channel',
              'icon': Icons.chat,
              'onTap': () => _showCreateBusinessChannelDialog(),
            },
            {
              'title': 'Create Project',
              'icon': Icons.project,
              'onTap': () => _showCreateProjectDialog(),
            },
            {
              'title': 'Security Policies',
              'icon': Icons.security,
              'onTap': () => _showSecurityPoliciesDialog(),
            },
            {
              'title': 'Compliance Report',
              'icon': Icons.assessment,
              'onTap': () => _showComplianceReportDialog(),
            },
          ]),
          const SizedBox(height: 24),

          // Enterprise Dashboard
          _buildDashboardCard(
            'Enterprise Dashboard',
            Icons.dashboard,
            () => _showEnterpriseDashboard(),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceHeader(String title, String subtitle, IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isActive 
            ? [Colors.blue[400]!, Colors.blue[600]!]
            : [Colors.grey[400]!, Colors.grey[600]!],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isActive ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              isActive ? 'Active' : 'Inactive',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceStatusGrid(Map<String, bool> status) {
    if (status.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('No service status available'),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      itemCount: status.length,
      itemBuilder: (context, index) {
        final service = status.entries.elementAt(index);
        return _buildStatusCard(service.key, service.value);
      },
    );
  }

  Widget _buildStatusCard(String serviceName, bool isActive) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    serviceName.replaceAll('_', ' ').toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    isActive ? 'Online' : 'Offline',
                    style: TextStyle(
                      fontSize: 10,
                      color: isActive ? Colors.green : Colors.red,
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

  Widget _buildQuickActionsSection(List<Map<String, dynamic>> actions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
          ),
          itemCount: actions.length,
          itemBuilder: (context, index) {
            final action = actions[index];
            return Card(
              elevation: 2,
              child: InkWell(
                onTap: action['onTap'] as VoidCallback,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        action['icon'] as IconData,
                        color: Colors.blue[600],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          action['title'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDashboardCard(String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blue[600],
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'View detailed analytics and management',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dialog Methods
  void _showQuickActionsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quick Actions'),
        content: const Text('Select a quick action to perform'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _showCreateGameServerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Game Server'),
        content: const Text('Game server creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Game server creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showCreateGameRoomDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Game Room'),
        content: const Text('Game room creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Game room creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showCreateVoiceChannelDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Voice Channel'),
        content: const Text('Voice channel creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Voice channel creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showCreateLeaderboardDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Leaderboard'),
        content: const Text('Leaderboard creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Leaderboard creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showCreateClassroomDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Virtual Classroom'),
        content: const Text('Virtual classroom creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Virtual classroom creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showCreateAssignmentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Assignment'),
        content: const Text('Assignment creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Assignment creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showCreateStudyGroupDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Study Group'),
        content: const Text('Study group creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Study group creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showParentNotificationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Send Parent Notification'),
        content: const Text('Parent notification dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Parent notification sent', 'info');
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  void _showCreateBusinessChannelDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Business Channel'),
        content: const Text('Business channel creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Business channel creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showCreateProjectDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Project'),
        content: const Text('Project creation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Project creation initiated', 'info');
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showSecurityPoliciesDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Configure Security Policies'),
        content: const Text('Security policies configuration dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Security policies configured', 'info');
            },
            child: const Text('Configure'),
          ),
        ],
      ),
    );
  }

  void _showComplianceReportDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Generate Compliance Report'),
        content: const Text('Compliance report generation dialog'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _addLog('Compliance report generation initiated', 'info');
            },
            child: const Text('Generate'),
          ),
        ],
      ),
    );
  }

  void _showGamingDashboard() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Gaming Dashboard'),
        content: const Text('Detailed gaming analytics and management'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showEducationDashboard() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Education Dashboard'),
        content: const Text('Detailed education analytics and management'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showEnterpriseDashboard() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enterprise Dashboard'),
        content: const Text('Detailed enterprise analytics and management'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
} 