import '../../common/models/blockchain_types.dart';

/// Configuration for Arbitrum blockchain
class ArbitrumConfig implements ChainConfig {
  @override
  final BlockchainNetwork network;
  @override
  final String name;
  @override
  final String nativeCurrency;
  @override
  final String currencySymbol;
  @override
  final int decimals;
  final String rpcUrl;
  @override
  final String explorerUrl;
  @override
  final int chainId;
  @override
  final NetworkType networkType;
  @override
  final Map<String, String> bridgeContracts;
  @override
  final Map<String, String> stakingContracts;
  @override
  final Map<String, String> investmentContracts;

  const ArbitrumConfig({
    required this.network,
    required this.name,
    required this.nativeCurrency,
    required this.currencySymbol,
    required this.decimals,
    required this.rpcUrl,
    required this.explorerUrl,
    required this.chainId,
    required this.networkType,
    required this.bridgeContracts,
    required this.stakingContracts,
    required this.investmentContracts,
  });

  @override
  bool get isTestnet => networkType == NetworkType.testnet;

  @override
  Map<String, dynamic> toJson() => {
    'name': name,
    'symbol': currencySymbol,
    'decimals': decimals,
    'networkType': networkType.toString().split('.').last,
    'isTestnet': isTestnet,
    'rpcUrl': rpcUrl,
    'chainId': chainId,
    'nativeCurrency': nativeCurrency,
    'blockExplorerUrl': explorerUrl,
    'bridgeContracts': bridgeContracts,
    'stakingContracts': stakingContracts,
    'investmentContracts': investmentContracts,
  };

  factory ArbitrumConfig.mainnet() {
    return ArbitrumConfig(
      network: BlockchainNetwork.arbitrum,
      name: 'Arbitrum One',
      nativeCurrency: 'ETH',
      currencySymbol: 'ARB',
      decimals: 18,
      rpcUrl: 'https://arb1.arbitrum.io/rpc',
      explorerUrl: 'https://arbiscan.io',
      chainId: 42161,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': '0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a',
        'optimism': '0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a',
        'polygon': '0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a',
        'ton': '0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a',
      },
      stakingContracts: {
        'gmx': '0x908C4D94D34924765f1eDc22A1DD098397c59dD4',
        'uniswap': '0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984',
      },
      investmentContracts: {
        'gmx': '0x908C4D94D34924765f1eDc22A1DD098397c59dD4',
        'uniswap': '0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984',
      },
    );
  }

  factory ArbitrumConfig.testnet() {
    return ArbitrumConfig(
      network: BlockchainNetwork.arbitrum,
      name: 'Arbitrum Goerli',
      nativeCurrency: 'ETH',
      currencySymbol: 'ARB',
      decimals: 18,
      rpcUrl: 'https://goerli-rollup.arbitrum.io/rpc',
      explorerUrl: 'https://goerli.arbiscan.io',
      chainId: 421613,
      networkType: NetworkType.testnet,
      bridgeContracts: {
        'ethereum': '0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a',
        'optimism': '0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a',
        'polygon': '0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a',
        'ton': '0x8315177aB297bA92A06054cE80a67Ed4DBd7ed3a',
      },
      stakingContracts: {
        'gmx': '0x908C4D94D34924765f1eDc22A1DD098397c59dD4',
        'uniswap': '0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984',
      },
      investmentContracts: {
        'gmx': '0x908C4D94D34924765f1eDc22A1DD098397c59dD4',
        'uniswap': '0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984',
      },
    );
  }
} 