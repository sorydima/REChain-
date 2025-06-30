import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Notification Card Component
class NotificationCard extends StatefulWidget {
  final NotificationData notification;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;
  final bool showActions;

  const NotificationCard({
    Key? key,
    required this.notification,
    this.onTap,
    this.onDismiss,
    this.showActions = true,
  }) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isDismissed = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isDismissed) {
      return const SizedBox.shrink();
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Dismissible(
          key: Key(widget.notification.id),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              _isDismissed = true;
            });
            widget.onDismiss?.call();
          },
          background: _buildDismissBackground(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _getNotificationColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _getNotificationColor().withOpacity(0.3),
              ),
            ),
            child: Column(
              children: [
                _buildHeader(),
                if (widget.notification.description.isNotEmpty) ...[
                  _buildDescription(),
                ],
                if (widget.showActions && widget.notification.actions.isNotEmpty) ...[
                  _buildActions(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildNotificationIcon(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: 4),
                _buildTimestamp(),
              ],
            ),
          ),
          _buildPriorityIndicator(),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon() {
    final iconData = _getNotificationIcon();
    final color = _getNotificationColor();

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        iconData,
        color: color,
        size: 20,
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.notification.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        if (widget.notification.isUnread) ...[
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: _getNotificationColor(),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTimestamp() {
    return Text(
      _formatTimestamp(widget.notification.timestamp),
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 12,
      ),
    );
  }

  Widget _buildPriorityIndicator() {
    if (widget.notification.priority == NotificationPriority.low) {
      return const SizedBox.shrink();
    }

    final color = _getPriorityColor();
    final icon = _getPriorityIcon();

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(
        icon,
        color: color,
        size: 16,
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Text(
        widget.notification.description,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: widget.notification.actions.map((action) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _buildActionButton(action),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildActionButton(NotificationAction action) {
    final isPrimary = action.type == NotificationActionType.primary;
    
    return GestureDetector(
      onTap: () {
        action.onTap?.call();
        if (action.dismissOnTap) {
          setState(() {
            _isDismissed = true;
          });
          widget.onDismiss?.call();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isPrimary 
            ? _getNotificationColor()
            : _getNotificationColor().withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _getNotificationColor().withOpacity(0.3),
          ),
        ),
        child: Text(
          action.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isPrimary ? Colors.white : _getNotificationColor(),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // Helper methods
  IconData _getNotificationIcon() {
    switch (widget.notification.type) {
      case NotificationType.transaction:
        return Icons.receipt;
      case NotificationType.security:
        return Icons.security;
      case NotificationType.price:
        return Icons.trending_up;
      case NotificationType.staking:
        return Icons.trending_up;
      case NotificationType.swap:
        return Icons.swap_horiz;
      case NotificationType.nft:
        return Icons.image;
      case NotificationType.defi:
        return Icons.account_balance;
      case NotificationType.system:
        return Icons.info;
      case NotificationType.warning:
        return Icons.warning;
      case NotificationType.error:
        return Icons.error;
      default:
        return Icons.notifications;
    }
  }

  Color _getNotificationColor() {
    switch (widget.notification.type) {
      case NotificationType.transaction:
        return Colors.blue;
      case NotificationType.security:
        return Colors.red;
      case NotificationType.price:
        return Colors.green;
      case NotificationType.staking:
        return Colors.orange;
      case NotificationType.swap:
        return Colors.purple;
      case NotificationType.nft:
        return Colors.pink;
      case NotificationType.defi:
        return Colors.teal;
      case NotificationType.system:
        return Colors.grey;
      case NotificationType.warning:
        return Colors.orange;
      case NotificationType.error:
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  Color _getPriorityColor() {
    switch (widget.notification.priority) {
      case NotificationPriority.low:
        return Colors.grey;
      case NotificationPriority.medium:
        return Colors.orange;
      case NotificationPriority.high:
        return Colors.red;
      case NotificationPriority.critical:
        return Colors.red[900]!;
      default:
        return Colors.grey;
    }
  }

  IconData _getPriorityIcon() {
    switch (widget.notification.priority) {
      case NotificationPriority.low:
        return Icons.info;
      case NotificationPriority.medium:
        return Icons.warning;
      case NotificationPriority.high:
        return Icons.error;
      case NotificationPriority.critical:
        return Icons.priority_high;
      default:
        return Icons.info;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

/// Notification Data Model
class NotificationData {
  final String id;
  final String title;
  final String description;
  final NotificationType type;
  final NotificationPriority priority;
  final DateTime timestamp;
  final bool isUnread;
  final List<NotificationAction> actions;
  final Map<String, dynamic>? metadata;

  NotificationData({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.priority,
    required this.timestamp,
    this.isUnread = true,
    this.actions = const [],
    this.metadata,
  });
}

/// Notification Types
enum NotificationType {
  transaction,
  security,
  price,
  staking,
  swap,
  nft,
  defi,
  system,
  warning,
  error,
}

/// Notification Priority
enum NotificationPriority {
  low,
  medium,
  high,
  critical,
}

/// Notification Action
class NotificationAction {
  final String label;
  final NotificationActionType type;
  final VoidCallback? onTap;
  final bool dismissOnTap;

  NotificationAction({
    required this.label,
    this.type = NotificationActionType.secondary,
    this.onTap,
    this.dismissOnTap = false,
  });
}

/// Notification Action Types
enum NotificationActionType {
  primary,
  secondary,
  destructive,
} 