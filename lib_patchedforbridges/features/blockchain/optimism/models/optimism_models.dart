import '../../common/interfaces/blockchain_service.dart';
import '../../common/models/blockchain_types.dart';

/// Optimism-specific network statistics
class OptimismNetworkStats extends NetworkStats {
  final double l1GasPrice;
  final int l1BlockNumber;
  final double l1GasSaved;

  const OptimismNetworkStats({
    required super.averageGasPrice,
    required super.blockHeight,
    required super.tps,
    required super.activeValidators,
    required super.totalStaked,
    required super.marketCap,
    required super.tvl,
    required this.l1GasPrice,
    required this.l1BlockNumber,
    required this.l1GasSaved,
  });
}

/// Optimism transaction
class OptimismTransaction extends BlockchainTransaction {
  final int nonce;
  final String? rawTransaction;
  final int l1BatchNumber;

  const OptimismTransaction({
    required super.id,
    required super.fromAddress,
    required super.toAddress,
    required super.amount,
    required super.gasPrice,
    required super.gasLimit,
    super.data,
    required super.type,
    required super.timestamp,
    required super.status,
    required this.nonce,
    this.rawTransaction,
    required this.l1BatchNumber,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'fromAddress': fromAddress,
    'toAddress': toAddress,
    'amount': amount,
    'gasPrice': gasPrice,
    'gasLimit': gasLimit,
    'data': data,
    'type': type.toString(),
    'timestamp': timestamp.toIso8601String(),
    'status': status.toString(),
    'nonce': nonce,
    'rawTransaction': rawTransaction,
    'l1BatchNumber': l1BatchNumber,
  };

  factory OptimismTransaction.fromJson(Map<String, dynamic> json) {
    return OptimismTransaction(
      id: json['hash'] ?? '',
      fromAddress: json['from'] ?? '',
      toAddress: json['to'] ?? '',
      amount: (int.parse(json['value'] ?? '0', radix: 16) / 1e18),
      gasPrice: (int.parse(json['gasPrice'] ?? '0', radix: 16) / 1e9),
      gasLimit: int.parse(json['gas'] ?? '0', radix: 16),
      data: json['input'],
      type: TransactionType.transfer,
      timestamp: DateTime.now(),
      status: TransactionStatus.pending,
      nonce: int.parse(json['nonce'] ?? '0', radix: 16),
      rawTransaction: json['rawTransaction'],
      l1BatchNumber: int.parse(json['l1BatchNumber'] ?? '0', radix: 16),
    );
  }
}

/// Optimism signed transaction
class OptimismSignedTransaction extends SignedTransaction {
  final String l1Signature;

  const OptimismSignedTransaction({
    required super.transaction,
    required super.signature,
    required super.hash,
    required this.l1Signature,
  });

  @override
  Map<String, dynamic> toJson() => {
    'transaction': transaction.toJson(),
    'signature': signature,
    'hash': hash,
    'l1Signature': l1Signature,
  };
}

/// Optimism transaction receipt
class OptimismTransactionReceipt extends TransactionReceipt {
  final int l1BlockNumber;
  final int l2BlockNumber;

  const OptimismTransactionReceipt({
    required super.transactionHash,
    required super.blockNumber,
    required super.blockHash,
    required super.confirmations,
    required super.status,
    required super.gasUsed,
    required super.events,
    required this.l1BlockNumber,
    required this.l2BlockNumber,
  });

  @override
  Map<String, dynamic> toJson() => {
    'transactionHash': transactionHash,
    'blockNumber': blockNumber,
    'blockHash': blockHash,
    'confirmations': confirmations,
    'status': status,
    'gasUsed': gasUsed,
    'events': events.map((e) => e.toJson()).toList(),
    'l1BlockNumber': l1BlockNumber,
    'l2BlockNumber': l2BlockNumber,
  };

  factory OptimismTransactionReceipt.fromJson(Map<String, dynamic> json) {
    return OptimismTransactionReceipt(
      transactionHash: json['transactionHash'] ?? '',
      blockNumber: int.parse(json['blockNumber'] ?? '0', radix: 16),
      blockHash: json['blockHash'] ?? '',
      confirmations: 1,
      status: int.parse(json['status'] ?? '0', radix: 16) == 1,
      gasUsed: int.parse(json['gasUsed'] ?? '0', radix: 16).toDouble(),
      events: (json['logs'] as List? ?? [])
          .map((log) => OptimismEvent.fromJson(log))
          .toList(),
      l1BlockNumber: int.parse(json['l1BlockNumber'] ?? '0', radix: 16),
      l2BlockNumber: int.parse(json['l2BlockNumber'] ?? '0', radix: 16),
    );
  }
}

/// Optimism block
class OptimismBlock extends Block {
  final String stateRoot;
  final String receiptsRoot;
  final String transactionsRoot;
  final String sequencer;
  final int size;
  final int gasUsed;
  final int gasLimit;
  final String l1BatchNumber;

  const OptimismBlock({
    required super.hash,
    required super.number,
    required super.parentHash,
    required super.timestamp,
    required super.transactions,
    required this.stateRoot,
    required this.receiptsRoot,
    required this.transactionsRoot,
    required this.sequencer,
    required this.size,
    required this.gasUsed,
    required this.gasLimit,
    required this.l1BatchNumber,
  });

  @override
  Map<String, dynamic> toJson() => {
    'hash': hash,
    'number': number,
    'parentHash': parentHash,
    'timestamp': timestamp.toIso8601String(),
    'transactions': transactions,
    'stateRoot': stateRoot,
    'receiptsRoot': receiptsRoot,
    'transactionsRoot': transactionsRoot,
    'sequencer': sequencer,
    'size': size,
    'gasUsed': gasUsed,
    'gasLimit': gasLimit,
    'l1BatchNumber': l1BatchNumber,
  };

  factory OptimismBlock.fromJson(Map<String, dynamic> json) {
    return OptimismBlock(
      hash: json['hash'] ?? '',
      number: int.parse(json['number'] ?? '0', radix: 16),
      parentHash: json['parentHash'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['timestamp'] ?? '0', radix: 16) * 1000,
      ),
      transactions: (json['transactions'] as List? ?? []).cast<String>(),
      stateRoot: json['stateRoot'] ?? '',
      receiptsRoot: json['receiptsRoot'] ?? '',
      transactionsRoot: json['transactionsRoot'] ?? '',
      sequencer: json['miner'] ?? '',
      size: int.parse(json['size'] ?? '0', radix: 16),
      gasUsed: int.parse(json['gasUsed'] ?? '0', radix: 16),
      gasLimit: int.parse(json['gasLimit'] ?? '0', radix: 16),
      l1BatchNumber: json['l1BatchNumber'] ?? '0',
    );
  }
}

/// Optimism event
class OptimismEvent extends TransactionEvent {
  final List<String> topics;
  final bool removed;
  final String l1BatchNumber;

  const OptimismEvent({
    required super.name,
    required super.data,
    required super.address,
    required super.logIndex,
    required this.topics,
    required this.removed,
    required this.l1BatchNumber,
  });

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'data': data,
    'address': address,
    'logIndex': logIndex,
    'topics': topics,
    'removed': removed,
    'l1BatchNumber': l1BatchNumber,
  };

  factory OptimismEvent.fromJson(Map<String, dynamic> json) {
    return OptimismEvent(
      name: 'event',
      data: {'data': json['data']},
      address: json['address'] ?? '',
      logIndex: int.parse(json['logIndex'] ?? '0', radix: 16),
      topics: (json['topics'] as List? ?? []).cast<String>(),
      removed: json['removed'] ?? false,
      l1BatchNumber: json['l1BatchNumber'] ?? '0',
    );
  }
}

/// Optimism validator
class OptimismValidator extends Validator {
  final String l1Address;
  final Duration disputeGameWindow;

  const OptimismValidator({
    required super.id,
    required super.name,
    required super.address,
    required super.commission,
    required super.totalStaked,
    required super.delegators,
    required super.active,
    required this.l1Address,
    required this.disputeGameWindow,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'commission': commission,
    'totalStaked': totalStaked,
    'delegators': delegators,
    'active': active,
    'l1Address': l1Address,
    'disputeGameWindow': disputeGameWindow.inSeconds,
  };
}

/// Optimism investment pool
class OptimismInvestmentPool extends InvestmentPool {
  final double l1GasSaved;

  const OptimismInvestmentPool({
    required super.id,
    required super.name,
    required super.description,
    required super.contractAddress,
    required super.minInvestment,
    required super.maxInvestment,
    required super.expectedApr,
    required super.lockPeriod,
    required super.totalValueLocked,
    required super.participantCount,
    required super.isActive,
    required super.protocol,
    required super.asset,
    required this.l1GasSaved,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'contractAddress': contractAddress,
    'minInvestment': minInvestment,
    'maxInvestment': maxInvestment,
    'expectedApr': expectedApr,
    'lockPeriod': lockPeriod.inSeconds,
    'totalValueLocked': totalValueLocked,
    'participantCount': participantCount,
    'isActive': isActive,
    'protocol': protocol,
    'asset': asset,
    'l1GasSaved': l1GasSaved,
  };
}

/// Optimism investment
class OptimismInvestment extends Investment {
  final String transactionHash;
  final String contractAddress;
  final int l1BatchNumber;

  const OptimismInvestment({
    required super.id,
    required super.poolId,
    required super.walletAddress,
    required super.amount,
    required super.expectedReturn,
    required super.createdAt,
    required super.maturityDate,
    required this.transactionHash,
    required this.contractAddress,
    required this.l1BatchNumber,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'poolId': poolId,
    'walletAddress': walletAddress,
    'amount': amount,
    'expectedReturn': expectedReturn,
    'createdAt': createdAt.toIso8601String(),
    'maturityDate': maturityDate.toIso8601String(),
    'transactionHash': transactionHash,
    'contractAddress': contractAddress,
    'l1BatchNumber': l1BatchNumber,
  };
}

/// Optimism staking position
class OptimismStakingPosition extends StakingPosition {
  final String transactionHash;
  final int l1BatchNumber;

  const OptimismStakingPosition({
    required super.id,
    required super.validatorId,
    required super.walletAddress,
    required super.amount,
    required super.rewards,
    required super.createdAt,
    required super.lastRewardClaim,
    required this.transactionHash,
    required this.l1BatchNumber,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'validatorId': validatorId,
    'walletAddress': walletAddress,
    'amount': amount,
    'rewards': rewards,
    'createdAt': createdAt.toIso8601String(),
    'lastRewardClaim': lastRewardClaim.toIso8601String(),
    'transactionHash': transactionHash,
    'l1BatchNumber': l1BatchNumber,
  };
}

/// Optimism bridge transaction
class OptimismBridgeTransaction extends BridgeTransaction {
  final String bridgeContract;
  final int nonce;
  final String l1WithdrawalHash;

  const OptimismBridgeTransaction({
    required super.id,
    required super.sourceChain,
    required super.targetChain,
    required super.sourceAddress,
    required super.targetAddress,
    required super.amount,
    required super.fee,
    required super.timestamp,
    required super.status,
    required this.bridgeContract,
    required this.nonce,
    required this.l1WithdrawalHash,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'sourceChain': sourceChain.toString(),
    'targetChain': targetChain.toString(),
    'sourceAddress': sourceAddress,
    'targetAddress': targetAddress,
    'amount': amount,
    'fee': fee,
    'timestamp': timestamp.toIso8601String(),
    'status': status.toString(),
    'bridgeContract': bridgeContract,
    'nonce': nonce,
    'l1WithdrawalHash': l1WithdrawalHash,
  };
}

/// Optimism investment statistics
class OptimismInvestmentStats extends InvestmentStats {
  final double totalGasFees;
  final List<String> protocolsUsed;
  final double l1GasSaved;

  const OptimismInvestmentStats({
    required super.totalInvested,
    required super.totalReturns,
    required super.pendingRewards,
    required super.activeInvestments,
    required super.averageAPR,
    required super.averageLockPeriod,
    required this.totalGasFees,
    required this.protocolsUsed,
    required this.l1GasSaved,
  });

  @override
  Map<String, dynamic> toJson() => {
    'totalInvested': totalInvested,
    'totalReturns': totalReturns,
    'pendingRewards': pendingRewards,
    'activeInvestments': activeInvestments,
    'averageAPR': averageAPR,
    'averageLockPeriod': averageLockPeriod.inSeconds,
    'totalGasFees': totalGasFees,
    'protocolsUsed': protocolsUsed,
    'l1GasSaved': l1GasSaved,
  };
}

/// Optimism staking statistics
class OptimismStakingStats extends StakingStats {
  final String l1SecurityLevel;
  final Duration disputeGameWindow;

  const OptimismStakingStats({
    required super.totalStaked,
    required super.totalRewards,
    required super.activePositions,
    required super.averageAPR,
    required super.totalValidators,
    required super.slashingEvents,
    required this.l1SecurityLevel,
    required this.disputeGameWindow,
  });

  @override
  Map<String, dynamic> toJson() => {
    'totalStaked': totalStaked,
    'totalRewards': totalRewards,
    'activePositions': activePositions,
    'averageAPR': averageAPR,
    'totalValidators': totalValidators,
    'slashingEvents': slashingEvents,
    'l1SecurityLevel': l1SecurityLevel,
    'disputeGameWindow': disputeGameWindow.inSeconds,
  };
}
