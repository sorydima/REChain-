import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import '../../analytics/portfolio_analytics.dart';
import '../../blockchain/common/models/blockchain_types.dart';

/// Portfolio Card Component
class PortfolioCard extends StatefulWidget {
  final PortfolioOverview portfolio;
  final VoidCallback? onTap;
  final bool showDetails;
  final bool isExpanded;

  const PortfolioCard({
    Key? key,
    required this.portfolio,
    this.onTap,
    this.showDetails = true,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard>
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
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).cardColor,
                  Theme.of(context).cardColor.withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Portfolio Value',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${_formatCurrency(widget.portfolio.totalValue)}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              _buildChangeIndicator(),
            ],
          ),
          const SizedBox(height: 16),
          _buildQuickStats(),
          if (widget.showDetails) ...[
            const SizedBox(height: 16),
            _buildExpandButton(),
          ],
        ],
      ),
    );
  }

  Widget _buildChangeIndicator() {
    final change24h = widget.portfolio.changePercentage24h;
    final isPositive = change24h >= 0;
    final color = isPositive ? Colors.green : Colors.red;
    final icon = isPositive ? Icons.trending_up : Icons.trending_down;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            '${isPositive ? '+' : ''}${change24h.toStringAsFixed(2)}%',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatItem(
            '24h',
            widget.portfolio.change24h,
            widget.portfolio.changePercentage24h,
          ),
        ),
        Expanded(
          child: _buildStatItem(
            '7d',
            widget.portfolio.change7d,
            widget.portfolio.changePercentage7d,
          ),
        ),
        Expanded(
          child: _buildStatItem(
            '30d',
            widget.portfolio.change30d,
            widget.portfolio.changePercentage30d,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, double change, double percentage) {
    final isPositive = change >= 0;
    final color = isPositive ? Colors.green : Colors.red;

    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${isPositive ? '+' : ''}\$${_formatCurrency(change.abs())}',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          '${isPositive ? '+' : ''}${percentage.toStringAsFixed(1)}%',
          style: TextStyle(
            color: color,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildExpandButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _isExpanded ? 'Show Less' : 'Show Details',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),
              AnimatedRotation(
                turns: _isExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Asset Allocation'),
          const SizedBox(height: 12),
          _buildAssetAllocation(),
          const SizedBox(height: 20),
          _buildSectionTitle('Network Distribution'),
          const SizedBox(height: 12),
          _buildNetworkDistribution(),
          const SizedBox(height: 20),
          _buildSectionTitle('Risk & Diversification'),
          const SizedBox(height: 12),
          _buildRiskMetrics(),
          const SizedBox(height: 20),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
      ),
    );
  }

  Widget _buildAssetAllocation() {
    final sortedAssets = widget.portfolio.assetAllocation.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      children: sortedAssets.take(5).map((entry) {
        final percentage = (entry.value / widget.portfolio.totalValue) * 100;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _getAssetColor(entry.key),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  entry.key,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '\$${_formatCurrency(entry.value)}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNetworkDistribution() {
    final sortedNetworks = widget.portfolio.networkBalances.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      children: sortedNetworks.map((entry) {
        final percentage = (entry.value / widget.portfolio.totalValue) * 100;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _getNetworkColor(entry.key),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _getNetworkName(entry.key),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '${percentage.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '\$${_formatCurrency(entry.value)}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRiskMetrics() {
    return Row(
      children: [
        Expanded(
          child: _buildRiskMetric(
            'Risk Score',
            '${(widget.portfolio.riskScore * 100).toStringAsFixed(0)}%',
            _getRiskColor(widget.portfolio.riskScore),
          ),
        ),
        Expanded(
          child: _buildRiskMetric(
            'Diversification',
            '${widget.portfolio.diversificationScore.toStringAsFixed(0)}%',
            _getDiversificationColor(widget.portfolio.diversificationScore),
          ),
        ),
      ],
    );
  }

  Widget _buildRiskMetric(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            'View Analytics',
            Icons.analytics,
            () => _showAnalytics(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            'Manage Portfolio',
            Icons.settings,
            () => _managePortfolio(),
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
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
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

  String _formatCurrency(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    } else {
      return value.toStringAsFixed(2);
    }
  }

  Color _getAssetColor(String asset) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
    ];
    return colors[asset.hashCode % colors.length];
  }

  Color _getNetworkColor(BlockchainNetwork network) {
    final colors = {
      BlockchainNetwork.ethereum: Colors.blue,
      BlockchainNetwork.binance: Colors.yellow,
      BlockchainNetwork.polygon: Colors.purple,
      BlockchainNetwork.avalanche: Colors.red,
      BlockchainNetwork.solana: Colors.green,
      BlockchainNetwork.ton: Colors.orange,
      BlockchainNetwork.optimism: Colors.pink,
      BlockchainNetwork.arbitrum: Colors.cyan,
    };
    return colors[network] ?? Colors.grey;
  }

  String _getNetworkName(BlockchainNetwork network) {
    return network.toString().split('.').last.toUpperCase();
  }

  Color _getRiskColor(double riskScore) {
    if (riskScore < 0.3) return Colors.green;
    if (riskScore < 0.6) return Colors.orange;
    return Colors.red;
  }

  Color _getDiversificationColor(double score) {
    if (score > 80) return Colors.green;
    if (score > 60) return Colors.orange;
    return Colors.red;
  }

  void _showAnalytics() {
    // TODO: Navigate to analytics page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Analytics page coming soon!')),
    );
  }

  void _managePortfolio() {
    // TODO: Navigate to portfolio management page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Portfolio management coming soon!')),
    );
  }
} 