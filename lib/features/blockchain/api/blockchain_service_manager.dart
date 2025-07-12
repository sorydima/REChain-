import 'wallet_service.dart';
import 'bridge_service.dart';
import 'portfolio_analytics_service.dart';
import 'staking_service.dart';
import 'notification_service.dart';
import 'smart_contract_service.dart';
import 'transaction_history_service.dart';

class BlockchainServiceManager {
  static final BlockchainServiceManager _instance = BlockchainServiceManager._internal();

  factory BlockchainServiceManager() {
    return _instance;
  }

  BlockchainServiceManager._internal();

  final WalletService walletService = WalletService();
  final BridgeService bridgeService = BridgeService();
  final PortfolioAnalyticsService portfolioAnalyticsService = PortfolioAnalyticsService();
  final StakingService stakingService = StakingService();
  final NotificationService notificationService = NotificationService();
  final SmartContractService smartContractService = SmartContractService();
  final TransactionHistoryService transactionHistoryService = TransactionHistoryService();

  void initialize() {
    // Add any initialization logic if needed
  }
}
