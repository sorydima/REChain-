import 'package:flutter/foundation.dart';
import '../common/multi_chain_manager.dart';
import '../common/models/blockchain_types.dart';

class StakingService {
  final MultiChainManager _multiChainManager = MultiChainManager.instance;

  /// Get staking information for a wallet address across all active networks
  Future<Map<BlockchainNetwork, dynamic>> getStakingInfo(String walletAddress) async {
    final stakingInfo = <BlockchainNetwork, dynamic>{};
    for (final network in _multiChainManager.activeNetworks) {
      final service = _multiChainManager.getService(network);
      if (service != null) {
        try {
          final info = await service.getStakingInfo(walletAddress);
          stakingInfo[network] = info;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to get staking info for $network: $e');
          }
          stakingInfo[network] = null;
        }
      }
    }
    return stakingInfo;
  }

  /// Stake tokens on a specific network
  Future<String> stakeTokens({
    required BlockchainNetwork network,
    required String walletAddress,
    required double amount,
    required String privateKey,
  }) async {
    final service = _multiChainManager.getService(network);
    if (service == null) {
      throw Exception('Network service not available');
    }
    try {
      final txHash = await service.stakeTokens(walletAddress, amount, privateKey);
      if (kDebugMode) {
        print('Stake transaction created: $txHash');
      }
      return txHash;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to stake tokens: $e');
      }
      rethrow;
    }
  }

  /// Unstake tokens on a specific network
  Future<String> unstakeTokens({
    required BlockchainNetwork network,
    required String walletAddress,
    required double amount,
    required String privateKey,
  }) async {
    final service = _multiChainManager.getService(network);
    if (service == null) {
      throw Exception('Network service not available');
    }
    try {
      final txHash = await service.unstakeTokens(walletAddress, amount, privateKey);
      if (kDebugMode) {
        print('Unstake transaction created: $txHash');
      }
      return txHash;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to unstake tokens: $e');
      }
      rethrow;
    }
  }
}
