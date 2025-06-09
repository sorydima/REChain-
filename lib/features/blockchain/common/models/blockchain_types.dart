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
  claim
}

enum AssetType {
  native,
  token,
  nft
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
