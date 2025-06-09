import 'package:flutter/foundation.dart';
import '../common/multi_chain_manager.dart';
import '../common/models/blockchain_types.dart';

class SmartContractService {
  final MultiChainManager _multiChainManager = MultiChainManager.instance;

  /// Call a read-only method on a smart contract
  Future<dynamic> callContractMethod({
    required BlockchainNetwork network,
    required String contractAddress,
    required String methodName,
    required List<dynamic> params,
  }) async {
    final service = _multiChainManager.getService(network);
    if (service == null) {
      throw Exception('Network service not available');
    }
    try {
      final result = await service.callContractMethod(contractAddress, methodName, params);
      if (kDebugMode) {
        print('Contract method $methodName called on $contractAddress with result: $result');
      }
      return result;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to call contract method: $e');
      }
      rethrow;
    }
  }

  /// Call a state-changing method on a smart contract (transaction)
  Future<String> sendContractTransaction({
    required BlockchainNetwork network,
    required String contractAddress,
    required String methodName,
    required List<dynamic> params,
    required String privateKey,
  }) async {
    final service = _multiChainManager.getService(network);
    if (service == null) {
      throw Exception('Network service not available');
    }
    try {
      final txHash = await service.sendContractTransaction(contractAddress, methodName, params, privateKey);
      if (kDebugMode) {
        print('Contract transaction $methodName sent on $contractAddress with txHash: $txHash');
      }
      return txHash;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to send contract transaction: $e');
      }
      rethrow;
    }
  }
}
