import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../features/integration/git_github_integration.dart';

/// Git and GitHub Dashboard
/// Provides comprehensive Git operations and GitHub integration interface
class GitGitHubDashboard extends StatefulWidget {
  final GitGitHubIntegration gitService;

  const GitGitHubDashboard({
    Key? key,
    required this.gitService,
  }) : super(key: key);

  @override
  State<GitGitHubDashboard> createState() => _GitGitHubDashboardState();
}

class _GitGitHubDashboardState extends State<GitGitHubDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;
  bool _isRefreshing = false;
  String? _error;
  bool _isDarkMode = false;
  bool _showLogs = false;
  final List<String> _logs = [];

  // Data
  Map<String, dynamic>? _repoStatus;
  List<Map<String, dynamic>> _repositories = [];
  List<Map<String, dynamic>> _pullRequests = [];
  List<Map<String, dynamic>> _issues = [];
  List<Map<String, dynamic>> _commits = [];
  List<Map<String, dynamic>> _activities = [];
  Map<String, dynamic>? _currentUser;

  static const _tabLabels = [
    'Repository',
    'GitHub',
    'Pull Requests',
    'Issues',
    'Commits',
    'Activity',
  ];
  
  static const _tabIcons = [
    Icons.folder,
    Icons.cloud,
    Icons.merge,
    Icons.bug_report,
    Icons.history,
    Icons.timeline,
  ];

  static const _tabColors = [
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.orange,
    Colors.indigo,
    Colors.teal,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabLabels.length, vsync: this);
    _loadData();
    _addLog('Git/GitHub Dashboard initialized');
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

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _isRefreshing = true;
      _error = null;
    });

    _addLog('Loading Git/GitHub data...');

    try {
      // Load repository status
      _repoStatus = await widget.gitService.getRepositoryStatus();
      
      // Load GitHub data if authenticated
      if (widget.gitService.isAuthenticated) {
        _currentUser = widget.gitService.getCurrentUser();
        _repositories = await widget.gitService.fetchRepositories();
        _activities = await widget.gitService.getActivityFeed();
        
        // Load repository-specific data if available
        if (_repoStatus != null && _repoStatus!['remoteUrl'] != null) {
          final remoteUrl = _repoStatus!['remoteUrl'] as String;
          if (remoteUrl.contains('github.com')) {
            final repoName = _extractRepoName(remoteUrl);
            if (repoName != null) {
              _pullRequests = await widget.gitService.fetchPullRequests(repoName);
              _issues = await widget.gitService.fetchIssues(repoName);
            }
          }
        }
        
        // Load commit history
        _commits = await widget.gitService.getCommitHistory();
      }

      setState(() {
        _isLoading = false;
        _isRefreshing = false;
      });
      _addLog('Data loaded successfully');
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
        _isRefreshing = false;
      });
      _addLog('Error loading data: $e');
    }
  }

  String? _extractRepoName(String remoteUrl) {
    try {
      final uri = Uri.parse(remoteUrl);
      final path = uri.path;
      if (path.startsWith('/')) {
        return path.substring(1);
      }
      return path;
    } catch (e) {
      return null;
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
          Icon(Icons.code, color: Colors.white),
          const SizedBox(width: 8),
          const Text('Git & GitHub'),
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
          onPressed: _isRefreshing ? null : _loadData,
          tooltip: 'Refresh Data',
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
              _buildRepositoryTab(),
              _buildGitHubTab(),
              _buildPullRequestsTab(),
              _buildIssuesTab(),
              _buildCommitsTab(),
              _buildActivityTab(),
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
            'Loading Git/GitHub Data...',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Connecting to repositories and GitHub API',
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
            onPressed: _loadData,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  // Placeholder methods for tabs
  Widget _buildRepositoryTab() => const Center(child: Text('Repository Tab'));
  Widget _buildGitHubTab() => const Center(child: Text('GitHub Tab'));
  Widget _buildPullRequestsTab() => const Center(child: Text('Pull Requests Tab'));
  Widget _buildIssuesTab() => const Center(child: Text('Issues Tab'));
  Widget _buildCommitsTab() => const Center(child: Text('Commits Tab'));
  Widget _buildActivityTab() => const Center(child: Text('Activity Tab'));

  Widget _buildFloatingActionButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: 'sync_all',
          onPressed: _loadData,
          backgroundColor: Colors.blue,
          child: const Icon(Icons.sync, color: Colors.white),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          heroTag: 'new_commit',
          onPressed: () => _addLog('Commit button pressed'),
          backgroundColor: Colors.green,
          child: const Icon(Icons.commit, color: Colors.white),
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
}
