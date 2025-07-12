import 'package:flutter/material.dart';
import '../bridge_config.dart';
import '../bridge_status.dart';

class BridgeStatusCard extends StatelessWidget {
  final BridgeConfig config;
  final BridgeStatus? status;
  final VoidCallback? onRemove;

  const BridgeStatusCard({
    super.key,
    required this.config,
    this.status,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      _getBridgeIcon(config.type),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        config.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Port: ${config.port}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'remove') {
                      onRemove?.call();
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'remove',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Remove'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(status?.status),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        status?.statusIcon ?? '⚫',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        status?.statusText ?? 'Unknown',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                if (status?.connectedUsers != null)
                  Text(
                    '${status!.connectedUsers} users',
                    style: theme.textTheme.bodySmall,
                  ),
              ],
            ),
            if (status?.errorMessage != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        status!.errorMessage!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              'Last checked: ${_formatLastChecked(status?.lastChecked)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getBridgeIcon(String type) {
    const icons = {
      'telegram': '📱',
      'signal': '🔒',
      'whatsapp': '💬',
      'discord': '🎮',
      'facebook': '📘',
      'instagram': '📷',
      'googlechat': '🔍',
      'slack': '💼',
      'twitter': '🐦',
      'bluesky': '🦋',
      'email': '📧',
      'xmpp': '💭',
    };
    return icons[type] ?? '🔗';
  }

  Color _getStatusColor(BridgeConnectionStatus? status) {
    switch (status) {
      case BridgeConnectionStatus.connected:
        return Colors.green;
      case BridgeConnectionStatus.connecting:
      case BridgeConnectionStatus.configuring:
      case BridgeConnectionStatus.starting:
        return Colors.orange;
      case BridgeConnectionStatus.configured:
        return Colors.blue;
      case BridgeConnectionStatus.error:
        return Colors.red;
      case BridgeConnectionStatus.maintenance:
        return Colors.purple;
      case BridgeConnectionStatus.stopping:
        return Colors.grey;
      case BridgeConnectionStatus.disconnected:
      case null:
        return Colors.grey;
    }
  }

  String _formatLastChecked(DateTime? lastChecked) {
    if (lastChecked == null) return 'Never';
    
    final now = DateTime.now();
    final difference = now.difference(lastChecked);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
