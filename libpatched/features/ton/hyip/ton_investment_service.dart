import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/ton_client.dart' as ton_client;
import '../core/ton_config.dart';
import '../models/ton_models.dart';

/// Service for managing TON HYIP (High Yield Investment Program) features
class TonInvestmentService {
  static TonInvestmentService? _instance;
  static TonInvestmentService get instance => _instance ??= TonInvestmentService._();
  
  TonInvestmentService._();
  
  static const String _investmentsKey = 'ton_investments';
  static const String _poolsKey = 'ton_investment_pools';
  static const String _stakingKey = 'ton_staking_positions';
  
  SharedPreferences? _prefs;
  
  final List<TonInvestment> _investments = [];
  final List<TonInvestmentPool> _pools = [];
  final List<TonStakingPosition> _stakingPositions = [];
  
  final StreamController<List<TonInvestment>> _investmentsController = 
      StreamController<List<TonInvestment>>.broadcast();
  final StreamController<List<TonInvestmentPool>> _poolsController = 
      StreamController<List<TonInvestmentPool>>.broadcast();
  final StreamController<List<TonStakingPosition>> _stakingController = 
      StreamController<List<TonStakingPosition>>.broadcast();
  final StreamController<TonInvestmentStats> _statsController = 
      StreamController<TonInvestmentStats>.broadcast();
  
  Stream<List<TonInvestment>> get investmentsStream => _investmentsController.stream;
  Stream<List<TonInvestmentPool>> get poolsStream => _poolsController.stream;
  Stream<List<TonStakingPosition>> get stakingStream => _stakingController.stream;
  Stream<TonInvestmentStats> get statsStream => _statsController.stream;
  
  List<TonInvestment> get investments => List.unmodifiable(_investments);
  List<TonInvestmentPool> get pools => List.unmodifiable(_pools);
  List<TonStakingPosition> get stakingPositions => List.unmodifiable(_stakingPositions);
  
  Timer? _updateTimer;
  
  /// Initialize the investment service
  Future<void> initialize() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      await _loadInvestments();
      await _loadPools();
      await _loadStakingPositions();
      await _initializePools();
      _startPeriodicUpdates();
      
      ton_client.Logs().i('TON Investment Service initialized');
    } catch (e) {
      ton_client.Logs().e('Failed to initialize TON Investment Service: $e');
      rethrow;
    }
  }
  
  /// Load investments from storage
  Future<void> _loadInvestments() async {
    try {
      final investmentsJson = _prefs?.getString(_investmentsKey);
      if (investmentsJson != null) {
        final investmentsList = jsonDecode(investmentsJson) as List;
        _investments.clear();
        
        for (final investmentData in investmentsList) {
          final investment = TonInvestment.fromJson(investmentData);
          _investments.add(investment);
        }
        
        _investmentsController.add(_investments);
      }
    } catch (e) {
      ton_client.Logs().e('Failed to load investments: $e');
    }
  }
  
  /// Load investment pools from storage
  Future<void> _loadPools() async {
    try {
      final poolsJson = _prefs?.getString(_poolsKey);
      if (poolsJson != null) {
        final poolsList = jsonDecode(poolsJson) as List;
        _pools.clear();
        
        for (final poolData in poolsList) {
          final pool = TonInvestmentPool.fromJson(poolData);
          _pools.add(pool);
        }
        
        _poolsController.add(_pools);
      }
    } catch (e) {
      ton_client.Logs().e('Failed to load pools: $e');
    }
  }
  
  /// Load staking positions from storage
  Future<void> _loadStakingPositions() async {
    try {
      final stakingJson = _prefs?.getString(_stakingKey);
      if (stakingJson != null) {
        final stakingList = jsonDecode(stakingJson) as List;
        _stakingPositions.clear();
        
        for (final stakingData in stakingList) {
          final position = TonStakingPosition.fromJson(stakingData);
          _stakingPositions.add(position);
        }
        
        _stakingController.add(_stakingPositions);
      }
    } catch (e) {
      ton_client.Logs().e('Failed to load staking positions: $e');
    }
  }
  
  /// Save investments to storage
  Future<void> _saveInvestments() async {
    try {
      final investmentsJson = jsonEncode(_investments.map((i) => i.toJson()).toList());
      await _prefs?.setString(_investmentsKey, investmentsJson);
      _investmentsController.add(_investments);
    } catch (e) {
      ton_client.Logs().e('Failed to save investments: $e');
    }
  }
  
  /// Save pools to storage
  Future<void> _savePools() async {
    try {
      final poolsJson = jsonEncode(_pools.map((p) => p.toJson()).toList());
      await _prefs?.setString(_poolsKey, poolsJson);
      _poolsController.add(_pools);
    } catch (e) {
      ton_client.Logs().e('Failed to save pools: $e');
    }
  }
  
  /// Save staking positions to storage
  Future<void> _saveStakingPositions() async {
    try {
      final stakingJson = jsonEncode(_stakingPositions.map((s) => s.toJson()).toList());
      await _prefs?.setString(_stakingKey, stakingJson);
      _stakingController.add(_stakingPositions);
    } catch (e) {
      ton_client.Logs().e('Failed to save staking positions: $e');
    }
  }
  
  /// Initialize default investment pools
  Future<void> _initializePools() async {
    if (_pools.isEmpty) {
      final defaultPools = [
        TonInvestmentPool(
          id: 'ton_stable_pool',
          name: 'TON Stable Pool',
          description: 'Low-risk stable returns with TON staking',
          contractAddress: TonConfig.contractAddresses['staking_pool']!,
          minInvestment: 10.0,
          maxInvestment: 10000.0,
          expectedApr: 8.5,
          lockPeriod: Duration(days: 30),
          riskLevel: InvestmentRiskLevel.low,
          totalValueLocked: 1500000.0,
          participantCount: 2500,
          isActive: true,
          createdAt: DateTime.now().subtract(Duration(days: 90)),
        ),
        TonInvestmentPool(
          id: 'ton_growth_pool',
          name: 'TON Growth Pool',
          description: 'Medium-risk growth opportunities in TON ecosystem',
          contractAddress: TonConfig.contractAddresses['defi_vault']!,
          minInvestment: 50.0,
          maxInvestment: 50000.0,
          expectedApr: 15.2,
          lockPeriod: Duration(days: 90),
          riskLevel: InvestmentRiskLevel.medium,
          totalValueLocked: 800000.0,
          participantCount: 1200,
          isActive: true,
          createdAt: DateTime.now().subtract(Duration(days: 60)),
        ),
        TonInvestmentPool(
          id: 'ton_hyip_pool',
          name: 'TON HYIP Pool',
          description: 'High-yield investment with advanced DeFi strategies',
          contractAddress: TonConfig.contractAddresses['hyip_pool']!,
          minInvestment: 100.0,
          maxInvestment: 100000.0,
          expectedApr: 25.8,
          lockPeriod: Duration(days: 180),
          riskLevel: InvestmentRiskLevel.high,
          totalValueLocked: 500000.0,
          participantCount: 800,
          isActive: true,
          createdAt: DateTime.now().subtract(Duration(days: 30)),
        ),
      ];
      
      _pools.addAll(defaultPools);
      await _savePools();
    }
  }
  
  /// Get available investment pools
  Future<List<TonInvestmentPool>> getAvailablePools() async {
    try {
      // Update pool data from smart contracts
      for (final pool in _pools) {
        await _updatePoolData(pool);
      }
      
      await _savePools();
      return _pools.where((pool) => pool.isActive).toList();
    } catch (e) {
      ton_client.Logs().e('Failed to get available pools: $e');
      return _pools.where((pool) => pool.isActive).toList();
    }
  }

  /// Update investment statistics
  Future<void> _updateStatistics() async {
    try {
      for (final investment in _investments) {
        if (investment.status == InvestmentStatus.active) {
          final pool = _pools.firstWhere((p) => p.id == investment.poolId);
          investment.actualReturn = _calculateActualReturn(investment, pool);
          investment.lastUpdated = DateTime.now();
        }
      }
      await _saveInvestments();
    } catch (e) {
      ton_client.Logs().e('Failed to update statistics: $e');
    }
  }
  
  /// Update pool data from smart contract
  Future<void> _updatePoolData(TonInvestmentPool pool) async {
    try {
      final contractState = await TonClient.instance.getSmartContractState(
        pool.contractAddress,
      );
      
      // Update pool data based on contract state
      pool.totalValueLocked = (contractState['total_locked'] as num?)?.toDouble() ?? pool.totalValueLocked;
      pool.participantCount = (contractState['participant_count'] as int?) ?? pool.participantCount;
      pool.lastUpdated = DateTime.now();
    } catch (e) {
      ton_client.Logs().e('Failed to update pool data: $e');
    }
  }
  
  /// Create investment
  Future<TonInvestment> createInvestment({
    required String poolId,
    required double amount,
    required String walletAddress,
    required String privateKey,
  }) async {
    try {
      final pool = _pools.firstWhere((p) => p.id == poolId);
      
      // Validate investment amount
      if (amount < pool.minInvestment || amount > pool.maxInvestment) {
        throw Exception('Investment amount must be between ${pool.minInvestment} and ${pool.maxInvestment} TON');
      }
      
      // Send investment transaction
      final txHash = await TonClient.instance.sendTransaction(
        fromAddress: walletAddress,
        toAddress: pool.contractAddress,
        amount: amount,
        privateKey: privateKey,
        comment: 'Investment in ${pool.name}',
      );
      
      // Create investment record
      final investment = TonInvestment(
        id: _generateInvestmentId(),
        poolId: poolId,
        poolName: pool.name,
        walletAddress: walletAddress,
        amount: amount,
        expectedReturn: _calculateExpectedReturn(amount, pool.expectedApr, pool.lockPeriod),
        actualReturn: 0.0,
        status: InvestmentStatus.active,
        transactionHash: txHash,
        createdAt: DateTime.now(),
        maturityDate: DateTime.now().add(pool.lockPeriod),
        lastUpdated: DateTime.now(),
      );
      
      _investments.add(investment);
      await _saveInvestments();
      
      // Update statistics
      await _updateStatistics();
      
      ton_client.Logs().i('Created investment: ${investment.id}');
      return investment;
    } catch (e) {
      ton_client.Logs().e('Failed to create investment: $e');
      rethrow;
    }
  }
  
  /// Withdraw investment
  Future<String> withdrawInvestment({
    required String investmentId,
    required String privateKey,
  }) async {
    try {
      final investment = _investments.firstWhere((i) => i.id == investmentId);
      
      if (investment.status != InvestmentStatus.active) {
        throw Exception('Investment is not active');
      }
      
      final pool = _pools.firstWhere((p) => p.id == investment.poolId);
      
      // Check if investment has matured
      final now = DateTime.now();
      final isMatured = now.isAfter(investment.maturityDate);
      
      if (!isMatured) {
        // Early withdrawal penalty
        final penalty = investment.amount * 0.1; // 10% penalty
        investment.actualReturn = investment.amount - penalty;
      } else {
        // Calculate actual return
        investment.actualReturn = _calculateActualReturn(investment, pool);
      }
      
      // Send withdrawal transaction
      final txHash = await TonClient.instance.sendTransaction(
        fromAddress: investment.walletAddress,
        toAddress: pool.contractAddress,
        amount: 0.01, // Gas fee
        privateKey: privateKey,
        comment: 'Withdraw investment ${investment.id}',
      );
      
      // Update investment status
      investment.status = InvestmentStatus.completed;
      investment.lastUpdated = now;
      investment.withdrawalHash = txHash;
      
      await _saveInvestments();
      await _updateStatistics();
      
      ton_client.Logs().i('Withdrew investment: ${investment.id}');
      return txHash;
    } catch (e) {
      ton_client.Logs().e('Failed to withdraw investment: $e');
      rethrow;
    }
  }
  
  /// Create staking position
  Future<TonStakingPosition> createStakingPosition({
    required double amount,
    required String walletAddress,
    required String privateKey,
    Duration? lockPeriod,
  }) async {
    try {
      final stakingPool = _pools.firstWhere((p) => p.id == 'ton_stable_pool');
      
      // Send staking transaction
      final txHash = await TonClient.instance.sendTransaction(
        fromAddress: walletAddress,
        toAddress: stakingPool.contractAddress,
        amount: amount,
        privateKey: privateKey,
        comment: 'Stake TON',
      );
      
      // Create staking position
      final position = TonStakingPosition(
        id: _generateStakingId(),
        walletAddress: walletAddress,
        amount: amount,
        rewards: 0.0,
        apr: stakingPool.expectedApr,
        lockPeriod: lockPeriod ?? Duration(days: 30),
        status: StakingStatus.active,
        transactionHash: txHash,
        createdAt: DateTime.now(),
        lastRewardClaim: DateTime.now(),
        lastUpdated: DateTime.now(),
      );
      
      _stakingPositions.add(position);
      await _saveStakingPositions();
      
      ton_client.Logs().i('Created staking position: ${position.id}');
      return position;
    } catch (e) {
      ton_client.Logs().e('Failed to create staking position: $e');
      rethrow;
    }
  }
  
  /// Claim staking rewards
  Future<String> claimStakingRewards({
    required String positionId,
    required String privateKey,
  }) async {
    try {
      final position = _stakingPositions.firstWhere((p) => p.id == positionId);
      
      if (position.status != StakingStatus.active) {
        throw Exception('Staking position is not active');
      }
      
      // Calculate pending rewards
      final pendingRewards = _calculateStakingRewards(position);
      
      if (pendingRewards <= 0) {
        throw Exception('No rewards to claim');
      }
      
      // Send claim transaction
      final txHash = await TonClient.instance.sendTransaction(
        fromAddress: position.walletAddress,
        toAddress: TonConfig.contractAddresses['staking_pool']!,
        amount: 0.01, // Gas fee
        privateKey: privateKey,
        comment: 'Claim staking rewards',
      );
      
      // Update position
      position.rewards += pendingRewards;
      position.lastRewardClaim = DateTime.now();
      position.lastUpdated = DateTime.now();
      
      await _saveStakingPositions();
      
      ton_client.Logs().i('Claimed staking rewards: $pendingRewards TON');
      return txHash;
    } catch (e) {
      ton_client.Logs().e('Failed to claim staking rewards: $e');
      rethrow;
    }
  }
  
  /// Get investment statistics
  Future<TonInvestmentStats> getInvestmentStats(String walletAddress) async {
    try {
      final userInvestments = _investments
          .where((i) => i.walletAddress == walletAddress)
          .toList();
      
      final userStaking = _stakingPositions
          .where((s) => s.walletAddress == walletAddress)
          .toList();
      
      final totalInvested = userInvestments.fold<double>(
        0.0, (sum, inv) => sum + inv.amount,
      );
      
      final totalReturns = userInvestments.fold<double>(
        0.0, (sum, inv) => sum + inv.actualReturn,
      );
      
      final pendingRewards = userStaking.fold<double>(
        0.0, (sum, stake) => sum + _calculateStakingRewards(stake),
      );
      
      final activeInvestments = userInvestments
          .where((i) => i.status == InvestmentStatus.active)
          .length;
      
      final averageApr = _calculateAverageApr(userInvestments, userStaking);
      
      final averageLockPeriod = _calculateAverageLockPeriod(userInvestments);
      
      final stats = TonInvestmentStats(
        totalInvested: totalInvested,
        totalReturns: totalReturns,
        pendingRewards: pendingRewards,
        activeInvestments: activeInvestments,
        averageAPR: averageApr,
        averageLockPeriod: averageLockPeriod,
      );
      
      _statsController.add(stats);
      return stats;
    } catch (e) {
      ton_client.Logs().e('Failed to get investment stats: $e');
      return TonInvestmentStats.empty();
    }
  }
  
  /// Calculate expected return
  double _calculateExpectedReturn(double amount, double apr, Duration lockPeriod) {
    final years = lockPeriod.inDays / 365.0;
    return amount * (1 + (apr / 100) * years);
  }
  
  /// Calculate actual return
  double _calculateActualReturn(TonInvestment investment, TonInvestmentPool pool) {
    final now = DateTime.now();
    final daysInvested = now.difference(investment.createdAt).inDays;
    final years = daysInvested / 365.0;
    
    // Add some randomness to simulate market conditions
    final random = Random();
    final variance = (random.nextDouble() - 0.5) * 0.1; // ±5% variance
    final actualApr = pool.expectedApr + (pool.expectedApr * variance);
    
    return investment.amount * (1 + (actualApr / 100) * years);
  }
  
  /// Calculate staking rewards
  double _calculateStakingRewards(TonStakingPosition position) {
    final now = DateTime.now();
    final daysSinceLastClaim = now.difference(position.lastRewardClaim).inDays;
    
    if (daysSinceLastClaim <= 0) return 0.0;
    
    final dailyRate = position.apr / 365 / 100;
    return position.amount * dailyRate * daysSinceLastClaim;
  }
  
  /// Calculate average APR
  double _calculateAverageApr(
    List<TonInvestment> investments,
    List<TonStakingPosition> stakingPositions,
  ) {
    if (investments.isEmpty && stakingPositions.isEmpty) return 0.0;
    
    double totalWeightedApr = 0.0;
    double totalAmount = 0.0;
    
    for (final investment in investments) {
      if (investment.status == InvestmentStatus.active) {
        final pool = _pools.firstWhere((p) => p.id == investment.poolId);
        totalWeightedApr += pool.expectedApr * investment.amount;
        totalAmount += investment.amount;
      }
    }
    
    for (final position in stakingPositions) {
      if (position.status == StakingStatus.active) {
        totalWeightedApr += position.apr * position.amount;
        totalAmount += position.amount;
      }
    }
    
    return totalAmount > 0 ? totalWeightedApr / totalAmount : 0.0;
  }
  
  /// Calculate average lock period
  Duration _calculateAverageLockPeriod(List<TonInvestment> investments) {
    if (investments.isEmpty) return Duration.zero;
    
    final totalDays = investments.fold<int>(
      0,
      (sum, inv) => sum + inv.maturityDate.difference(inv.createdAt).inDays,
    );
    
    return Duration(days: totalDays ~/ investments.length);
  }
  
  /// Start periodic updates
  void _startPeriodicUpdates() {
    _updateTimer?.cancel();
    _updateTimer = Timer.periodic(Duration(minutes: 5), (_) async {
      await _updateInvestmentReturns();
      await _updateStakingRewards();
    });
  }
  
  /// Update investment returns
  Future<void> _updateInvestmentReturns() async {
    try {
      bool hasUpdates = false;
      
      for (final investment in _investments) {
        if (investment.status == InvestmentStatus.active) {
          final pool = _pools.firstWhere((p) => p.id == investment.poolId);
          final newReturn = _calculateActualReturn(investment, pool);
          
          if (newReturn != investment.actualReturn) {
            investment.actualReturn = newReturn;
            investment.lastUpdated = DateTime.now();
            hasUpdates = true;
          }
        }
      }
      
      if (hasUpdates) {
        await _saveInvestments();
      }
    } catch (e) {
      ton_client.Logs().e('Failed to update investment returns: $e');
    }
  }
  
  /// Update staking rewards
  Future<void> _updateStakingRewards() async {
    try {
      bool hasUpdates = false;
      
      for (final position in _stakingPositions) {
        if (position.status == StakingStatus.active) {
          final pendingRewards = _calculateStakingRewards(position);
          
          if (pendingRewards > 0) {
            position.rewards += pendingRewards;
            position.lastRewardClaim = DateTime.now();
            position.lastUpdated = DateTime.now();
            hasUpdates = true;
          }
        }
      }
      
      if (hasUpdates) {
        await _saveStakingPositions();
      }
    } catch (e) {
      ton_client.Logs().e('Failed to update staking rewards: $e');
    }
  }
  
  /// Generate investment ID
  String _generateInvestmentId() {
    return 'inv_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  /// Generate staking ID
  String _generateStakingId() {
    return 'stake_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  /// Dispose resources
  void dispose() {
    _updateTimer?.cancel();
    _investmentsController.close();
    _poolsController.close();
    _stakingController.close();
    _statsController.close();
  }
}
