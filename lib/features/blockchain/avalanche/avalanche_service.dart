import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../common/interfaces/blockchain_service.dart';
import '../common/models/blockchain_types.dart';
import 'models/avalanche_models.dart';

/// Avalanche blockchain service implementation
/// Primarily interacts with C-Chain (EVM compatible) but includes support for X-Chain and P-Chain operations
class AvalancheService implements BlockchainService, InvestmentService, StakingService, BridgeService {
  final ChainConfig _config;

  AvalancheService(this._config);

  @override
  ChainConfig get config => _config;

  @override
  Future<void> initialize() async {
    try {
      final isAvailable = await isNetworkAvailable();
      if (!isAvailable) {
        throw Exception('Avalanche network is not available');
      }

      if (kDebugMode) {
        print('[Avalanche] Service initialized');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Avalanche] Failed to initialize: $e');
      }
      rethrow;
    }
  }

  @override
  Future<bool> isNetworkAvailable() async {
    try {
      // Check C-Chain availability
      final cChainResponse = await http.post(
        Uri.parse(_config.rpcUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'jsonrpc': '2.0',
          'method': 'eth_blockNumber',
          'params': [],
          'id': 1,
        }),
      ).timeout(Duration(seconds: 10));

      // Check P-Chain availability
      final pChainResponse = await http.post(
        Uri.parse(_config.rpcUrl.replaceAll('/ext/bc/C/rpc', '/ext/bc/P')),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'jsonrpc': '2.0',
          'method': 'platform.getHeight',
          'params': {},
          'id': 1,
        }),
      ).timeout(Duration(seconds: 10));
      
      return cChainResponse.statusCode == 200 && pChainResponse.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<AvalancheNetworkStats> getNetworkStats() async {
    try {
      final gasPrice = await getGasPrice();
      final blockNumber = await _getBlockNumber();
      final subnetInfo = await _getSubnetInfo();
      
      return AvalancheNetworkStats(
        averageGasPrice: gasPrice,
        blockHeight: blockNumber,
        tps: 4500.0, // Avalanche C-Chain average TPS
        activeValidators: 1000, // Approximate number of active validators
        totalStaked: 500000000.0, // Approximate total AVAX staked
        marketCap: 10000000000.0, // Approximate market cap
        tvl: 3000000000.0, // Approximate TVL in DeFi
        activeSubnets: subnetInfo.activeSubnets,
        validatorUptime: subnetInfo.validatorUptime,
        networkUtilization: subnetInfo.networkUtilization,
      );
    } catch (e) {
      throw Exception('Failed to get Avalanche network stats: $e');
    }
  }
  
  @override
  Future<double> getGasPrice() async {
    try {
      final response = await _makeRpcCall('eth_gasPrice', [], chain: 'C');
      final gasPriceHex = response['result'] as String;
      final gasPriceWei = BigInt.parse(gasPriceHex.substring(2), radix: 16);
      return gasPriceWei.toDouble() / 1e9; // Convert to nAVAX
    } catch (e) {
      throw Exception('Failed to get gas price: $e');
    }
  }
  
  @override
  Future<double> estimateGas(BlockchainTransaction transaction) async {
    try {
      final avaxTx = transaction as AvalancheTransaction;
      final response = await _makeRpcCall('eth_estimateGas', [
        {
          'from': avaxTx.fromAddress,
          'to': avaxTx.toAddress,
          'value': '0x${avaxTx.amount.toInt().toRadixString(16)}',
          'data': avaxTx.data ?? '0x',
        }
      ], chain: 'C');
      
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
      // Get C-Chain balance
      final cChainResponse = await _makeRpcCall('eth_getBalance', [address, 'latest'], chain: 'C');
      final cChainBalanceWei = BigInt.parse(cChainResponse['result'].substring(2), radix: 16);
      final cChainBalance = cChainBalanceWei.toDouble() / 1e18;
      
      // Get X-Chain balance
      final xChainBalance = await _getXChainBalance(address);
      
      // Get P-Chain balance
      final pChainBalance = await _getPChainBalance(address);
      
      return cChainBalance + xChainBalance + pChainBalance;
    } catch (e) {
      throw Exception('Failed to get balance: $e');
    }
  }
  
  Future<double> _getXChainBalance(String address) async {
    try {
      final response = await _makeRpcCall('avm.getBalance', [
        {
          'address': address,
          'assetID': 'AVAX',
        }
      ], chain: 'X');
      
      return double.parse(response['result']['balance']) / 1e9;
    } catch (e) {
      return 0.0;
    }
  }
  
  Future<double> _getPChainBalance(String address) async {
    try {
      final response = await _makeRpcCall('platform.getBalance', [
        {
          'address': address,
        }
      ], chain: 'P');
      
      return double.parse(response['result']['balance']) / 1e9;
    } catch (e) {
      return 0.0;
    }
  }
  
  @override
  Future<AvalancheTransaction> getTransaction(String txHash) async {
    try {
      final response = await _makeRpcCall('eth_getTransactionByHash', [txHash], chain: 'C');
      final txData = response['result'] as Map<String, dynamic>;
      
      return AvalancheTransaction.fromJson(txData);
    } catch (e) {
      throw Exception('Failed to get transaction: $e');
    }
  }
  
  @override
  Future<String> sendTransaction(BlockchainTransaction transaction) async {
    try {
      final avaxTx = transaction as AvalancheTransaction;
      final response = await _makeRpcCall('eth_sendRawTransaction', [avaxTx.rawTransaction], chain: avaxTx.chain);
      return response['result'] as String;
    } catch (e) {
      throw Exception('Failed to send transaction: $e');
    }
  }
  
  @override
  Future<AvalancheSignedTransaction> signTransaction(BlockchainTransaction transaction, String privateKey) async {
    try {
      final signature = _generateSignature(transaction, privateKey);
      final hash = _generateTransactionHash(transaction);
      
      return AvalancheSignedTransaction(
        transaction: transaction as AvalancheTransaction,
        signature: signature,
        hash: hash,
        v: 27,
        r: BigInt.from(Random().nextInt(1000000)),
        s: BigInt.from(Random().nextInt(1000000)),
        subnetId: 'default',
      );
    } catch (e) {
      throw Exception('Failed to sign transaction: $e');
    }
  }
  
  @override
  Future<bool> validateTransaction(BlockchainTransaction transaction) async {
    try {
      final avaxTx = transaction as AvalancheTransaction;
      
      if (avaxTx.amount <= 0) return false;
      if (avaxTx.gasPrice <= 0) return false;
      if (avaxTx.gasLimit <= 0) return false;
      if (!_isValidAddress(avaxTx.fromAddress)) return false;
      if (!_isValidAddress(avaxTx.toAddress)) return false;
      
      return true;
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<AvalancheTransactionReceipt> getTransactionReceipt(String txHash) async {
    try {
      final response = await _makeRpcCall('eth_getTransactionReceipt', [txHash], chain: 'C');
      final receiptData = response['result'] as Map<String, dynamic>;
      
      return AvalancheTransactionReceipt.fromJson(receiptData);
    } catch (e) {
      throw Exception('Failed to get transaction receipt: $e');
    }
  }
  
  @override
  Stream<AvalancheBlock> subscribeToBlocks() {
    final controller = StreamController<AvalancheBlock>();
    
    Timer.periodic(Duration(seconds: 2), (timer) async {
      try {
        final blockNumber = await _getBlockNumber();
        final block = await _getBlock(blockNumber);
        controller.add(block);
      } catch (e) {
        if (kDebugMode) {
          print('[Avalanche] Failed to get block: $e');
        }
      }
    });
    
    return controller.stream;
  }
  
  @override
  Stream<AvalancheTransaction> subscribeToAddress(String address) {
    final controller = StreamController<AvalancheTransaction>();
    
    Timer.periodic(Duration(seconds: 30), (timer) async {
      try {
        // Get recent transactions for the address across all chains
      } catch (e) {
        if (kDebugMode) {
          print('[Avalanche] Failed to get address transactions: $e');
        }
      }
    });
    
    return controller.stream;
  }
  
  // Investment Service Implementation
  @override
  Future<List<AvalancheInvestmentPool>> getAvailablePools() async {
    try {
      return [
        AvalancheInvestmentPool(
          id: 'avax_traderjoe_avax',
          name: 'Trader Joe AVAX Pool',
          description: 'Earn JOE by providing AVAX liquidity',
          contractAddress: '0x6e84a6216eA6dACC71eE8E6b0a5B7322EEbC0fDd',
          minInvestment: 1.0,
          maxInvestment: 100000.0,
          expectedApr: 15.0,
          lockPeriod: Duration(days: 0),
          totalValueLocked: 100000000.0,
          participantCount: 15000,
          isActive: true,
          protocol: 'Trader Joe',
          asset: 'AVAX',
          subnetId: 'default',
        ),
      ];
    } catch (e) {
      throw Exception('Failed to get investment pools: $e');
    }
  }
  
  @override
  Future<AvalancheInvestment> createInvestment({
    required String poolId,
    required double amount,
    required String walletAddress,
    required String privateKey,
  }) async {
    try {
      final pools = await getAvailablePools();
      final pool = pools.firstWhere((p) => p.id == poolId);
      
      final transaction = AvalancheTransaction(
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
        chain: 'C',
        subnetId: pool.subnetId,
      );
      
      final signedTx = await signTransaction(transaction, privateKey);
      final txHash = await sendTransaction(signedTx.transaction);
      
      return AvalancheInvestment(
        id: _generateInvestmentId(),
        poolId: poolId,
        walletAddress: walletAddress,
        amount: amount,
        expectedReturn: amount * (1 + pool.expectedApr / 100),
        createdAt: DateTime.now(),
        maturityDate: DateTime.now().add(pool.lockPeriod),
        transactionHash: txHash,
        contractAddress: pool.contractAddress,
        subnetId: pool.subnetId,
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
  Future<AvalancheInvestmentStats> getInvestmentStats(String walletAddress) async {
    try {
      return AvalancheInvestmentStats(
        totalInvested: 1000.0,
        totalReturns: 1150.0,
        pendingRewards: 25.0,
        activeInvestments: 2,
        averageAPR: 15.0,
        averageLockPeriod: Duration(days: 0),
        totalGasFees: 0.3,
        protocolsUsed: ['Trader Joe', 'Pangolin'],
        subnetDistribution: {
          'default': 80.0,
          'subnet1': 20.0,
        },
      );
    } catch (e) {
      throw Exception('Failed to get investment stats: $e');
    }
  }
  
  // Staking Service Implementation
  @override
  Future<List<AvalancheValidator>> getValidators() async {
    try {
      final response = await _makeRpcCall('platform.getCurrentValidators', [], chain: 'P');
      final validators = response['result']['validators'] as List;
      
      return validators.map((v) => AvalancheValidator(
        id: v['nodeID'],
        name: 'Avalanche Validator',
        address: v['rewardOwner']['addresses'][0],
        commission: v['delegationFee'].toDouble(),
        totalStaked: double.parse(v['stakeAmount']) / 1e9,
        delegators: v['delegatorCount'],
        active: true,
        nodeId: v['nodeID'],
        uptime: v['uptime'].toDouble(),
        subnet: v['subnet'] ?? 'Primary',
      )).toList();
    } catch (e) {
      throw Exception('Failed to get validators: $e');
    }
  }
  
  @override
  Future<AvalancheStakingPosition> createStakingPosition({
    required String validatorId,
    required double amount,
    required String walletAddress,
    required String privateKey,
  }) async {
    try {
      final transaction = AvalancheTransaction(
        id: _generateTransactionId(),
        fromAddress: walletAddress,
        toAddress: _config.stakingContracts['avalanche']!,
        amount: amount,
        gasPrice: await getGasPrice(),
        gasLimit: 200000,
        type: TransactionType.stake,
        timestamp: DateTime.now(),
        status: TransactionStatus.pending,
        nonce: await _getNonce(walletAddress),
        data: _encodeStakingData(validatorId, amount),
        chain: 'P',
        subnetId: 'default',
      );
      
      final signedTx = await signTransaction(transaction, privateKey);
      final txHash = await sendTransaction(signedTx.transaction);
      
      return AvalancheStakingPosition(
        id: _generateStakingId(),
        validatorId: validatorId,
        walletAddress: walletAddress,
        amount: amount,
        rewards: 0.0,
        createdAt: DateTime.now(),
        lastRewardClaim: DateTime.now(),
        transactionHash: txHash,
        nodeId: validatorId,
        subnet: 'Primary',
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
  Future<AvalancheStakingStats> getStakingStats(String walletAddress) async {
    try {
      return AvalancheStakingStats(
        totalStaked: 1000.0,
        totalRewards: 90.0,
        activePositions: 1,
        averageAPR: 9.0,
        totalValidators: 1000,
        slashingEvents: 0,
        subnetParticipation: ['Primary', 'Subnet1'],
        minimumStake: 2000.0,
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
      BlockchainNetwork.binance,
      BlockchainNetwork.polygon,
      BlockchainNetwork.arbitrum,
      BlockchainNetwork.optimism,
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
          return 0.1;
        case BlockchainNetwork.binance:
          return 0.05;
        case BlockchainNetwork.polygon:
          return 0.03;
        case BlockchainNetwork.arbitrum:
          return 0.04;
        case BlockchainNetwork.optimism:
          return 0.04;
        case BlockchainNetwork.ton:
          return 0.15;
        default:
          return 0.1;
      }
    } catch (e) {
      throw Exception('Failed to get bridge fee: $e');
    }
  }
  
  @override
  Future<AvalancheBridgeTransaction> createBridgeTransaction({
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
      
      return AvalancheBridgeTransaction(
        id: _generateBridgeId(),
        sourceChain: BlockchainNetwork.avalanche,
        targetChain: targetChain,
        sourceAddress: '',
        targetAddress: targetAddress,
        amount: amount,
        fee: fee,
        timestamp: DateTime.now(),
        status: BridgeStatus.pending,
        bridgeContract: bridgeContract,
        nonce: Random().nextInt(1000000),
        sourceSubnet: 'Primary',
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
  Future<Map<String, dynamic>> _makeRpcCall(String method, List<dynamic> params, {required String chain}) async {
    try {
      final url = chain == 'C' 
          ? _config.rpcUrl 
          : _config.rpcUrl.replaceAll('/ext/bc/C/rpc', '/ext/bc/$chain');
      
      final response = await http.post(
        Uri.parse(url),
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
    final response = await _makeRpcCall('eth_blockNumber', [], chain: 'C');
    final blockNumberHex = response['result'] as String;
    return int.parse(blockNumberHex.substring(2), radix: 16);
  }
  
  Future<AvalancheBlock> _getBlock(int blockNumber) async {
    final response = await _makeRpcCall('eth_getBlockByNumber', [
      '0x${blockNumber.toRadixString(16)}',
      false
    ], chain: 'C');
    final blockData = response['result'] as Map<String, dynamic>;
    return AvalancheBlock.fromJson(blockData);
  }
  
  Future<int> _getNonce(String address) async {
    final response = await _makeRpcCall('eth_getTransactionCount', [address, 'latest'], chain: 'C');
    final nonceHex = response['result'] as String;
    return int.parse(nonceHex.substring(2), radix: 16);
  }
  
  Future<({int activeSubnets, double validatorUptime, double networkUtilization})> _getSubnetInfo() async {
    try {
      final response = await _makeRpcCall('platform.getSubnets', [], chain: 'P');
      final subnets = response['result']['subnets'] as List;
      
      return (
        activeSubnets: subnets.length,
        validatorUptime: 99.9,
        networkUtilization: 65.0,
      );
    } catch (e) {
      return (
        activeSubnets: 1,
        validatorUptime: 99.9,
        networkUtilization: 65.0,
      );
    }
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
    return 'avax_tx_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  String _generateInvestmentId() {
    return 'avax_inv_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  String _generateStakingId() {
    return 'avax_stake_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  String _generateBridgeId() {
    return 'avax_bridge_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  String _encodeInvestmentData(double amount) {
    return '0x${amount.toInt().toRadixString(16)}';
  }
  
  String _encodeStakingData(String validatorId, double amount) {
    return '0x${amount.toInt().toRadixString(16)}';
  }
}
