import '../../common/interfaces/blockchain_service.dart';
import '../../common/models/blockchain_types.dart';

/// Solana-specific network statistics
class SolanaNetworkStats extends NetworkStats {
  final int currentEpoch;
  final int slotsInEpoch;
  final int slotHeight;
  final double currentInflation;

  const SolanaNetworkStats({
    required super.averageGasPrice,
    required super.blockHeight,
    required super.tps,
    required super.activeValidators,
    required super.totalStaked,
    required super.marketCap,
    required super.tvl,
    required this.currentEpoch,
    required this.slotsInEpoch,
    required this.slotHeight,
    required this.currentInflation,
  });
}

/// Solana transaction
class SolanaTransaction extends BlockchainTransaction {
  final List<Map<String, dynamic>> instructions;
  final String serializedMessage;

  const SolanaTransaction({
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
    required this.instructions,
    required this.serializedMessage,
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
    'instructions': instructions,
    'serializedMessage': serializedMessage,
  };

  factory SolanaTransaction.fromJson(Map<String, dynamic> json) {
    return SolanaTransaction(
      id: json['signature'] ?? '',
      fromAddress: json['message']['accountKeys'][0] ?? '',
      toAddress: json['message']['accountKeys'][1] ?? '',
      amount: (json['meta']?['postBalances'][1] ?? 0) / 1e9,
      gasPrice: 0.000005,
      gasLimit: 0.000005,
      type: TransactionType.transfer,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (json['blockTime'] ?? 0) * 1000,
      ),
      status: json['meta']?['err'] == null
          ? TransactionStatus.confirmed
          : TransactionStatus.failed,
      instructions: (json['message']['instructions'] as List? ?? [])
          .cast<Map<String, dynamic>>(),
      serializedMessage: json['message']?['serializedMessage'] ?? '',
    );
  }
}

/// Solana signed transaction
class SolanaSignedTransaction extends SignedTransaction {
  final String publicKey;

  const SolanaSignedTransaction({
    required super.transaction,
    required super.signature,
    required super.hash,
    required this.publicKey,
  });

  @override
  Map<String, dynamic> toJson() => {
    'transaction': transaction.toJson(),
    'signature': signature,
    'hash': hash,
    'publicKey': publicKey,
  };
}

/// Solana transaction receipt
class SolanaTransactionReceipt extends TransactionReceipt {
  final String slot;
  final List<String> rewards;
  final Map<String, dynamic> meta;

  const SolanaTransactionReceipt({
    required super.transactionHash,
    required super.blockNumber,
    required super.blockHash,
    required super.confirmations,
    required super.status,
    required super.gasUsed,
    required super.events,
    required this.slot,
    required this.rewards,
    required this.meta,
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
    'slot': slot,
    'rewards': rewards,
    'meta': meta,
  };

  factory SolanaTransactionReceipt.fromJson(Map<String, dynamic> json) {
    return SolanaTransactionReceipt(
      transactionHash: json['transaction']['signatures'][0] ?? '',
      blockNumber: json['slot'] ?? 0,
      blockHash: json['blockhash'] ?? '',
      confirmations: json['confirmations'] ?? 0,
      status: json['meta']?['err'] == null,
      gasUsed: 0.000005,
      events: (json['meta']?['logMessages'] as List? ?? [])
          .map((log) => SolanaEvent(
            name: 'log',
            data: {'message': log},
            programId: '',
            slot: json['slot'] ?? 0,
          ))
          .toList(),
      slot: json['slot'].toString(),
      rewards: (json['meta']?['rewards'] as List? ?? [])
          .map((r) => r.toString())
          .toList(),
      meta: json['meta'] ?? {},
    );
  }
}

/// Solana block
class SolanaBlock extends Block {
  final String slot;
  final String previousBlockhash;
  final String blockhash;
  final int blockTime;
  final List<String> rewards;
  final int blockHeight;

  const SolanaBlock({
    required super.hash,
    required super.number,
    required super.parentHash,
    required super.timestamp,
    required super.transactions,
    required this.slot,
    required this.previousBlockhash,
    required this.blockhash,
    required this.blockTime,
    required this.rewards,
    required this.blockHeight,
  });

  @override
  Map<String, dynamic> toJson() => {
    'hash': hash,
    'number': number,
    'parentHash': parentHash,
    'timestamp': timestamp.toIso8601String(),
    'transactions': transactions,
    'slot': slot,
    'previousBlockhash': previousBlockhash,
    'blockhash': blockhash,
    'blockTime': blockTime,
    'rewards': rewards,
    'blockHeight': blockHeight,
  };

  factory SolanaBlock.fromJson(Map<String, dynamic> json) {
    return SolanaBlock(
      hash: json['blockhash'] ?? '',
      number: json['slot'] ?? 0,
      parentHash: json['previousBlockhash'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (json['blockTime'] ?? 0) * 1000,
      ),
      transactions: (json['transactions'] as List? ?? [])
          .map((tx) => tx['transaction']['signatures'][0] as String)
          .toList(),
      slot: json['slot'].toString(),
      previousBlockhash: json['previousBlockhash'] ?? '',
      blockhash: json['blockhash'] ?? '',
      blockTime: json['blockTime'] ?? 0,
      rewards: (json['rewards'] as List? ?? [])
          .map((r) => r.toString())
          .toList(),
      blockHeight: json['blockHeight'] ?? 0,
    );
  }
}

/// Solana event
class SolanaEvent extends TransactionEvent {
  final String programId;
  final int slot;

  const SolanaEvent({
    required super.name,
    required super.data,
    required this.programId,
    required this.slot,
  });

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'data': data,
    'programId': programId,
    'slot': slot,
  };
}

/// Solana validator
class SolanaValidator extends Validator {
  final String voteAccount;
  final int lastVote;
  final int rootSlot;

  const SolanaValidator({
    required super.id,
    required super.name,
    required super.address,
    required super.commission,
    required super.totalStaked,
    required super.delegators,
    required super.active,
    required this.voteAccount,
    required this.lastVote,
    required this.rootSlot,
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
    'voteAccount': voteAccount,
    'lastVote': lastVote,
    'rootSlot': rootSlot,
  };
}

/// Solana investment pool
class SolanaInvestmentPool extends InvestmentPool {
  final String programId;
  final String protocol;
  final String asset;
  final String rewardToken;

  const SolanaInvestmentPool({
    required super.id,
    required super.name,
    required super.description,
    required this.programId,
    required super.minInvestment,
    required super.maxInvestment,
    required super.expectedApr,
    required super.lockPeriod,
    required super.totalValueLocked,
    required super.participantCount,
    required super.isActive,
    required this.protocol,
    required this.asset,
    required this.rewardToken,
  });

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'programId': programId,
    'minInvestment': minInvestment,
    'maxInvestment': maxInvestment,
    'expectedApr': expectedApr,
    'lockPeriod': lockPeriod.inSeconds,
    'totalValueLocked': totalValueLocked,
    'participantCount': participantCount,
    'isActive': isActive,
    'protocol': protocol,
    'asset': asset,
    'rewardToken': rewardToken,
  };
}

/// Solana investment
class SolanaInvestment extends Investment {
  final String signature;
  final String programId;
  final String rewardToken;

  const SolanaInvestment({
    required super.id,
    required super.poolId,
    required super.walletAddress,
    required super.amount,
    required super.expectedReturn,
    required super.createdAt,
    required super.maturityDate,
    required this.signature,
    required this.programId,
    required this.rewardToken,
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
    'signature': signature,
    'programId': programId,
    'rewardToken': rewardToken,
  };
}

/// Solana staking position
class SolanaStakingPosition extends StakingPosition {
  final String signature;
  final String voteAccount;
  final int activationEpoch;

  const SolanaStakingPosition({
    required super.id,
    required super.validatorId,
    required super.walletAddress,
    required super.amount,
    required super.rewards,
    required super.createdAt,
    required super.lastRewardClaim,
    required this.signature,
    required this.voteAccount,
    required this.activationEpoch,
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
    'signature': signature,
    'voteAccount': voteAccount,
    'activationEpoch': activationEpoch,
  };
}

/// Solana bridge transaction
class SolanaBridgeTransaction extends BridgeTransaction {
  final String programId;
  final int sequence;
  final String custodianAddress;

  const SolanaBridgeTransaction({
    required super.id,
    required super.sourceChain,
    required super.targetChain,
    required super.sourceAddress,
    required super.targetAddress,
    required super.amount,
    required super.fee,
    required super.timestamp,
    required super.status,
    required this.programId,
    required this.sequence,
    required this.custodianAddress,
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
    'programId': programId,
    'sequence': sequence,
    'custodianAddress': custodianAddress,
  };
}

/// Solana investment statistics
class SolanaInvestmentStats {
  final double totalInvested;
  final double totalReturns;
  final double pendingRewards;
  final int activeInvestments;
  final double averageAPR;
  final Duration averageLockPeriod;
  final double totalFees;
  final List<String> protocolsUsed;
  final List<String> rewardTokens;

  const SolanaInvestmentStats({
    required this.totalInvested,
    required this.totalReturns,
    required this.pendingRewards,
    required this.activeInvestments,
    required this.averageAPR,
    required this.averageLockPeriod,
    required this.totalFees,
    required this.protocolsUsed,
    required this.rewardTokens,
  });

  Map<String, dynamic> toJson() => {
    'totalInvested': totalInvested,
    'totalReturns': totalReturns,
    'pendingRewards': pendingRewards,
    'activeInvestments': activeInvestments,
    'averageAPR': averageAPR,
    'averageLockPeriod': averageLockPeriod.inSeconds,
    'totalFees': totalFees,
    'protocolsUsed': protocolsUsed,
    'rewardTokens': rewardTokens,
  };
}

/// Solana staking statistics
class SolanaStakingStats {
  final double totalStaked;
  final double totalRewards;
  final int activePositions;
  final double averageAPR;
  final int totalValidators;
  final int slashingEvents;
  final int currentEpoch;
  final Duration warmupPeriod;
  final Duration cooldownPeriod;

  const SolanaStakingStats({
    required this.totalStaked,
    required this.totalRewards,
    required this.activePositions,
    required this.averageAPR,
    required this.totalValidators,
    required this.slashingEvents,
    required this.currentEpoch,
    required this.warmupPeriod,
    required this.cooldownPeriod,
  });

  Map<String, dynamic> toJson() => {
    'totalStaked': totalStaked,
    'totalRewards': totalRewards,
    'activePositions': activePositions,
    'averageAPR': averageAPR,
    'totalValidators': totalValidators,
    'slashingEvents': slashingEvents,
    'currentEpoch': currentEpoch,
    'warmupPeriod': warmupPeriod.inSeconds,
    'cooldownPeriod': cooldownPeriod.inSeconds,
  };
}
