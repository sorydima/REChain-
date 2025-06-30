import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';

import '../blockchain/common/models/blockchain_types.dart';
import '../blockchain/common/interfaces/blockchain_service.dart';

/// Portfolio Analytics Service
class PortfolioAnalytics {
  final Map<BlockchainNetwork, BlockchainService> _services;

  PortfolioAnalytics(this._services);

  /// Get comprehensive portfolio overview
  Future<PortfolioOverview> getPortfolioOverview({
    required String walletAddress,
  }) async {
    try {
      double totalValue = 0.0;
      double totalChange24h = 0.0;
      double totalChange7d = 0.0;
      double totalChange30d = 0.0;
      final networkBalances = <BlockchainNetwork, double>{};
      final assetAllocation = <String, double>{};

      // Aggregate data from all networks
      for (final entry in _services.entries) {
        final network = entry.key;
        final service = entry.value;

        try {
          final balance = await service.getBalance(walletAddress);
          networkBalances[network] = balance;
          totalValue += balance;

          // Mock price changes (in real app, would fetch from price APIs)
          final change24h = balance * (Random().nextDouble() * 0.2 - 0.1); // ±10%
          final change7d = balance * (Random().nextDouble() * 0.4 - 0.2); // ±20%
          final change30d = balance * (Random().nextDouble() * 0.6 - 0.3); // ±30%

          totalChange24h += change24h;
          totalChange7d += change7d;
          totalChange30d += change30d;

          // Add to asset allocation
          final assetName = network.toString().split('.').last.toUpperCase();
          assetAllocation[assetName] = (assetAllocation[assetName] ?? 0) + balance;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get balance for $network: $e');
          }
        }
      }

      return PortfolioOverview(
        totalValue: totalValue,
        change24h: totalChange24h,
        change7d: totalChange7d,
        change30d: totalChange30d,
        changePercentage24h: totalValue > 0 ? (totalChange24h / totalValue) * 100 : 0,
        changePercentage7d: totalValue > 0 ? (totalChange7d / totalValue) * 100 : 0,
        changePercentage30d: totalValue > 0 ? (totalChange30d / totalValue) * 100 : 0,
        networkBalances: networkBalances,
        assetAllocation: assetAllocation,
        riskScore: _calculateRiskScore(assetAllocation),
        diversificationScore: _calculateDiversificationScore(assetAllocation),
      );
    } catch (e) {
      throw Exception('Failed to get portfolio overview: $e');
    }
  }

  /// Get transaction history with analytics
  Future<TransactionAnalytics> getTransactionAnalytics({
    required String walletAddress,
    required Duration period,
  }) async {
    try {
      final transactions = <BlockchainTransaction>[];
      final networkStats = <BlockchainNetwork, NetworkTransactionStats>{};

      // Collect transactions from all networks
      for (final entry in _services.entries) {
        final network = entry.key;
        final service = entry.value;

        try {
          final networkTransactions = await service.getTransactionHistory(walletAddress);
          transactions.addAll(networkTransactions);

          // Calculate network-specific stats
          final networkStat = _calculateNetworkStats(networkTransactions, period);
          networkStats[network] = networkStat;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get transactions for $network: $e');
          }
        }
      }

      // Calculate overall analytics
      final totalTransactions = transactions.length;
      final totalVolume = transactions.fold<double>(0, (sum, tx) => sum + tx.amount);
      final averageTransactionSize = totalTransactions > 0 ? totalVolume / totalTransactions : 0;

      // Categorize transactions
      final transactionCategories = _categorizeTransactions(transactions);

      return TransactionAnalytics(
        totalTransactions: totalTransactions,
        totalVolume: totalVolume,
        averageTransactionSize: averageTransactionSize,
        networkStats: networkStats,
        transactionCategories: transactionCategories,
        transactionHistory: transactions,
        period: period,
      );
    } catch (e) {
      throw Exception('Failed to get transaction analytics: $e');
    }
  }

  /// Get performance metrics
  Future<PerformanceMetrics> getPerformanceMetrics({
    required String walletAddress,
    required Duration period,
  }) async {
    try {
      // Mock performance data (in real app, would calculate from historical data)
      final metrics = PerformanceMetrics(
        totalReturn: 15.5,
        annualizedReturn: 12.3,
        sharpeRatio: 1.8,
        maxDrawdown: -8.2,
        volatility: 12.5,
        beta: 0.95,
        alpha: 2.1,
        informationRatio: 1.2,
        sortinoRatio: 2.1,
        calmarRatio: 1.5,
        winRate: 0.65,
        averageWin: 5.2,
        averageLoss: -3.1,
        profitFactor: 1.8,
        recoveryFactor: 1.9,
      );

      return metrics;
    } catch (e) {
      throw Exception('Failed to get performance metrics: $e');
    }
  }

  /// Get risk analysis
  Future<RiskAnalysis> getRiskAnalysis({
    required String walletAddress,
  }) async {
    try {
      final overview = await getPortfolioOverview(walletAddress: walletAddress);

      return RiskAnalysis(
        overallRiskScore: overview.riskScore,
        marketRisk: 0.35,
        liquidityRisk: 0.25,
        concentrationRisk: 0.45,
        volatilityRisk: 0.30,
        correlationRisk: 0.20,
        riskFactors: [
          RiskFactor(
            type: RiskFactorType.concentration,
            severity: RiskSeverity.medium,
            description: 'High concentration in Ethereum (45%)',
            recommendation: 'Consider diversifying into other assets',
          ),
          RiskFactor(
            type: RiskFactorType.volatility,
            severity: RiskSeverity.low,
            description: 'Moderate volatility in portfolio',
            recommendation: 'Monitor market conditions closely',
          ),
        ],
        stressTestResults: [
          StressTestResult(
            scenario: 'Market Crash (-30%)',
            impact: -12.5,
            probability: 0.05,
          ),
          StressTestResult(
            scenario: 'Recession (-15%)',
            impact: -6.8,
            probability: 0.15,
          ),
          StressTestResult(
            scenario: 'Bull Market (+20%)',
            impact: 8.5,
            probability: 0.25,
          ),
        ],
      );
    } catch (e) {
      throw Exception('Failed to get risk analysis: $e');
    }
  }

  /// Get tax reporting data
  Future<TaxReport> getTaxReport({
    required String walletAddress,
    required int year,
  }) async {
    try {
      final transactions = <BlockchainTransaction>[];
      
      // Collect all transactions for the year
      for (final service in _services.values) {
        try {
          final networkTransactions = await service.getTransactionHistory(walletAddress);
          transactions.addAll(networkTransactions.where((tx) => 
            tx.timestamp.year == year
          ));
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get transactions for tax report: $e');
          }
        }
      }

      // Calculate tax metrics
      double totalGains = 0.0;
      double totalLosses = 0.0;
      double totalIncome = 0.0;
      int totalTransactions = transactions.length;

      // Mock calculation (in real app, would implement proper tax logic)
      for (final tx in transactions) {
        if (tx.type == TransactionType.transfer) {
          final gain = tx.amount * 0.05; // Mock 5% gain
          if (gain > 0) {
            totalGains += gain;
          } else {
            totalLosses += gain.abs();
          }
        } else if (tx.type == TransactionType.staking) {
          totalIncome += tx.amount * 0.08; // Mock 8% staking income
        }
      }

      return TaxReport(
        year: year,
        totalGains: totalGains,
        totalLosses: totalLosses,
        netGains: totalGains - totalLosses,
        totalIncome: totalIncome,
        totalTransactions: totalTransactions,
        transactions: transactions,
        taxLiability: (totalGains - totalLosses) * 0.15, // Mock 15% tax rate
      );
    } catch (e) {
      throw Exception('Failed to get tax report: $e');
    }
  }

  /// Calculate risk score based on asset allocation
  double _calculateRiskScore(Map<String, double> assetAllocation) {
    if (assetAllocation.isEmpty) return 0.0;

    final totalValue = assetAllocation.values.reduce((a, b) => a + b);
    if (totalValue == 0) return 0.0;

    double riskScore = 0.0;
    
    // Risk weights for different assets (mock values)
    final riskWeights = {
      'ETHEREUM': 0.8,
      'BINANCE': 0.7,
      'POLYGON': 0.6,
      'AVALANCHE': 0.7,
      'SOLANA': 0.8,
      'TON': 0.5,
      'OPTIMISM': 0.7,
      'ARBITRUM': 0.7,
    };

    for (final entry in assetAllocation.entries) {
      final weight = entry.value / totalValue;
      final riskWeight = riskWeights[entry.key] ?? 0.5;
      riskScore += weight * riskWeight;
    }

    return riskScore;
  }

  /// Calculate diversification score
  double _calculateDiversificationScore(Map<String, double> assetAllocation) {
    if (assetAllocation.isEmpty) return 0.0;

    final totalValue = assetAllocation.values.reduce((a, b) => a + b);
    if (totalValue == 0) return 0.0;

    // Calculate Herfindahl-Hirschman Index (HHI)
    double hhi = 0.0;
    for (final value in assetAllocation.values) {
      final share = value / totalValue;
      hhi += share * share;
    }

    // Convert HHI to diversification score (0-100)
    final diversificationScore = (1 - hhi) * 100;
    return diversificationScore.clamp(0.0, 100.0);
  }

  /// Calculate network-specific transaction stats
  NetworkTransactionStats _calculateNetworkStats(
    List<BlockchainTransaction> transactions,
    Duration period,
  ) {
    final now = DateTime.now();
    final cutoffDate = now.subtract(period);

    final periodTransactions = transactions.where((tx) => 
      tx.timestamp.isAfter(cutoffDate)
    ).toList();

    final totalVolume = periodTransactions.fold<double>(0, (sum, tx) => sum + tx.amount);
    final averageSize = periodTransactions.isNotEmpty ? totalVolume / periodTransactions.length : 0;

    return NetworkTransactionStats(
      totalTransactions: periodTransactions.length,
      totalVolume: totalVolume,
      averageTransactionSize: averageSize,
      period: period,
    );
  }

  /// Categorize transactions by type
  Map<TransactionType, int> _categorizeTransactions(List<BlockchainTransaction> transactions) {
    final categories = <TransactionType, int>{};
    
    for (final tx in transactions) {
      categories[tx.type] = (categories[tx.type] ?? 0) + 1;
    }

    return categories;
  }
}

/// Portfolio Overview
class PortfolioOverview {
  final double totalValue;
  final double change24h;
  final double change7d;
  final double change30d;
  final double changePercentage24h;
  final double changePercentage7d;
  final double changePercentage30d;
  final Map<BlockchainNetwork, double> networkBalances;
  final Map<String, double> assetAllocation;
  final double riskScore;
  final double diversificationScore;

  PortfolioOverview({
    required this.totalValue,
    required this.change24h,
    required this.change7d,
    required this.change30d,
    required this.changePercentage24h,
    required this.changePercentage7d,
    required this.changePercentage30d,
    required this.networkBalances,
    required this.assetAllocation,
    required this.riskScore,
    required this.diversificationScore,
  });
}

/// Transaction Analytics
class TransactionAnalytics {
  final int totalTransactions;
  final double totalVolume;
  final double averageTransactionSize;
  final Map<BlockchainNetwork, NetworkTransactionStats> networkStats;
  final Map<TransactionType, int> transactionCategories;
  final List<BlockchainTransaction> transactionHistory;
  final Duration period;

  TransactionAnalytics({
    required this.totalTransactions,
    required this.totalVolume,
    required this.averageTransactionSize,
    required this.networkStats,
    required this.transactionCategories,
    required this.transactionHistory,
    required this.period,
  });
}

/// Network Transaction Stats
class NetworkTransactionStats {
  final int totalTransactions;
  final double totalVolume;
  final double averageTransactionSize;
  final Duration period;

  NetworkTransactionStats({
    required this.totalTransactions,
    required this.totalVolume,
    required this.averageTransactionSize,
    required this.period,
  });
}

/// Performance Metrics
class PerformanceMetrics {
  final double totalReturn;
  final double annualizedReturn;
  final double sharpeRatio;
  final double maxDrawdown;
  final double volatility;
  final double beta;
  final double alpha;
  final double informationRatio;
  final double sortinoRatio;
  final double calmarRatio;
  final double winRate;
  final double averageWin;
  final double averageLoss;
  final double profitFactor;
  final double recoveryFactor;

  PerformanceMetrics({
    required this.totalReturn,
    required this.annualizedReturn,
    required this.sharpeRatio,
    required this.maxDrawdown,
    required this.volatility,
    required this.beta,
    required this.alpha,
    required this.informationRatio,
    required this.sortinoRatio,
    required this.calmarRatio,
    required this.winRate,
    required this.averageWin,
    required this.averageLoss,
    required this.profitFactor,
    required this.recoveryFactor,
  });
}

/// Risk Analysis
class RiskAnalysis {
  final double overallRiskScore;
  final double marketRisk;
  final double liquidityRisk;
  final double concentrationRisk;
  final double volatilityRisk;
  final double correlationRisk;
  final List<RiskFactor> riskFactors;
  final List<StressTestResult> stressTestResults;

  RiskAnalysis({
    required this.overallRiskScore,
    required this.marketRisk,
    required this.liquidityRisk,
    required this.concentrationRisk,
    required this.volatilityRisk,
    required this.correlationRisk,
    required this.riskFactors,
    required this.stressTestResults,
  });
}

/// Risk Factor
class RiskFactor {
  final RiskFactorType type;
  final RiskSeverity severity;
  final String description;
  final String recommendation;

  RiskFactor({
    required this.type,
    required this.severity,
    required this.description,
    required this.recommendation,
  });
}

/// Risk Factor Types
enum RiskFactorType {
  concentration,
  volatility,
  liquidity,
  market,
  correlation,
  regulatory,
}

/// Risk Severity
enum RiskSeverity {
  low,
  medium,
  high,
  critical,
}

/// Stress Test Result
class StressTestResult {
  final String scenario;
  final double impact;
  final double probability;

  StressTestResult({
    required this.scenario,
    required this.impact,
    required this.probability,
  });
}

/// Tax Report
class TaxReport {
  final int year;
  final double totalGains;
  final double totalLosses;
  final double netGains;
  final double totalIncome;
  final int totalTransactions;
  final List<BlockchainTransaction> transactions;
  final double taxLiability;

  TaxReport({
    required this.year,
    required this.totalGains,
    required this.totalLosses,
    required this.netGains,
    required this.totalIncome,
    required this.totalTransactions,
    required this.transactions,
    required this.taxLiability,
  });
} 