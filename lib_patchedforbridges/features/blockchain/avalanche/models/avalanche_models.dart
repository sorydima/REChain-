import '../../common/models/blockchain_types.dart';
import '../../common/interfaces/blockchain_service.dart';

/// Avalanche-specific network statistics
class AvalancheNetworkStats extends NetworkStats {
  final int pChainHeight;
  final int xChainHeight;
  final int cChainHeight;
  final List<String> activeSubnets;
  final double subnetParticipation;

  const AvalancheNetworkStats({
    required super.averageGasPrice,
    required super.blockHeight,
    required super.tps,
    required super.activeValidators,
    required super.totalStaked,
    required super.marketCap,
    required super.tvl,
    required this.pChainHeight,
    required this.xChainHeight,
    required this.cChainHeight,
    required this.activeSubnets,
    required this.subnetParticipation,
  });

  @override
  Map<String, dynamic> toJson() => {
    'averageGasPrice': averageGasPrice,
    'blockHeight': blockHeight,
    'tps': tps,
    'activeValidators': activeValidators,
    'totalStaked': totalStaked,
    'marketCap': marketCap,
    'tvl': tvl,
    'pChainHeight': pChainHeight,
    'xChainHeight': xChainHeight,
    'cChainHeight': cChainHeight,
    'activeSubnets': activeSubnets,
    'subnetParticipation': subnetParticipation,
  };
}

/// Avalanche transaction
class AvalancheTransaction extends BlockchainTransaction {
  final String nonce;
  final double gasPrice;
  final int gasLimit;
  final String to;
  final String value;
  final String data;
  final String v;
  final String r;
  final String s;
  final String hash;
  final int blockNumber;
  final String blockHash;
  final int transactionIndex;
  final String from;
  final String cumulativeGasUsed;
  final String gasUsed;
  final String contractAddress;
  final List<dynamic> logs;
  final String logsBloom;
  final String root;
  final String transactionHash;

  const AvalancheTransaction({
    required super.id,
    required super.fromAddress,
    required super.toAddress,
    required super.amount,
    required this.gasPrice,
    required this.gasLimit,
    required this.data,
    required super.type,
    required super.timestamp,
    required super.status,
    required this.nonce,
    required this.to,
    required this.value,
    required this.v,
    required this.r,
    required this.s,
    required this.hash,
    required this.blockNumber,
    required this.blockHash,
    required this.transactionIndex,
    required this.from,
    required this.cumulativeGasUsed,
    required this.gasUsed,
    required this.contractAddress,
    required this.logs,
    required this.logsBloom,
    required this.root,
    required this.transactionHash,
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
    'to': to,
    'value': value,
    'v': v,
    'r': r,
    's': s,
    'hash': hash,
    'blockNumber': blockNumber,
    'blockHash': blockHash,
    'transactionIndex': transactionIndex,
    'from': from,
    'cumulativeGasUsed': cumulativeGasUsed,
    'gasUsed': gasUsed,
    'contractAddress': contractAddress,
    'logs': logs,
    'logsBloom': logsBloom,
    'root': root,
    'transactionHash': transactionHash,
  };

  factory AvalancheTransaction.fromJson(Map<String, dynamic> json) {
    return AvalancheTransaction(
      id: json['hash'] ?? '',
      fromAddress: json['from'] ?? '',
      toAddress: json['to'] ?? '',
      amount: double.parse(json['value'] ?? '0') / 1e18,
      gasPrice: double.parse(json['gasPrice'] ?? '0') / 1e9,
      gasLimit: int.parse(json['gas'] ?? '0'),
      data: json['input'] ?? '',
      type: TransactionType.transfer,
      timestamp: DateTime.now(),
      status: json['status'] == '0x1' ? true : false,
      nonce: json['nonce'] ?? '',
      to: json['to'] ?? '',
      value: json['value'] ?? '',
      v: json['v'] ?? '',
      r: json['r'] ?? '',
      s: json['s'] ?? '',
      hash: json['hash'] ?? '',
      blockNumber: int.parse(json['blockNumber'] ?? '0'),
      blockHash: json['blockHash'] ?? '',
      transactionIndex: int.parse(json['transactionIndex'] ?? '0'),
      from: json['from'] ?? '',
      cumulativeGasUsed: json['cumulativeGasUsed'] ?? '',
      gasUsed: json['gasUsed'] ?? '',
      contractAddress: json['contractAddress'] ?? '',
      logs: json['logs'] ?? [],
      logsBloom: json['logsBloom'] ?? '',
      root: json['root'] ?? '',
      transactionHash: json['transactionHash'] ?? '',
    );
  }
}

/// Avalanche signed transaction
class AvalancheSignedTransaction extends SignedTransaction {
  final String serializedTx;

  const AvalancheSignedTransaction({
    required super.transaction,
    required super.signature,
    required super.hash,
    required this.serializedTx,
  });

  @override
  Map<String, dynamic> toJson() => {
    'transaction': transaction.toJson(),
    'signature': signature,
    'hash': hash,
    'serializedTx': serializedTx,
  };
}

/// Avalanche transaction receipt
class AvalancheTransactionReceipt extends TransactionReceipt {
  final String logsBloom;
  final String root;
  final String contractAddress;

  const AvalancheTransactionReceipt({
    required super.transactionHash,
    required super.blockNumber,
    required super.blockHash,
    required super.confirmations,
    required super.status,
    required super.gasUsed,
    required super.events,
    required this.logsBloom,
    required this.root,
    required this.contractAddress,
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
    'logsBloom': logsBloom,
    'root': root,
    'contractAddress': contractAddress,
  };

  factory AvalancheTransactionReceipt.fromJson(Map<String, dynamic> json) {
    return AvalancheTransactionReceipt(
      transactionHash: json['transactionHash'] ?? '',
      blockNumber: int.parse(json['blockNumber'] ?? '0'),
      blockHash: json['blockHash'] ?? '',
      confirmations: 1,
      status: json['status'] == '0x1' ? true : false,
      gasUsed: double.parse(json['gasUsed'] ?? '0'),
      events: (json['logs'] as List? ?? [])
          .map((log) => AvalancheEvent.fromJson(log))
          .toList(),
      logsBloom: json['logsBloom'] ?? '',
      root: json['root'] ?? '',
      contractAddress: json['contractAddress'] ?? '',
    );
  }
}

/// Avalanche block
class AvalancheBlock extends Block {
  final String stateRoot;
  final String receiptsRoot;
  final String transactionsRoot;
  final String miner;
  final int size;
  final int gasUsed;
  final int gasLimit;
  final String extraData;

  const AvalancheBlock({
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
    required this.extraData,
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
    'extraData': extraData,
  };

  factory AvalancheBlock.fromJson(Map<String, dynamic> json) {
    return AvalancheBlock(
      hash: json['hash'] ?? '',
      number: int.parse(json['number'] ?? '0'),
      parentHash: json['parentHash'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['timestamp'] ?? '0') * 1000,
      ),
      transactions: (json['transactions'] as List? ?? [])
          .map((tx) => tx['hash'] as String)
          .toList(),
      stateRoot: json['stateRoot'] ?? '',
      receiptsRoot: json['receiptsRoot'] ?? '',
      transactionsRoot: json['transactionsRoot'] ?? '',
      miner: json['miner'] ?? '',
      size: int.parse(json['size'] ?? '0'),
      gasUsed: int.parse(json['gasUsed'] ?? '0'),
      gasLimit: int.parse(json['gasLimit'] ?? '0'),
      extraData: json['extraData'] ?? '',
    );
  }
}

/// Avalanche event
class AvalancheEvent extends TransactionEvent {
  final List<String> topics;
  final bool removed;

  const AvalancheEvent({
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

  factory AvalancheEvent.fromJson(Map<String, dynamic> json) {
    return AvalancheEvent(
      name: 'event',
      data: {'data': json['data']},
      address: json['address'] ?? '',
      logIndex: int.parse(json['logIndex'] ?? '0'),
      topics: (json['topics'] as List? ?? []).cast<String>(),
      removed: json['removed'] ?? false,
    );
  }
}

/// Avalanche validator
class AvalancheValidator extends Validator {
  final String nodeId;
  final String subnetId;
  final Duration uptime;

  const AvalancheValidator({
    required super.id,
    required super.name,
    required super.address,
    required super.commission,
    required super.totalStaked,
    required super.delegators,
    required super.active,
    required this.nodeId,
    required this.subnetId,
    required this.uptime,
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
    'nodeId': nodeId,
    'subnetId': subnetId,
    'uptime': uptime.inSeconds,
  };
}

/// Avalanche investment pool
class AvalancheInvestmentPool extends InvestmentPool {
  final String subnetId;

  const AvalancheInvestmentPool({
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
    required this.subnetId,
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
    'subnetId': subnetId,
  };
}

/// Avalanche investment
class AvalancheInvestment extends Investment {
  final String transactionHash;
  final String contractAddress;
  final String subnetId;

  const AvalancheInvestment({
    required super.id,
    required super.poolId,
    required super.walletAddress,
    required super.amount,
    required super.expectedReturn,
    required super.createdAt,
    required super.maturityDate,
    required this.transactionHash,
    required this.contractAddress,
    required this.subnetId,
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
    'subnetId': subnetId,
  };
}

/// Avalanche staking position
class AvalancheStakingPosition extends StakingPosition {
  final String transactionHash;
  final String subnetId;

  const AvalancheStakingPosition({
    required super.id,
    required super.validatorId,
    required super.walletAddress,
    required super.amount,
    required super.rewards,
    required super.createdAt,
    required super.lastRewardClaim,
    required this.transactionHash,
    required this.subnetId,
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
    'subnetId': subnetId,
  };
}

class AvalancheBridgeTransaction extends BridgeTransaction {
  final String bridgeContract;
  final int nonce;
  final String sourceSubnet;

  const AvalancheBridgeTransaction({
    required this.bridgeContract,
    required this.nonce,
    required this.sourceSubnet,
    required super.id,
    required super.sourceChain,
    required super.targetChain,
    required super.sourceAddress,
    required super.targetAddress,
    required super.amount,
    required super.fee,
    required super.timestamp,
    required super.status,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridgeContract': bridgeContract,
      'nonce': nonce,
      'sourceSubnet': sourceSubnet,
      'id': id,
      'sourceChain': sourceChain.toString(),
      'targetChain': targetChain.toString(),
      'sourceAddress': sourceAddress,
      'targetAddress': targetAddress,
      'amount': amount,
      'fee': fee,
      'timestamp': timestamp.toIso8601String(),
      'status': status.toString(),
    };
  }
}

class AvalancheInvestmentStats extends InvestmentStats {
  final double totalGasFees;
  final List<String> protocolsUsed;
  final Map<String, double> subnetDistribution;

  const AvalancheInvestmentStats({
    required super.totalInvested,
    required super.totalReturns,
    required super.pendingRewards,
    required super.activeInvestments,
    required super.averageAPR,
    required super.averageLockPeriod,
    required this.totalGasFees,
    required this.protocolsUsed,
    required this.subnetDistribution,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'totalInvested': totalInvested,
      'totalReturns': totalReturns,
      'pendingRewards': pendingRewards,
      'activeInvestments': activeInvestments,
      'averageAPR': averageAPR,
      'averageLockPeriod': averageLockPeriod.inSeconds,
      'totalGasFees': totalGasFees,
      'protocolsUsed': protocolsUsed,
      'subnetDistribution': subnetDistribution,
    };
  }
}

class AvalancheStakingStats extends StakingStats {
  final double epochRewards;
  final Duration timeUntilNextEpoch;
  final List<String> subnetParticipation;

  const AvalancheStakingStats({
    required super.totalStaked,
    required super.totalRewards,
    required super.activePositions,
    required super.averageAPR,
    required super.totalValidators,
    required super.slashingEvents,
    required this.epochRewards,
    required this.timeUntilNextEpoch,
    required this.subnetParticipation,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'totalStaked': totalStaked,
      'totalRewards': totalRewards,
      'activePositions': activePositions,
      'averageAPR': averageAPR,
      'totalValidators': totalValidators,
      'slashingEvents': slashingEvents,
      'epochRewards': epochRewards,
      'timeUntilNextEpoch': timeUntilNextEpoch.inSeconds,
      'subnetParticipation': subnetParticipation,
    };
  }
}
