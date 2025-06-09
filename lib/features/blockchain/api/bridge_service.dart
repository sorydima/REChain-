import 'package:flutter/foundation.dart';
import '../common/multi_chain_manager.dart';
import '../common/models/blockchain_types.dart';

class BridgeService {
  final MultiChainManager _multiChainManager = MultiChainManager.instance;

  /// Create a bridge transaction from source to target chain
  Future<String> createBridgeTransaction({
    required BlockchainNetwork sourceChain,
    required BlockchainNetwork targetChain,
    required String fromAddress,
    required String toAddress,
    required double amount,
    required String privateKey,
  }) async {
    final sourceService = _multiChainManager.getService(sourceChain);
    if (sourceService == null) {
      throw Exception('Source chain service not available');
    }

    // Validate that target chain is supported by source chain for bridging
    final supportedTargets = sourceService.getSupportedTargetChains();
    if (!supportedTargets.contains(targetChain)) {
      throw Exception('Target chain not supported for bridging from source chain');
    }

    // Create the bridge transaction using the source chain service
    try {
      final txHash = await sourceService.createBridgeTransaction(
        targetChain: targetChain,
        targetAddress: toAddress,
        amount: amount,
        privateKey: privateKey,
      );
      if (kDebugMode) {
        print('Bridge transaction created: $txHash');
      }
      return txHash;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to create bridge transaction: $e');
      }
      rethrow;
    }
  }

  /// Monitor the status of a bridge transaction (stub for now)
  Future<String> getBridgeTransactionStatus(String txHash) async {
    // Implementation depends on blockchain event subscriptions or polling
    // For now, return a placeholder status
    return 'pending';
  }
}
