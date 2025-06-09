import 'package:flutter_test/flutter_test.dart';
import '../common/models/blockchain_types.dart';
import '../common/multi_chain_manager.dart';
import '../ethereum/ethereum_service.dart';
import '../ethereum/models/ethereum_models.dart';
import '../arbitrum/arbitrum_service.dart';
import '../arbitrum/models/arbitrum_models.dart';
import '../optimism/optimism_service.dart';
import '../optimism/models/optimism_models.dart';
import '../avalanche/avalanche_service.dart';
import '../avalanche/models/avalanche_models.dart';
import '../ton/ton_service.dart';
import '../ton/models/ton_models.dart';

void main() {
  late MultiChainManager manager;

  setUp(() async {
    manager = MultiChainManager.instance;
    await manager.initialize();
  });

  tearDown(() async {
    await manager.dispose();
  });

  group('Multi-Chain Manager Tests', () {
    test('Initialize with Default Networks', () {
      expect(manager.activeNetworks, contains(BlockchainNetwork.ton));
      expect(manager.defaultNetwork, equals(BlockchainNetwork.ton));
    });

    test('Add Network', () async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      expect(manager.activeNetworks, contains(BlockchainNetwork.ethereum));
      
      final service = manager.getService(BlockchainNetwork.ethereum);
      expect(service, isNotNull);
      expect(service, isA<EthereumService>());
    });

    test('Remove Network', () async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      await manager.removeNetwork(BlockchainNetwork.ethereum);
      expect(manager.activeNetworks, isNot(contains(BlockchainNetwork.ethereum)));
    });

    test('Cannot Remove TON Network', () async {
      await manager.removeNetwork(BlockchainNetwork.ton);
      expect(manager.activeNetworks, contains(BlockchainNetwork.ton));
    });

    test('Get Network Config', () {
      final config = manager.getConfig(BlockchainNetwork.ethereum);
      expect(config, isNotNull);
      expect(config?.name, equals('Ethereum'));
      expect(config?.nativeCurrency, equals('Ether'));
      expect(config?.currencySymbol, equals('ETH'));
    });

    test('Network Stats Stream', () async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      
      expectLater(
        manager.statsStream,
        emits(isA<Map<BlockchainNetwork, NetworkStats>>()),
      );
    });

    test('Active Networks Stream', () async {
      expectLater(
        manager.activeNetworksStream,
        emits(isA<List<BlockchainNetwork>>()),
      );
      
      await manager.addNetwork(BlockchainNetwork.ethereum);
    });
  });

  group('Ethereum Service Tests', () {
    late EthereumService ethService;

    setUp(() async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      ethService = manager.getService(BlockchainNetwork.ethereum) as EthereumService;
    });

    test('Network Availability', () async {
      final isAvailable = await ethService.isNetworkAvailable();
      expect(isAvailable, isTrue);
    });

    test('Get Network Stats', () async {
      final stats = await ethService.getNetworkStats();
      expect(stats, isA<EthereumNetworkStats>());
      expect(stats.blockHeight, isPositive);
      expect(stats.averageGasPrice, isPositive);
    });

    test('Get Gas Price', () async {
      final gasPrice = await ethService.getGasPrice();
      expect(gasPrice, isPositive);
    });

    test('Investment Pool Operations', () async {
      final pools = await ethService.getAvailablePools();
      expect(pools, isNotEmpty);
      
      final pool = pools.first;
      expect(pool.minInvestment, isPositive);
      expect(pool.maxInvestment, greaterThan(pool.minInvestment));
    });

    test('Staking Operations', () async {
      final validators = await ethService.getValidators();
      expect(validators, isNotEmpty);
      
      final validator = validators.first;
      expect(validator.commission, isPositive);
      expect(validator.totalStaked, isPositive);
    });

    test('Bridge Operations', () async {
      final targetChains = ethService.getSupportedTargetChains();
      expect(targetChains, isNotEmpty);
      
      final fee = await ethService.getBridgeFee(
        targetChain: BlockchainNetwork.polygon,
        amount: 1.0,
      );
      expect(fee, isPositive);
    });
  });

  group('Cross-Chain Operations', () {
    test('Aggregated Portfolio', () async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      
      final portfolio = await manager.getAggregatedPortfolio(
        '0x1234567890123456789012345678901234567890'
      );
      
      expect(portfolio['totalBalance'], isNotNull);
      expect(portfolio['balances'], isA<Map<BlockchainNetwork, double>>());
      expect(portfolio['networks'], equals(2)); // TON and Ethereum
    });

    test('Network Availability Check', () async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      
      final availability = await manager.checkNetworkAvailability();
      expect(availability, isA<Map<BlockchainNetwork, bool>>());
      expect(availability.length, equals(2)); // TON and Ethereum
    });
  });

  group('Error Handling', () {
    test('Invalid Network Addition', () {
      expect(
        () => manager.addNetwork(BlockchainNetwork.ton),
        throwsException,
      );
    });

    test('Invalid Network Removal', () async {
      expect(
        () => manager.removeNetwork(BlockchainNetwork.ethereum),
        throwsException,
      );
    });

    test('Invalid Bridge Operation', () async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      final ethService = manager.getService(BlockchainNetwork.ethereum) as EthereumService;
      
      expect(
        () => ethService.createBridgeTransaction(
          targetChain: BlockchainNetwork.solana, // Unsupported chain
          targetAddress: '0x1234567890123456789012345678901234567890',
          amount: 1.0,
          privateKey: '0x1234567890123456789012345678901234567890',
        ),
        throwsException,
      );
    });
  });

  group('Arbitrum Service Tests', () {
    late ArbitrumService arbService;

    setUp(() async {
      await manager.addNetwork(BlockchainNetwork.arbitrum);
      arbService = manager.getService(BlockchainNetwork.arbitrum) as ArbitrumService;
    });

    test('Network Availability', () async {
      final isAvailable = await arbService.isNetworkAvailable();
      expect(isAvailable, isTrue);
    });

    test('Get Network Stats', () async {
      final stats = await arbService.getNetworkStats();
      expect(stats, isA<ArbitrumNetworkStats>());
      expect(stats.blockHeight, isPositive);
      expect(stats.averageGasPrice, isPositive);
      expect(stats.l1GasPrice, isPositive);
    });

    test('L2 Specific Operations', () async {
      final l1ToL2Fee = await arbService.getL1ToL2Fee(1.0);
      expect(l1ToL2Fee, isPositive);
      
      final l2ToL1Fee = await arbService.getL2ToL1Fee(1.0);
      expect(l2ToL1Fee, isPositive);
    });

    test('Investment Pool Operations', () async {
      final pools = await arbService.getAvailablePools();
      expect(pools, isNotEmpty);
      
      final pool = pools.first;
      expect(pool.minInvestment, isPositive);
      expect(pool.maxInvestment, greaterThan(pool.minInvestment));
    });
  });

  group('Optimism Service Tests', () {
    late OptimismService opService;

    setUp(() async {
      await manager.addNetwork(BlockchainNetwork.optimism);
      opService = manager.getService(BlockchainNetwork.optimism) as OptimismService;
    });

    test('Network Availability', () async {
      final isAvailable = await opService.isNetworkAvailable();
      expect(isAvailable, isTrue);
    });

    test('Get Network Stats', () async {
      final stats = await opService.getNetworkStats();
      expect(stats, isA<OptimismNetworkStats>());
      expect(stats.blockHeight, isPositive);
      expect(stats.averageGasPrice, isPositive);
      expect(stats.l1GasPrice, isPositive);
    });

    test('Optimistic Rollup Operations', () async {
      final withdrawalTime = await opService.getWithdrawalTime();
      expect(withdrawalTime, isPositive);
      
      final sequencerStatus = await opService.getSequencerStatus();
      expect(sequencerStatus, isNotNull);
    });

    test('Staking Operations', () async {
      final validators = await opService.getValidators();
      expect(validators, isNotEmpty);
      
      final validator = validators.first;
      expect(validator.commission, isPositive);
      expect(validator.totalStaked, isPositive);
    });
  });

  group('Avalanche Service Tests', () {
    late AvalancheService avaxService;

    setUp(() async {
      await manager.addNetwork(BlockchainNetwork.avalanche);
      avaxService = manager.getService(BlockchainNetwork.avalanche) as AvalancheService;
    });

    test('Network Availability', () async {
      final isAvailable = await avaxService.isNetworkAvailable();
      expect(isAvailable, isTrue);
    });

    test('Get Network Stats', () async {
      final stats = await avaxService.getNetworkStats();
      expect(stats, isA<AvalancheNetworkStats>());
      expect(stats.blockHeight, isPositive);
      expect(stats.averageGasPrice, isPositive);
      expect(stats.pChainHeight, isPositive);
      expect(stats.xChainHeight, isPositive);
    });

    test('Subnet Operations', () async {
      final subnets = await avaxService.getSubnets();
      expect(subnets, isNotEmpty);
      
      final subnet = subnets.first;
      expect(subnet.id, isNotEmpty);
      expect(subnet.validators, isNotEmpty);
    });

    test('Cross-Chain Operations', () async {
      final cChainBalance = await avaxService.getCChainBalance('0x1234567890123456789012345678901234567890');
      expect(cChainBalance, isNotNegative);
      
      final pChainBalance = await avaxService.getPChainBalance('P-avax1234567890123456789012345678901234567890');
      expect(pChainBalance, isNotNegative);
    });

    test('Investment Pool Operations', () async {
      final pools = await avaxService.getAvailablePools();
      expect(pools, isNotEmpty);
      
      final pool = pools.first;
      expect(pool.minInvestment, isPositive);
      expect(pool.maxInvestment, greaterThan(pool.minInvestment));
    });
  });

  group('TON Service Tests', () {
    late TonService tonService;

    setUp(() async {
      tonService = manager.getService(BlockchainNetwork.ton) as TonService;
    });

    test('Network Availability', () async {
      final isAvailable = await tonService.isNetworkAvailable();
      expect(isAvailable, isTrue);
    });

    test('Get Network Stats', () async {
      final stats = await tonService.getNetworkStats();
      expect(stats, isA<TonNetworkStats>());
      expect(stats.blockHeight, isPositive);
      expect(stats.averageGasPrice, isPositive);
      expect(stats.totalSupply, isPositive);
      expect(stats.circulatingSupply, isPositive);
    });

    test('Smart Contract Operations', () async {
      final contractInfo = await tonService.getContractInfo('EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t');
      expect(contractInfo, isNotNull);
      expect(contractInfo.address, isNotEmpty);
    });

    test('Jetton Operations', () async {
      final jettons = await tonService.getJettons('EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t');
      expect(jettons, isNotNull);
    });

    test('Staking Operations', () async {
      final validators = await tonService.getValidators();
      expect(validators, isNotEmpty);
      
      final validator = validators.first;
      expect(validator.commission, isPositive);
      expect(validator.totalStaked, isPositive);
    });

    test('Investment Pool Operations', () async {
      final pools = await tonService.getAvailablePools();
      expect(pools, isNotEmpty);
      
      final pool = pools.first;
      expect(pool.minInvestment, isPositive);
      expect(pool.maxInvestment, greaterThan(pool.minInvestment));
    });
  });

  group('Layer 2 Specific Tests', () {
    test('Arbitrum vs Optimism Gas Comparison', () async {
      await manager.addNetwork(BlockchainNetwork.arbitrum);
      await manager.addNetwork(BlockchainNetwork.optimism);
      
      final arbService = manager.getService(BlockchainNetwork.arbitrum) as ArbitrumService;
      final opService = manager.getService(BlockchainNetwork.optimism) as OptimismService;
      
      final arbGasPrice = await arbService.getGasPrice();
      final opGasPrice = await opService.getGasPrice();
      
      expect(arbGasPrice, isPositive);
      expect(opGasPrice, isPositive);
      
      // Both should be significantly lower than Ethereum mainnet
      expect(arbGasPrice, lessThan(50.0)); // Gwei
      expect(opGasPrice, lessThan(50.0)); // Gwei
    });

    test('L1 to L2 Bridge Operations', () async {
      await manager.addNetwork(BlockchainNetwork.arbitrum);
      final arbService = manager.getService(BlockchainNetwork.arbitrum) as ArbitrumService;
      
      final bridgeFee = await arbService.getBridgeFee(
        targetChain: BlockchainNetwork.ethereum,
        amount: 1.0,
      );
      expect(bridgeFee, isPositive);
      
      final targetChains = arbService.getSupportedTargetChains();
      expect(targetChains, contains(BlockchainNetwork.ethereum));
    });
  });

  group('Multi-Chain Avalanche Tests', () {
    test('Avalanche Subnet Validation', () async {
      await manager.addNetwork(BlockchainNetwork.avalanche);
      final avaxService = manager.getService(BlockchainNetwork.avalanche) as AvalancheService;
      
      final subnets = await avaxService.getSubnets();
      expect(subnets, isNotEmpty);
      
      for (final subnet in subnets) {
        expect(subnet.id, isNotEmpty);
        expect(subnet.validators, isNotEmpty);
        expect(subnet.threshold, isPositive);
      }
    });

    test('Cross-Chain Balance Verification', () async {
      await manager.addNetwork(BlockchainNetwork.avalanche);
      final avaxService = manager.getService(BlockchainNetwork.avalanche) as AvalancheService;
      
      const testAddress = '0x1234567890123456789012345678901234567890';
      const pChainAddress = 'P-avax1234567890123456789012345678901234567890';
      
      final cChainBalance = await avaxService.getCChainBalance(testAddress);
      final pChainBalance = await avaxService.getPChainBalance(pChainAddress);
      
      expect(cChainBalance, isNotNegative);
      expect(pChainBalance, isNotNegative);
    });
  });

  group('TON Blockchain Specific Tests', () {
    test('TON Smart Contract Interaction', () async {
      final tonService = manager.getService(BlockchainNetwork.ton) as TonService;
      
      const contractAddress = 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t';
      final contractInfo = await tonService.getContractInfo(contractAddress);
      
      expect(contractInfo, isNotNull);
      expect(contractInfo.address, equals(contractAddress));
      expect(contractInfo.balance, isNotNegative);
    });

    test('TON Jetton Operations', () async {
      final tonService = manager.getService(BlockchainNetwork.ton) as TonService;
      
      const walletAddress = 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t';
      final jettons = await tonService.getJettons(walletAddress);
      
      expect(jettons, isNotNull);
    });

    test('TON Network Statistics', () async {
      final tonService = manager.getService(BlockchainNetwork.ton) as TonService;
      
      final stats = await tonService.getNetworkStats() as TonNetworkStats;
      
      expect(stats.totalSupply, isPositive);
      expect(stats.circulatingSupply, isPositive);
      expect(stats.circulatingSupply, lessThanOrEqualTo(stats.totalSupply));
      expect(stats.validatorCount, isPositive);
    });
  });

  group('Performance Tests', () {
    test('Multiple Network Operations', () async {
      // Add multiple networks including new ones
      await manager.addNetwork(BlockchainNetwork.ethereum);
      await manager.addNetwork(BlockchainNetwork.arbitrum);
      await manager.addNetwork(BlockchainNetwork.optimism);
      await manager.addNetwork(BlockchainNetwork.avalanche);
      
      expect(manager.activeNetworks.length, equals(5)); // Including TON
      
      // Check network stats update time
      final stopwatch = Stopwatch()..start();
      
      await manager.checkNetworkAvailability();
      
      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(10000)); // Should complete within 10 seconds
    });

    test('Concurrent Operations Across All Networks', () async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      await manager.addNetwork(BlockchainNetwork.arbitrum);
      await manager.addNetwork(BlockchainNetwork.optimism);
      await manager.addNetwork(BlockchainNetwork.avalanche);
      
      final ethService = manager.getService(BlockchainNetwork.ethereum) as EthereumService;
      final arbService = manager.getService(BlockchainNetwork.arbitrum) as ArbitrumService;
      final opService = manager.getService(BlockchainNetwork.optimism) as OptimismService;
      final avaxService = manager.getService(BlockchainNetwork.avalanche) as AvalancheService;
      final tonService = manager.getService(BlockchainNetwork.ton) as TonService;
      
      // Perform multiple operations concurrently across all networks
      final futures = await Future.wait([
        ethService.getNetworkStats(),
        arbService.getNetworkStats(),
        opService.getNetworkStats(),
        avaxService.getNetworkStats(),
        tonService.getNetworkStats(),
      ]);
      
      expect(futures[0], isA<EthereumNetworkStats>());
      expect(futures[1], isA<ArbitrumNetworkStats>());
      expect(futures[2], isA<OptimismNetworkStats>());
      expect(futures[3], isA<AvalancheNetworkStats>());
      expect(futures[4], isA<TonNetworkStats>());
    });

    test('Gas Price Comparison Across Networks', () async {
      await manager.addNetwork(BlockchainNetwork.ethereum);
      await manager.addNetwork(BlockchainNetwork.arbitrum);
      await manager.addNetwork(BlockchainNetwork.optimism);
      await manager.addNetwork(BlockchainNetwork.avalanche);
      
      final ethService = manager.getService(BlockchainNetwork.ethereum) as EthereumService;
      final arbService = manager.getService(BlockchainNetwork.arbitrum) as ArbitrumService;
      final opService = manager.getService(BlockchainNetwork.optimism) as OptimismService;
      final avaxService = manager.getService(BlockchainNetwork.avalanche) as AvalancheService;
      
      final gasPrices = await Future.wait([
        ethService.getGasPrice(),
        arbService.getGasPrice(),
        opService.getGasPrice(),
        avaxService.getGasPrice(),
      ]);
      
      // All gas prices should be positive
      for (final gasPrice in gasPrices) {
        expect(gasPrice, isPositive);
      }
      
      // Layer 2 solutions should generally have lower gas prices than Ethereum
      expect(gasPrices[1], lessThan(gasPrices[0])); // Arbitrum < Ethereum
      expect(gasPrices[2], lessThan(gasPrices[0])); // Optimism < Ethereum
    });
  });
}
