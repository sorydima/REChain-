import 'package:flutter/foundation.dart';
import '../common/multi_chain_manager.dart';
import '../common/models/blockchain_types.dart';

class WalletService {
  final MultiChainManager _multiChainManager = MultiChainManager.instance;

  /// Connect a wallet by address (for simplicity, just store the address)
  Future<void> connectWallet(String walletAddress) async {
    // In a real app, you might validate the address format and store it securely
    if (walletAddress.isEmpty) {
      throw ArgumentError('Wallet address cannot be empty');
    }
    // For now, just log connection
    if (kDebugMode) {
      print('Wallet connected: $walletAddress');
    }
  }

  /// Fetch aggregated balances across all active networks for the given wallet address
  Future<Map<BlockchainNetwork, double>> getAggregatedBalances(String walletAddress) async {
    final balances = <BlockchainNetwork, double>{};
    for (final network in _multiChainManager.activeNetworks) {
      final service = _multiChainManager.getService(network);
      if (service != null) {
        try {
          final balance = await service.getBalance(walletAddress);
          balances[network] = balance;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get balance for $network: $e');
          }
          balances[network] = 0.0;
        }
      }
    }
    return balances;
  }
}
