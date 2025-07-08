import '../../common/interfaces/blockchain_service.dart';
import '../../common/models/blockchain_types.dart';

/// Polygon-specific network statistics
class PolygonNetworkStats extends NetworkStats {
  final int checkpointNumber;
  final Duration checkpointInterval;

  const PolygonNetworkStats({
    required super.averageGasPrice,
    required super.blockHeight,
    required super.tps,
    required super.activeValidators,
    required super.totalStaked,
    required super.marketCap,
    required super.tvl,
    required this.checkpointNumber,
    required this.checkpointInterval,
  });
}

/// Polygon transaction
class PolygonTransaction extends BlockchainTransaction {
  final int nonce;
  final String? rawTransaction;
  final int checkpointNumber;

  const PolygonTransaction({
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
    required this.checkpointNumber,
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
    'checkpointNumber': checkpointNumber,
  };

  factory PolygonTransaction.fromJson(Map<String, dynamic> json) {
    return PolygonTransaction(
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
      rawTransaction: json['raw'],
      checkpointNumber: int.parse(json['checkpointNumber'] ?? '0', radix: 16),
    );
  }
}

/// Polygon signed transaction
class PolygonSignedTransaction extends SignedTransaction {
  final int v;
  final BigInt r;
  final BigInt s;

  const PolygonSignedTransaction({
    required super.transaction,
    required super.signature,
    required super.hash,
    required this.v,
    required this.r,
    required this.s,
  });

  @override
  Map<String, dynamic> toJson() => {
    'transaction': transaction.toJson(),
    'signature': signature,
    'hash': hash,
    'v': v,
    'r': r.toString(),
    's': s.toString(),
  };
}

/// Polygon transaction receipt
class PolygonTransactionReceipt extends TransactionReceipt {
  final String contractAddress;
  final int cumulativeGasUsed;
  final String logsBloom;

  const PolygonTransactionReceipt({
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
  };

  factory PolygonTransactionReceipt.fromJson(Map<String, dynamic> json) {
    return PolygonTransactionReceipt(
      transactionHash: json['transactionHash'] ?? '',
      blockNumber: int.parse(json['blockNumber'] ?? '0', radix: 16),
      blockHash: json['blockHash'] ?? '',
      confirmations: 1,
      status: int.parse(json['status'] ?? '0', radix: 16) == 1,
      gasUsed: int.parse(json['gasUsed'] ?? '0', radix: 16).toDouble(),
      events: (json['logs'] as List? ?? [])
          .map((log) => PolygonEvent.fromJson(log))
          .toList(),
      contractAddress: json['contractAddress'] ?? '',
      cumulativeGasUsed: int.parse(json['cumulativeGasUsed'] ?? '0', radix: 16),
      logsBloom: json['logsBloom'] ?? '',
    );
  }
}

/// Polygon block
class PolygonBlock extends Block {
  final String stateRoot;
  final String receiptsRoot;
  final String transactionsRoot;
  final String miner;
  final int size;
  final int gasUsed;
  final int gasLimit;
  final bool isCheckpoint;

  const PolygonBlock({
    required super.hash,
    required super.number,
    required super.parentHash,
    required super.timestamp,
    required super.transactions,
    required this.stateRoot,
    required this.receiptsRoot,
    required this.transactionsRoot,
    required this.miner,
    required this.size,
    required this.gasUsed,
    required this.gasLimit,
    required this.isCheckpoint,
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
    'miner': miner,
    'size': size,
    'gasUsed': gasUsed,
    'gasLimit': gasLimit,
    'isCheckpoint': isCheckpoint,
  };

  factory PolygonBlock.fromJson(Map<String, dynamic> json) {
    return PolygonBlock(
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
      miner: json['miner'] ?? '',
      size: int.parse(json['size'] ?? '0', radix: 16),
      gasUsed: int.parse(json['gasUsed'] ?? '0', radix: 16),
      gasLimit: int.parse(json['gas'] ?? '0', radix: 16),
      isCheckpoint: (int.parse(json['number'] ?? '0', radix: 16) % 256) == 0,
    );
  }
}

/// Polygon event
class PolygonEvent extends TransactionEvent {
  final List<String> topics;
  final bool removed;

  const PolygonEvent({
    required super.name,
    required super.data,
    required super.address,
    required super.logIndex,
    required this.topics,
    required this.removed,
  });

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'data': data,
    'address': address,
    'logIndex': logIndex,
    'topics': topics,
    'removed': removed,
  };

  factory PolygonEvent.fromJson(Map<String, dynamic> json) {
    return PolygonEvent(
      name: 'event',
      data: {'data': json['data']},
      address: json['address'] ?? '',
      logIndex: int.parse(json['logIndex'] ?? '0', radix: 16),
      topics: (json['topics'] as List? ?? []).cast<String>(),
      removed: json['removed'] ?? false,
    );
  }
}

/// Polygon validator
class PolygonValidator extends Validator {
  final String checkpointSignerAddress;
  final String heimdallAddress;

  const PolygonValidator({
    required super.id,
    required super.name,
    required super.address,
    required super.commission,
    required super.totalStaked,
    required super.delegators,
    required super.active,
    required this.checkpointSignerAddress,
    required this.heimdallAddress,
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
    'checkpointSignerAddress': checkpointSignerAddress,
    'heimdallAddress': heimdallAddress,
  };
}

/// Polygon investment pool
class PolygonInvestmentPool extends InvestmentPool {
  const PolygonInvestmentPool({
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
  };
}

/// Polygon investment
class PolygonInvestment extends Investment {
  final String transactionHash;
  final String contractAddress;

  const PolygonInvestment({
    required super.id,
    required super.poolId,
    required super.walletAddress,
    required super.amount,
    required super.expectedReturn,
    required super.createdAt,
    required super.maturityDate,
    required this.transactionHash,
    required this.contractAddress,
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
  };
}

/// Polygon staking position
class PolygonStakingPosition extends StakingPosition {
  final String transactionHash;
  final int checkpointNumber;

  const PolygonStakingPosition({
    required super.id,
    required super.validatorId,
    required super.walletAddress,
    required super.amount,
    required super.rewards,
    required super.createdAt,
    required super.lastRewardClaim,
    required this.transactionHash,
    required this.checkpointNumber,
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
    'checkpointNumber': checkpointNumber,
  };
}

/// Polygon bridge transaction
class PolygonBridgeTransaction extends BridgeTransaction {
  final String bridgeContract;
  final int nonce;
  final String exitHash;

  const PolygonBridgeTransaction({
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
    required this.exitHash,
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
    'exitHash': exitHash,
  };
}

/// Polygon investment statistics
class PolygonInvestmentStats extends InvestmentStats {
  final double totalGasFees;
  final List<String> protocolsUsed;

  const PolygonInvestmentStats({
    required super.totalInvested,
    required super.totalReturns,
    required super.pendingRewards,
    required super.activeInvestments,
    required super.averageAPR,
    required super.averageLockPeriod,
    required this.totalGasFees,
    required this.protocolsUsed,
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
  };
}

/// Polygon staking statistics
class PolygonStakingStats extends StakingStats {
  final double checkpointRewards;
  final Duration unbondingPeriod;

  const PolygonStakingStats({
    required super.totalStaked,
    required super.totalRewards,
    required super.activePositions,
    required super.averageAPR,
    required super.totalValidators,
    required super.slashingEvents,
    required this.checkpointRewards,
    required this.unbondingPeriod,
  });

  @override
  Map<String, dynamic> toJson() => {
    'totalStaked': totalStaked,
    'totalRewards': totalRewards,
    'activePositions': activePositions,
    'averageAPR': averageAPR,
    'totalValidators': totalValidators,
    'slashingEvents': slashingEvents,
    'checkpointRewards': checkpointRewards,
    'unbondingPeriod': unbondingPeriod.inSeconds,
  };
}
