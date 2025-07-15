import 'package:flutter/material.dart';
import '../bridge_manager.dart';

class BridgeListItem extends StatelessWidget {
  final BridgeInfo info;
  final bool isConfigured;
  final VoidCallback? onTap;

  const BridgeListItem({
    super.key,
    required this.info,
    required this.isConfigured,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            info.icon,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      title: Text(info.name),
      subtitle: Text(info.description),
      trailing: isConfigured
          ? const Chip(
              label: Text('Configured'),
              backgroundColor: Colors.green,
              labelStyle: TextStyle(color: Colors.white),
            )
          : IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: onTap,
              tooltip: 'Configure ${info.name} Bridge',
            ),
      onTap: isConfigured ? null : onTap,
      enabled: !isConfigured,
    );
  }
}
