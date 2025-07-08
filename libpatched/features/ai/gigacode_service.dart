import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Gigacode Service for AI code generation and analysis
class GigacodeService {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;

  GigacodeService({
    required String baseUrl,
    required String apiKey,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _client = client ?? http.Client();

  /// Generate code based on description
  Future<CodeGenerationResponse> generateCode({
    required String description,
    required String language,
    String? framework,
    Map<String, dynamic>? requirements,
    Map<String, dynamic>? context,
  }) async {
    try {
      final requestBody = {
        'description': description,
        'language': language,
        'framework': framework,
        'requirements': requirements ?? {},
        'context': context ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/code/generate');
      
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
        return CodeGenerationResponse.fromJson(data);
      } else {
        throw Exception('Failed to generate code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error generating code: $e');
    }
  }

  /// Analyze code for issues and improvements
  Future<CodeAnalysisResponse> analyzeCode({
    required String code,
    required String language,
    List<String>? analysisTypes,
  }) async {
    try {
      final requestBody = {
        'code': code,
        'language': language,
        'analysis_types': analysisTypes ?? ['security', 'performance', 'style'],
      };

      final uri = Uri.parse('$_baseUrl/v1/code/analyze');
      
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
        return CodeAnalysisResponse.fromJson(data);
      } else {
        throw Exception('Failed to analyze code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error analyzing code: $e');
    }
  }

  /// Refactor code based on suggestions
  Future<CodeRefactorResponse> refactorCode({
    required String code,
    required String language,
    required List<String> improvements,
    Map<String, dynamic>? preferences,
  }) async {
    try {
      final requestBody = {
        'code': code,
        'language': language,
        'improvements': improvements,
        'preferences': preferences ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/code/refactor');
      
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
        return CodeRefactorResponse.fromJson(data);
      } else {
        throw Exception('Failed to refactor code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error refactoring code: $e');
    }
  }

  /// Generate tests for code
  Future<TestGenerationResponse> generateTests({
    required String code,
    required String language,
    required String testFramework,
    Map<String, dynamic>? testRequirements,
  }) async {
    try {
      final requestBody = {
        'code': code,
        'language': language,
        'test_framework': testFramework,
        'test_requirements': testRequirements ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/code/tests');
      
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
        return TestGenerationResponse.fromJson(data);
      } else {
        throw Exception('Failed to generate tests: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error generating tests: $e');
    }
  }

  /// Explain code functionality
  Future<CodeExplanationResponse> explainCode({
    required String code,
    required String language,
    String? explanationType,
  }) async {
    try {
      final requestBody = {
        'code': code,
        'language': language,
        'explanation_type': explanationType ?? 'detailed',
      };

      final uri = Uri.parse('$_baseUrl/v1/code/explain');
      
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
        return CodeExplanationResponse.fromJson(data);
      } else {
        throw Exception('Failed to explain code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error explaining code: $e');
    }
  }

  /// Generate blockchain smart contract
  Future<SmartContractResponse> generateSmartContract({
    required String description,
    required String blockchain,
    required String language,
    Map<String, dynamic>? requirements,
    Map<String, dynamic>? securityRequirements,
  }) async {
    try {
      final requestBody = {
        'description': description,
        'blockchain': blockchain,
        'language': language,
        'requirements': requirements ?? {},
        'security_requirements': securityRequirements ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/blockchain/contract');
      
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
        return SmartContractResponse.fromJson(data);
      } else {
        throw Exception('Failed to generate smart contract: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error generating smart contract: $e');
    }
  }

  /// Audit smart contract for security issues
  Future<SmartContractAuditResponse> auditSmartContract({
    required String contractCode,
    required String blockchain,
    required String language,
    List<String>? auditTypes,
  }) async {
    try {
      final requestBody = {
        'contract_code': contractCode,
        'blockchain': blockchain,
        'language': language,
        'audit_types': auditTypes ?? ['security', 'gas_optimization', 'logic'],
      };

      final uri = Uri.parse('$_baseUrl/v1/blockchain/audit');
      
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
        return SmartContractAuditResponse.fromJson(data);
      } else {
        throw Exception('Failed to audit smart contract: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error auditing smart contract: $e');
    }
  }

  /// Generate DeFi protocol code
  Future<DeFiProtocolResponse> generateDeFiProtocol({
    required String protocolType,
    required String blockchain,
    required Map<String, dynamic> requirements,
    Map<String, dynamic>? securityRequirements,
  }) async {
    try {
      final requestBody = {
        'protocol_type': protocolType,
        'blockchain': blockchain,
        'requirements': requirements,
        'security_requirements': securityRequirements ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/defi/protocol');
      
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
        return DeFiProtocolResponse.fromJson(data);
      } else {
        throw Exception('Failed to generate DeFi protocol: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error generating DeFi protocol: $e');
    }
  }

  /// Optimize code for performance
  Future<CodeOptimizationResponse> optimizeCode({
    required String code,
    required String language,
    required String optimizationType,
    Map<String, dynamic>? constraints,
  }) async {
    try {
      final requestBody = {
        'code': code,
        'language': language,
        'optimization_type': optimizationType,
        'constraints': constraints ?? {},
      };

      final uri = Uri.parse('$_baseUrl/v1/code/optimize');
      
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
        return CodeOptimizationResponse.fromJson(data);
      } else {
        throw Exception('Failed to optimize code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error optimizing code: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}

/// Code Generation Response
class CodeGenerationResponse {
  final String code;
  final String language;
  final String framework;
  final List<String> dependencies;
  final Map<String, dynamic> metadata;
  final double confidence;

  CodeGenerationResponse({
    required this.code,
    required this.language,
    required this.framework,
    required this.dependencies,
    required this.metadata,
    required this.confidence,
  });

  factory CodeGenerationResponse.fromJson(Map<String, dynamic> json) {
    return CodeGenerationResponse(
      code: json['code']?.toString() ?? '',
      language: json['language']?.toString() ?? '',
      framework: json['framework']?.toString() ?? '',
      dependencies: List<String>.from(json['dependencies'] ?? []),
      metadata: json['metadata'] ?? {},
      confidence: json['confidence']?.toDouble() ?? 0.0,
    );
  }
}

/// Code Analysis Response
class CodeAnalysisResponse {
  final List<CodeIssue> issues;
  final List<CodeSuggestion> suggestions;
  final CodeMetrics metrics;
  final double qualityScore;

  CodeAnalysisResponse({
    required this.issues,
    required this.suggestions,
    required this.metrics,
    required this.qualityScore,
  });

  factory CodeAnalysisResponse.fromJson(Map<String, dynamic> json) {
    return CodeAnalysisResponse(
      issues: (json['issues'] as List<dynamic>? ?? [])
          .map((issue) => CodeIssue.fromJson(issue))
          .toList(),
      suggestions: (json['suggestions'] as List<dynamic>? ?? [])
          .map((suggestion) => CodeSuggestion.fromJson(suggestion))
          .toList(),
      metrics: CodeMetrics.fromJson(json['metrics'] ?? {}),
      qualityScore: json['quality_score']?.toDouble() ?? 0.0,
    );
  }
}

/// Code Issue
class CodeIssue {
  final String type;
  final String severity;
  final String message;
  final int line;
  final int column;
  final String suggestion;

  CodeIssue({
    required this.type,
    required this.severity,
    required this.message,
    required this.line,
    required this.column,
    required this.suggestion,
  });

  factory CodeIssue.fromJson(Map<String, dynamic> json) {
    return CodeIssue(
      type: json['type']?.toString() ?? '',
      severity: json['severity']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      line: json['line'] ?? 0,
      column: json['column'] ?? 0,
      suggestion: json['suggestion']?.toString() ?? '',
    );
  }
}

/// Code Suggestion
class CodeSuggestion {
  final String type;
  final String description;
  final String code;
  final double impact;

  CodeSuggestion({
    required this.type,
    required this.description,
    required this.code,
    required this.impact,
  });

  factory CodeSuggestion.fromJson(Map<String, dynamic> json) {
    return CodeSuggestion(
      type: json['type']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      impact: json['impact']?.toDouble() ?? 0.0,
    );
  }
}

/// Code Metrics
class CodeMetrics {
  final int linesOfCode;
  final int cyclomaticComplexity;
  final double maintainabilityIndex;
  final double testCoverage;

  CodeMetrics({
    required this.linesOfCode,
    required this.cyclomaticComplexity,
    required this.maintainabilityIndex,
    required this.testCoverage,
  });

  factory CodeMetrics.fromJson(Map<String, dynamic> json) {
    return CodeMetrics(
      linesOfCode: json['lines_of_code'] ?? 0,
      cyclomaticComplexity: json['cyclomatic_complexity'] ?? 0,
      maintainabilityIndex: json['maintainability_index']?.toDouble() ?? 0.0,
      testCoverage: json['test_coverage']?.toDouble() ?? 0.0,
    );
  }
}

/// Code Refactor Response
class CodeRefactorResponse {
  final String originalCode;
  final String refactoredCode;
  final List<String> changes;
  final Map<String, dynamic> improvements;

  CodeRefactorResponse({
    required this.originalCode,
    required this.refactoredCode,
    required this.changes,
    required this.improvements,
  });

  factory CodeRefactorResponse.fromJson(Map<String, dynamic> json) {
    return CodeRefactorResponse(
      originalCode: json['original_code']?.toString() ?? '',
      refactoredCode: json['refactored_code']?.toString() ?? '',
      changes: List<String>.from(json['changes'] ?? []),
      improvements: json['improvements'] ?? {},
    );
  }
}

/// Test Generation Response
class TestGenerationResponse {
  final String testCode;
  final String testFramework;
  final List<String> testCases;
  final double coverage;

  TestGenerationResponse({
    required this.testCode,
    required this.testFramework,
    required this.testCases,
    required this.coverage,
  });

  factory TestGenerationResponse.fromJson(Map<String, dynamic> json) {
    return TestGenerationResponse(
      testCode: json['test_code']?.toString() ?? '',
      testFramework: json['test_framework']?.toString() ?? '',
      testCases: List<String>.from(json['test_cases'] ?? []),
      coverage: json['coverage']?.toDouble() ?? 0.0,
    );
  }
}

/// Code Explanation Response
class CodeExplanationResponse {
  final String explanation;
  final String explanationType;
  final Map<String, dynamic> details;

  CodeExplanationResponse({
    required this.explanation,
    required this.explanationType,
    required this.details,
  });

  factory CodeExplanationResponse.fromJson(Map<String, dynamic> json) {
    return CodeExplanationResponse(
      explanation: json['explanation']?.toString() ?? '',
      explanationType: json['explanation_type']?.toString() ?? '',
      details: json['details'] ?? {},
    );
  }
}

/// Smart Contract Response
class SmartContractResponse {
  final String contractCode;
  final String blockchain;
  final String language;
  final List<String> functions;
  final Map<String, dynamic> abi;
  final double securityScore;

  SmartContractResponse({
    required this.contractCode,
    required this.blockchain,
    required this.language,
    required this.functions,
    required this.abi,
    required this.securityScore,
  });

  factory SmartContractResponse.fromJson(Map<String, dynamic> json) {
    return SmartContractResponse(
      contractCode: json['contract_code']?.toString() ?? '',
      blockchain: json['blockchain']?.toString() ?? '',
      language: json['language']?.toString() ?? '',
      functions: List<String>.from(json['functions'] ?? []),
      abi: json['abi'] ?? {},
      securityScore: json['security_score']?.toDouble() ?? 0.0,
    );
  }
}

/// Smart Contract Audit Response
class SmartContractAuditResponse {
  final List<SecurityIssue> securityIssues;
  final List<OptimizationSuggestion> optimizations;
  final double overallScore;
  final Map<String, dynamic> recommendations;

  SmartContractAuditResponse({
    required this.securityIssues,
    required this.optimizations,
    required this.overallScore,
    required this.recommendations,
  });

  factory SmartContractAuditResponse.fromJson(Map<String, dynamic> json) {
    return SmartContractAuditResponse(
      securityIssues: (json['security_issues'] as List<dynamic>? ?? [])
          .map((issue) => SecurityIssue.fromJson(issue))
          .toList(),
      optimizations: (json['optimizations'] as List<dynamic>? ?? [])
          .map((opt) => OptimizationSuggestion.fromJson(opt))
          .toList(),
      overallScore: json['overall_score']?.toDouble() ?? 0.0,
      recommendations: json['recommendations'] ?? {},
    );
  }
}

/// Security Issue
class SecurityIssue {
  final String type;
  final String severity;
  final String description;
  final String location;
  final String fix;

  SecurityIssue({
    required this.type,
    required this.severity,
    required this.description,
    required this.location,
    required this.fix,
  });

  factory SecurityIssue.fromJson(Map<String, dynamic> json) {
    return SecurityIssue(
      type: json['type']?.toString() ?? '',
      severity: json['severity']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      fix: json['fix']?.toString() ?? '',
    );
  }
}

/// Optimization Suggestion
class OptimizationSuggestion {
  final String type;
  final String description;
  final String code;
  final double gasSavings;

  OptimizationSuggestion({
    required this.type,
    required this.description,
    required this.code,
    required this.gasSavings,
  });

  factory OptimizationSuggestion.fromJson(Map<String, dynamic> json) {
    return OptimizationSuggestion(
      type: json['type']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      gasSavings: json['gas_savings']?.toDouble() ?? 0.0,
    );
  }
}

/// DeFi Protocol Response
class DeFiProtocolResponse {
  final String protocolCode;
  final String protocolType;
  final String blockchain;
  final List<String> features;
  final Map<String, dynamic> configuration;

  DeFiProtocolResponse({
    required this.protocolCode,
    required this.protocolType,
    required this.blockchain,
    required this.features,
    required this.configuration,
  });

  factory DeFiProtocolResponse.fromJson(Map<String, dynamic> json) {
    return DeFiProtocolResponse(
      protocolCode: json['protocol_code']?.toString() ?? '',
      protocolType: json['protocol_type']?.toString() ?? '',
      blockchain: json['blockchain']?.toString() ?? '',
      features: List<String>.from(json['features'] ?? []),
      configuration: json['configuration'] ?? {},
    );
  }
}

/// Code Optimization Response
class CodeOptimizationResponse {
  final String originalCode;
  final String optimizedCode;
  final Map<String, dynamic> improvements;
  final double performanceGain;

  CodeOptimizationResponse({
    required this.originalCode,
    required this.optimizedCode,
    required this.improvements,
    required this.performanceGain,
  });

  factory CodeOptimizationResponse.fromJson(Map<String, dynamic> json) {
    return CodeOptimizationResponse(
      originalCode: json['original_code']?.toString() ?? '',
      optimizedCode: json['optimized_code']?.toString() ?? '',
      improvements: json['improvements'] ?? {},
      performanceGain: json['performance_gain']?.toDouble() ?? 0.0,
    );
  }
} 