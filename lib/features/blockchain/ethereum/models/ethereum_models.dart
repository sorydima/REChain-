import '../../common/interfaces/blockchain_service.dart';
import '../../common/models/blockchain_types.dart';

/// Ethereum-specific network statistics
class EthereumNetworkStats extends NetworkStats {
  final int gasLimit;
  final BigInt difficulty;

  const EthereumNetworkStats({
    required super.averageGasPrice,
    required super.blockHeight,
    required super.tps,
    required super.activeValidators,
    required super.totalStaked,
    required super.marketCap,
    required super.tvl,
    required this.gasLimit,
    required this.difficulty,
  });
}

/// Ethereum transaction
class EthereumTransaction extends BlockchainTransaction {
  final int nonce;
  final String? rawTransaction;

  const EthereumTransaction({
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
  };

  factory EthereumTransaction.fromJson(Map<String, dynamic> json) {
    return EthereumTransaction(
      id: json['hash'] ?? '',
      fromAddress: json['from'] ?? '',
      toAddress: json['to'] ?? '',
      amount: (int.parse(json['value'] ?? '0', radix: 16) / 1e18),
      gasPrice: (int.parse(json['gasPrice'] ?? '0', radix: 16) / 1e9),
      gasLimit: int.parse(json['gas'] ?? '0', radix: 16).toDouble(),
      data: json['input'],
      type: TransactionType.transfer, // Default type
      timestamp: DateTime.now(), // Would be parsed from block timestamp
      status: TransactionStatus.pending,
      nonce: int.parse(json['nonce'] ?? '0', radix: 16),
      rawTransaction: json['raw'],
    );
  }
}

/// Ethereum signed transaction
class EthereumSignedTransaction extends SignedTransaction {
  final int v;
  final BigInt r;
  final BigInt s;

  const EthereumSignedTransaction({
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

/// Ethereum transaction receipt
class EthereumTransactionReceipt extends TransactionReceipt {
  final String contractAddress;
  final int cumulativeGasUsed;
  final String logsBloom;

  const EthereumTransactionReceipt({
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

  factory EthereumTransactionReceipt.fromJson(Map<String, dynamic> json) {
    return EthereumTransactionReceipt(
      transactionHash: json['transactionHash'] ?? '',
      blockNumber: int.parse(json['blockNumber'] ?? '0', radix: 16),
      blockHash: json['blockHash'] ?? '',
      confirmations: 1, // Would be calculated from current block number
      status: int.parse(json['status'] ?? '0', radix: 16) == 1,
      gasUsed: int.parse(json['gasUsed'] ?? '0', radix: 16).toDouble(),
      events: (json['logs'] as List? ?? [])
          .map((log) => EthereumEvent.fromJson(log))
          .toList(),
      contractAddress: json['contractAddress'] ?? '',
      cumulativeGasUsed: int.parse(json['cumulativeGasUsed'] ?? '0', radix: 16),
      logsBloom: json['logsBloom'] ?? '',
    );
  }
}

/// Ethereum block
class EthereumBlock extends Block {
  final String stateRoot;
  final String receiptsRoot;
  final String transactionsRoot;
  final String miner;
  final BigInt difficulty;
  final BigInt totalDifficulty;
  final String extraData;
  final int size;
  final int gasUsed;
  final int gasLimit;
  final String nonce;
  final String mixHash;

  const EthereumBlock({
    required super.hash,
    required super.number,
    required super.parentHash,
    required super.timestamp,
    required super.transactions,
    required this.stateRoot,
    required this.receiptsRoot,
    required this.transactionsRoot,
    required this.miner,
    required this.difficulty,
    required this.totalDifficulty,
    required this.extraData,
    required this.size,
    required this.gasUsed,
    required this.gasLimit,
    required this.nonce,
    required this.mixHash,
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
    'difficulty': difficulty.toString(),
    'totalDifficulty': totalDifficulty.toString(),
    'extraData': extraData,
    'size': size,
    'gasUsed': gasUsed,
    'gasLimit': gasLimit,
    'nonce': nonce,
    'mixHash': mixHash,
  };

  factory EthereumBlock.fromJson(Map<String, dynamic> json) {
    return EthereumBlock(
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
      difficulty: BigInt.parse(json['difficulty']?.substring(2) ?? '0', radix: 16),
      totalDifficulty: BigInt.parse(json['totalDifficulty']?.substring(2) ?? '0', radix: 16),
      extraData: json['extraData'] ?? '',
      size: int.parse(json['size'] ?? '0', radix: 16),
      gasUsed: int.parse(json['gasUsed'] ?? '0', radix: 16),
      gasLimit: int.parse(json['gasLimit'] ?? '0', radix: 16),
      nonce: json['nonce'] ?? '',
      mixHash: json['mixHash'] ?? '',
    );
  }
}

/// Ethereum event
class EthereumEvent extends TransactionEvent {
  final String address;
  final List<String> topics;
  final int logIndex;
  final bool removed;

  const EthereumEvent({
    required super.name,
    required super.data,
    required this.address,
    required this.topics,
    required this.logIndex,
    required this.removed,
  });

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'data': data,
    'address': address,
    'topics': topics,
    'logIndex': logIndex,
    'removed': removed,
  };

  factory EthereumEvent.fromJson(Map<String, dynamic> json) {
    return EthereumEvent(
      name: 'event', // Would be decoded from ABI
      data: {'data': json['data']},
      address: json['address'] ?? '',
      topics: (json['topics'] as List? ?? []).cast<String>(),
      logIndex: int.parse(json['logIndex'] ?? '0', radix: 16),
      removed: json['removed'] ?? false,
    );
  }
}

/// Ethereum validator
class EthereumValidator extends Validator {
  final String publicKey;
  final String withdrawalCredentials;

  const EthereumValidator({
    required super.id,
    required super.name,
    required super.address,
    required super.commission,
    required super.totalStaked,
    required super.delegators,
    required super.active,
    required this.publicKey,
    required this.withdrawalCredentials,
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
    'publicKey': publicKey,
    'withdrawalCredentials': withdrawalCredentials,
  };
}

/// Ethereum investment pool
class EthereumInvestmentPool extends InvestmentPool {
  final String contractAddress;
  final String protocol;
  final String asset;

  const EthereumInvestmentPool({
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

/// Ethereum investment
class EthereumInvestment extends Investment {
  final String transactionHash;
  final String contractAddress;

  const EthereumInvestment({
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

/// Ethereum staking position
class EthereumStakingPosition extends StakingPosition {
  final String transactionHash;
  final String withdrawalCredentials;

  const EthereumStakingPosition({
    required super.id,
    required super.validatorId,
    required super.walletAddress,
    required super.amount,
    required super.rewards,
    required super.createdAt,
    required super.lastRewardClaim,
    required this.transactionHash,
    required this.withdrawalCredentials,
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
    'withdrawalCredentials': withdrawalCredentials,
  };
}

/// Ethereum bridge transaction
class EthereumBridgeTransaction extends BridgeTransaction {
  final String bridgeContract;
  final int nonce;

  const EthereumBridgeTransaction({
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
  };
}

/// Ethereum investment statistics
class EthereumInvestmentStats {
  final double totalInvested;
  final double totalReturns;
  final double pendingRewards;
  final int activeInvestments;
  final double averageAPR;
  final Duration averageLockPeriod;
  final double totalGasFees;
  final List<String> protocolsUsed;

  const EthereumInvestmentStats({
    required this.totalInvested,
    required this.totalReturns,
    required this.pendingRewards,
    required this.activeInvestments,
    required this.averageAPR,
    required this.averageLockPeriod,
    required this.totalGasFees,
    required this.protocolsUsed,
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
  };
}

/// Ethereum staking statistics
class EthereumStakingStats {
  final double totalStaked;
  final double totalRewards;
  final int activePositions;
  final double averageAPR;
  final int totalValidators;
  final int slashingEvents;

  const EthereumStakingStats({
    required this.totalStaked,
    required this.totalRewards,
    required this.activePositions,
    required this.averageAPR,
    required this.totalValidators,
    required this.slashingEvents,
  });

  Map<String, dynamic> toJson() => {
    'totalStaked': totalStaked,
    'totalRewards': totalRewards,
    'activePositions': activePositions,
    'averageAPR': averageAPR,
    'totalValidators': totalValidators,
    'slashingEvents': slashingEvents,
  };
}
