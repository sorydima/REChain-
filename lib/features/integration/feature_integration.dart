import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../blockchain/defi/defi_service.dart';
import '../blockchain/nft/nft_service.dart';
import '../analytics/portfolio_analytics.dart';
import '../security/biometric_auth.dart';
import '../ui/components/advanced_chart.dart';
import '../ui/components/portfolio_card.dart';
import '../ui/components/transaction_card.dart';
import '../ui/components/notification_card.dart';
import '../ui/components/price_ticker.dart';

/// Feature Integration Service
class FeatureIntegrationService {
  static final FeatureIntegrationService _instance = FeatureIntegrationService._internal();
  factory FeatureIntegrationService() => _instance;
  FeatureIntegrationService._internal();

  // Services
  DeFiService? _defiService;
  NFTService? _nftService;
  PortfolioAnalytics? _portfolioAnalytics;
  BiometricAuthManager? _biometricAuthManager;

  // State
  bool _isInitialized = false;
  final List<NotificationData> _notifications = [];
  final List<PriceData> _priceData = [];

  /// Initialize all features
  Future<void> initialize({
    required Map<BlockchainNetwork, BlockchainService> blockchainServices,
  }) async {
    if (_isInitialized) return;

    try {
      if (kDebugMode) {
        print('Initializing REChain features...');
      }

      // Initialize DeFi service
      _defiService = DeFiService(blockchainServices);

      // Initialize NFT service
      _nftService = NFTService(blockchainServices);

      // Initialize portfolio analytics
      _portfolioAnalytics = PortfolioAnalytics(blockchainServices);

      // Initialize biometric authentication
      _biometricAuthManager = BiometricAuthManager();
      await _biometricAuthManager!.initialize();

      // Initialize price ticker
      _initializePriceData();

      _isInitialized = true;

      if (kDebugMode) {
        print('REChain features initialized successfully!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Failed to initialize REChain features: $e');
      }
      rethrow;
    }
  }

  /// Get DeFi service
  DeFiService? get defiService => _defiService;

  /// Get NFT service
  NFTService? get nftService => _nftService;

  /// Get portfolio analytics
  PortfolioAnalytics? get portfolioAnalytics => _portfolioAnalytics;

  /// Get biometric auth manager
  BiometricAuthManager? get biometricAuthManager => _biometricAuthManager;

  /// Get notifications
  List<NotificationData> get notifications => List.unmodifiable(_notifications);

  /// Get price data
  List<PriceData> get priceData => List.unmodifiable(_priceData);

  /// Check if features are initialized
  bool get isInitialized => _isInitialized;

  /// Initialize price data
  void _initializePriceData() {
    _priceData.addAll([
      PriceData(
        symbol: 'ETH',
        name: 'Ethereum',
        price: 2500.0,
        priceChange: 25.0,
        priceChangePercent: 1.0,
        volume: 15000000000,
        marketCap: 300000000000,
        lastUpdated: DateTime.now(),
      ),
      PriceData(
        symbol: 'BTC',
        name: 'Bitcoin',
        price: 45000.0,
        priceChange: -500.0,
        priceChangePercent: -1.1,
        volume: 25000000000,
        marketCap: 850000000000,
        lastUpdated: DateTime.now(),
      ),
      PriceData(
        symbol: 'BNB',
        name: 'Binance Coin',
        price: 320.0,
        priceChange: 8.0,
        priceChangePercent: 2.5,
        volume: 8000000000,
        marketCap: 50000000000,
        lastUpdated: DateTime.now(),
      ),
      PriceData(
        symbol: 'SOL',
        name: 'Solana',
        price: 95.0,
        priceChange: 3.0,
        priceChangePercent: 3.2,
        volume: 5000000000,
        marketCap: 40000000000,
        lastUpdated: DateTime.now(),
      ),
      PriceData(
        symbol: 'TON',
        name: 'Toncoin',
        price: 2.5,
        priceChange: 0.1,
        priceChangePercent: 4.0,
        volume: 2000000000,
        marketCap: 8000000000,
        lastUpdated: DateTime.now(),
      ),
    ]);
  }

  /// Add notification
  void addNotification(NotificationData notification) {
    _notifications.insert(0, notification);
    if (_notifications.length > 100) {
      _notifications.removeLast();
    }
  }

  /// Remove notification
  void removeNotification(String notificationId) {
    _notifications.removeWhere((n) => n.id == notificationId);
  }

  /// Clear all notifications
  void clearNotifications() {
    _notifications.clear();
  }

  /// Get unread notifications count
  int get unreadNotificationsCount {
    return _notifications.where((n) => n.isUnread).length;
  }

  /// Mark notification as read
  void markNotificationAsRead(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      final notification = _notifications[index];
      _notifications[index] = NotificationData(
        id: notification.id,
        title: notification.title,
        description: notification.description,
        type: notification.type,
        priority: notification.priority,
        timestamp: notification.timestamp,
        isUnread: false,
        actions: notification.actions,
        metadata: notification.metadata,
      );
    }
  }

  /// Mark all notifications as read
  void markAllNotificationsAsRead() {
    for (int i = 0; i < _notifications.length; i++) {
      final notification = _notifications[i];
      _notifications[i] = NotificationData(
        id: notification.id,
        title: notification.title,
        description: notification.description,
        type: notification.type,
        priority: notification.priority,
        timestamp: notification.timestamp,
        isUnread: false,
        actions: notification.actions,
        metadata: notification.metadata,
      );
    }
  }

  /// Create transaction notification
  void createTransactionNotification({
    required String transactionId,
    required String type,
    required double amount,
    required String symbol,
    required bool isSuccess,
  }) {
    final notification = NotificationData(
      id: 'tx_$transactionId',
      title: isSuccess ? 'Transaction Successful' : 'Transaction Failed',
      description: '$type of $amount $symbol has been ${isSuccess ? 'completed' : 'failed'}.',
      type: NotificationType.transaction,
      priority: isSuccess ? NotificationPriority.medium : NotificationPriority.high,
      timestamp: DateTime.now(),
      actions: [
        NotificationAction(
          label: 'View Details',
          type: NotificationActionType.primary,
          onTap: () {
            // TODO: Navigate to transaction details
          },
        ),
        if (isSuccess)
          NotificationAction(
            label: 'Share',
            type: NotificationActionType.secondary,
            onTap: () {
              // TODO: Share transaction
            },
          ),
      ],
    );

    addNotification(notification);
  }

  /// Create security notification
  void createSecurityNotification({
    required String title,
    required String description,
    required NotificationPriority priority,
  }) {
    final notification = NotificationData(
      id: 'security_${DateTime.now().millisecondsSinceEpoch}',
      title: title,
      description: description,
      type: NotificationType.security,
      priority: priority,
      timestamp: DateTime.now(),
      actions: [
        NotificationAction(
          label: 'Review',
          type: NotificationActionType.primary,
          onTap: () {
            // TODO: Navigate to security settings
          },
        ),
      ],
    );

    addNotification(notification);
  }

  /// Create price alert notification
  void createPriceAlertNotification({
    required String symbol,
    required double price,
    required double targetPrice,
    required bool isAbove,
  }) {
    final notification = NotificationData(
      id: 'price_${symbol}_${DateTime.now().millisecondsSinceEpoch}',
      title: 'Price Alert: $symbol',
      description: '$symbol has ${isAbove ? 'risen above' : 'fallen below'} \$${targetPrice.toStringAsFixed(2)} (Current: \$${price.toStringAsFixed(2)})',
      type: NotificationType.price,
      priority: NotificationPriority.medium,
      timestamp: DateTime.now(),
      actions: [
        NotificationAction(
          label: 'View Chart',
          type: NotificationActionType.primary,
          onTap: () {
            // TODO: Navigate to price chart
          },
        ),
      ],
    );

    addNotification(notification);
  }

  /// Create DeFi notification
  void createDeFiNotification({
    required String protocol,
    required String action,
    required double amount,
    required String symbol,
  }) {
    final notification = NotificationData(
      id: 'defi_${DateTime.now().millisecondsSinceEpoch}',
      title: 'DeFi $action',
      description: '$action of $amount $symbol on $protocol has been completed.',
      type: NotificationType.defi,
      priority: NotificationPriority.medium,
      timestamp: DateTime.now(),
      actions: [
        NotificationAction(
          label: 'View Position',
          type: NotificationActionType.primary,
          onTap: () {
            // TODO: Navigate to DeFi position
          },
        ),
      ],
    );

    addNotification(notification);
  }

  /// Create NFT notification
  void createNFTNotification({
    required String action,
    required String nftName,
    required double? price,
  }) {
    final description = price != null 
      ? '$action of $nftName for \$${price.toStringAsFixed(2)}'
      : '$action of $nftName';

    final notification = NotificationData(
      id: 'nft_${DateTime.now().millisecondsSinceEpoch}',
      title: 'NFT $action',
      description: description,
      type: NotificationType.nft,
      priority: NotificationPriority.medium,
      timestamp: DateTime.now(),
      actions: [
        NotificationAction(
          label: 'View NFT',
          type: NotificationActionType.primary,
          onTap: () {
            // TODO: Navigate to NFT details
          },
        ),
      ],
    );

    addNotification(notification);
  }

  /// Get portfolio overview
  Future<PortfolioOverview?> getPortfolioOverview(String walletAddress) async {
    if (_portfolioAnalytics == null) return null;

    try {
      return await _portfolioAnalytics!.getPortfolioOverview(
        walletAddress: walletAddress,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get portfolio overview: $e');
      }
      return null;
    }
  }

  /// Get transaction analytics
  Future<TransactionAnalytics?> getTransactionAnalytics({
    required String walletAddress,
    required Duration period,
  }) async {
    if (_portfolioAnalytics == null) return null;

    try {
      return await _portfolioAnalytics!.getTransactionAnalytics(
        walletAddress: walletAddress,
        period: period,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get transaction analytics: $e');
      }
      return null;
    }
  }

  /// Get performance metrics
  Future<PerformanceMetrics?> getPerformanceMetrics({
    required String walletAddress,
    required Duration period,
  }) async {
    if (_portfolioAnalytics == null) return null;

    try {
      return await _portfolioAnalytics!.getPerformanceMetrics(
        walletAddress: walletAddress,
        period: period,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get performance metrics: $e');
      }
      return null;
    }
  }

  /// Get risk analysis
  Future<RiskAnalysis?> getRiskAnalysis(String walletAddress) async {
    if (_portfolioAnalytics == null) return null;

    try {
      return await _portfolioAnalytics!.getRiskAnalysis(
        walletAddress: walletAddress,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get risk analysis: $e');
      }
      return null;
    }
  }

  /// Get DeFi portfolio
  Future<DeFiPortfolio?> getDeFiPortfolio({
    required String walletAddress,
    required BlockchainNetwork network,
  }) async {
    if (_defiService == null) return null;

    try {
      return await _defiService!.getUserPortfolio(
        walletAddress: walletAddress,
        network: network,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get DeFi portfolio: $e');
      }
      return null;
    }
  }

  /// Get owned NFTs
  Future<List<NFT>?> getOwnedNFTs({
    required String walletAddress,
    required BlockchainNetwork network,
  }) async {
    if (_nftService == null) return null;

    try {
      return await _nftService!.getOwnedNFTs(
        walletAddress: walletAddress,
        network: network,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to get owned NFTs: $e');
      }
      return null;
    }
  }

  /// Authenticate for sensitive operation
  Future<bool> authenticateForSensitiveOperation(String operation) async {
    if (_biometricAuthManager == null) return true;

    try {
      return await _biometricAuthManager!.authenticateForSensitiveOperation(
        operation: operation,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Biometric authentication failed: $e');
      }
      return false;
    }
  }

  /// Check if biometric auth is available
  Future<bool> isBiometricAuthAvailable() async {
    if (_biometricAuthManager == null) return false;

    try {
      return await _biometricAuthManager!.isEnabled;
    } catch (e) {
      return false;
    }
  }

  /// Dispose resources
  void dispose() {
    _defiService = null;
    _nftService = null;
    _portfolioAnalytics = null;
    _biometricAuthManager?.dispose();
    _biometricAuthManager = null;
    _notifications.clear();
    _priceData.clear();
    _isInitialized = false;
  }
} 