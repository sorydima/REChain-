import 'package:flutter/material.dart';

import '../../pages/auth/auth_dashboard.dart';

/// Navigation service for Auth-related screens
class AuthNavigation {
  /// Navigate to the Auth dashboard
  static Future<void> navigateToDashboard(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthDashboard(),
      ),
    );
  }
  
  /// Show Auth features menu
  static void showAuthMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Authentication Dashboard'),
            onTap: () {
              Navigator.pop(context);
              navigateToDashboard(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('TON Wallet Auth'),
            onTap: () {
              Navigator.pop(context);
              navigateToDashboard(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.telegram),
            title: const Text('Telegram Auth'),
            onTap: () {
              Navigator.pop(context);
              navigateToDashboard(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.currency_bitcoin),
            title: const Text('Bitget Auth'),
            onTap: () {
              Navigator.pop(context);
              navigateToDashboard(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text('Web3 Auth'),
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

/// Auth feature button for the app's main navigation
class AuthFeatureButton extends StatelessWidget {
  const AuthFeatureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.security),
      tooltip: 'Authentication Features',
      onPressed: () => AuthNavigation.showAuthMenu(context),
    );
  }
}

/// Auth navigation rail destination
class AuthNavigationDestination extends StatelessWidget {
  const AuthNavigationDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRailDestination(
      icon: const Icon(Icons.security),
      selectedIcon: const Icon(Icons.security),
      label: const Text('Auth'),
    );
  }
}

/// Auth navigation bar item
class AuthNavigationItem extends StatelessWidget {
  const AuthNavigationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: const Icon(Icons.security),
      selectedIcon: const Icon(Icons.security),
      label: 'Auth',
    );
  }
}

/// Auth drawer item
class AuthDrawerItem extends StatelessWidget {
  const AuthDrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.security),
      title: const Text('Authentication'),
      onTap: () {
        Navigator.pop(context); // Close drawer
        AuthNavigation.navigateToDashboard(context);
      },
    );
  }
} 