import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

/// Git and GitHub Integration Service
/// Provides comprehensive Git operations and GitHub API integration
class GitGitHubIntegration {
  static const String _githubApiBase = 'https://api.github.com';
  static const String _githubOAuthBase = 'https://github.com/login/oauth';
  
  String? _accessToken;
  String? _username;
  String? _repositoryPath;
  Map<String, dynamic>? _userProfile;
  List<Map<String, dynamic>> _repositories = [];
  List<Map<String, dynamic>> _pullRequests = [];
  List<Map<String, dynamic>> _issues = [];
  List<Map<String, dynamic>> _commits = [];
  List<Map<String, dynamic>> _activities = [];

  // Configuration
  final String clientId;
  final String clientSecret;
  final String? redirectUri;

  GitGitHubIntegration({
    required this.clientId,
    required this.clientSecret,
    this.redirectUri,
  });

  /// Initialize Git integration with local repository
  Future<bool> initializeGitRepository(String repoPath) async {
    try {
      _repositoryPath = repoPath;
      final dir = Directory(repoPath);
      
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      // Check if it's already a git repository
      final gitDir = Directory(path.join(repoPath, '.git'));
      if (!await gitDir.exists()) {
        await _runGitCommand(['init']);
        await _runGitCommand(['config', 'user.name', 'REChain Bot']);
        await _runGitCommand(['config', 'user.email', 'bot@rechain.online']);
      }

      return true;
    } catch (e) {
      print('Error initializing Git repository: $e');
      return false;
    }
  }

  /// Authenticate with GitHub using OAuth
  Future<bool> authenticateWithGitHub() async {
    try {
      final authUrl = Uri.parse('$_githubOAuthBase/authorize').replace(
        queryParameters: {
          'client_id': clientId,
          'scope': 'repo user read:org',
          if (redirectUri != null) 'redirect_uri': redirectUri!,
        },
      );

      print('Please visit: $authUrl');
      // In a real app, you'd open this URL and handle the callback
      
      return true;
    } catch (e) {
      print('Error during GitHub authentication: $e');
      return false;
    }
  }

  /// Exchange authorization code for access token
  Future<bool> exchangeCodeForToken(String code) async {
    try {
      final response = await http.post(
        Uri.parse('$_githubOAuthBase/access_token'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': code,
          if (redirectUri != null) 'redirect_uri': redirectUri!,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _accessToken = data['access_token'];
        await _fetchUserProfile();
        return true;
      }
      
      return false;
    } catch (e) {
      print('Error exchanging code for token: $e');
      return false;
    }
  }

  /// Fetch user profile from GitHub
  Future<void> _fetchUserProfile() async {
    if (_accessToken == null) return;

    try {
      final response = await http.get(
        Uri.parse('$_githubApiBase/user'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
        },
      );

      if (response.statusCode == 200) {
        _userProfile = jsonDecode(response.body);
        _username = _userProfile!['login'];
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  /// Get repository status and information
  Future<Map<String, dynamic>> getRepositoryStatus() async {
    if (_repositoryPath == null) {
      return {'error': 'Repository not initialized'};
    }

    try {
      final status = await _runGitCommand(['status', '--porcelain']);
      final branch = await _runGitCommand(['branch', '--show-current']);
      final lastCommit = await _runGitCommand(['log', '-1', '--pretty=format:%H|%an|%ae|%s|%ci']);
      final remoteUrl = await _runGitCommand(['remote', 'get-url', 'origin']);

      final changes = status.split('\n')
          .where((line) => line.isNotEmpty)
          .map((line) => {
                'status': line.substring(0, 2),
                'file': line.substring(3),
              })
          .toList();

      final commitParts = lastCommit.split('|');
      final lastCommitInfo = commitParts.length >= 5 ? {
        'hash': commitParts[0],
        'author': commitParts[1],
        'email': commitParts[2],
        'message': commitParts[3],
        'date': commitParts[4],
      } : null;

      return {
        'repositoryPath': _repositoryPath,
        'currentBranch': branch.trim(),
        'hasChanges': changes.isNotEmpty,
        'changes': changes,
        'lastCommit': lastCommitInfo,
        'remoteUrl': remoteUrl.trim(),
        'isConnected': remoteUrl.trim().isNotEmpty,
      };
    } catch (e) {
      return {'error': 'Error getting repository status: $e'};
    }
  }

  /// Stage files for commit
  Future<bool> stageFiles(List<String> files) async {
    try {
      if (files.isEmpty) {
        await _runGitCommand(['add', '.']);
      } else {
        await _runGitCommand(['add', ...files]);
      }
      return true;
    } catch (e) {
      print('Error staging files: $e');
      return false;
    }
  }

  /// Commit changes
  Future<bool> commitChanges(String message, {String? author}) async {
    try {
      final commitArgs = ['commit', '-m', message];
      if (author != null) {
        commitArgs.addAll(['--author', author]);
      }
      await _runGitCommand(commitArgs);
      return true;
    } catch (e) {
      print('Error committing changes: $e');
      return false;
    }
  }

  /// Push changes to remote repository
  Future<bool> pushChanges({String? branch, String? remote}) async {
    try {
      final pushArgs = ['push'];
      if (remote != null) pushArgs.add(remote);
      if (branch != null) pushArgs.add(branch);
      
      await _runGitCommand(pushArgs);
      return true;
    } catch (e) {
      print('Error pushing changes: $e');
      return false;
    }
  }

  /// Pull changes from remote repository
  Future<bool> pullChanges({String? branch, String? remote}) async {
    try {
      final pullArgs = ['pull'];
      if (remote != null) pullArgs.add(remote);
      if (branch != null) pullArgs.add(branch);
      
      await _runGitCommand(pullArgs);
      return true;
    } catch (e) {
      print('Error pulling changes: $e');
      return false;
    }
  }

  /// Create a new branch
  Future<bool> createBranch(String branchName, {bool checkout = true}) async {
    try {
      final args = ['branch', branchName];
      if (checkout) args.insert(1, '-b');
      await _runGitCommand(args);
      return true;
    } catch (e) {
      print('Error creating branch: $e');
      return false;
    }
  }

  /// Switch to a branch
  Future<bool> checkoutBranch(String branchName) async {
    try {
      await _runGitCommand(['checkout', branchName]);
      return true;
    } catch (e) {
      print('Error checking out branch: $e');
      return false;
    }
  }

  /// Get commit history
  Future<List<Map<String, dynamic>>> getCommitHistory({int limit = 50}) async {
    try {
      final log = await _runGitCommand([
        'log',
        '--pretty=format:%H|%an|%ae|%s|%ci|%b',
        '--max-count=$limit',
      ]);

      return log.split('\n')
          .where((line) => line.isNotEmpty)
          .map((line) {
            final parts = line.split('|');
            return {
              'hash': parts[0],
              'author': parts[1],
              'email': parts[2],
              'message': parts[3],
              'date': parts[4],
              'body': parts.length > 5 ? parts[5] : '',
            };
          })
          .toList();
    } catch (e) {
      print('Error getting commit history: $e');
      return [];
    }
  }

  /// Fetch repositories from GitHub
  Future<List<Map<String, dynamic>>> fetchRepositories() async {
    if (_accessToken == null) return [];

    try {
      final response = await http.get(
        Uri.parse('$_githubApiBase/user/repos?sort=updated&per_page=100'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
        },
      );

      if (response.statusCode == 200) {
        _repositories = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        return _repositories;
      }
      
      return [];
    } catch (e) {
      print('Error fetching repositories: $e');
      return [];
    }
  }

  /// Create a new repository on GitHub
  Future<Map<String, dynamic>?> createRepository({
    required String name,
    String? description,
    bool isPrivate = false,
    bool autoInit = true,
  }) async {
    if (_accessToken == null) return null;

    try {
      final response = await http.post(
        Uri.parse('$_githubApiBase/user/repos'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          if (description != null) 'description': description,
          'private': isPrivate,
          'auto_init': autoInit,
        }),
      );

      if (response.statusCode == 201) {
        final repo = jsonDecode(response.body);
        _repositories.add(repo);
        return repo;
      }
      
      return null;
    } catch (e) {
      print('Error creating repository: $e');
      return null;
    }
  }

  /// Fetch pull requests for a repository
  Future<List<Map<String, dynamic>>> fetchPullRequests(String repoFullName) async {
    if (_accessToken == null) return [];

    try {
      final response = await http.get(
        Uri.parse('$_githubApiBase/repos/$repoFullName/pulls?state=all&per_page=100'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
        },
      );

      if (response.statusCode == 200) {
        _pullRequests = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        return _pullRequests;
      }
      
      return [];
    } catch (e) {
      print('Error fetching pull requests: $e');
      return [];
    }
  }

  /// Create a pull request
  Future<Map<String, dynamic>?> createPullRequest({
    required String repoFullName,
    required String title,
    required String head,
    required String base,
    String? body,
  }) async {
    if (_accessToken == null) return null;

    try {
      final response = await http.post(
        Uri.parse('$_githubApiBase/repos/$repoFullName/pulls'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'title': title,
          'head': head,
          'base': base,
          if (body != null) 'body': body,
        }),
      );

      if (response.statusCode == 201) {
        final pr = jsonDecode(response.body);
        _pullRequests.add(pr);
        return pr;
      }
      
      return null;
    } catch (e) {
      print('Error creating pull request: $e');
      return null;
    }
  }

  /// Fetch issues for a repository
  Future<List<Map<String, dynamic>>> fetchIssues(String repoFullName) async {
    if (_accessToken == null) return [];

    try {
      final response = await http.get(
        Uri.parse('$_githubApiBase/repos/$repoFullName/issues?state=all&per_page=100'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
        },
      );

      if (response.statusCode == 200) {
        _issues = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        return _issues;
      }
      
      return [];
    } catch (e) {
      print('Error fetching issues: $e');
      return [];
    }
  }

  /// Create an issue
  Future<Map<String, dynamic>?> createIssue({
    required String repoFullName,
    required String title,
    String? body,
    List<String>? labels,
    List<String>? assignees,
  }) async {
    if (_accessToken == null) return null;

    try {
      final response = await http.post(
        Uri.parse('$_githubApiBase/repos/$repoFullName/issues'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'title': title,
          if (body != null) 'body': body,
          if (labels != null) 'labels': labels,
          if (assignees != null) 'assignees': assignees,
        }),
      );

      if (response.statusCode == 201) {
        final issue = jsonDecode(response.body);
        _issues.add(issue);
        return issue;
      }
      
      return null;
    } catch (e) {
      print('Error creating issue: $e');
      return null;
    }
  }

  /// Get user activity feed
  Future<List<Map<String, dynamic>>> getActivityFeed() async {
    if (_accessToken == null || _username == null) return [];

    try {
      final response = await http.get(
        Uri.parse('$_githubApiBase/users/$_username/events?per_page=50'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
        },
      );

      if (response.statusCode == 200) {
        _activities = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        return _activities;
      }
      
      return [];
    } catch (e) {
      print('Error fetching activity feed: $e');
      return [];
    }
  }

  /// Get repository statistics
  Future<Map<String, dynamic>> getRepositoryStats(String repoFullName) async {
    if (_accessToken == null) return {};

    try {
      final response = await http.get(
        Uri.parse('$_githubApiBase/repos/$repoFullName'),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
        },
      );

      if (response.statusCode == 200) {
        final repo = jsonDecode(response.body);
        return {
          'name': repo['name'],
          'fullName': repo['full_name'],
          'description': repo['description'],
          'language': repo['language'],
          'stars': repo['stargazers_count'],
          'forks': repo['forks_count'],
          'watchers': repo['watchers_count'],
          'openIssues': repo['open_issues_count'],
          'size': repo['size'],
          'createdAt': repo['created_at'],
          'updatedAt': repo['updated_at'],
          'isPrivate': repo['private'],
          'isFork': repo['fork'],
        };
      }
      
      return {};
    } catch (e) {
      print('Error fetching repository stats: $e');
      return {};
    }
  }

  /// Search repositories
  Future<List<Map<String, dynamic>>> searchRepositories({
    required String query,
    String? language,
    String? sort = 'stars',
    String? order = 'desc',
  }) async {
    if (_accessToken == null) return [];

    try {
      var searchQuery = query;
      if (language != null) {
        searchQuery += ' language:$language';
      }

      final response = await http.get(
        Uri.parse('$_githubApiBase/search/repositories').replace(
          queryParameters: {
            'q': searchQuery,
            'sort': sort,
            'order': order,
            'per_page': '30',
          },
        ),
        headers: {
          'Authorization': 'token $_accessToken',
          'Accept': 'application/vnd.github.v3+json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['items']);
      }
      
      return [];
    } catch (e) {
      print('Error searching repositories: $e');
      return [];
    }
  }

  /// Clone a repository
  Future<bool> cloneRepository(String repoUrl, {String? targetPath}) async {
    try {
      final args = ['clone', repoUrl];
      if (targetPath != null) args.add(targetPath);
      
      await _runGitCommand(args);
      return true;
    } catch (e) {
      print('Error cloning repository: $e');
      return false;
    }
  }

  /// Add remote repository
  Future<bool> addRemote(String name, String url) async {
    try {
      await _runGitCommand(['remote', 'add', name, url]);
      return true;
    } catch (e) {
      print('Error adding remote: $e');
      return false;
    }
  }

  /// Get current user information
  Map<String, dynamic>? getCurrentUser() => _userProfile;

  /// Get authentication status
  bool get isAuthenticated => _accessToken != null;

  /// Get current repository path
  String? get currentRepositoryPath => _repositoryPath;

  /// Run Git command
  Future<String> _runGitCommand(List<String> args) async {
    if (_repositoryPath == null) {
      throw Exception('Repository not initialized');
    }

    final result = await Process.run('git', args, workingDirectory: _repositoryPath);
    
    if (result.exitCode != 0) {
      throw Exception('Git command failed: ${result.stderr}');
    }
    
    return result.stdout.toString().trim();
  }

  /// Dispose resources
  void dispose() {
    _accessToken = null;
    _username = null;
    _repositoryPath = null;
    _userProfile = null;
    _repositories.clear();
    _pullRequests.clear();
    _issues.clear();
    _commits.clear();
    _activities.clear();
  }
} 