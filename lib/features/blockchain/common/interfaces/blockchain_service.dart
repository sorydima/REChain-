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
  final double gasLimit;
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

/// Base class for transaction events
abstract class TransactionEvent {
  final String name;
  final Map<String, dynamic> data;

  const TransactionEvent({
    required this.name,
    required this.data,
  });

  Map<String, dynamic> toJson();
}

/// Transaction status enum
enum TransactionStatus {
  pending,
  confirmed,
  failed,
  cancelled
}

/// Bridge transaction status
enum BridgeStatus {
  pending,
  processing,
  completed,
  failed
}

/// Base class for validators
abstract class Validator {
  final String id;
  final String name;
  final String address;
  final double commission;
  final double totalStaked;
  final int delegators;
  final bool active;

  const Validator({
    required this.id,
    required this.name,
    required this.address,
    required this.commission,
    required this.totalStaked,
    required this.delegators,
    required this.active,
  });

  Map<String, dynamic> toJson();
}

/// Base class for investment pools
abstract class InvestmentPool {
  final String id;
  final String name;
  final String description;
  final double minInvestment;
  final double maxInvestment;
  final double expectedApr;
  final Duration lockPeriod;
  final double totalValueLocked;
  final int participantCount;
  final bool isActive;

  const InvestmentPool({
    required this.id,
    required this.name,
    required this.description,
    required this.minInvestment,
    required this.maxInvestment,
    required this.expectedApr,
    required this.lockPeriod,
    required this.totalValueLocked,
    required this.participantCount,
    required this.isActive,
  });

  Map<String, dynamic> toJson();
}

/// Base class for investments
abstract class Investment {
  final String id;
  final String poolId;
  final String walletAddress;
  final double amount;
  final double expectedReturn;
  final DateTime createdAt;
  final DateTime maturityDate;

  const Investment({
    required this.id,
    required this.poolId,
    required this.walletAddress,
    required this.amount,
    required this.expectedReturn,
    required this.createdAt,
    required this.maturityDate,
  });

  Map<String, dynamic> toJson();
}

/// Base class for staking positions
abstract class StakingPosition {
  final String id;
  final String validatorId;
  final String walletAddress;
  final double amount;
  final double rewards;
  final DateTime createdAt;
  final DateTime lastRewardClaim;

  const StakingPosition({
    required this.id,
    required this.validatorId,
    required this.walletAddress,
    required this.amount,
    required this.rewards,
    required this.createdAt,
    required this.lastRewardClaim,
  });

  Map<String, dynamic> toJson();
}

/// Base class for bridge transactions
abstract class BridgeTransaction {
  final String id;
  final BlockchainNetwork sourceChain;
  final BlockchainNetwork targetChain;
  final String sourceAddress;
  final String targetAddress;
  final double amount;
  final double fee;
  final DateTime timestamp;
  final BridgeStatus status;

  const BridgeTransaction({
    required this.id,
    required this.sourceChain,
    required this.targetChain,
    required this.sourceAddress,
    required this.targetAddress,
    required this.amount,
    required this.fee,
    required this.timestamp,
    required this.status,
  });

  Map<String, dynamic> toJson();
}
