import '../../common/interfaces/blockchain_service.dart';
import '../../common/models/blockchain_types.dart';

/// TON-specific network statistics
class TonNetworkStats extends NetworkStats {
  final int workchain;
  final double shardId;

  const TonNetworkStats({
    required super.averageGasPrice,
    required super.blockHeight,
    required super.tps,
    required super.activeValidators,
    required super.totalStaked,
    required super.marketCap,
    required super.tvl,
    required this.workchain,
    required this.shardId,
  });
}

/// TON transaction
class TonTransaction extends BlockchainTransaction {
  final int workchain;
  final int seqno;
  final String serializedBoc;

  const TonTransaction({
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
    required this.workchain,
    required this.seqno,
    required this.serializedBoc,
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
    'workchain': workchain,
    'seqno': seqno,
    'serializedBoc': serializedBoc,
  };

  factory TonTransaction.fromJson(Map<String, dynamic> json) {
    return TonTransaction(
      id: json['transaction_id']['hash'] ?? '',
      fromAddress: json['in_msg']['source'] ?? '',
      toAddress: json['in_msg']['destination'] ?? '',
      amount: double.parse(json['in_msg']['value'] ?? '0') / 1e9,
      gasPrice: double.parse(json['fee'] ?? '0') / 1e9,
      gasLimit: 1000000,
      data: json['in_msg']['msg_data'],
      type: TransactionType.transfer,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (json['utime'] as int) * 1000,
      ),
      status: TransactionStatus.confirmed,
      workchain: json['transaction_id']['workchain'] ?? 0,
      seqno: json['transaction_id']['lt'] ?? 0,
      serializedBoc: json['data'] ?? '',
    );
  }
}

/// TON signed transaction
class TonSignedTransaction extends SignedTransaction {
  final String serializedBoc;
  final int workchain;

  const TonSignedTransaction({
    required super.transaction,
    required super.signature,
    required super.hash,
    required this.serializedBoc,
    required this.workchain,
  });

  @override
  Map<String, dynamic> toJson() => {
    'transaction': transaction.toJson(),
    'signature': signature,
    'hash': hash,
    'serializedBoc': serializedBoc,
    'workchain': workchain,
  };
}

/// TON transaction receipt
class TonTransactionReceipt extends TransactionReceipt {
  final String description;
  final bool success;
  final int workchain;

  const TonTransactionReceipt({
    required super.transactionHash,
    required super.blockNumber,
    required super.blockHash,
    required super.confirmations,
    required super.status,
    required super.gasUsed,
    required super.events,
    required this.description,
    required this.success,
    required this.workchain,
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
    'description': description,
    'success': success,
    'workchain': workchain,
  };

  factory TonTransactionReceipt.fromJson(Map<String, dynamic> json) {
    return TonTransactionReceipt(
      transactionHash: json['transaction_id']['hash'] ?? '',
      blockNumber: json['transaction_id']['lt'] ?? 0,
      blockHash: json['block_id']['root_hash'] ?? '',
      confirmations: 1,
      status: json['success'] ?? false,
      gasUsed: double.parse(json['fee'] ?? '0') / 1e9,
      events: (json['out_msgs'] as List? ?? [])
          .map((msg) => TonEvent.fromJson(msg))
          .toList(),
      description: json['description']['type'] ?? '',
      success: json['success'] ?? false,
      workchain: json['transaction_id']['workchain'] ?? 0,
    );
  }
}

/// TON block
class TonBlock extends Block {
  final String rootHash;
  final String fileHash;
  final int workchain;
  final String shard;
  final int seqno;

  const TonBlock({
    required super.hash,
    required super.number,
    required super.parentHash,
    required super.timestamp,
    required super.transactions,
    required this.rootHash,
    required this.fileHash,
    required this.workchain,
    required this.shard,
    required this.seqno,
  });

  @override
  Map<String, dynamic> toJson() => {
    'hash': hash,
    'number': number,
    'parentHash': parentHash,
    'timestamp': timestamp.toIso8601String(),
    'transactions': transactions,
    'rootHash': rootHash,
    'fileHash': fileHash,
    'workchain': workchain,
    'shard': shard,
    'seqno': seqno,
  };

  factory TonBlock.fromJson(Map<String, dynamic> json) {
    return TonBlock(
      hash: json['id']['root_hash'] ?? '',
      number: json['id']['seqno'] ?? 0,
      parentHash: json['prev_ref']['root_hash'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (json['gen_utime'] as int) * 1000,
      ),
      transactions: (json['transactions'] as List? ?? [])
          .map((tx) => tx['hash'] as String)
          .toList(),
      rootHash: json['id']['root_hash'] ?? '',
      fileHash: json['id']['file_hash'] ?? '',
      workchain: json['id']['workchain'] ?? 0,
      shard: json['id']['shard'] ?? '',
      seqno: json['id']['seqno'] ?? 0,
    );
  }
}

/// TON event
class TonEvent extends TransactionEvent {
  final String source;
  final String destination;
  final String value;
  final String msgData;

  const TonEvent({
    required super.name,
    required super.data,
    required super.address,
    required super.logIndex,
    required this.source,
    required this.destination,
    required this.value,
    required this.msgData,
  });

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'data': data,
    'address': address,
    'logIndex': logIndex,
    'source': source,
    'destination': destination,
    'value': value,
    'msgData': msgData,
  };

  factory TonEvent.fromJson(Map<String, dynamic> json) {
    return TonEvent(
      name: 'message',
      data: {'msg_data': json['msg_data']},
      address: json['source'] ?? '',
      logIndex: 0,
      source: json['source'] ?? '',
      destination: json['destination'] ?? '',
      value: json['value'] ?? '0',
      msgData: json['msg_data'] ?? '',
    );
  }
}

/// TON validator
class TonValidator extends Validator {
  final String adnlAddress;
  final String publicKey;
  final int workchain;

  const TonValidator({
    required super.id,
    required super.name,
    required super.address,
    required super.commission,
    required super.totalStaked,
    required super.delegators,
    required super.active,
    required this.adnlAddress,
    required this.publicKey,
    required this.workchain,
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
    'adnlAddress': adnlAddress,
    'publicKey': publicKey,
    'workchain': workchain,
  };
}

/// TON investment pool
class TonInvestmentPool extends InvestmentPool {
  final int workchain;

  const TonInvestmentPool({
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
    required this.workchain,
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
    'workchain': workchain,
  };
}

/// TON investment
class TonInvestment extends Investment {
  final String transactionHash;
  final String contractAddress;
  final int workchain;

  const TonInvestment({
    required super.id,
    required super.poolId,
    required super.walletAddress,
    required super.amount,
    required super.expectedReturn,
    required super.createdAt,
    required super.maturityDate,
    required this.transactionHash,
    required this.contractAddress,
    required this.workchain,
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
    'workchain': workchain,
  };
}

/// TON staking position
class TonStakingPosition extends StakingPosition {
  final String transactionHash;
  final String adnlAddress;
  final int workchain;

  const TonStakingPosition({
    required super.id,
    required super.validatorId,
    required super.walletAddress,
    required super.amount,
    required super.rewards,
    required super.createdAt,
    required super.lastRewardClaim,
    required this.transactionHash,
    required this.adnlAddress,
    required this.workchain,
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
    'adnlAddress': adnlAddress,
    'workchain': workchain,
  };
}

/// TON bridge transaction
class TonBridgeTransaction extends BridgeTransaction {
  final String bridgeContract;
  final int nonce;
  final int workchain;

  const TonBridgeTransaction({
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
    required this.workchain,
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
    'workchain': workchain,
  };
}

/// TON investment statistics
class TonInvestmentStats extends InvestmentStats {
  final double totalGasFees;
  final List<String> protocolsUsed;
  final Map<int, double> workchainDistribution;

  const TonInvestmentStats({
    required super.totalInvested,
    required super.totalReturns,
    required super.pendingRewards,
    required super.activeInvestments,
    required super.averageAPR,
    required super.averageLockPeriod,
    required this.totalGasFees,
    required this.protocolsUsed,
    required this.workchainDistribution,
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
    'workchainDistribution': workchainDistribution,
  };
}

/// TON staking statistics
class TonStakingStats extends StakingStats {
  final double epochRewards;
  final Duration timeUntilNextEpoch;

  const TonStakingStats({
    required super.totalStaked,
    required super.totalRewards,
    required super.activePositions,
    required super.averageAPR,
    required super.totalValidators,
    required super.slashingEvents,
    required this.epochRewards,
    required this.timeUntilNextEpoch,
  });

  @override
  Map<String, dynamic> toJson() => {
    'totalStaked': totalStaked,
    'totalRewards': totalRewards,
    'activePositions': activePositions,
    'averageAPR': averageAPR,
    'totalValidators': totalValidators,
    'slashingEvents': slashingEvents,
    'epochRewards': epochRewards,
    'timeUntilNextEpoch': timeUntilNextEpoch.inSeconds,
  };
}
