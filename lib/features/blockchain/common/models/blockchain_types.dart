class TransactionResult {
  final bool success;
  final String? transactionHash;
  final BigInt? gasUsed;
  final BigInt? blockNumber;
  final String? error;

  TransactionResult({
    required this.success,
    this.transactionHash,
    this.gasUsed,
    this.blockNumber,
    this.error,
  });
}

class ContractResult {
  final bool success;
  final String? transactionHash;
  final BigInt? gasUsed;
  final String? result;
  final String? error;

  ContractResult({
    required this.success,
    this.transactionHash,
    this.gasUsed,
    this.result,
    this.error,
  });
}

class StakingInfo {
  final BigInt totalStaked;
  final BigInt rewards;
  final Duration stakingPeriod;
  final double apy;
  final String? error;

  StakingInfo({
    required this.totalStaked,
    required this.rewards,
    required this.stakingPeriod,
    required this.apy,
    this.error,
  });
}

class BlockchainTransaction {
  final String id;
  final String fromAddress;
  final String toAddress;
  final double amount;
  final double gasPrice;
  final int gasLimit;
  final String? data;

  BlockchainTransaction({
    required this.id,
    required this.fromAddress,
    required this.toAddress,
    required this.amount,
    required this.gasPrice,
    required this.gasLimit,
    this.data,
  });
}

enum BlockchainNetwork {
  ethereum,
  binance,
  polygon,
  arbitrum,
  optimism,
  ton,
}
