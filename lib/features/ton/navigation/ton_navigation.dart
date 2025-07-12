import 'package:flutter/material.dart';

import '../screens/ton_dashboard_screen.dart';
import '../screens/ton_send_screen.dart';
import '../screens/ton_nft_marketplace_screen.dart';
import '../screens/ton_investment_screen.dart';
import '../wallet/ton_wallet_service.dart';
import '../hyip/ton_investment_service.dart';

/// Navigation service for TON-related screens
class TonNavigation {
  /// Navigate to the TON dashboard
  static Future<void> navigateToDashboard(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TonDashboardScreen(),
      ),
    );
  }
  
  /// Navigate to send TON screen
  static Future<void> navigateToSend(BuildContext context, TonWallet wallet) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TonSendScreen(wallet: wallet),
      ),
    );
  }
  
  /// Navigate to NFT marketplace
  static Future<void> navigateToNftMarketplace(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TonNftMarketplaceScreen(),
      ),
    );
  }
  
  /// Navigate to investment screen
  static Future<void> navigateToInvestment(
    BuildContext context,
    TonInvestmentPool pool,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TonInvestmentScreen(pool: pool),
      ),
    );
  }
  
  /// Show TON features menu
  static void showTonMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('TON Wallet'),
            onTap: () {
              Navigator.pop(context);
              navigateToDashboard(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.collections),
            title: const Text('NFT Marketplace'),
            onTap: () {
              Navigator.pop(context);
              navigateToNftMarketplace(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.trending_up),
            title: const Text('Investments'),
            onTap: () {
              Navigator.pop(context);
              navigateToDashboard(context);
            },
          ),
        ],
      ),
    );
  }
}

/// TON feature button for the app's main navigation
class TonFeatureButton extends StatelessWidget {
  const TonFeatureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.currency_bitcoin),
      tooltip: 'TON Features',
      onPressed: () => TonNavigation.showTonMenu(context),
    );
  }
}

/// TON navigation rail destination
class TonNavigationDestination extends StatelessWidget {
  const TonNavigationDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRailDestination(
      icon: const Icon(Icons.currency_bitcoin),
      selectedIcon: const Icon(Icons.currency_bitcoin),
      label: const Text('TON'),
    );
  }
}

/// TON navigation bar item
class TonNavigationItem extends StatelessWidget {
  const TonNavigationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: const Icon(Icons.currency_bitcoin),
      selectedIcon: const Icon(Icons.currency_bitcoin),
      label: 'TON',
    );
  }
}

/// TON drawer item
class TonDrawerItem extends StatelessWidget {
  const TonDrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.currency_bitcoin),
      title: const Text('TON Features'),
      onTap: () {
        Navigator.pop(context); // Close drawer
        TonNavigation.showTonMenu(context);
      },
    );
  }
}
