import 'package:flutter/foundation.dart';

// Investment Model
class TonInvestment {
  final String id;
  final String poolId;
  final String poolName;
  final String walletAddress;
  final double amount;
  final double expectedReturn;
  double actualReturn;
  InvestmentStatus status;
  final String transactionHash;
  String? withdrawalHash;
  final DateTime createdAt;
  final DateTime maturityDate;
  DateTime lastUpdated;

  TonInvestment({
    required this.id,
    required this.poolId,
    required this.poolName,
    required this.walletAddress,
    required this.amount,
    required this.expectedReturn,
    this.actualReturn = 0.0,
    this.status = InvestmentStatus.active,
    required this.transactionHash,
    this.withdrawalHash,
    required this.createdAt,
    required this.maturityDate,
    required this.lastUpdated,
  });

  factory TonInvestment.fromJson(Map<String, dynamic> json) {
    return TonInvestment(
      id: json['id'] as String,
      poolId: json['pool_id'] as String,
      poolName: json['pool_name'] as String,
      walletAddress: json['wallet_address'] as String,
      amount: (json['amount'] as num).toDouble(),
      expectedReturn: (json['expected_return'] as num).toDouble(),
      actualReturn: (json['actual_return'] as num).toDouble(),
      status: InvestmentStatus.values.firstWhere(
        (e) => e.toString() == 'InvestmentStatus.${json['status']}',
      ),
      transactionHash: json['transaction_hash'] as String,
      withdrawalHash: json['withdrawal_hash'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      maturityDate: DateTime.parse(json['maturity_date'] as String),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pool_id': poolId,
      'pool_name': poolName,
      'wallet_address': walletAddress,
      'amount': amount,
      'expected_return': expectedReturn,
      'actual_return': actualReturn,
      'status': status.toString().split('.').last,
      'transaction_hash': transactionHash,
      'withdrawal_hash': withdrawalHash,
      'created_at': createdAt.toIso8601String(),
      'maturity_date': maturityDate.toIso8601String(),
      'last_updated': lastUpdated.toIso8601String(),
    };
  }
}

// Investment Pool Model
class TonInvestmentPool {
  final String id;
  final String name;
  final String description;
  final String contractAddress;
  final double minInvestment;
  final double maxInvestment;
  final double expectedApr;
  final Duration lockPeriod;
  final InvestmentRiskLevel riskLevel;
  double totalValueLocked;
  int participantCount;
  final bool isActive;
  final DateTime createdAt;
  DateTime? lastUpdated;

  TonInvestmentPool({
    required this.id,
    required this.name,
    required this.description,
    required this.contractAddress,
    required this.minInvestment,
    required this.maxInvestment,
    required this.expectedApr,
    required this.lockPeriod,
    required this.riskLevel,
    required this.totalValueLocked,
    required this.participantCount,
    required this.isActive,
    required this.createdAt,
    this.lastUpdated,
  });

  factory TonInvestmentPool.fromJson(Map<String, dynamic> json) {
    return TonInvestmentPool(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      contractAddress: json['contract_address'] as String,
      minInvestment: (json['min_investment'] as num).toDouble(),
      maxInvestment: (json['max_investment'] as num).toDouble(),
      expectedApr: (json['expected_apr'] as num).toDouble(),
      lockPeriod: Duration(seconds: json['lock_period'] as int),
      riskLevel: InvestmentRiskLevel.values.firstWhere(
        (e) => e.toString() == 'InvestmentRiskLevel.${json['risk_level']}',
      ),
      totalValueLocked: (json['total_value_locked'] as num).toDouble(),
      participantCount: json['participant_count'] as int,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastUpdated: json['last_updated'] != null
          ? DateTime.parse(json['last_updated'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'contract_address': contractAddress,
      'min_investment': minInvestment,
      'max_investment': maxInvestment,
      'expected_apr': expectedApr,
      'lock_period': lockPeriod.inSeconds,
      'risk_level': riskLevel.toString().split('.').last,
      'total_value_locked': totalValueLocked,
      'participant_count': participantCount,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'last_updated': lastUpdated?.toIso8601String(),
    };
  }
}

// Transaction Model
class TonTransaction {
  final String id;
  final String fromAddress;
  final String toAddress;
  final double amount;
  final String? message;
  final String hash;
  final DateTime timestamp;
  final TransactionStatus status;

  TonTransaction({
    required this.id,
    required this.fromAddress,
    required this.toAddress,
    required this.amount,
    this.message,
    required this.hash,
    required this.timestamp,
    required this.status,
  });

  factory TonTransaction.fromJson(Map<String, dynamic> json) {
    return TonTransaction(
      id: json['id'] as String,
      fromAddress: json['from_address'] as String,
      toAddress: json['to_address'] as String,
      amount: (json['amount'] as num).toDouble(),
      message: json['message'] as String?,
      hash: json['hash'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: TransactionStatus.values.firstWhere(
        (e) => e.toString() == 'TransactionStatus.${json['status']}',
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'from_address': fromAddress,
      'to_address': toAddress,
      'amount': amount,
      'message': message,
      'hash': hash,
      'timestamp': timestamp.toIso8601String(),
      'status': status.toString().split('.').last,
    };
  }
}

// Investment Stats Model
class TonInvestmentStats {
  final double totalInvested;
  final double totalReturns;
  final double pendingRewards;
  final int activeInvestments;
  final double averageAPR;
  final Duration averageLockPeriod;

  const TonInvestmentStats({
    required this.totalInvested,
    required this.totalReturns,
    required this.pendingRewards,
    required this.activeInvestments,
    required this.averageAPR,
    required this.averageLockPeriod,
  });

  factory TonInvestmentStats.empty() {
    return TonInvestmentStats(
      totalInvested: 0.0,
      totalReturns: 0.0,
      pendingRewards: 0.0,
      activeInvestments: 0,
      averageAPR: 0.0,
      averageLockPeriod: Duration.zero,
    );
  }

  factory TonInvestmentStats.fromJson(Map<String, dynamic> json) {
    return TonInvestmentStats(
      totalInvested: (json['total_invested'] as num).toDouble(),
      totalReturns: (json['total_returns'] as num).toDouble(),
      pendingRewards: (json['pending_rewards'] as num).toDouble(),
      activeInvestments: json['active_investments'] as int,
      averageAPR: (json['average_apr'] as num).toDouble(),
      averageLockPeriod: Duration(seconds: json['average_lock_period'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_invested': totalInvested,
      'total_returns': totalReturns,
      'pending_rewards': pendingRewards,
      'active_investments': activeInvestments,
      'average_apr': averageAPR,
      'average_lock_period': averageLockPeriod.inSeconds,
    };
  }
}

// Staking Position Model
class TonStakingPosition {
  final String id;
  final String walletAddress;
  final double amount;
  double rewards;
  final double apr;
  final Duration lockPeriod;
  StakingStatus status;
  final String transactionHash;
  final DateTime createdAt;
  DateTime lastRewardClaim;
  DateTime lastUpdated;

  TonStakingPosition({
    required this.id,
    required this.walletAddress,
    required this.amount,
    this.rewards = 0.0,
    required this.apr,
    required this.lockPeriod,
    this.status = StakingStatus.active,
    required this.transactionHash,
    required this.createdAt,
    required this.lastRewardClaim,
    required this.lastUpdated,
  });

  factory TonStakingPosition.fromJson(Map<String, dynamic> json) {
    return TonStakingPosition(
      id: json['id'] as String,
      walletAddress: json['wallet_address'] as String,
      amount: (json['amount'] as num).toDouble(),
      rewards: (json['rewards'] as num).toDouble(),
      apr: (json['apr'] as num).toDouble(),
      lockPeriod: Duration(seconds: json['lock_period'] as int),
      status: StakingStatus.values.firstWhere(
        (e) => e.toString() == 'StakingStatus.${json['status']}',
      ),
      transactionHash: json['transaction_hash'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastRewardClaim: DateTime.parse(json['last_reward_claim'] as String),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_address': walletAddress,
      'amount': amount,
      'rewards': rewards,
      'apr': apr,
      'lock_period': lockPeriod.inSeconds,
      'status': status.toString().split('.').last,
      'transaction_hash': transactionHash,
      'created_at': createdAt.toIso8601String(),
      'last_reward_claim': lastRewardClaim.toIso8601String(),
      'last_updated': lastUpdated.toIso8601String(),
    };
  }
}

// Enums
enum InvestmentStatus {
  pending,
  active,
  completed,
  cancelled,
  failed
}

enum InvestmentRiskLevel {
  low,
  medium,
  high,
  extreme
}

enum TransactionStatus {
  pending,
  confirmed,
  failed,
  cancelled
}

enum StakingStatus {
  active,
  locked,
  withdrawn,
  expired
}

// Logging Utility
class Logs {
  static final Logs _instance = Logs._internal();
  
  factory Logs() {
    return _instance;
  }
  
  Logs._internal();

  void i(String message) {
    if (kDebugMode) {
      print('[INFO] $message');
    }
  }

  void e(String message) {
    if (kDebugMode) {
      print('[ERROR] $message');
    }
  }

  void w(String message) {
    if (kDebugMode) {
      print('[WARNING] $message');
    }
  }

  void d(String message) {
    if (kDebugMode) {
      print('[DEBUG] $message');
    }
  }
}
