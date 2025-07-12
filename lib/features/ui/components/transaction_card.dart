import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import '../../blockchain/common/models/blockchain_types.dart';

/// Transaction Card Component
class TransactionCard extends StatefulWidget {
  final BlockchainTransaction transaction;
  final VoidCallback? onTap;
  final bool showDetails;
  final bool isExpanded;

  const TransactionCard({
    Key? key,
    required this.transaction,
    this.onTap,
    this.showDetails = true,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
    
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
      begin: const Offset(0, 0.1),
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
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: GestureDetector(
          onTap: widget.onTap ?? _toggleExpansion,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildHeader(),
                if (_isExpanded && widget.showDetails) ...[
                  const Divider(height: 1),
                  _buildDetails(),
                ],
              ],
            ),
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
          _buildTransactionIcon(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTransactionTitle(),
                const SizedBox(height: 4),
                _buildTransactionSubtitle(),
              ],
            ),
          ),
          _buildTransactionAmount(),
        ],
      ),
    );
  }

  Widget _buildTransactionIcon() {
    final iconData = _getTransactionIcon();
    final color = _getTransactionColor();

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        iconData,
        color: color,
        size: 20,
      ),
    );
  }

  Widget _buildTransactionTitle() {
    return Row(
      children: [
        Text(
          _getTransactionTypeName(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 8),
        _buildStatusBadge(),
      ],
    );
  }

  Widget _buildTransactionSubtitle() {
    return Text(
      _formatTimestamp(widget.transaction.timestamp),
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 12,
      ),
    );
  }

  Widget _buildTransactionAmount() {
    final isPositive = _isIncomingTransaction();
    final amount = widget.transaction.amount;
    final color = isPositive ? Colors.green : Colors.red;
    final prefix = isPositive ? '+' : '-';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$prefix${_formatAmount(amount)}',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          _getNetworkName(),
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge() {
    final status = widget.transaction.status;
    Color color;
    String text;

    if (status is bool) {
      color = status ? Colors.green : Colors.red;
      text = status ? 'Confirmed' : 'Failed';
    } else {
      color = Colors.orange;
      text = 'Pending';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow('Transaction ID', _formatTransactionId()),
          const SizedBox(height: 8),
          _buildDetailRow('From', _formatAddress(widget.transaction.fromAddress)),
          const SizedBox(height: 8),
          _buildDetailRow('To', _formatAddress(widget.transaction.toAddress)),
          const SizedBox(height: 8),
          _buildDetailRow('Network', _getNetworkName()),
          const SizedBox(height: 8),
          _buildDetailRow('Type', _getTransactionTypeName()),
          const SizedBox(height: 8),
          _buildDetailRow('Amount', _formatAmount(widget.transaction.amount)),
          const SizedBox(height: 8),
          _buildDetailRow('Timestamp', _formatTimestamp(widget.transaction.timestamp)),
          const SizedBox(height: 16),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => _copyToClipboard(value),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.copy,
                  size: 14,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            'View on Explorer',
            Icons.open_in_new,
            () => _viewOnExplorer(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            'Share',
            Icons.share,
            () => _shareTransaction(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 18,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  IconData _getTransactionIcon() {
    switch (widget.transaction.type) {
      case TransactionType.transfer:
        return Icons.swap_horiz;
      case TransactionType.staking:
        return Icons.trending_up;
      case TransactionType.swap:
        return Icons.swap_vert;
      case TransactionType.contract:
        return Icons.code;
      case TransactionType.mint:
        return Icons.add_circle;
      case TransactionType.burn:
        return Icons.remove_circle;
      default:
        return Icons.receipt;
    }
  }

  Color _getTransactionColor() {
    switch (widget.transaction.type) {
      case TransactionType.transfer:
        return Colors.blue;
      case TransactionType.staking:
        return Colors.green;
      case TransactionType.swap:
        return Colors.orange;
      case TransactionType.contract:
        return Colors.purple;
      case TransactionType.mint:
        return Colors.teal;
      case TransactionType.burn:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getTransactionTypeName() {
    switch (widget.transaction.type) {
      case TransactionType.transfer:
        return 'Transfer';
      case TransactionType.staking:
        return 'Staking';
      case TransactionType.swap:
        return 'Swap';
      case TransactionType.contract:
        return 'Contract';
      case TransactionType.mint:
        return 'Mint';
      case TransactionType.burn:
        return 'Burn';
      default:
        return 'Transaction';
    }
  }

  bool _isIncomingTransaction() {
    // This would need to be determined based on the user's address
    // For now, we'll assume it's outgoing
    return false;
  }

  String _formatAmount(double amount) {
    if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(2)}M';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(2)}K';
    } else {
      return amount.toStringAsFixed(4);
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

  String _formatTransactionId() {
    final id = widget.transaction.id;
    if (id.length > 20) {
      return '${id.substring(0, 10)}...${id.substring(id.length - 10)}';
    }
    return id;
  }

  String _formatAddress(String address) {
    if (address.length > 20) {
      return '${address.substring(0, 10)}...${address.substring(address.length - 10)}';
    }
    return address;
  }

  String _getNetworkName() {
    // This would need to be determined from the transaction context
    return 'Ethereum';
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Copied to clipboard'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _viewOnExplorer() {
    // TODO: Open transaction in blockchain explorer
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Opening explorer...')),
    );
  }

  void _shareTransaction() {
    // TODO: Share transaction details
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sharing transaction...')),
    );
  }
} 