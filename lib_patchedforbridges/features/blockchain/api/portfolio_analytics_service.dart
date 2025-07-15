import 'package:flutter/foundation.dart';
import '../common/multi_chain_manager.dart';
import '../common/models/blockchain_types.dart';

class PortfolioAnalyticsService {
  final MultiChainManager _multiChainManager = MultiChainManager.instance;

  /// Get aggregated portfolio data for a wallet address
  Future<Map<String, dynamic>> getPortfolioData(String walletAddress) async {
    final balances = await _multiChainManager.getAggregatedPortfolio(walletAddress);
    final totalBalance = balances['totalBalance'] as double? ?? 0.0;
    final networkBalances = balances['balances'] as Map<BlockchainNetwork, double>? ?? {};

    // Calculate asset allocation percentages
    final allocation = <BlockchainNetwork, double>{};
    networkBalances.forEach((network, balance) {
      allocation[network] = totalBalance > 0 ? (balance / totalBalance) * 100 : 0.0;
    });

    // Placeholder for performance metrics (to be implemented)
    final performance = {
      'totalReturn': 0.0,
      'dailyChange': 0.0,
    };

    if (kDebugMode) {
      print('Portfolio data for $walletAddress: totalBalance=$totalBalance');
    }

    return {
      'totalBalance': totalBalance,
      'allocation': allocation,
      'performance': performance,
    };
  }
}
