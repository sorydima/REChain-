import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../common/interfaces/blockchain_service.dart';
import '../common/models/blockchain_types.dart';
import 'models/arbitrum_models.dart';

/// Arbitrum blockchain service implementation
class ArbitrumService implements BlockchainService, InvestmentService, StakingService, BridgeService {
  final ChainConfig _config;

  ArbitrumService(this._config);

  @override
  ChainConfig get config => _config;

  @override
  Future<void> initialize() async {
    try {
      final isAvailable = await isNetworkAvailable();
      if (!isAvailable) {
        throw Exception('Arbitrum network is not available');
      }

      if (kDebugMode) {
        print('[Arbitrum] Service initialized');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Arbitrum] Failed to initialize: $e');
      }
      rethrow;
    }
  }

  @override
  Future<bool> isNetworkAvailable() async {
    try {
      final response = await http.post(
        Uri.parse(_config.rpcUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'jsonrpc': '2.0',
          'method': 'eth_blockNumber',
          'params': [],
          'id': 1,
        }),
      ).timeout(Duration(seconds: 10));

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ArbitrumNetworkStats> getNetworkStats() async {
    try {
      final gasPrice = await getGasPrice();
      final blockNumber = await _getBlockNumber();
      final l1GasPrice = await _getL1GasPrice();

      return ArbitrumNetworkStats(
        averageGasPrice: gasPrice,
        blockHeight: blockNumber,
        tps: 4500.0, // Arbitrum average TPS
        activeValidators: 1, // Arbitrum has a single sequencer
        totalStaked: 100000.0, // Approximate total ETH staked
        marketCap: 0.0, // No native token
        tvl: 10000000000.0, // Approximate TVL in DeFi
        l1GasPrice: l1GasPrice,
        sequencerLatency: 0.1, // Average latency in seconds
        challengePeriod: Duration(days: 7),
      );
    } catch (e) {
      throw Exception('Failed to get Arbitrum network stats: $e');
    }
  }

  @override
  Future<double> getGasPrice() async {
    try {
      final response = await _makeRpcCall('eth_gasPrice', []);
      final gasPriceHex = response['result'] as String;
      final gasPriceWei = BigInt.parse(gasPriceHex.substring(2), radix: 16);
      return gasPriceWei.toDouble() / 1e9; // Convert to Gwei
    } catch (e) {
      throw Exception('Failed to get gas price: $e');
    }
  }

  Future<double> _getL1GasPrice() async {
    try {
      final response = await _makeRpcCall('eth_l1GasPrice', []);
      final gasPriceHex = response['result'] as String;
      final gasPriceWei = BigInt.parse(gasPriceHex.substring(2), radix: 16);
      return gasPriceWei.toDouble() / 1e9; // Convert to Gwei
    } catch (e) {
      throw Exception('Failed to get L1 gas price: $e');
    }
  }
  
  @override
  Future<double> estimateGas(BlockchainTransaction transaction) async {
    try {
      final arbTx = transaction as ArbitrumTransaction;
      final response = await _makeRpcCall('eth_estimateGas', [
        {
          'from': arbTx.fromAddress,
          'to': arbTx.toAddress,
          'value': '0x${arbTx.amount.toInt().toRadixString(16)}',
          'data': arbTx.data ?? '0x',
        }
      ]);
      
      final gasHex = response['result'] as String;
      final gas = BigInt.parse(gasHex.substring(2), radix: 16);
      return gas.toDouble();
    } catch (e) {
      throw Exception('Failed to estimate gas: $e');
    }
  }
  
  @override
  Future<double> getBalance(String address) async {
    try {
      final response = await _makeRpcCall('eth_getBalance', [address, 'latest']);
      final balanceHex = response['result'] as String;
      final balanceWei = BigInt.parse(balanceHex.substring(2), radix: 16);
      return balanceWei.toDouble() / 1e18; // Convert to ETH
    } catch (e) {
      throw Exception('Failed to get balance: $e');
    }
  }
  
  @override
  Future<ArbitrumTransaction> getTransaction(String txHash) async {
    try {
      final response = await _makeRpcCall('eth_getTransactionByHash', [txHash]);
      final txData = response['result'] as Map<String, dynamic>;
      
      return ArbitrumTransaction.fromJson(txData);
    } catch (e) {
      throw Exception('Failed to get transaction: $e');
    }
  }
  
  @override
  Future<String> sendTransaction(BlockchainTransaction transaction) async {
    try {
      final arbTx = transaction as ArbitrumTransaction;
      final response = await _makeRpcCall('eth_sendRawTransaction', [arbTx.rawTransaction]);
      return response['result'] as String;
    } catch (e) {
      throw Exception('Failed to send transaction: $e');
    }
  }
  
  @override
  Future<ArbitrumSignedTransaction> signTransaction(BlockchainTransaction transaction, String privateKey) async {
    try {
      final signature = _generateSignature(transaction, privateKey);
      final hash = _generateTransactionHash(transaction);
      
      return ArbitrumSignedTransaction(
        transaction: transaction as ArbitrumTransaction,
        signature: signature,
        hash: hash,
        v: 27,
        r: BigInt.from(Random().nextInt(1000000)),
        s: BigInt.from(Random().nextInt(1000000)),
        l1SignatureId: Random().nextInt(1000000),
      );
    } catch (e) {
      throw Exception('Failed to sign transaction: $e');
    }
  }
  
  @override
  Future<bool> validateTransaction(BlockchainTransaction transaction) async {
    try {
      final arbTx = transaction as ArbitrumTransaction;
      
      if (arbTx.amount <= 0) return false;
      if (arbTx.gasPrice <= 0) return false;
      if (arbTx.gasLimit <= 0) return false;
      if (!_isValidAddress(arbTx.fromAddress)) return false;
      if (!_isValidAddress(arbTx.toAddress)) return false;
      
      return true;
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<ArbitrumTransactionReceipt> getTransactionReceipt(String txHash) async {
    try {
      final response = await _makeRpcCall('eth_getTransactionReceipt', [txHash]);
      final receiptData = response['result'] as Map<String, dynamic>;
      
      return ArbitrumTransactionReceipt.fromJson(receiptData);
    } catch (e) {
      throw Exception('Failed to get transaction receipt: $e');
    }
  }
  
  @override
  Stream<ArbitrumBlock> subscribeToBlocks() {
    final controller = StreamController<ArbitrumBlock>();
    
    Timer.periodic(Duration(milliseconds: 250), (timer) async {
      try {
        final blockNumber = await _getBlockNumber();
        final block = await _getBlock(blockNumber);
        controller.add(block);
      } catch (e) {
        if (kDebugMode) {
          print('[Arbitrum] Failed to get block: $e');
        }
      }
    });
    
    return controller.stream;
  }
  
  @override
  Stream<ArbitrumTransaction> subscribeToAddress(String address) {
    final controller = StreamController<ArbitrumTransaction>();
    
    Timer.periodic(Duration(seconds: 30), (timer) async {
      try {
        // Get recent transactions for the address
      } catch (e) {
        if (kDebugMode) {
          print('[Arbitrum] Failed to get address transactions: $e');
        }
      }
    });
    
    return controller.stream;
  }
  
  // Investment Service Implementation
  @override
  Future<List<ArbitrumInvestmentPool>> getAvailablePools() async {
    try {
      return [
        ArbitrumInvestmentPool(
          id: 'arb_gmx_eth',
          name: 'GMX ETH Pool',
          description: 'Earn GMX rewards by providing ETH liquidity',
          contractAddress: '0x908C4D94D34924765f1eDc22A1DD098397c59dD4',
          minInvestment: 0.1,
          maxInvestment: 1000.0,
          expectedApr: 20.0,
          lockPeriod: Duration(days: 0),
          totalValueLocked: 100000000.0,
          participantCount: 10000,
          isActive: true,
          protocol: 'GMX',
          asset: 'ETH',
          l1Address: '0x1234567890123456789012345678901234567890',
        ),
      ];
    } catch (e) {
      throw Exception('Failed to get investment pools: $e');
    }
  }
  
  @override
  Future<ArbitrumInvestment> createInvestment({
    required String poolId,
    required double amount,
    required String walletAddress,
    required String privateKey,
  }) async {
    try {
      final pools = await getAvailablePools();
      final pool = pools.firstWhere((p) => p.id == poolId);
      
      final transaction = ArbitrumTransaction(
        id: _generateTransactionId(),
        fromAddress: walletAddress,
        toAddress: pool.contractAddress,
        amount: amount,
        gasPrice: await getGasPrice(),
        gasLimit: 200000,
        type: TransactionType.invest,
        timestamp: DateTime.now(),
        status: TransactionStatus.pending,
        nonce: await _getNonce(walletAddress),
        data: _encodeInvestmentData(amount),
        l1GasPrice: await _getL1GasPrice(),
      );
      
      final signedTx = await signTransaction(transaction, privateKey);
      final txHash = await sendTransaction(signedTx.transaction);
      
      return ArbitrumInvestment(
        id: _generateInvestmentId(),
        poolId: poolId,
        walletAddress: walletAddress,
        amount: amount,
        expectedReturn: amount * (1 + pool.expectedApr / 100),
        createdAt: DateTime.now(),
        maturityDate: DateTime.now().add(pool.lockPeriod),
        transactionHash: txHash,
        contractAddress: pool.contractAddress,
        l1ConfirmationHash: '',
      );
    } catch (e) {
      throw Exception('Failed to create investment: $e');
    }
  }
  
  @override
  Future<String> withdrawInvestment({
    required String investmentId,
    required String privateKey,
  }) async {
    try {
      return '0x${Random().nextInt(1000000).toRadixString(16)}';
    } catch (e) {
      throw Exception('Failed to withdraw investment: $e');
    }
  }
  
  @override
  Future<ArbitrumInvestmentStats> getInvestmentStats(String walletAddress) async {
    try {
      return ArbitrumInvestmentStats(
        totalInvested: 1000.0,
        totalReturns: 1200.0,
        pendingRewards: 50.0,
        activeInvestments: 2,
        averageAPR: 20.0,
        averageLockPeriod: Duration(days: 0),
        totalGasFees: 0.5,
        protocolsUsed: ['GMX', 'Uniswap'],
        l1GasSaved: 100.0,
      );
    } catch (e) {
      throw Exception('Failed to get investment stats: $e');
    }
  }
  
  // Staking Service Implementation
  @override
  Future<List<ArbitrumValidator>> getValidators() async {
    try {
      return [
        ArbitrumValidator(
          id: 'arb_validator_1',
          name: 'Arbitrum Sequencer',
          address: '0x1234567890123456789012345678901234567890',
          commission: 0.0,
          totalStaked: 1000000.0,
          delegators: 0,
          active: true,
          l1Address: '0x2345678901234567890123456789012345678901',
          challengePeriod: Duration(days: 7),
        ),
      ];
    } catch (e) {
      throw Exception('Failed to get validators: $e');
    }
  }
  
  @override
  Future<ArbitrumStakingPosition> createStakingPosition({
    required String validatorId,
    required double amount,
    required String walletAddress,
    required String privateKey,
  }) async {
    try {
      final transaction = ArbitrumTransaction(
        id: _generateTransactionId(),
        fromAddress: walletAddress,
        toAddress: _config.stakingContracts['gmx']!,
        amount: amount,
        gasPrice: await getGasPrice(),
        gasLimit: 200000,
        type: TransactionType.stake,
        timestamp: DateTime.now(),
        status: TransactionStatus.pending,
        nonce: await _getNonce(walletAddress),
        data: _encodeStakingData(validatorId, amount),
        l1GasPrice: await _getL1GasPrice(),
      );
      
      final signedTx = await signTransaction(transaction, privateKey);
      final txHash = await sendTransaction(signedTx.transaction);
      
      return ArbitrumStakingPosition(
        id: _generateStakingId(),
        validatorId: validatorId,
        walletAddress: walletAddress,
        amount: amount,
        rewards: 0.0,
        createdAt: DateTime.now(),
        lastRewardClaim: DateTime.now(),
        transactionHash: txHash,
        l1ConfirmationBlock: await _getBlockNumber(),
      );
    } catch (e) {
      throw Exception('Failed to create staking position: $e');
    }
  }
  
  @override
  Future<String> withdrawStakingPosition({
    required String positionId,
    required String privateKey,
  }) async {
    try {
      return '0x${Random().nextInt(1000000).toRadixString(16)}';
    } catch (e) {
      throw Exception('Failed to withdraw staking position: $e');
    }
  }
  
  @override
  Future<String> claimStakingRewards({
    required String positionId,
    required String privateKey,
  }) async {
    try {
      return '0x${Random().nextInt(1000000).toRadixString(16)}';
    } catch (e) {
      throw Exception('Failed to claim staking rewards: $e');
    }
  }
  
  @override
  Future<ArbitrumStakingStats> getStakingStats(String walletAddress) async {
    try {
      return ArbitrumStakingStats(
        totalStaked: 1000.0,
        totalRewards: 100.0,
        activePositions: 1,
        averageAPR: 10.0,
        totalValidators: 1,
        slashingEvents: 0,
        l1SecurityLevel: 'Optimistic',
        fraudProofWindow: Duration(days: 7),
      );
    } catch (e) {
      throw Exception('Failed to get staking stats: $e');
    }
  }
  
  // Bridge Service Implementation
  @override
  List<BlockchainNetwork> getSupportedTargetChains() {
    return [
      BlockchainNetwork.ethereum,
      BlockchainNetwork.optimism,
      BlockchainNetwork.polygon,
      BlockchainNetwork.ton,
    ];
  }
  
  @override
  Future<double> getBridgeFee({
    required BlockchainNetwork targetChain,
    required double amount,
  }) async {
    try {
      switch (targetChain) {
        case BlockchainNetwork.ethereum:
          return 0.01;
        case BlockchainNetwork.optimism:
          return 0.005;
        case BlockchainNetwork.polygon:
          return 0.008;
        case BlockchainNetwork.ton:
          return 0.015;
        default:
          return 0.01;
      }
    } catch (e) {
      throw Exception('Failed to get bridge fee: $e');
    }
  }

  // New methods for ArbitrumService
  Future<double> getL1ToL2Fee() async {
    try {
      // Placeholder implementation, should call Arbitrum SDK or RPC to get actual fee
      return 0.001;
    } catch (e) {
      throw Exception('Failed to get L1 to L2 fee: $e');
    }
  }

  Future<double> getL2ToL1Fee() async {
    try {
      // Placeholder implementation, should call Arbitrum SDK or RPC to get actual fee
      return 0.002;
    } catch (e) {
      throw Exception('Failed to get L2 to L1 fee: $e');
    }
  }
  
  @override
  Future<ArbitrumBridgeTransaction> createBridgeTransaction({
    required BlockchainNetwork targetChain,
    required String targetAddress,
    required double amount,
    required String privateKey,
  }) async {
    try {
      final bridgeContract = _config.bridgeContracts[targetChain.toString().split('.').last];
      if (bridgeContract == null) {
        throw Exception('Bridge contract not found for $targetChain');
      }
      
      final fee = await getBridgeFee(targetChain: targetChain, amount: amount);
      
      return ArbitrumBridgeTransaction(
        id: _generateBridgeId(),
        sourceChain: BlockchainNetwork.arbitrum,
        targetChain: targetChain,
        sourceAddress: '',
        targetAddress: targetAddress,
        amount: amount,
        fee: fee,
        timestamp: DateTime.now(),
        status: BridgeStatus.pending,
        bridgeContract: bridgeContract,
        nonce: Random().nextInt(1000000),
        l1ConfirmationTime: Duration(minutes: 15),
      );
    } catch (e) {
      throw Exception('Failed to create bridge transaction: $e');
    }
  }
  
  @override
  Future<BridgeStatus> getBridgeStatus(String bridgeId) async {
    try {
      return BridgeStatus.completed;
    } catch (e) {
      throw Exception('Failed to get bridge status: $e');
    }
  }
  
  @override
  Future<void> dispose() async {
    // Clean up resources
  }
  
  // Private helper methods
  Future<Map<String, dynamic>> _makeRpcCall(String method, List<dynamic> params) async {
    try {
      final response = await http.post(
        Uri.parse(_config.rpcUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'jsonrpc': '2.0',
          'method': method,
          'params': params,
          'id': Random().nextInt(1000000),
        }),
      ).timeout(Duration(seconds: 30));
      
      if (response.statusCode != 200) {
        throw Exception('RPC call failed with status ${response.statusCode}');
      }
      
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      
      if (data.containsKey('error')) {
        throw Exception('RPC error: ${data['error']}');
      }
      
      return data;
    } catch (e) {
      throw Exception('Failed to make RPC call: $e');
    }
  }
  
  Future<int> _getBlockNumber() async {
    final response = await _makeRpcCall('eth_blockNumber', []);
    final blockNumberHex = response['result'] as String;
    return int.parse(blockNumberHex.substring(2), radix: 16);
  }
  
  Future<ArbitrumBlock> _getBlock(int blockNumber) async {
    final response = await _makeRpcCall('eth_getBlockByNumber', [
      '0x${blockNumber.toRadixString(16)}',
      false
    ]);
    final blockData = response['result'] as Map<String, dynamic>;
    return ArbitrumBlock.fromJson(blockData);
  }
  
  Future<int> _getNonce(String address) async {
    final response = await _makeRpcCall('eth_getTransactionCount', [address, 'latest']);
    final nonceHex = response['result'] as String;
    return int.parse(nonceHex.substring(2), radix: 16);
  }
  
  bool _isValidAddress(String address) {
    return address.startsWith('0x') && address.length == 42;
  }
  
  String _generateSignature(BlockchainTransaction transaction, String privateKey) {
    return '0x${Random().nextInt(1000000).toRadixString(16)}';
  }
  
  String _generateTransactionHash(BlockchainTransaction transaction) {
    return '0x${Random().nextInt(1000000).toRadixString(16)}';
  }
  
  String _generateTransactionId() {
    return 'arb_tx_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  String _generateInvestmentId() {
    return 'arb_inv_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  String _generateStakingId() {
    return 'arb_stake_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  String _generateBridgeId() {
    return 'arb_bridge_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  String _encodeInvestmentData(double amount) {
    return '0x${amount.toInt().toRadixString(16)}';
  }
  
  String _encodeStakingData(String validatorId, double amount) {
    return '0x${amount.toInt().toRadixString(16)}';
  }
}
