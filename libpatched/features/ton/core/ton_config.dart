import 'package:flutter/foundation.dart';

/// Configuration class for TON blockchain integration
class TonConfig {
  static const String tonMainnetEndpoint = 'https://toncenter.com/api/v2/jsonRPC';
  static const String tonTestnetEndpoint = 'https://testnet.toncenter.com/api/v2/jsonRPC';
  
  // NFT Marketplace Configuration
  static const String nftMarketplaceUrl = 'https://getgems.io/api';
  static const String tonNftApiUrl = 'https://tonapi.io/v2';
  
  // HYIP Configuration
  static const String hyipContractAddress = 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t';
  static const double minimumInvestment = 1.0; // TON
  static const double maximumInvestment = 1000.0; // TON
  
  // Wallet Configuration
  static const String walletVersion = 'v4R2';
  static const int workchain = 0;
  
  // Security Configuration
  static const int transactionTimeout = 60; // seconds
  static const int maxRetries = 3;
  static const double networkFee = 0.01; // TON
  
  // Bridge Configuration
  static const String bridgeNamespace = 'ton';
  static const String bridgeUserId = '@tonbridge:your.domain.tld';
  
  // API Keys (should be loaded from environment or secure storage)
  static String? _tonCenterApiKey;
  static String? _nftMarketplaceApiKey;
  
  static String get tonCenterApiKey => _tonCenterApiKey ?? '';
  static String get nftMarketplaceApiKey => _nftMarketplaceApiKey ?? '';
  
  static void setApiKeys({
    String? tonCenterKey,
    String? nftMarketplaceKey,
  }) {
    _tonCenterApiKey = tonCenterKey;
    _nftMarketplaceApiKey = nftMarketplaceKey;
  }
  
  // Environment-based configuration
  static bool get isTestnet => kDebugMode;
  static String get currentEndpoint => isTestnet ? tonTestnetEndpoint : tonMainnetEndpoint;
  
  // Feature flags
  static const bool enableNftTrading = true;
  static const bool enableHyipFeatures = true;
  static const bool enableStaking = true;
  static const bool enableDeFi = true;
  
  // UI Configuration
  static const int transactionHistoryLimit = 100;
  static const int nftGridColumns = 2;
  static const double walletRefreshInterval = 30.0; // seconds
  
  // Notification Configuration
  static const bool notifyOnTransactions = true;
  static const bool notifyOnNftActivity = true;
  static const bool notifyOnInvestmentUpdates = true;
  
  // Cache Configuration
  static const int cacheExpirationHours = 24;
  static const int maxCacheSize = 1000; // items
  
  // Error Handling
  static const int maxErrorRetries = 3;
  static const double retryDelaySeconds = 2.0;
  
  // Validation Rules
  static bool isValidTonAddress(String address) {
    // Basic TON address validation
    return address.length >= 48 && 
           (address.startsWith('EQ') || address.startsWith('UQ'));
  }
  
  static bool isValidAmount(double amount) {
    return amount > 0 && amount <= maximumInvestment;
  }
  
  static bool isValidInvestmentAmount(double amount) {
    return amount >= minimumInvestment && amount <= maximumInvestment;
  }
  
  // Network Configuration
  static const Map<String, dynamic> networkConfig = {
    'mainnet': {
      'name': 'TON Mainnet',
      'chainId': -239,
      'explorer': 'https://tonscan.org',
    },
    'testnet': {
      'name': 'TON Testnet',
      'chainId': -3,
      'explorer': 'https://testnet.tonscan.org',
    },
  };
  
  static Map<String, dynamic> get currentNetwork => 
      networkConfig[isTestnet ? 'testnet' : 'mainnet']!;
  
  // Smart Contract Addresses
  static const Map<String, String> contractAddresses = {
    'hyip_pool': 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t',
    'nft_marketplace': 'EQBYTuYbLf8INxFtD8tQeNk5ZLy-nAX9ahQbG_yl1qQ-GEMS',
    'staking_pool': 'EQC-3ilVr-W0Uc3pLrg6ftgZhZL72ohNcBqBMN9HNNpK5w',
    'defi_vault': 'EQD0vdSA_NedR9uvbgN9EikRX-suesDxGeFg69XQMavfLqIw',
  };
  
  // Gas Configuration
  static const Map<String, int> gasLimits = {
    'transfer': 100000,
    'nft_transfer': 150000,
    'smart_contract': 200000,
    'complex_operation': 300000,
  };
  
  // Rate Limiting
  static const int maxRequestsPerMinute = 60;
  static const int maxTransactionsPerHour = 100;
  
  // Backup Configuration
  static const bool enableAutoBackup = true;
  static const int backupIntervalHours = 24;
  static const int maxBackupFiles = 5;
}
