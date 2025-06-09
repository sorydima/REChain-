import '../../common/interfaces/blockchain_service.dart';
import '../../common/models/blockchain_types.dart';

/// Arbitrum-specific network statistics
class ArbitrumNetworkStats extends NetworkStats {
  final double l1GasPrice;
  final double sequencerLatency;
  final Duration challengePeriod;

  const ArbitrumNetworkStats({
    required super.averageGasPrice,
    required super.blockHeight,
    required super.tps,
    required super.activeValidators,
    required super.totalStaked,
    required super.marketCap,
    required super.tvl,
    required this.l1GasPrice,
    required this.sequencerLatency,
    required this.challengePeriod,
  });
}

/// Arbitrum transaction
class ArbitrumTransaction extends BlockchainTransaction {
  final int nonce;
  final String? rawTransaction;
  final double l1GasPrice;

  const ArbitrumTransaction({
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

  factory ArbitrumTransaction.fromJson(Map<String, dynamic> json) {
    return ArbitrumTransaction(
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

/// Arbitrum signed transaction
class ArbitrumSignedTransaction extends SignedTransaction {
  final int v;
  final BigInt r;
  final BigInt s;
  final int l1SignatureId;

  const ArbitrumSignedTransaction({
    required super.transaction,
    required super.signature,
    required super.hash,
    required this.v,
    required this.r,
    required this.s,
    required this.l1SignatureId,
  });

  @override
  Map<String, dynamic> toJson() => {
    'transaction': transaction.toJson(),
    'signature': signature,
    'hash': hash,
    'v': v,
    'r': r.toString(),
    's': s.toString(),
    'l1SignatureId': l1SignatureId,
  };
}

/// Arbitrum transaction receipt
class ArbitrumTransactionReceipt extends TransactionReceipt {
  final String contractAddress;
  final int cumulativeGasUsed;
  final String logsBloom;
  final String l1BlockNumber;

  const ArbitrumTransactionReceipt({
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
    required this.l1BlockNumber,
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
    'l1BlockNumber': l1BlockNumber,
  };

  factory ArbitrumTransactionReceipt.fromJson(Map<String, dynamic> json) {
    return ArbitrumTransactionReceipt(
      transactionHash: json['transactionHash'] ?? '',
      blockNumber: int.parse(json['blockNumber'] ?? '0', radix: 16),
      blockHash: json['blockHash'] ?? '',
      confirmations: 1,
      status: int.parse(json['status'] ?? '0', radix: 16) == 1,
      gasUsed: int.parse(json['gasUsed'] ?? '0', radix: 16).toDouble(),
      events: (json['logs'] as List? ?? [])
          .map((log) => ArbitrumEvent.fromJson(log))
          .toList(),
      contractAddress: json['contractAddress'] ?? '',
      cumulativeGasUsed: int.parse(json['cumulativeGasUsed'] ?? '0', radix: 16),
      logsBloom: json['logsBloom'] ?? '',
      l1BlockNumber: json['l1BlockNumber'] ?? '0',
    );
  }
}

/// Arbitrum block
class ArbitrumBlock extends Block {
  final String stateRoot;
  final String receiptsRoot;
  final String transactionsRoot;
  final String sequencer;
  final int size;
  final int gasUsed;
  final int gasLimit;
  final String l1BlockNumber;

  const ArbitrumBlock({
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
    required this.l1BlockNumber,
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
    'l1BlockNumber': l1BlockNumber,
  };

  factory ArbitrumBlock.fromJson(Map<String, dynamic> json) {
    return ArbitrumBlock(
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
      l1BlockNumber: json['l1BlockNumber'] ?? '0',
    );
  }
}

/// Arbitrum event
class ArbitrumEvent extends TransactionEvent {
  final String address;
  final List<String> topics;
  final int logIndex;
  final bool removed;
  final String l1BlockNumber;

  const ArbitrumEvent({
    required super.name,
    required super.data,
    required this.address,
    required this.topics,
    required this.logIndex,
    required this.removed,
    required this.l1BlockNumber,
  });

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'data': data,
    'address': address,
    'topics': topics,
    'logIndex': logIndex,
    'removed': removed,
    'l1BlockNumber': l1BlockNumber,
  };

  factory ArbitrumEvent.fromJson(Map<String, dynamic> json) {
    return ArbitrumEvent(
      name: 'event',
      data: {'data': json['data']},
      address: json['address'] ?? '',
      topics: (json['topics'] as List? ?? []).cast<String>(),
      logIndex: int.parse(json['logIndex'] ?? '0', radix: 16),
      removed: json['removed'] ?? false,
      l1BlockNumber: json['l1BlockNumber'] ?? '0',
    );
  }
}

/// Arbitrum validator
class ArbitrumValidator extends Validator {
  final String l1Address;
  final Duration challengePeriod;

  const ArbitrumValidator({
    required super.id,
    required super.name,
    required super.address,
    required super.commission,
    required super.totalStaked,
    required super.delegators,
    required super.active,
    required this.l1Address,
    required this.challengePeriod,
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
    'challengePeriod': challengePeriod.inSeconds,
  };
}

/// Arbitrum investment pool
class ArbitrumInvestmentPool extends InvestmentPool {
  final String contractAddress;
  final String protocol;
  final String asset;
  final String l1Address;

  const ArbitrumInvestmentPool({
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

/// Arbitrum investment
class ArbitrumInvestment extends Investment {
  final String transactionHash;
  final String contractAddress;
  final String l1ConfirmationHash;

  const ArbitrumInvestment({
    required super.id,
    required super.poolId,
    required super.walletAddress,
    required super.amount,
    required super.expectedReturn,
    required super.createdAt,
    required super.maturityDate,
    required this.transactionHash,
    required this.contractAddress,
    required this.l1ConfirmationHash,
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
    'l1ConfirmationHash': l1ConfirmationHash,
  };
}

/// Arbitrum staking position
class ArbitrumStakingPosition extends StakingPosition {
  final String transactionHash;
  final int l1ConfirmationBlock;

  const ArbitrumStakingPosition({
    required super.id,
    required super.validatorId,
    required super.walletAddress,
    required super.amount,
    required super.rewards,
    required super.createdAt,
    required super.lastRewardClaim,
    required this.transactionHash,
    required this.l1ConfirmationBlock,
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
    'l1ConfirmationBlock': l1ConfirmationBlock,
  };
}

/// Arbitrum bridge transaction
class ArbitrumBridgeTransaction extends BridgeTransaction {
  final String bridgeContract;
  final int nonce;
  final Duration l1ConfirmationTime;

  const ArbitrumBridgeTransaction({
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
    required this.l1ConfirmationTime,
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
    'l1ConfirmationTime': l1ConfirmationTime.inSeconds,
  };
}

/// Arbitrum investment statistics
class ArbitrumInvestmentStats {
  final double totalInvested;
  final double totalReturns;
  final double pendingRewards;
  final int activeInvestments;
  final double averageAPR;
  final Duration averageLockPeriod;
  final double totalGasFees;
  final List<String> protocolsUsed;
  final double l1GasSaved;

  const ArbitrumInvestmentStats({
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

/// Arbitrum staking statistics
class ArbitrumStakingStats {
  final double totalStaked;
  final double totalRewards;
  final int activePositions;
  final double averageAPR;
  final int totalValidators;
  final int slashingEvents;
  final String l1SecurityLevel;
  final Duration fraudProofWindow;

  const ArbitrumStakingStats({
    required this.totalStaked,
    required this.totalRewards,
    required this.activePositions,
    required this.averageAPR,
    required this.totalValidators,
    required this.slashingEvents,
    required this.l1SecurityLevel,
    required this.fraudProofWindow,
  });

  Map<String, dynamic> toJson() => {
    'totalStaked': totalStaked,
    'totalRewards': totalRewards,
    'activePositions': activePositions,
    'averageAPR': averageAPR,
    'totalValidators': totalValidators,
    'slashingEvents': slashingEvents,
    'l1SecurityLevel': l1SecurityLevel,
    'fraudProofWindow': fraudProofWindow.inSeconds,
  };
}
