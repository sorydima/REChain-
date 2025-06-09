import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/blockchain_types.dart';
import 'interfaces/blockchain_service.dart';
import '../ethereum/ethereum_service.dart';
import '../binance/binance_service.dart';
import '../solana/solana_service.dart';
import '../polygon/polygon_service.dart';
import '../arbitrum/arbitrum_service.dart';
import '../optimism/optimism_service.dart';
import '../avalanche/avalanche_service.dart';
import '../ton/ton_service.dart';

/// Manages multiple blockchain networks and provides unified access
class MultiChainManager {
  static MultiChainManager? _instance;
  static MultiChainManager get instance => _instance ??= MultiChainManager._();
  
  MultiChainManager._();
  
  static const String _activeNetworksKey = 'active_networks';
  static const String _defaultNetworkKey = 'default_network';
  
  SharedPreferences? _prefs;
  
  final Map<BlockchainNetwork, BlockchainService> _services = {};
  final Map<BlockchainNetwork, ChainConfig> _configs = {};
  
  final StreamController<Map<BlockchainNetwork, NetworkStats>> _statsController = 
      StreamController<Map<BlockchainNetwork, NetworkStats>>.broadcast();
  final StreamController<List<BlockchainNetwork>> _activeNetworksController = 
      StreamController<List<BlockchainNetwork>>.broadcast();
  
  Stream<Map<BlockchainNetwork, NetworkStats>> get statsStream => _statsController.stream;
  Stream<List<BlockchainNetwork>> get activeNetworksStream => _activeNetworksController.stream;
  
  List<BlockchainNetwork> _activeNetworks = [BlockchainNetwork.ton];
  BlockchainNetwork _defaultNetwork = BlockchainNetwork.ton;
  
  Timer? _statsUpdateTimer;
  
  /// Initialize the multi-chain manager
  Future<void> initialize() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      await _loadSettings();
      await _initializeConfigs();
      await _initializeServices();
      _startStatsUpdates();
      
      if (kDebugMode) {
        print('[MultiChain] Manager initialized with ${_activeNetworks.length} networks');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MultiChain] Failed to initialize: $e');
      }
      rethrow;
    }
  }
  
  /// Load settings from storage
  Future<void> _loadSettings() async {
    try {
      final activeNetworksJson = _prefs?.getString(_activeNetworksKey);
      if (activeNetworksJson != null) {
        final networkNames = List<String>.from(jsonDecode(activeNetworksJson));
        _activeNetworks = networkNames
            .map((name) => BlockchainNetwork.values.firstWhere(
                (network) => network.toString() == name))
            .toList();
      }
      
      final defaultNetworkName = _prefs?.getString(_defaultNetworkKey);
      if (defaultNetworkName != null) {
        _defaultNetwork = BlockchainNetwork.values.firstWhere(
            (network) => network.toString() == defaultNetworkName);
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MultiChain] Failed to load settings: $e');
      }
    }
  }
  
  /// Save settings to storage
  Future<void> _saveSettings() async {
    try {
      final networkNames = _activeNetworks.map((n) => n.toString()).toList();
      await _prefs?.setString(_activeNetworksKey, jsonEncode(networkNames));
      await _prefs?.setString(_defaultNetworkKey, _defaultNetwork.toString());
    } catch (e) {
      if (kDebugMode) {
        print('[MultiChain] Failed to save settings: $e');
      }
    }
  }
  
  /// Initialize blockchain configurations
  Future<void> _initializeConfigs() async {
    _configs[BlockchainNetwork.ethereum] = ChainConfig(
      network: BlockchainNetwork.ethereum,
      name: 'Ethereum',
      nativeCurrency: 'Ether',
      currencySymbol: 'ETH',
      decimals: 18,
      rpcUrl: 'https://mainnet.infura.io/v3/YOUR_PROJECT_ID',
      explorerUrl: 'https://etherscan.io',
      chainId: 1,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ton': '0x1234567890123456789012345678901234567890',
        'polygon': '0x2345678901234567890123456789012345678901',
      },
      stakingContracts: {
        'eth2': '0x00000000219ab540356cBB839Cbe05303d7705Fa',
      },
      investmentContracts: {
        'compound': '0x3d9819210A31b4961b30EF54bE2aeD79B9c9Cd3B',
        'aave': '0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9',
      },
    );
    
    _configs[BlockchainNetwork.binance] = ChainConfig(
      network: BlockchainNetwork.binance,
      name: 'BNB Smart Chain',
      nativeCurrency: 'BNB',
      currencySymbol: 'BNB',
      decimals: 18,
      rpcUrl: 'https://bsc-dataseed1.binance.org',
      explorerUrl: 'https://bscscan.com',
      chainId: 56,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': '0x3456789012345678901234567890123456789012',
        'polygon': '0x4567890123456789012345678901234567890123',
      },
      stakingContracts: {
        'pancake': '0x73feaa1eE314F8c655E354234017bE2193C9E24E',
      },
      investmentContracts: {
        'venus': '0xfD36E2c2a6789Db23113685031d7F16329158384',
      },
    );
    
    _configs[BlockchainNetwork.solana] = ChainConfig(
      network: BlockchainNetwork.solana,
      name: 'Solana',
      nativeCurrency: 'SOL',
      currencySymbol: 'SOL',
      decimals: 9,
      rpcUrl: 'https://api.mainnet-beta.solana.com',
      explorerUrl: 'https://explorer.solana.com',
      chainId: 101,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': 'wormDTUJ6AWPNvk59vGQbDvGJmqbDTdgWgAqcLBCgUb',
      },
      stakingContracts: {
        'native': 'Stake11111111111111111111111111111111111112',
      },
      investmentContracts: {
        'raydium': '675kPX9MHTjS2zt1qfr1NYHuzeLXfQM9H24wFSUt1Mp8',
      },
    );
    
    _configs[BlockchainNetwork.polygon] = ChainConfig(
      network: BlockchainNetwork.polygon,
      name: 'Polygon',
      nativeCurrency: 'MATIC',
      currencySymbol: 'MATIC',
      decimals: 18,
      rpcUrl: 'https://polygon-rpc.com',
      explorerUrl: 'https://polygonscan.com',
      chainId: 137,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': '0x5678901234567890123456789012345678901234',
      },
      stakingContracts: {
        'polygon': '0x5e3Ef299fDDf15eAa0432E6e66473ace8c13D908',
      },
      investmentContracts: {
        'quickswap': '0xa5E0829CaCEd8fFDD4De3c43696c57F7D7A678ff',
      },
    );
    
    _configs[BlockchainNetwork.arbitrum] = ChainConfig(
      network: BlockchainNetwork.arbitrum,
      name: 'Arbitrum One',
      nativeCurrency: 'Ether',
      currencySymbol: 'ETH',
      decimals: 18,
      rpcUrl: 'https://arb1.arbitrum.io/rpc',
      explorerUrl: 'https://arbiscan.io',
      chainId: 42161,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': '0x6789012345678901234567890123456789012345',
      },
      stakingContracts: {
        'gmx': '0x908C4D94D34924765f1eDc22A1DD098397c59dD4',
      },
      investmentContracts: {
        'uniswap': '0xE592427A0AEce92De3Edee1F18E0157C05861564',
      },
    );
    
    _configs[BlockchainNetwork.optimism] = ChainConfig(
      network: BlockchainNetwork.optimism,
      name: 'Optimism',
      nativeCurrency: 'Ether',
      currencySymbol: 'ETH',
      decimals: 18,
      rpcUrl: 'https://mainnet.optimism.io',
      explorerUrl: 'https://optimistic.etherscan.io',
      chainId: 10,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': '0x7890123456789012345678901234567890123456',
      },
      stakingContracts: {
        'synthetix': '0x8700dAec35aF8Ff88c16BdF0418774CB3D7599B4',
      },
      investmentContracts: {
        'velodrome': '0x9c12939390052919aF3155f41Bf4160Fd3666A6f',
      },
    );
    
    _configs[BlockchainNetwork.avalanche] = ChainConfig(
      network: BlockchainNetwork.avalanche,
      name: 'Avalanche',
      nativeCurrency: 'AVAX',
      currencySymbol: 'AVAX',
      decimals: 18,
      rpcUrl: 'https://api.avax.network/ext/bc/C/rpc',
      explorerUrl: 'https://snowtrace.io',
      chainId: 43114,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': '0x8901234567890123456789012345678901234567',
      },
      stakingContracts: {
        'avalanche': '0x01234567890123456789012345678901234567890',
      },
      investmentContracts: {
        'traderjoe': '0x60aE616a2155Ee3d9A68541Ba4544862310933d4',
      },
    );
    
    _configs[BlockchainNetwork.fantom] = ChainConfig(
      network: BlockchainNetwork.fantom,
      name: 'Fantom',
      nativeCurrency: 'FTM',
      currencySymbol: 'FTM',
      decimals: 18,
      rpcUrl: 'https://rpc.ftm.tools',
      explorerUrl: 'https://ftmscan.com',
      chainId: 250,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': '0x9012345678901234567890123456789012345678',
      },
      stakingContracts: {
        'fantom': '0x0123456789012345678901234567890123456789',
      },
      investmentContracts: {
        'spookyswap': '0xF491e7B69E4244ad4002BC14e878a34207E38c29',
      },
    );
    
    _configs[BlockchainNetwork.cosmos] = ChainConfig(
      network: BlockchainNetwork.cosmos,
      name: 'Cosmos Hub',
      nativeCurrency: 'ATOM',
      currencySymbol: 'ATOM',
      decimals: 6,
      rpcUrl: 'https://cosmos-rpc.polkachu.com',
      explorerUrl: 'https://www.mintscan.io/cosmos',
      chainId: 1,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': 'cosmos1234567890123456789012345678901234567890',
      },
      stakingContracts: {
        'cosmos': 'cosmos1234567890123456789012345678901234567890',
      },
      investmentContracts: {
        'osmosis': 'osmo1234567890123456789012345678901234567890',
      },
    );
    
    _configs[BlockchainNetwork.ton] = ChainConfig(
      network: BlockchainNetwork.ton,
      name: 'TON',
      nativeCurrency: 'Toncoin',
      currencySymbol: 'TON',
      decimals: 9,
      rpcUrl: 'https://toncenter.com/api/v2/jsonRPC',
      explorerUrl: 'https://tonscan.org',
      chainId: 1,
      networkType: NetworkType.mainnet,
      bridgeContracts: {
        'ethereum': 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
      },
      stakingContracts: {
        'ton': 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
      },
      investmentContracts: {
        'ton': 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
      },
    );
  }
  
  /// Initialize blockchain services
  Future<void> _initializeServices() async {
    for (final network in _activeNetworks) {
      final config = _configs[network];
      if (config == null) continue;
      
      BlockchainService? service;
      
      switch (network) {
        case BlockchainNetwork.ethereum:
          service = EthereumService(config);
          break;
        case BlockchainNetwork.binance:
          service = BinanceService(config);
          break;
        case BlockchainNetwork.solana:
          service = SolanaService(config);
          break;
        case BlockchainNetwork.polygon:
          service = PolygonService(config);
          break;
        case BlockchainNetwork.arbitrum:
          service = ArbitrumService(config);
          break;
        case BlockchainNetwork.optimism:
          service = OptimismService(config);
          break;
        case BlockchainNetwork.avalanche:
          service = AvalancheService(config);
          break;
        case BlockchainNetwork.ton:
          service = TonService(config);
          break;
      }
      
      if (service != null) {
        await service.initialize();
        _services[network] = service;
      }
    }
    
    _activeNetworksController.add(_activeNetworks);
  }
  
  /// Start periodic statistics updates
  void _startStatsUpdates() {
    _statsUpdateTimer?.cancel();
    _statsUpdateTimer = Timer.periodic(Duration(minutes: 1), (_) async {
      await _updateNetworkStats();
    });
  }
  
  /// Update network statistics
  Future<void> _updateNetworkStats() async {
    final stats = <BlockchainNetwork, NetworkStats>{};
    
    for (final entry in _services.entries) {
      try {
        final networkStats = await entry.value.getNetworkStats();
        stats[entry.key] = networkStats;
      } catch (e) {
        if (kDebugMode) {
          print('[MultiChain] Failed to get stats for ${entry.key}: $e');
        }
      }
    }
    
    _statsController.add(stats);
  }
  
  /// Get service for a specific network
  BlockchainService? getService(BlockchainNetwork network) {
    return _services[network];
  }
  
  /// Get configuration for a specific network
  ChainConfig? getConfig(BlockchainNetwork network) {
    return _configs[network];
  }
  
  /// Get all active networks
  List<BlockchainNetwork> get activeNetworks => List.unmodifiable(_activeNetworks);
  
  /// Get default network
  BlockchainNetwork get defaultNetwork => _defaultNetwork;
  
  /// Set default network
  Future<void> setDefaultNetwork(BlockchainNetwork network) async {
    if (_activeNetworks.contains(network)) {
      _defaultNetwork = network;
      await _saveSettings();
    }
  }
  
  /// Add a network to active networks
  Future<void> addNetwork(BlockchainNetwork network) async {
    if (!_activeNetworks.contains(network)) {
      _activeNetworks.add(network);
      
      final config = _configs[network];
      if (config != null) {
        BlockchainService? service;
        
        switch (network) {
          case BlockchainNetwork.ethereum:
            service = EthereumService(config);
            break;
          case BlockchainNetwork.binance:
            service = BinanceService(config);
            break;
          case BlockchainNetwork.solana:
            service = SolanaService(config);
            break;
          case BlockchainNetwork.polygon:
            service = PolygonService(config);
            break;
          case BlockchainNetwork.arbitrum:
            service = ArbitrumService(config);
            break;
          case BlockchainNetwork.optimism:
            service = OptimismService(config);
            break;
          case BlockchainNetwork.avalanche:
            service = AvalancheService(config);
            break;
          case BlockchainNetwork.ton:
            service = TonService(config);
            break;
        }
        
        if (service != null) {
          await service.initialize();
          _services[network] = service;
        }
      }
      
      await _saveSettings();
      _activeNetworksController.add(_activeNetworks);
    }
  }
  
  /// Remove a network from active networks
  Future<void> removeNetwork(BlockchainNetwork network) async {
    if (_activeNetworks.contains(network) && network != BlockchainNetwork.ton) {
      _activeNetworks.remove(network);
      
      final service = _services.remove(network);
      await service?.dispose();
      
      if (_defaultNetwork == network) {
        _defaultNetwork = _activeNetworks.first;
      }
      
      await _saveSettings();
      _activeNetworksController.add(_activeNetworks);
    }
  }
  
  /// Get aggregated portfolio across all networks
  Future<Map<String, dynamic>> getAggregatedPortfolio(String address) async {
    double totalBalance = 0.0;
    final balances = <BlockchainNetwork, double>{};
    
    for (final entry in _services.entries) {
      try {
        final balance = await entry.value.getBalance(address);
        balances[entry.key] = balance;
        totalBalance += balance;
      } catch (e) {
        if (kDebugMode) {
          print('[MultiChain] Failed to get balance for ${entry.key}: $e');
        }
        balances[entry.key] = 0.0;
      }
    }
    
    return {
      'totalBalance': totalBalance,
      'balances': balances,
      'networks': _activeNetworks.length,
    };
  }
  
  /// Check network availability across all chains
  Future<Map<BlockchainNetwork, bool>> checkNetworkAvailability() async {
    final availability = <BlockchainNetwork, bool>{};
    
    for (final entry in _services.entries) {
      try {
        final isAvailable = await entry.value.isNetworkAvailable();
        availability[entry.key] = isAvailable;
      } catch (e) {
        availability[entry.key] = false;
      }
    }
    
    return availability;
  }
  
  /// Dispose all resources
  Future<void> dispose() async {
    _statsUpdateTimer?.cancel();
    
    for (final service in _services.values) {
      await service.dispose();
    }
    
    _services.clear();
    _statsController.close();
    _activeNetworksController.close();
  }
}
