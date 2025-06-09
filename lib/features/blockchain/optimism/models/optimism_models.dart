import '../../common/interfaces/blockchain_service.dart';
import '../../common/models/blockchain_types.dart';

/// Optimism-specific network statistics
class OptimismNetworkStats extends NetworkStats {
  final double l1GasPrice;
  final double sequencerUptime;
  final Duration batchSubmissionInterval;

  const OptimismNetworkStats({
    required super.averageGasPrice,
    required super.blockHeight,
    required super.tps,
    required super.activeValidators,
    required super.totalStaked,
    required super.marketCap,
    required super.tvl,
    required this.l1GasPrice,
    required this.sequencerUptime,
    required this.batchSubmissionInterval,
  });
}

/// Optimism transaction
class OptimismTransaction extends BlockchainTransaction {
  final int nonce;
  final String? rawTransaction;
  final double l1GasPrice;

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
    required this.l1GasPrice,
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
    'l1GasPrice': l1GasPrice,
  };

  factory OptimismTransaction.fromJson(Map<String, dynamic> json) {
    return OptimismTransaction(
      id: json['hash'] ?? '',
      fromAddress: json['from'] ?? '',
      toAddress: json['to'] ?? '',
      amount: (int.parse(json['value'] ?? '0', radix: 16) / 1e18),
      gasPrice: (int.parse(json['gasPrice'] ?? '0', radix: 16) / 1e9),
      gasLimit: int.parse(json['gas'] ?? '0', radix: 16).toDouble(),
      data: json['input'],
      type: TransactionType.transfer,
      timestamp: DateTime.now(),
      status: TransactionStatus.pending,
      nonce: int.parse(json['nonce'] ?? '0', radix: 16),
      rawTransaction: json['raw'],
      l1GasPrice: (int.parse(json['l1GasPrice'] ?? '0', radix: 16) / 1e9),
    );
  }
}

/// Optimism signed transaction
class OptimismSignedTransaction extends SignedTransaction {
  final int v;
  final BigInt r;
  final BigInt s;
  final double l1DataFee;

  const OptimismSignedTransaction({
    required super.transaction,
    required super.signature,
    required super.hash,
    required this.v,
    required this.r,
    required this.s,
    required this.l1DataFee,
  });

  @override
  Map<String, dynamic> toJson() => {
    'transaction': transaction.toJson(),
    'signature': signature,
    'hash': hash,
    'v': v,
    'r': r.toString(),
    's': s.toString(),
    'l1DataFee': l1DataFee,
  };
}

/// Optimism transaction receipt
class OptimismTransactionReceipt extends TransactionReceipt {
  final String contractAddress;
  final int cumulativeGasUsed;
  final String logsBloom;
  final String l1BatchHash;

  const OptimismTransactionReceipt({
    required super.transactionHash,
    required super.blockNumber,
    required super.blockHash,
    required super.confirmations,
    required super.status,
    required super.gasUsed,
    required super.events,
    required this.contractAddress,
    required this.cumulativeGasUsed,
    required this.logsBloom,
    required this.l1BatchHash,
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
    'contractAddress': contractAddress,
    'cumulativeGasUsed': cumulativeGasUsed,
    'logsBloom': logsBloom,
    'l1BatchHash': l1BatchHash,
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
      contractAddress: json['contractAddress'] ?? '',
      cumulativeGasUsed: int.parse(json['cumulativeGasUsed'] ?? '0', radix: 16),
      logsBloom: json['logsBloom'] ?? '',
      l1BatchHash: json['l1BatchHash'] ?? '',
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
  final String address;
  final List<String> topics;
  final int logIndex;
  final bool removed;
  final String l1BatchNumber;

  const OptimismEvent({
    required super.name,
    required super.data,
    required this.address,
    required this.topics,
    required this.logIndex,
    required this.removed,
    required this.l1BatchNumber,
  });

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'data': data,
    'address': address,
    'topics': topics,
    'logIndex': logIndex,
    'removed': removed,
    'l1BatchNumber': l1BatchNumber,
  };

  factory OptimismEvent.fromJson(Map<String, dynamic> json) {
    return OptimismEvent(
      name: 'event',
      data: {'data': json['data']},
      address: json['address'] ?? '',
      topics: (json['topics'] as List? ?? []).cast<String>(),
      logIndex: int.parse(json['logIndex'] ?? '0', radix: 16),
      removed: json['removed'] ?? false,
      l1BatchNumber: json['l1BatchNumber'] ?? '0',
    );
  }
}

/// Optimism validator
class OptimismValidator extends Validator {
  final String l1Address;
  final double batchSubmissionRate;

  const OptimismValidator({
    required super.id,
    required super.name,
    required super.address,
    required super.commission,
    required super.totalStaked,
    required super.delegators,
    required super.active,
    required this.l1Address,
    required this.batchSubmissionRate,
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
    'batchSubmissionRate': batchSubmissionRate,
  };
}

/// Optimism investment pool
class OptimismInvestmentPool extends InvestmentPool {
  final String contractAddress;
  final String protocol;
  final String asset;
  final String l1Address;

  const OptimismInvestmentPool({
    required super.id,
    required super.name,
    required super.description,
    required this.contractAddress,
    required super.minInvestment,
    required super.maxInvestment,
    required super.expectedApr,
    required super.lockPeriod,
    required super.totalValueLocked,
    required super.participantCount,
    required super.isActive,
    required this.protocol,
    required this.asset,
    required this.l1Address,
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
    'l1Address': l1Address,
  };
}

/// Optimism investment
class OptimismInvestment extends Investment {
  final String transactionHash;
  final String contractAddress;
  final String l1BatchHash;

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
    required this.l1BatchHash,
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
    'l1BatchHash': l1BatchHash,
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
class OptimismInvestmentStats {
  final double totalInvested;
  final double totalReturns;
  final double pendingRewards;
  final int activeInvestments;
  final double averageAPR;
  final Duration averageLockPeriod;
  final double totalGasFees;
  final List<String> protocolsUsed;
  final double l1GasSaved;

  const OptimismInvestmentStats({
    required this.totalInvested,
    required this.totalReturns,
    required this.pendingRewards,
    required this.activeInvestments,
    required this.averageAPR,
    required this.averageLockPeriod,
    required this.totalGasFees,
    required this.protocolsUsed,
    required this.l1GasSaved,
  });

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
class OptimismStakingStats {
  final double totalStaked;
  final double totalRewards;
  final int activePositions;
  final double averageAPR;
  final int totalValidators;
  final int slashingEvents;
  final String l1SecurityLevel;
  final Duration disputeGameWindow;

  const OptimismStakingStats({
    required this.totalStaked,
    required this.totalRewards,
    required this.activePositions,
    required this.averageAPR,
    required this.totalValidators,
    required this.slashingEvents,
    required this.l1SecurityLevel,
    required this.disputeGameWindow,
  });

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
