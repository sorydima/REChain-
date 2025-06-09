import 'package:flutter/material.dart';

class TonNavigationItem extends StatelessWidget {
  const TonNavigationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavigationDestination(
      icon: Icon(Icons.account_balance_wallet),
      label: 'TON',
    );
  }
}

class TonDrawerItem extends StatelessWidget {
  const TonDrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.account_balance_wallet),
      title: const Text('TON Wallet'),
      onTap: () {
        Navigator.pop(context); // Close drawer
        Navigator.pushNamed(context, '/ton/dashboard');
      },
    );
  }
}

class TonFeatureButton extends StatelessWidget {
  const TonFeatureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.account_balance_wallet),
      tooltip: 'TON Features',
      onPressed: () {
        Navigator.pushNamed(context, '/ton/dashboard');
      },
    );
  }
}

class TonNavigationRail extends StatelessWidget {
  const TonNavigationRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationRailDestination(
      icon: const Icon(Icons.account_balance_wallet),
      label: const Text('TON'),
    );
  }
}

class TonBottomNavigationBarItem extends BottomNavigationBarItem {
  TonBottomNavigationBarItem()
      : super(
          icon: const Icon(Icons.account_balance_wallet),
          label: 'TON',
        );
}
