import 'dart:async';
import '../models/blockchain_types.dart';

/// Base interface for blockchain-specific implementations
abstract class BlockchainService {
  /// Get current network configuration
  ChainConfig get config;

  /// Get current network statistics
  Future<NetworkStats> getNetworkStats();

  /// Initialize the blockchain service
  Future<void> initialize();

  /// Check if the network is available
  Future<bool> isNetworkAvailable();

  /// Get the current gas price
  Future<double> getGasPrice();

  /// Estimate gas for a transaction
  Future<double> estimateGas(BlockchainTransaction transaction);

  /// Get balance for an address
  Future<double> getBalance(String address);

  /// Get transaction details
  Future<BlockchainTransaction> getTransaction(String txHash);

  /// Send a transaction
  Future<String> sendTransaction(BlockchainTransaction transaction);

  /// Sign a transaction
  Future<SignedTransaction> signTransaction(BlockchainTransaction transaction, String privateKey);

  /// Validate a transaction
  Future<bool> validateTransaction(BlockchainTransaction transaction);

  /// Get transaction receipt
  Future<TransactionReceipt> getTransactionReceipt(String txHash);

  /// Subscribe to new blocks
  Stream<Block> subscribeToBlocks();

  /// Subscribe to address transactions
  Stream<BlockchainTransaction> subscribeToAddress(String address);

  /// Get transaction history for an address
  Future<List<BlockchainTransaction>> getTransactionHistory(String address);

  /// Call a smart contract method
  Future<dynamic> callContractMethod(String contractAddress, String methodName, List<dynamic> params);

  /// Send a contract transaction
  Future<String> sendContractTransaction(String contractAddress, String methodName, List<dynamic> params, String privateKey);

  /// Get staking information
  Future<StakingStats> getStakingInfo(String walletAddress);

  /// Stake tokens
  Future<String> stakeTokens(String walletAddress, double amount, String privateKey);

  /// Unstake tokens
  Future<String> unstakeTokens(String walletAddress, double amount, String privateKey);

  /// Get supported target chains for bridging
  List<BlockchainNetwork> getSupportedTargetChains();

  /// Create a bridge transaction
  Future<String> createBridgeTransaction({
    required BlockchainNetwork targetChain,
    required String targetAddress,
    required double amount,
    required String privateKey,
  });

  /// Dispose resources
  Future<void> dispose();
}

/// Base interface for investment operations
abstract class InvestmentService {
  /// Get available investment pools
  Future<List<InvestmentPool>> getAvailablePools();

  /// Create an investment
  Future<Investment> createInvestment({
    required String poolId,
    required double amount,
    required String walletAddress,
    required String privateKey,
  });

  /// Withdraw an investment
  Future<String> withdrawInvestment({
    required String investmentId,
    required String privateKey,
  });

  /// Get investment statistics
  Future<InvestmentStats> getInvestmentStats(String walletAddress);
}

/// Base interface for staking operations
abstract class StakingService {
  /// Get available validators
  Future<List<Validator>> getValidators();

  /// Create staking position
  Future<StakingPosition> createStakingPosition({
    required String validatorId,
    required double amount,
    required String walletAddress,
    required String privateKey,
  });

  /// Withdraw staking position
  Future<String> withdrawStakingPosition({
    required String positionId,
    required String privateKey,
  });

  /// Claim staking rewards
  Future<String> claimStakingRewards({
    required String positionId,
    required String privateKey,
  });

  /// Get staking statistics
  Future<StakingStats> getStakingStats(String walletAddress);
}

/// Base interface for bridging operations
abstract class BridgeService {
  /// Get supported chains for bridging
  List<BlockchainNetwork> getSupportedTargetChains();

  /// Get bridge fee
  Future<double> getBridgeFee({
    required BlockchainNetwork targetChain,
    required double amount,
  });

  /// Create bridge transaction
  Future<BridgeTransaction> createBridgeTransaction({
    required BlockchainNetwork targetChain,
    required String targetAddress,
    required double amount,
    required String privateKey,
  });

  /// Get bridge transaction status
  Future<BridgeStatus> getBridgeStatus(String bridgeId);
}

/// Base class for blockchain transactions
abstract class BlockchainTransaction {
  final String id;
  final String fromAddress;
  final String toAddress;
  final double amount;
  final double gasPrice;
  final int gasLimit;
  final String? data;
  final TransactionType type;
  final DateTime timestamp;
  final TransactionStatus status;

  const BlockchainTransaction({
    required this.id,
    required this.fromAddress,
    required this.toAddress,
    required this.amount,
    required this.gasPrice,
    required this.gasLimit,
    this.data,
    required this.type,
    required this.timestamp,
    required this.status,
  });

  Map<String, dynamic> toJson();
}

/// Base class for signed transactions
abstract class SignedTransaction {
  final BlockchainTransaction transaction;
  final String signature;
  final String hash;

  const SignedTransaction({
    required this.transaction,
    required this.signature,
    required this.hash,
  });

  Map<String, dynamic> toJson();
}

/// Base class for transaction receipts
abstract class TransactionReceipt {
  final String transactionHash;
  final int blockNumber;
  final String blockHash;
  final int confirmations;
  final bool status;
  final double gasUsed;
  final List<TransactionEvent> events;

  const TransactionReceipt({
    required this.transactionHash,
    required this.blockNumber,
    required this.blockHash,
    required this.confirmations,
    required this.status,
    required this.gasUsed,
    required this.events,
  });

  Map<String, dynamic> toJson();
}

/// Base class for blockchain blocks
abstract class Block {
  final String hash;
  final int number;
  final String parentHash;
  final DateTime timestamp;
  final List<String> transactions;

  const Block({
    required this.hash,
    required this.number,
    required this.parentHash,
    required this.timestamp,
    required this.transactions,
  });

  Map<String, dynamic> toJson();
} 