import 'package:flutter/foundation.dart';
import '../common/multi_chain_manager.dart';
import '../common/models/blockchain_types.dart';

class TransactionHistoryService {
  final MultiChainManager _multiChainManager = MultiChainManager.instance;

  /// Get transaction history for a wallet address aggregated across all active networks
  Future<Map<BlockchainNetwork, List<dynamic>>> getTransactionHistory(String walletAddress) async {
    final history = <BlockchainNetwork, List<dynamic>>{};
    for (final network in _multiChainManager.activeNetworks) {
      final service = _multiChainManager.getService(network);
      if (service != null) {
        try {
          final txs = await service.getTransactionHistory(walletAddress);
          history[network] = txs;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get transaction history for $network: $e');
          }
          history[network] = [];
        }
      }
    }
    return history;
  }
}
