import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Prometheus Service for metrics collection and monitoring
class PrometheusService {
  final String _baseUrl;
  final String? _apiKey;
  final http.Client _client;

  PrometheusService({
    required String baseUrl,
    String? apiKey,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _client = client ?? http.Client();

  /// Get metrics from Prometheus
  Future<Map<String, dynamic>> getMetrics({
    required String query,
    DateTime? start,
    DateTime? end,
    Duration? step,
  }) async {
    try {
      final queryParams = <String, String>{
        'query': query,
      };

      if (start != null) {
        queryParams['start'] = (start.millisecondsSinceEpoch / 1000).toString();
      }
      if (end != null) {
        queryParams['end'] = (end.millisecondsSinceEpoch / 1000).toString();
      }
      if (step != null) {
        queryParams['step'] = step.inSeconds.toString();
      }

      final uri = Uri.parse('$_baseUrl/api/v1/query_range').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };
      
      if (_apiKey != null) {
        headers['Authorization'] = 'Bearer $_apiKey';
      }

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to get metrics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Prometheus metrics: $e');
    }
  }

  /// Get instant query result
  Future<Map<String, dynamic>> getInstantQuery({
    required String query,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/api/v1/query').replace(
        queryParameters: {'query': query},
      );
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };
      
      if (_apiKey != null) {
        headers['Authorization'] = 'Bearer $_apiKey';
      }

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to get instant query: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching instant query: $e');
    }
  }

  /// Get available metrics
  Future<List<String>> getAvailableMetrics() async {
    try {
      final uri = Uri.parse('$_baseUrl/api/v1/label/__name__/values');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };
      
      if (_apiKey != null) {
        headers['Authorization'] = 'Bearer $_apiKey';
      }

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<String>.from(data['data'] ?? []);
      } else {
        throw Exception('Failed to get available metrics: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching available metrics: $e');
    }
  }

  /// Get system health metrics
  Future<SystemHealthMetrics> getSystemHealth() async {
    try {
      final cpuQuery = '100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)';
      final memoryQuery = '(1 - (node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes)) * 100';
      final diskQuery = '(1 - (node_filesystem_avail_bytes{mountpoint="/"} / node_filesystem_size_bytes{mountpoint="/"})) * 100';

      final cpuResult = await getInstantQuery(query: cpuQuery);
      final memoryResult = await getInstantQuery(query: memoryQuery);
      final diskResult = await getInstantQuery(query: diskQuery);

      return SystemHealthMetrics(
        cpuUsage: _extractValue(cpuResult),
        memoryUsage: _extractValue(memoryResult),
        diskUsage: _extractValue(diskResult),
        timestamp: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Error fetching system health: $e');
    }
  }

  /// Get application performance metrics
  Future<AppPerformanceMetrics> getAppPerformance({
    required String appName,
    Duration period = const Duration(hours: 1),
  }) async {
    try {
      final end = DateTime.now();
      final start = end.subtract(period);

      final responseTimeQuery = 'histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket{app="$appName"}[5m])) by (le))';
      final requestRateQuery = 'sum(rate(http_requests_total{app="$appName"}[5m]))';
      final errorRateQuery = 'sum(rate(http_requests_total{app="$appName",status=~"5.."}[5m])) / sum(rate(http_requests_total{app="$appName"}[5m])) * 100';

      final responseTimeResult = await getMetrics(
        query: responseTimeQuery,
        start: start,
        end: end,
        step: const Duration(minutes: 5),
      );
      final requestRateResult = await getMetrics(
        query: requestRateQuery,
        start: start,
        end: end,
        step: const Duration(minutes: 5),
      );
      final errorRateResult = await getMetrics(
        query: errorRateQuery,
        start: start,
        end: end,
        step: const Duration(minutes: 5),
      );

      return AppPerformanceMetrics(
        responseTime95th: _extractTimeSeriesValue(responseTimeResult),
        requestRate: _extractTimeSeriesValue(requestRateResult),
        errorRate: _extractTimeSeriesValue(errorRateResult),
        period: period,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Error fetching app performance: $e');
    }
  }

  /// Get blockchain-specific metrics
  Future<BlockchainMetrics> getBlockchainMetrics({
    required String network,
    Duration period = const Duration(hours: 24),
  }) async {
    try {
      final end = DateTime.now();
      final start = end.subtract(period);

      final transactionRateQuery = 'sum(rate(blockchain_transactions_total{network="$network"}[5m]))';
      final gasPriceQuery = 'avg(blockchain_gas_price{network="$network"})';
      final blockTimeQuery = 'avg(blockchain_block_time{network="$network"})';

      final transactionRateResult = await getMetrics(
        query: transactionRateQuery,
        start: start,
        end: end,
        step: const Duration(minutes: 5),
      );
      final gasPriceResult = await getMetrics(
        query: gasPriceQuery,
        start: start,
        end: end,
        step: const Duration(minutes: 5),
      );
      final blockTimeResult = await getMetrics(
        query: blockTimeQuery,
        start: start,
        end: end,
        step: const Duration(minutes: 5),
      );

      return BlockchainMetrics(
        network: network,
        transactionRate: _extractTimeSeriesValue(transactionRateResult),
        gasPrice: _extractTimeSeriesValue(gasPriceResult),
        blockTime: _extractTimeSeriesValue(blockTimeResult),
        period: period,
        timestamp: DateTime.now(),
      );
    } catch (e) {
      throw Exception('Error fetching blockchain metrics: $e');
    }
  }

  double _extractValue(Map<String, dynamic> result) {
    try {
      final data = result['data'] as Map<String, dynamic>?;
      if (data != null) {
        final result = data['result'] as List<dynamic>?;
        if (result != null && result.isNotEmpty) {
          final value = result.first['value'] as List<dynamic>?;
          if (value != null && value.length > 1) {
            return double.tryParse(value[1].toString()) ?? 0.0;
          }
        }
      }
      return 0.0;
    } catch (e) {
      if (kDebugMode) {
        print('Error extracting value: $e');
      }
      return 0.0;
    }
  }

  List<TimeSeriesPoint> _extractTimeSeriesValue(Map<String, dynamic> result) {
    try {
      final data = result['data'] as Map<String, dynamic>?;
      if (data != null) {
        final result = data['result'] as List<dynamic>?;
        if (result != null && result.isNotEmpty) {
          final values = result.first['values'] as List<dynamic>?;
          if (values != null) {
            return values.map((point) {
              final timestamp = double.tryParse(point[0].toString()) ?? 0.0;
              final value = double.tryParse(point[1].toString()) ?? 0.0;
              return TimeSeriesPoint(
                timestamp: DateTime.fromMillisecondsSinceEpoch((timestamp * 1000).toInt()),
                value: value,
              );
            }).toList();
          }
        }
      }
      return [];
    } catch (e) {
      if (kDebugMode) {
        print('Error extracting time series value: $e');
      }
      return [];
    }
  }

  void dispose() {
    _client.close();
  }
}

/// System Health Metrics
class SystemHealthMetrics {
  final double cpuUsage;
  final double memoryUsage;
  final double diskUsage;
  final DateTime timestamp;

  SystemHealthMetrics({
    required this.cpuUsage,
    required this.memoryUsage,
    required this.diskUsage,
    required this.timestamp,
  });
}

/// Application Performance Metrics
class AppPerformanceMetrics {
  final List<TimeSeriesPoint> responseTime95th;
  final List<TimeSeriesPoint> requestRate;
  final List<TimeSeriesPoint> errorRate;
  final Duration period;
  final DateTime timestamp;

  AppPerformanceMetrics({
    required this.responseTime95th,
    required this.requestRate,
    required this.errorRate,
    required this.period,
    required this.timestamp,
  });
}

/// Blockchain Metrics
class BlockchainMetrics {
  final String network;
  final List<TimeSeriesPoint> transactionRate;
  final List<TimeSeriesPoint> gasPrice;
  final List<TimeSeriesPoint> blockTime;
  final Duration period;
  final DateTime timestamp;

  BlockchainMetrics({
    required this.network,
    required this.transactionRate,
    required this.gasPrice,
    required this.blockTime,
    required this.period,
    required this.timestamp,
  });
}

/// Time Series Point
class TimeSeriesPoint {
  final DateTime timestamp;
  final double value;

  TimeSeriesPoint({
    required this.timestamp,
    required this.value,
  });
} 