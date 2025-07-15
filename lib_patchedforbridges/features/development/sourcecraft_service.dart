import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Sourcecraft Service for code quality and development analytics
class SourcecraftService {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;

  SourcecraftService({
    required String baseUrl,
    required String apiKey,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _client = client ?? http.Client();

  /// Analyze code quality
  Future<CodeQualityAnalysis> analyzeCodeQuality({
    required String code,
    required String language,
    Map<String, dynamic>? rules,
  }) async {
    try {
      final requestBody = {
        'code': code,
        'language': language,
        'rules': rules ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/quality/analyze');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(requestBody),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CodeQualityAnalysis.fromJson(data);
      } else {
        throw Exception('Failed to analyze code quality: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error analyzing code quality: $e');
    }
  }

  /// Get code metrics
  Future<CodeMetrics> getCodeMetrics({
    required String repository,
    String? branch,
    String? path,
  }) async {
    try {
      final queryParams = <String, String>{
        'repository': repository,
      };
      
      if (branch != null) {
        queryParams['branch'] = branch;
      }
      if (path != null) {
        queryParams['path'] = path;
      }

      final uri = Uri.parse('$_baseUrl/v1/metrics/code').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CodeMetrics.fromJson(data);
      } else {
        throw Exception('Failed to get code metrics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching code metrics: $e');
    }
  }

  /// Get development analytics
  Future<DevelopmentAnalytics> getDevelopmentAnalytics({
    required String repository,
    required Duration period,
    String? branch,
  }) async {
    try {
      final queryParams = <String, String>{
        'repository': repository,
        'period': period.inDays.toString(),
      };
      
      if (branch != null) {
        queryParams['branch'] = branch;
      }

      final uri = Uri.parse('$_baseUrl/v1/analytics/development').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return DevelopmentAnalytics.fromJson(data);
      } else {
        throw Exception('Failed to get development analytics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching development analytics: $e');
    }
  }

  /// Get code review insights
  Future<CodeReviewInsights> getCodeReviewInsights({
    required String repository,
    required Duration period,
  }) async {
    try {
      final queryParams = <String, String>{
        'repository': repository,
        'period': period.inDays.toString(),
      };

      final uri = Uri.parse('$_baseUrl/v1/insights/reviews').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CodeReviewInsights.fromJson(data);
      } else {
        throw Exception('Failed to get code review insights: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching code review insights: $e');
    }
  }

  /// Get technical debt analysis
  Future<TechnicalDebtAnalysis> getTechnicalDebtAnalysis({
    required String repository,
    String? branch,
  }) async {
    try {
      final queryParams = <String, String>{
        'repository': repository,
      };
      
      if (branch != null) {
        queryParams['branch'] = branch;
      }

      final uri = Uri.parse('$_baseUrl/v1/debt/technical').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TechnicalDebtAnalysis.fromJson(data);
      } else {
        throw Exception('Failed to get technical debt analysis: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching technical debt analysis: $e');
    }
  }

  /// Get security analysis
  Future<SecurityAnalysis> getSecurityAnalysis({
    required String repository,
    String? branch,
    List<String>? scanTypes,
  }) async {
    try {
      final queryParams = <String, String>{
        'repository': repository,
      };
      
      if (branch != null) {
        queryParams['branch'] = branch;
      }
      if (scanTypes != null) {
        queryParams['scan_types'] = scanTypes.join(',');
      }

      final uri = Uri.parse('$_baseUrl/v1/security/analyze').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return SecurityAnalysis.fromJson(data);
      } else {
        throw Exception('Failed to get security analysis: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching security analysis: $e');
    }
  }

  /// Get performance analysis
  Future<PerformanceAnalysis> getPerformanceAnalysis({
    required String repository,
    String? branch,
    String? environment,
  }) async {
    try {
      final queryParams = <String, String>{
        'repository': repository,
      };
      
      if (branch != null) {
        queryParams['branch'] = branch;
      }
      if (environment != null) {
        queryParams['environment'] = environment;
      }

      final uri = Uri.parse('$_baseUrl/v1/performance/analyze').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return PerformanceAnalysis.fromJson(data);
      } else {
        throw Exception('Failed to get performance analysis: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching performance analysis: $e');
    }
  }

  /// Get team productivity metrics
  Future<TeamProductivityMetrics> getTeamProductivityMetrics({
    required String repository,
    required Duration period,
  }) async {
    try {
      final queryParams = <String, String>{
        'repository': repository,
        'period': period.inDays.toString(),
      };

      final uri = Uri.parse('$_baseUrl/v1/productivity/team').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TeamProductivityMetrics.fromJson(data);
      } else {
        throw Exception('Failed to get team productivity metrics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching team productivity metrics: $e');
    }
  }

  /// Get code coverage analysis
  Future<CodeCoverageAnalysis> getCodeCoverageAnalysis({
    required String repository,
    String? branch,
    String? testFramework,
  }) async {
    try {
      final queryParams = <String, String>{
        'repository': repository,
      };
      
      if (branch != null) {
        queryParams['branch'] = branch;
      }
      if (testFramework != null) {
        queryParams['test_framework'] = testFramework;
      }

      final uri = Uri.parse('$_baseUrl/v1/coverage/analyze').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CodeCoverageAnalysis.fromJson(data);
      } else {
        throw Exception('Failed to get code coverage analysis: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching code coverage analysis: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}

/// Code Quality Analysis
class CodeQualityAnalysis {
  final double overallScore;
  final List<QualityIssue> issues;
  final List<QualityMetric> metrics;
  final Map<String, dynamic> recommendations;

  CodeQualityAnalysis({
    required this.overallScore,
    required this.issues,
    required this.metrics,
    required this.recommendations,
  });

  factory CodeQualityAnalysis.fromJson(Map<String, dynamic> json) {
    return CodeQualityAnalysis(
      overallScore: json['overall_score']?.toDouble() ?? 0.0,
      issues: (json['issues'] as List<dynamic>? ?? [])
          .map((issue) => QualityIssue.fromJson(issue))
          .toList(),
      metrics: (json['metrics'] as List<dynamic>? ?? [])
          .map((metric) => QualityMetric.fromJson(metric))
          .toList(),
      recommendations: json['recommendations'] ?? {},
    );
  }
}

/// Quality Issue
class QualityIssue {
  final String type;
  final String severity;
  final String message;
  final int line;
  final int column;
  final String rule;

  QualityIssue({
    required this.type,
    required this.severity,
    required this.message,
    required this.line,
    required this.column,
    required this.rule,
  });

  factory QualityIssue.fromJson(Map<String, dynamic> json) {
    return QualityIssue(
      type: json['type']?.toString() ?? '',
      severity: json['severity']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      line: json['line'] ?? 0,
      column: json['column'] ?? 0,
      rule: json['rule']?.toString() ?? '',
    );
  }
}

/// Quality Metric
class QualityMetric {
  final String name;
  final double value;
  final String unit;
  final double threshold;
  final bool isGood;

  QualityMetric({
    required this.name,
    required this.value,
    required this.unit,
    required this.threshold,
    required this.isGood,
  });

  factory QualityMetric.fromJson(Map<String, dynamic> json) {
    return QualityMetric(
      name: json['name']?.toString() ?? '',
      value: json['value']?.toDouble() ?? 0.0,
      unit: json['unit']?.toString() ?? '',
      threshold: json['threshold']?.toDouble() ?? 0.0,
      isGood: json['is_good'] ?? false,
    );
  }
}

/// Code Metrics
class CodeMetrics {
  final int linesOfCode;
  final int functions;
  final int classes;
  final double cyclomaticComplexity;
  final double maintainabilityIndex;
  final double technicalDebtRatio;

  CodeMetrics({
    required this.linesOfCode,
    required this.functions,
    required this.classes,
    required this.cyclomaticComplexity,
    required this.maintainabilityIndex,
    required this.technicalDebtRatio,
  });

  factory CodeMetrics.fromJson(Map<String, dynamic> json) {
    return CodeMetrics(
      linesOfCode: json['lines_of_code'] ?? 0,
      functions: json['functions'] ?? 0,
      classes: json['classes'] ?? 0,
      cyclomaticComplexity: json['cyclomatic_complexity']?.toDouble() ?? 0.0,
      maintainabilityIndex: json['maintainability_index']?.toDouble() ?? 0.0,
      technicalDebtRatio: json['technical_debt_ratio']?.toDouble() ?? 0.0,
    );
  }
}

/// Development Analytics
class DevelopmentAnalytics {
  final int commits;
  final int pullRequests;
  final int issues;
  final double velocity;
  final List<DeveloperActivity> developerActivity;
  final Map<String, dynamic> trends;

  DevelopmentAnalytics({
    required this.commits,
    required this.pullRequests,
    required this.issues,
    required this.velocity,
    required this.developerActivity,
    required this.trends,
  });

  factory DevelopmentAnalytics.fromJson(Map<String, dynamic> json) {
    return DevelopmentAnalytics(
      commits: json['commits'] ?? 0,
      pullRequests: json['pull_requests'] ?? 0,
      issues: json['issues'] ?? 0,
      velocity: json['velocity']?.toDouble() ?? 0.0,
      developerActivity: (json['developer_activity'] as List<dynamic>? ?? [])
          .map((activity) => DeveloperActivity.fromJson(activity))
          .toList(),
      trends: json['trends'] ?? {},
    );
  }
}

/// Developer Activity
class DeveloperActivity {
  final String developer;
  final int commits;
  final int linesAdded;
  final int linesRemoved;
  final double impact;

  DeveloperActivity({
    required this.developer,
    required this.commits,
    required this.linesAdded,
    required this.linesRemoved,
    required this.impact,
  });

  factory DeveloperActivity.fromJson(Map<String, dynamic> json) {
    return DeveloperActivity(
      developer: json['developer']?.toString() ?? '',
      commits: json['commits'] ?? 0,
      linesAdded: json['lines_added'] ?? 0,
      linesRemoved: json['lines_removed'] ?? 0,
      impact: json['impact']?.toDouble() ?? 0.0,
    );
  }
}

/// Code Review Insights
class CodeReviewInsights {
  final double averageReviewTime;
  final double reviewCoverage;
  final List<ReviewPattern> patterns;
  final Map<String, dynamic> recommendations;

  CodeReviewInsights({
    required this.averageReviewTime,
    required this.reviewCoverage,
    required this.patterns,
    required this.recommendations,
  });

  factory CodeReviewInsights.fromJson(Map<String, dynamic> json) {
    return CodeReviewInsights(
      averageReviewTime: json['average_review_time']?.toDouble() ?? 0.0,
      reviewCoverage: json['review_coverage']?.toDouble() ?? 0.0,
      patterns: (json['patterns'] as List<dynamic>? ?? [])
          .map((pattern) => ReviewPattern.fromJson(pattern))
          .toList(),
      recommendations: json['recommendations'] ?? {},
    );
  }
}

/// Review Pattern
class ReviewPattern {
  final String type;
  final String description;
  final double frequency;
  final double impact;

  ReviewPattern({
    required this.type,
    required this.description,
    required this.frequency,
    required this.impact,
  });

  factory ReviewPattern.fromJson(Map<String, dynamic> json) {
    return ReviewPattern(
      type: json['type']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      frequency: json['frequency']?.toDouble() ?? 0.0,
      impact: json['impact']?.toDouble() ?? 0.0,
    );
  }
}

/// Technical Debt Analysis
class TechnicalDebtAnalysis {
  final double totalDebt;
  final List<DebtItem> debtItems;
  final Map<String, double> debtByCategory;
  final double debtRatio;

  TechnicalDebtAnalysis({
    required this.totalDebt,
    required this.debtItems,
    required this.debtByCategory,
    required this.debtRatio,
  });

  factory TechnicalDebtAnalysis.fromJson(Map<String, dynamic> json) {
    return TechnicalDebtAnalysis(
      totalDebt: json['total_debt']?.toDouble() ?? 0.0,
      debtItems: (json['debt_items'] as List<dynamic>? ?? [])
          .map((item) => DebtItem.fromJson(item))
          .toList(),
      debtByCategory: Map<String, double>.from(json['debt_by_category'] ?? {}),
      debtRatio: json['debt_ratio']?.toDouble() ?? 0.0,
    );
  }
}

/// Debt Item
class DebtItem {
  final String type;
  final String description;
  final double effort;
  final String location;
  final String priority;

  DebtItem({
    required this.type,
    required this.description,
    required this.effort,
    required this.location,
    required this.priority,
  });

  factory DebtItem.fromJson(Map<String, dynamic> json) {
    return DebtItem(
      type: json['type']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      effort: json['effort']?.toDouble() ?? 0.0,
      location: json['location']?.toString() ?? '',
      priority: json['priority']?.toString() ?? '',
    );
  }
}

/// Security Analysis
class SecurityAnalysis {
  final List<SecurityVulnerability> vulnerabilities;
  final double securityScore;
  final Map<String, dynamic> recommendations;
  final DateTime lastScan;

  SecurityAnalysis({
    required this.vulnerabilities,
    required this.securityScore,
    required this.recommendations,
    required this.lastScan,
  });

  factory SecurityAnalysis.fromJson(Map<String, dynamic> json) {
    return SecurityAnalysis(
      vulnerabilities: (json['vulnerabilities'] as List<dynamic>? ?? [])
          .map((vuln) => SecurityVulnerability.fromJson(vuln))
          .toList(),
      securityScore: json['security_score']?.toDouble() ?? 0.0,
      recommendations: json['recommendations'] ?? {},
      lastScan: DateTime.tryParse(json['last_scan'] ?? '') ?? DateTime.now(),
    );
  }
}

/// Security Vulnerability
class SecurityVulnerability {
  final String type;
  final String severity;
  final String description;
  final String location;
  final String cve;

  SecurityVulnerability({
    required this.type,
    required this.severity,
    required this.description,
    required this.location,
    required this.cve,
  });

  factory SecurityVulnerability.fromJson(Map<String, dynamic> json) {
    return SecurityVulnerability(
      type: json['type']?.toString() ?? '',
      severity: json['severity']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      cve: json['cve']?.toString() ?? '',
    );
  }
}

/// Performance Analysis
class PerformanceAnalysis {
  final List<PerformanceMetric> metrics;
  final double performanceScore;
  final List<PerformanceIssue> issues;
  final Map<String, dynamic> recommendations;

  PerformanceAnalysis({
    required this.metrics,
    required this.performanceScore,
    required this.issues,
    required this.recommendations,
  });

  factory PerformanceAnalysis.fromJson(Map<String, dynamic> json) {
    return PerformanceAnalysis(
      metrics: (json['metrics'] as List<dynamic>? ?? [])
          .map((metric) => PerformanceMetric.fromJson(metric))
          .toList(),
      performanceScore: json['performance_score']?.toDouble() ?? 0.0,
      issues: (json['issues'] as List<dynamic>? ?? [])
          .map((issue) => PerformanceIssue.fromJson(issue))
          .toList(),
      recommendations: json['recommendations'] ?? {},
    );
  }
}

/// Performance Metric
class PerformanceMetric {
  final String name;
  final double value;
  final String unit;
  final double threshold;
  final bool isGood;

  PerformanceMetric({
    required this.name,
    required this.value,
    required this.unit,
    required this.threshold,
    required this.isGood,
  });

  factory PerformanceMetric.fromJson(Map<String, dynamic> json) {
    return PerformanceMetric(
      name: json['name']?.toString() ?? '',
      value: json['value']?.toDouble() ?? 0.0,
      unit: json['unit']?.toString() ?? '',
      threshold: json['threshold']?.toDouble() ?? 0.0,
      isGood: json['is_good'] ?? false,
    );
  }
}

/// Performance Issue
class PerformanceIssue {
  final String type;
  final String description;
  final String location;
  final double impact;
  final String solution;

  PerformanceIssue({
    required this.type,
    required this.description,
    required this.location,
    required this.impact,
    required this.solution,
  });

  factory PerformanceIssue.fromJson(Map<String, dynamic> json) {
    return PerformanceIssue(
      type: json['type']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      impact: json['impact']?.toDouble() ?? 0.0,
      solution: json['solution']?.toString() ?? '',
    );
  }
}

/// Team Productivity Metrics
class TeamProductivityMetrics {
  final double velocity;
  final double efficiency;
  final List<TeamMember> teamMembers;
  final Map<String, dynamic> trends;

  TeamProductivityMetrics({
    required this.velocity,
    required this.efficiency,
    required this.teamMembers,
    required this.trends,
  });

  factory TeamProductivityMetrics.fromJson(Map<String, dynamic> json) {
    return TeamProductivityMetrics(
      velocity: json['velocity']?.toDouble() ?? 0.0,
      efficiency: json['efficiency']?.toDouble() ?? 0.0,
      teamMembers: (json['team_members'] as List<dynamic>? ?? [])
          .map((member) => TeamMember.fromJson(member))
          .toList(),
      trends: json['trends'] ?? {},
    );
  }
}

/// Team Member
class TeamMember {
  final String name;
  final double productivity;
  final int commits;
  final double impact;

  TeamMember({
    required this.name,
    required this.productivity,
    required this.commits,
    required this.impact,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      name: json['name']?.toString() ?? '',
      productivity: json['productivity']?.toDouble() ?? 0.0,
      commits: json['commits'] ?? 0,
      impact: json['impact']?.toDouble() ?? 0.0,
    );
  }
}

/// Code Coverage Analysis
class CodeCoverageAnalysis {
  final double overallCoverage;
  final Map<String, double> coverageByFile;
  final List<CoverageGap> coverageGaps;
  final Map<String, dynamic> recommendations;

  CodeCoverageAnalysis({
    required this.overallCoverage,
    required this.coverageByFile,
    required this.coverageGaps,
    required this.recommendations,
  });

  factory CodeCoverageAnalysis.fromJson(Map<String, dynamic> json) {
    return CodeCoverageAnalysis(
      overallCoverage: json['overall_coverage']?.toDouble() ?? 0.0,
      coverageByFile: Map<String, double>.from(json['coverage_by_file'] ?? {}),
      coverageGaps: (json['coverage_gaps'] as List<dynamic>? ?? [])
          .map((gap) => CoverageGap.fromJson(gap))
          .toList(),
      recommendations: json['recommendations'] ?? {},
    );
  }
}

/// Coverage Gap
class CoverageGap {
  final String file;
  final int line;
  final String type;
  final String description;

  CoverageGap({
    required this.file,
    required this.line,
    required this.type,
    required this.description,
  });

  factory CoverageGap.fromJson(Map<String, dynamic> json) {
    return CoverageGap(
      file: json['file']?.toString() ?? '',
      line: json['line'] ?? 0,
      type: json['type']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }
} 