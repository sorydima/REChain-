enum BlockchainNetwork {
  ethereum,
  binance,
  solana,
  polygon,
  arbitrum,
  optimism,
  avalanche,
  fantom,
  cosmos,
  ton
}

enum NetworkType {
  mainnet,
  testnet,
  devnet
}

enum TransactionType {
  transfer,
  swap,
  stake,
  unstake,
  bridge,
  invest,
  withdraw,
  claim,
  staking,
  contract,
  mint,
  burn
}

enum AssetType {
  native,
  token,
  nft
}

enum TransactionStatus {
  pending,
  confirmed,
  failed,
  cancelled
}

enum BridgeStatus {
  pending,
  processing,
  completed,
  failed
}

enum InvestmentStatus {
  active,
  completed,
  cancelled,
  failed
}

enum StakingStatus {
  active,
  inactive,
  slashed,
  unbonding
}

class ChainConfig {
  final BlockchainNetwork network;
  final String name;
  final String nativeCurrency;
  final String currencySymbol;
  final int decimals;
  final String rpcUrl;
  final String explorerUrl;
  final int chainId;
  final NetworkType networkType;
  final Map<String, String> bridgeContracts;
  final Map<String, String> stakingContracts;
  final Map<String, String> investmentContracts;

  const ChainConfig({
    required this.network,
    required this.name,
    required this.nativeCurrency,
    required this.currencySymbol,
    required this.decimals,
    required this.rpcUrl,
    required this.explorerUrl,
    required this.chainId,
    required this.networkType,
    this.bridgeContracts = const {},
    this.stakingContracts = const {},
    this.investmentContracts = const {},
  });
}

abstract class NetworkStats {
  final double averageGasPrice;
  final int blockHeight;
  final double tps; // Transactions per second
  final int activeValidators;
  final double totalStaked;
  final double marketCap;
  final double tvl; // Total value locked

  const NetworkStats({
    required this.averageGasPrice,
    required this.blockHeight,
    required this.tps,
    required this.activeValidators,
    required this.totalStaked,
    required this.marketCap,
    required this.tvl,
  });
}

abstract class InvestmentStats {
  final double totalInvested;
  final double totalReturns;
  final double pendingRewards;
  final int activeInvestments;
  final double averageAPR;
  final Duration averageLockPeriod;

  const InvestmentStats({
    required this.totalInvested,
    required this.totalReturns,
    required this.pendingRewards,
    required this.activeInvestments,
    required this.averageAPR,
    required this.averageLockPeriod,
  });

  Map<String, dynamic> toJson();
}

abstract class StakingStats {
  final double totalStaked;
  final double totalRewards;
  final int activePositions;
  final double averageAPR;
  final int totalValidators;
  final int slashingEvents;

  const StakingStats({
    required this.totalStaked,
    required this.totalRewards,
    required this.activePositions,
    required this.averageAPR,
    required this.totalValidators,
    required this.slashingEvents,
  });

  Map<String, dynamic> toJson();
}

abstract class InvestmentPool {
  final String id;
  final String name;
  final String description;
  final String contractAddress;
  final double minInvestment;
  final double maxInvestment;
  final double expectedApr;
  final Duration lockPeriod;
  final double totalValueLocked;
  final int participantCount;
  final bool isActive;
  final String protocol;
  final String asset;

  const InvestmentPool({
    required this.id,
    required this.name,
    required this.description,
    required this.contractAddress,
    required this.minInvestment,
    required this.maxInvestment,
    required this.expectedApr,
    required this.lockPeriod,
    required this.totalValueLocked,
    required this.participantCount,
    required this.isActive,
    required this.protocol,
    required this.asset,
  });

  Map<String, dynamic> toJson();
}

abstract class Investment {
  final String id;
  final String poolId;
  final String walletAddress;
  final double amount;
  final double expectedReturn;
  final DateTime createdAt;
  final DateTime maturityDate;

  const Investment({
    required this.id,
    required this.poolId,
    required this.walletAddress,
    required this.amount,
    required this.expectedReturn,
    required this.createdAt,
    required this.maturityDate,
  });

  Map<String, dynamic> toJson();
}

abstract class Validator {
  final String id;
  final String name;
  final String address;
  final double commission;
  final double totalStaked;
  final int delegators;
  final bool active;

  const Validator({
    required this.id,
    required this.name,
    required this.address,
    required this.commission,
    required this.totalStaked,
    required this.delegators,
    required this.active,
  });

  Map<String, dynamic> toJson();
}

abstract class StakingPosition {
  final String id;
  final String validatorId;
  final String walletAddress;
  final double amount;
  final double rewards;
  final DateTime createdAt;
  final DateTime lastRewardClaim;

  const StakingPosition({
    required this.id,
    required this.validatorId,
    required this.walletAddress,
    required this.amount,
    required this.rewards,
    required this.createdAt,
    required this.lastRewardClaim,
  });

  Map<String, dynamic> toJson();
}

abstract class BridgeTransaction {
  final String id;
  final BlockchainNetwork sourceChain;
  final BlockchainNetwork targetChain;
  final String sourceAddress;
  final String targetAddress;
  final double amount;
  final double fee;
  final DateTime timestamp;
  final BridgeStatus status;

  const BridgeTransaction({
    required this.id,
    required this.sourceChain,
    required this.targetChain,
    required this.sourceAddress,
    required this.targetAddress,
    required this.amount,
    required this.fee,
    required this.timestamp,
    required this.status,
  });

  Map<String, dynamic> toJson();
}

abstract class TransactionEvent {
  final String name;
  final Map<String, dynamic> data;
  final String address;
  final int logIndex;

  const TransactionEvent({
    required this.name,
    required this.data,
    required this.address,
    required this.logIndex,
  });

  Map<String, dynamic> toJson();
}
