import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// GitHub Service for repository and development integration
class GitHubService {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;

  GitHubService({
    required String apiKey,
    http.Client? client,
  })  : _baseUrl = 'https://api.github.com',
        _apiKey = apiKey,
        _client = client ?? http.Client();

  /// Get user repositories
  Future<List<GitHubRepository>> getUserRepositories({
    String? username,
    String? type,
    String? sort,
    String? direction,
  }) async {
    try {
      final user = username ?? 'me';
      final queryParams = <String, String>{};
      
      if (type != null) {
        queryParams['type'] = type;
      }
      if (sort != null) {
        queryParams['sort'] = sort;
      }
      if (direction != null) {
        queryParams['direction'] = direction;
      }

      final uri = Uri.parse('$_baseUrl/user/repos').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((repo) => GitHubRepository.fromJson(repo)).toList();
      } else {
        throw Exception('Failed to get repositories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching repositories: $e');
    }
  }

  /// Get repository details
  Future<GitHubRepository> getRepository({
    required String owner,
    required String repo,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo');
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GitHubRepository.fromJson(data);
      } else {
        throw Exception('Failed to get repository: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching repository: $e');
    }
  }

  /// Get repository commits
  Future<List<GitHubCommit>> getRepositoryCommits({
    required String owner,
    required String repo,
    String? sha,
    String? path,
    String? author,
    DateTime? since,
    DateTime? until,
  }) async {
    try {
      final queryParams = <String, String>{};
      
      if (sha != null) {
        queryParams['sha'] = sha;
      }
      if (path != null) {
        queryParams['path'] = path;
      }
      if (author != null) {
        queryParams['author'] = author;
      }
      if (since != null) {
        queryParams['since'] = since.toIso8601String();
      }
      if (until != null) {
        queryParams['until'] = until.toIso8601String();
      }

      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/commits').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((commit) => GitHubCommit.fromJson(commit)).toList();
      } else {
        throw Exception('Failed to get commits: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching commits: $e');
    }
  }

  /// Get pull requests
  Future<List<GitHubPullRequest>> getPullRequests({
    required String owner,
    required String repo,
    String? state,
    String? head,
    String? base,
    String? sort,
    String? direction,
  }) async {
    try {
      final queryParams = <String, String>{};
      
      if (state != null) {
        queryParams['state'] = state;
      }
      if (head != null) {
        queryParams['head'] = head;
      }
      if (base != null) {
        queryParams['base'] = base;
      }
      if (sort != null) {
        queryParams['sort'] = sort;
      }
      if (direction != null) {
        queryParams['direction'] = direction;
      }

      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/pulls').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((pr) => GitHubPullRequest.fromJson(pr)).toList();
      } else {
        throw Exception('Failed to get pull requests: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching pull requests: $e');
    }
  }

  /// Get issues
  Future<List<GitHubIssue>> getIssues({
    required String owner,
    required String repo,
    String? state,
    String? assignee,
    String? creator,
    String? mentioned,
    String? labels,
    String? sort,
    String? direction,
  }) async {
    try {
      final queryParams = <String, String>{};
      
      if (state != null) {
        queryParams['state'] = state;
      }
      if (assignee != null) {
        queryParams['assignee'] = assignee;
      }
      if (creator != null) {
        queryParams['creator'] = creator;
      }
      if (mentioned != null) {
        queryParams['mentioned'] = mentioned;
      }
      if (labels != null) {
        queryParams['labels'] = labels;
      }
      if (sort != null) {
        queryParams['sort'] = sort;
      }
      if (direction != null) {
        queryParams['direction'] = direction;
      }

      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/issues').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((issue) => GitHubIssue.fromJson(issue)).toList();
      } else {
        throw Exception('Failed to get issues: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching issues: $e');
    }
  }

  /// Get repository branches
  Future<List<GitHubBranch>> getRepositoryBranches({
    required String owner,
    required String repo,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/branches');
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((branch) => GitHubBranch.fromJson(branch)).toList();
      } else {
        throw Exception('Failed to get branches: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching branches: $e');
    }
  }

  /// Get repository releases
  Future<List<GitHubRelease>> getRepositoryReleases({
    required String owner,
    required String repo,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/releases');
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((release) => GitHubRelease.fromJson(release)).toList();
      } else {
        throw Exception('Failed to get releases: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching releases: $e');
    }
  }

  /// Get repository contributors
  Future<List<GitHubContributor>> getRepositoryContributors({
    required String owner,
    required String repo,
    String? anon,
  }) async {
    try {
      final queryParams = <String, String>{};
      
      if (anon != null) {
        queryParams['anon'] = anon;
      }

      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/contributors').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((contributor) => GitHubContributor.fromJson(contributor)).toList();
      } else {
        throw Exception('Failed to get contributors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching contributors: $e');
    }
  }

  /// Get repository languages
  Future<Map<String, int>> getRepositoryLanguages({
    required String owner,
    required String repo,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/languages');
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Map<String, int>.from(data);
      } else {
        throw Exception('Failed to get languages: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching languages: $e');
    }
  }

  /// Get repository statistics
  Future<GitHubRepositoryStats> getRepositoryStats({
    required String owner,
    required String repo,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/stats/participation');
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GitHubRepositoryStats.fromJson(data);
      } else {
        throw Exception('Failed to get repository stats: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching repository stats: $e');
    }
  }

  /// Create issue
  Future<GitHubIssue> createIssue({
    required String owner,
    required String repo,
    required String title,
    String? body,
    List<String>? assignees,
    List<String>? labels,
  }) async {
    try {
      final issue = {
        'title': title,
        'body': body,
        'assignees': assignees,
        'labels': labels,
      };

      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/issues');
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
        'Content-Type': 'application/json',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(issue),
      );
      
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return GitHubIssue.fromJson(data);
      } else {
        throw Exception('Failed to create issue: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating issue: $e');
    }
  }

  /// Create pull request
  Future<GitHubPullRequest> createPullRequest({
    required String owner,
    required String repo,
    required String title,
    required String head,
    required String base,
    String? body,
    bool? draft,
  }) async {
    try {
      final pr = {
        'title': title,
        'head': head,
        'base': base,
        'body': body,
        'draft': draft,
      };

      final uri = Uri.parse('$_baseUrl/repos/$owner/$repo/pulls');
      
      final headers = <String, String>{
        'Accept': 'application/vnd.github.v3+json',
        'Authorization': 'token $_apiKey',
        'Content-Type': 'application/json',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(pr),
      );
      
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return GitHubPullRequest.fromJson(data);
      } else {
        throw Exception('Failed to create pull request: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating pull request: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}

/// GitHub Repository
class GitHubRepository {
  final int id;
  final String name;
  final String fullName;
  final String description;
  final bool isPrivate;
  final bool isFork;
  final String language;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;
  final int openIssuesCount;
  final String defaultBranch;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? pushedAt;
  final GitHubUser owner;

  GitHubRepository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.isPrivate,
    required this.isFork,
    required this.language,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
    required this.openIssuesCount,
    required this.defaultBranch,
    required this.createdAt,
    required this.updatedAt,
    this.pushedAt,
    required this.owner,
  });

  factory GitHubRepository.fromJson(Map<String, dynamic> json) {
    return GitHubRepository(
      id: json['id'] ?? 0,
      name: json['name']?.toString() ?? '',
      fullName: json['full_name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      isPrivate: json['private'] ?? false,
      isFork: json['fork'] ?? false,
      language: json['language']?.toString() ?? '',
      stargazersCount: json['stargazers_count'] ?? 0,
      watchersCount: json['watchers_count'] ?? 0,
      forksCount: json['forks_count'] ?? 0,
      openIssuesCount: json['open_issues_count'] ?? 0,
      defaultBranch: json['default_branch']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      pushedAt: json['pushed_at'] != null 
          ? DateTime.tryParse(json['pushed_at']) 
          : null,
      owner: GitHubUser.fromJson(json['owner'] ?? {}),
    );
  }
}

/// GitHub User
class GitHubUser {
  final String login;
  final int id;
  final String avatarUrl;
  final String type;
  final bool siteAdmin;

  GitHubUser({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return GitHubUser(
      login: json['login']?.toString() ?? '',
      id: json['id'] ?? 0,
      avatarUrl: json['avatar_url']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      siteAdmin: json['site_admin'] ?? false,
    );
  }
}

/// GitHub Commit
class GitHubCommit {
  final String sha;
  final String message;
  final GitHubCommitAuthor author;
  final GitHubCommitAuthor committer;
  final DateTime date;

  GitHubCommit({
    required this.sha,
    required this.message,
    required this.author,
    required this.committer,
    required this.date,
  });

  factory GitHubCommit.fromJson(Map<String, dynamic> json) {
    return GitHubCommit(
      sha: json['sha']?.toString() ?? '',
      message: json['commit']?['message']?.toString() ?? '',
      author: GitHubCommitAuthor.fromJson(json['commit']?['author'] ?? {}),
      committer: GitHubCommitAuthor.fromJson(json['commit']?['committer'] ?? {}),
      date: DateTime.tryParse(json['commit']?['author']?['date'] ?? '') ?? DateTime.now(),
    );
  }
}

/// GitHub Commit Author
class GitHubCommitAuthor {
  final String name;
  final String email;
  final DateTime date;

  GitHubCommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  factory GitHubCommitAuthor.fromJson(Map<String, dynamic> json) {
    return GitHubCommitAuthor(
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
    );
  }
}

/// GitHub Pull Request
class GitHubPullRequest {
  final int id;
  final int number;
  final String title;
  final String body;
  final String state;
  final bool isDraft;
  final GitHubUser user;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? closedAt;
  final DateTime? mergedAt;

  GitHubPullRequest({
    required this.id,
    required this.number,
    required this.title,
    required this.body,
    required this.state,
    required this.isDraft,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    this.closedAt,
    this.mergedAt,
  });

  factory GitHubPullRequest.fromJson(Map<String, dynamic> json) {
    return GitHubPullRequest(
      id: json['id'] ?? 0,
      number: json['number'] ?? 0,
      title: json['title']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      isDraft: json['draft'] ?? false,
      user: GitHubUser.fromJson(json['user'] ?? {}),
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      closedAt: json['closed_at'] != null 
          ? DateTime.tryParse(json['closed_at']) 
          : null,
      mergedAt: json['merged_at'] != null 
          ? DateTime.tryParse(json['merged_at']) 
          : null,
    );
  }
}

/// GitHub Issue
class GitHubIssue {
  final int id;
  final int number;
  final String title;
  final String body;
  final String state;
  final GitHubUser user;
  final List<String> labels;
  final List<String> assignees;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? closedAt;

  GitHubIssue({
    required this.id,
    required this.number,
    required this.title,
    required this.body,
    required this.state,
    required this.user,
    required this.labels,
    required this.assignees,
    required this.createdAt,
    required this.updatedAt,
    this.closedAt,
  });

  factory GitHubIssue.fromJson(Map<String, dynamic> json) {
    return GitHubIssue(
      id: json['id'] ?? 0,
      number: json['number'] ?? 0,
      title: json['title']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
      state: json['state']?.toString() ?? '',
      user: GitHubUser.fromJson(json['user'] ?? {}),
      labels: (json['labels'] as List<dynamic>? ?? [])
          .map((label) => label['name']?.toString() ?? '')
          .toList(),
      assignees: (json['assignees'] as List<dynamic>? ?? [])
          .map((assignee) => assignee['login']?.toString() ?? '')
          .toList(),
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      closedAt: json['closed_at'] != null 
          ? DateTime.tryParse(json['closed_at']) 
          : null,
    );
  }
}

/// GitHub Branch
class GitHubBranch {
  final String name;
  final GitHubCommit commit;
  final bool isProtected;

  GitHubBranch({
    required this.name,
    required this.commit,
    required this.isProtected,
  });

  factory GitHubBranch.fromJson(Map<String, dynamic> json) {
    return GitHubBranch(
      name: json['name']?.toString() ?? '',
      commit: GitHubCommit.fromJson(json['commit'] ?? {}),
      isProtected: json['protected'] ?? false,
    );
  }
}

/// GitHub Release
class GitHubRelease {
  final int id;
  final String tagName;
  final String name;
  final String body;
  final bool isDraft;
  final bool isPrerelease;
  final DateTime createdAt;
  final DateTime publishedAt;
  final GitHubUser author;

  GitHubRelease({
    required this.id,
    required this.tagName,
    required this.name,
    required this.body,
    required this.isDraft,
    required this.isPrerelease,
    required this.createdAt,
    required this.publishedAt,
    required this.author,
  });

  factory GitHubRelease.fromJson(Map<String, dynamic> json) {
    return GitHubRelease(
      id: json['id'] ?? 0,
      tagName: json['tag_name']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      body: json['body']?.toString() ?? '',
      isDraft: json['draft'] ?? false,
      isPrerelease: json['prerelease'] ?? false,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      publishedAt: DateTime.tryParse(json['published_at'] ?? '') ?? DateTime.now(),
      author: GitHubUser.fromJson(json['author'] ?? {}),
    );
  }
}

/// GitHub Contributor
class GitHubContributor {
  final GitHubUser user;
  final int contributions;

  GitHubContributor({
    required this.user,
    required this.contributions,
  });

  factory GitHubContributor.fromJson(Map<String, dynamic> json) {
    return GitHubContributor(
      user: GitHubUser.fromJson(json),
      contributions: json['contributions'] ?? 0,
    );
  }
}

/// GitHub Repository Stats
class GitHubRepositoryStats {
  final List<int> all;
  final List<int> owner;

  GitHubRepositoryStats({
    required this.all,
    required this.owner,
  });

  factory GitHubRepositoryStats.fromJson(Map<String, dynamic> json) {
    return GitHubRepositoryStats(
      all: List<int>.from(json['all'] ?? []),
      owner: List<int>.from(json['owner'] ?? []),
    );
  }
} 