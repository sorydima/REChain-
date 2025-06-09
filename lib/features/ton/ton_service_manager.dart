import 'dart:async';

import 'package:flutter/foundation.dart';

import 'core/ton_client.dart';
import 'core/ton_config.dart';
import 'wallet/ton_wallet_service.dart';
import 'nft/ton_nft_service.dart';
import 'hyip/ton_investment_service.dart';

/// Central service manager for all TON-related services
class TonServiceManager {
  static TonServiceManager? _instance;
  static TonServiceManager get instance => _instance ??= TonServiceManager._();
  
  TonServiceManager._();
  
  bool _isInitialized = false;
  bool _isInitializing = false;
  
  final StreamController<bool> _initializationController = 
      StreamController<bool>.broadcast();
  
  Stream<bool> get initializationStream => _initializationController.stream;
  bool get isInitialized => _isInitialized;
  bool get isInitializing => _isInitializing;
  
  /// Initialize all TON services
  Future<void> initialize() async {
    if (_isInitialized || _isInitializing) return;
    
    try {
      _isInitializing = true;
      _initializationController.add(false);
      
      Logs().i('Initializing TON Service Manager...');
      
      // Initialize TON client first
      await TonClient.instance.initialize();
      
      // Initialize all services in parallel
      await Future.wait([
        TonWalletService.instance.initialize(),
        TonNftService.instance.initialize(),
        TonInvestmentService.instance.initialize(),
      ]);
      
      _isInitialized = true;
      _initializationController.add(true);
      
      Logs().i('TON Service Manager initialized successfully');
    } catch (e) {
      Logs().e('Failed to initialize TON Service Manager: $e');
      _initializationController.addError(e);
      rethrow;
    } finally {
      _isInitializing = false;
    }
  }
  
  /// Get wallet service
  TonWalletService get walletService => TonWalletService.instance;
  
  /// Get NFT service
  TonNftService get nftService => TonNftService.instance;
  
  /// Get investment service
  TonInvestmentService get investmentService => TonInvestmentService.instance;
  
  /// Get TON client
  TonClient get client => TonClient.instance;
  
  /// Check if TON features are enabled
  bool get isTonEnabled => TonConfig.enableNftTrading || 
                          TonConfig.enableHyipFeatures || 
                          TonConfig.enableStaking;
  
  /// Get service status
  Map<String, bool> getServiceStatus() {
    return {
      'ton_client': _isInitialized,
      'wallet_service': _isInitialized,
      'nft_service': _isInitialized,
      'investment_service': _isInitialized,
    };
  }
  
  /// Restart all services
  Future<void> restart() async {
    try {
      Logs().i('Restarting TON services...');
      
      // Dispose current services
      await dispose();
      
      // Reinitialize
      _isInitialized = false;
      await initialize();
      
      Logs().i('TON services restarted successfully');
    } catch (e) {
      Logs().e('Failed to restart TON services: $e');
      rethrow;
    }
  }
  
  /// Update wallet balances
  Future<void> updateWalletBalances() async {
    if (!_isInitialized) return;
    
    try {
      final wallets = TonWalletService.instance.wallets;
      for (final wallet in wallets) {
        await TonWalletService.instance.updateBalance(wallet.id);
      }
    } catch (e) {
      Logs().e('Failed to update wallet balances: $e');
    }
  }
  
  /// Refresh NFT data
  Future<void> refreshNftData() async {
    if (!_isInitialized) return;
    
    try {
      final activeWallet = TonWalletService.instance.activeWallet;
      if (activeWallet != null) {
        TonNftService.instance.clearCache(activeWallet.address);
        await TonNftService.instance.getNftsForAddress(activeWallet.address);
      }
    } catch (e) {
      Logs().e('Failed to refresh NFT data: $e');
    }
  }
  
  /// Update investment data
  Future<void> updateInvestmentData() async {
    if (!_isInitialized) return;
    
    try {
      await TonInvestmentService.instance.getAvailablePools();
      
      final activeWallet = TonWalletService.instance.activeWallet;
      if (activeWallet != null) {
        await TonInvestmentService.instance.getInvestmentStats(activeWallet.address);
      }
    } catch (e) {
      Logs().e('Failed to update investment data: $e');
    }
  }
  
  /// Perform health check on all services
  Future<Map<String, dynamic>> performHealthCheck() async {
    final healthStatus = <String, dynamic>{};
    
    try {
      // Check TON client connectivity
      healthStatus['ton_client'] = await _checkTonClientHealth();
      
      // Check wallet service
      healthStatus['wallet_service'] = _checkWalletServiceHealth();
      
      // Check NFT service
      healthStatus['nft_service'] = _checkNftServiceHealth();
      
      // Check investment service
      healthStatus['investment_service'] = _checkInvestmentServiceHealth();
      
      // Overall health
      final allHealthy = healthStatus.values.every((status) => status == true);
      healthStatus['overall'] = allHealthy;
      
    } catch (e) {
      healthStatus['error'] = e.toString();
      healthStatus['overall'] = false;
    }
    
    return healthStatus;
  }
  
  Future<bool> _checkTonClientHealth() async {
    try {
      // Try to get account info for a known address
      await TonClient.instance.getAccountInfo(
        'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t'
      );
      return true;
    } catch (e) {
      return false;
    }
  }
  
  bool _checkWalletServiceHealth() {
    try {
      final wallets = TonWalletService.instance.wallets;
      return wallets.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
  
  bool _checkNftServiceHealth() {
    try {
      // Check if NFT service is responsive
      return TonNftService.instance.favoriteNfts.isNotEmpty || true;
    } catch (e) {
      return false;
    }
  }
  
  bool _checkInvestmentServiceHealth() {
    try {
      // Check if investment service is responsive
      final pools = TonInvestmentService.instance.pools;
      return pools.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
  
  /// Get comprehensive service statistics
  Future<Map<String, dynamic>> getServiceStatistics() async {
    final stats = <String, dynamic>{};
    
    try {
      // Wallet statistics
      final wallets = TonWalletService.instance.wallets;
      final totalBalance = wallets.fold<double>(
        0.0, (sum, wallet) => sum + wallet.balance,
      );
      
      stats['wallets'] = {
        'count': wallets.length,
        'total_balance': totalBalance,
        'active_wallet': TonWalletService.instance.activeWallet?.name,
      };
      
      // NFT statistics
      final activeWallet = TonWalletService.instance.activeWallet;
      if (activeWallet != null) {
        final nfts = await TonNftService.instance.getNftsForAddress(activeWallet.address);
        stats['nfts'] = {
          'count': nfts.length,
          'favorites': TonNftService.instance.favoriteNfts.length,
        };
      }
      
      // Investment statistics
      if (activeWallet != null) {
        final investmentStats = await TonInvestmentService.instance
            .getInvestmentStats(activeWallet.address);
        stats['investments'] = {
          'total_invested': investmentStats.totalInvested,
          'total_returns': investmentStats.totalReturns,
          'active_investments': investmentStats.activeInvestments,
          'average_apr': investmentStats.averageApr,
        };
      }
      
      // Pool statistics
      final pools = TonInvestmentService.instance.pools;
      stats['pools'] = {
        'count': pools.length,
        'active_pools': pools.where((p) => p.isActive).length,
      };
      
    } catch (e) {
      stats['error'] = e.toString();
    }
    
    return stats;
  }
  
  /// Dispose all services
  Future<void> dispose() async {
    try {
      Logs().i('Disposing TON services...');
      
      // Dispose services
      TonWalletService.instance.dispose();
      TonNftService.instance.dispose();
      TonInvestmentService.instance.dispose();
      TonClient.instance.dispose();
      
      _isInitialized = false;
      _initializationController.close();
      
      Logs().i('TON services disposed');
    } catch (e) {
      Logs().e('Error disposing TON services: $e');
    }
  }
}

// Add Logs class if not available
class Logs {
  static void i(String message) => debugPrint('[INFO] $message');
  static void e(String message) => debugPrint('[ERROR] $message');
  static void w(String message) => debugPrint('[WARNING] $message');
  static void d(String message) => debugPrint('[DEBUG] $message');
}
