import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../features/integration/feature_integration.dart';
import '../../features/ui/components/portfolio_card.dart';
import '../../features/ui/components/price_ticker.dart';
import '../../features/ui/components/notification_card.dart';
import '../../features/ui/components/advanced_chart.dart';
import '../../features/ui/components/transaction_card.dart';
import '../../features/analytics/portfolio_analytics.dart';
import '../../features/blockchain/defi/defi_service.dart';
import '../../features/blockchain/nft/nft_service.dart';
import '../../features/blockchain/common/interfaces/blockchain_service.dart';
import '../../features/blockchain/common/models/blockchain_types.dart';
import '../integration/integration_dashboard.dart';
import '../integration/ai_services_dashboard.dart';
import '../integration/etke_integration_dashboard.dart';
import '../integration/element_integration_dashboard.dart';
import '../integration/matrix_clients_dashboard.dart';
import '../auth/auth_dashboard.dart';

/// Main dashboard page for REChain.
///
/// Displays portfolio, analytics, blockchain, AI, and integration widgets.
///
/// Example usage:
/// ```dart
/// DashboardPage(walletAddress: '0x...')
/// ```
class DashboardPage extends StatefulWidget {
  /// The user's wallet address for dashboard context.
  final String walletAddress;

  /// Create a new dashboard page for the given wallet address.
  const DashboardPage({
    Key? key,
    required this.walletAddress,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

/// State for [DashboardPage].
class _DashboardPageState extends State<DashboardPage>
    with TickerProviderStateMixin {
  final FeatureIntegrationService _featureService = FeatureIntegrationService();
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  
  PortfolioOverview? _portfolioOverview;
  TransactionAnalytics? _transactionAnalytics;
  PerformanceMetrics? _performanceMetrics;
  RiskAnalysis? _riskAnalysis;
  DeFiPortfolio? _defiPortfolio;
  List<NFT>? _ownedNFTs;
  
  bool _isLoading = true;
  bool _isRefreshing = false;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _loadDashboardData();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _isLoading
          ? _buildLoadingView()
          : _buildDashboardView(),
    );
  }

  Widget _buildLoadingView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Loading Dashboard...'),
        ],
      ),
    );
  }

  Widget _buildDashboardView() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildPriceTicker(),
          _buildTabBar(),
          _buildTabContent(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Dashboard'),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.8),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: _showNotifications,
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: _showSettings,
        ),
      ],
    );
  }

  Widget _buildPriceTicker() {
    return SliverToBoxAdapter(
      child: PriceTicker(
        prices: _featureService.priceData,
        onPriceTap: _onPriceTap,
      ),
    );
  }

  Widget _buildTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _TabBarDelegate(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: TabBar(
            controller: TabController(
              length: 10,
              vsync: this,
              initialIndex: _selectedTabIndex,
            ),
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
            tabs: const [
              Tab(icon: Icon(Icons.dashboard), text: 'Overview'),
              Tab(icon: Icon(Icons.blockchain), text: 'Blockchain'),
              Tab(icon: Icon(Icons.security), text: 'Security'),
              Tab(icon: Icon(Icons.analytics), text: 'Analytics'),
              Tab(icon: Icon(Icons.integration), text: 'Integrations'),
              Tab(icon: Icon(Icons.psychology), text: 'AI Services'),
              Tab(icon: Icon(Icons.code), text: 'Etke.cc'),
              Tab(icon: Icon(Icons.chat), text: 'Element.io'),
              Tab(icon: Icon(Icons.forum), text: 'Matrix Clients'),
              Tab(icon: Icon(Icons.security), text: 'Authentication'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return SliverFillRemaining(
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: IndexedStack(
          index: _selectedTabIndex,
          children: [
            _buildOverviewTab(),
            _buildBlockchainTab(),
            _buildSecurityTab(),
            _buildAnalyticsTab(),
            _buildIntegrationsTab(),
            const AIServicesDashboard(),
            const EtkeIntegrationDashboard(),
            const ElementIntegrationDashboard(),
            MatrixClientsDashboard(
              integrationManager: _featureService.integrationManager,
            ),
            const AuthDashboard(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_portfolioOverview != null) ...[
            PortfolioCard(
              portfolio: _portfolioOverview!,
              onTap: _showPortfolioDetails,
            ),
            const SizedBox(height: 16),
            _buildQuickActions(),
            const SizedBox(height: 16),
            _buildRecentTransactions(),
          ] else ...[
            _buildErrorCard('Portfolio data not available'),
          ],
        ],
      ),
    );
  }

  Widget _buildBlockchainTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_defiPortfolio != null) ...[
            _buildDeFiOverview(),
            const SizedBox(height: 16),
            _buildDeFiPositions(),
            const SizedBox(height: 16),
            _buildYieldFarmingOpportunities(),
          ] else ...[
            _buildErrorCard('DeFi data not available'),
          ],
        ],
      ),
    );
  }

  Widget _buildSecurityTab() {
    // Implementation of _buildSecurityTab method
    return const SizedBox.shrink(); // Placeholder return, actual implementation needed
  }

  Widget _buildAnalyticsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_performanceMetrics != null) ...[
            _buildPerformanceMetrics(),
            const SizedBox(height: 16),
            _buildRiskAnalysis(),
            const SizedBox(height: 16),
            _buildTransactionAnalytics(),
          ] else ...[
            _buildErrorCard('Analytics data not available'),
          ],
        ],
      ),
    );
  }

  Widget _buildIntegrationsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'External Integrations',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildIntegrationCards(),
        ],
      ),
    );
  }

  Widget _buildIntegrationCards() {
    final integrations = [
      {
        'title': 'Monitoring & Analytics',
        'description': 'Grafana, Prometheus, and system monitoring',
        'icon': Icons.monitor,
        'color': Colors.blue,
        'services': ['Grafana', 'Prometheus'],
      },
      {
        'title': 'AI Development',
        'description': 'Gigachat and Gigacode for AI-powered development',
        'icon': Icons.psychology,
        'color': Colors.purple,
        'services': ['Gigachat', 'Gigacode'],
      },
      {
        'title': 'Code Quality',
        'description': 'Sourcecraft for code quality and development analytics',
        'icon': Icons.assessment,
        'color': Colors.orange,
        'services': ['Sourcecraft'],
      },
      {
        'title': 'Version Control',
        'description': 'GitHub integration for repository management',
        'icon': Icons.code,
        'color': Colors.green,
        'services': ['GitHub'],
      },
      {
        'title': 'Etke.cc Services',
        'description': 'Matrix ecosystem, Rust AI, and Go development tools',
        'icon': Icons.integration_instructions,
        'color': Colors.indigo,
        'services': ['Matrix', 'Rust', 'Go'],
      },
      {
        'title': 'Element.io Services',
        'description': 'Matrix client, calling, and bridge services',
        'icon': Icons.chat,
        'color': Colors.teal,
        'services': ['Matrix Client', 'Call', 'Bridge'],
      },
      {
        'title': 'Matrix Clients',
        'description': 'FluffyChat, Krille-chan, and Element.io clients',
        'icon': Icons.forum,
        'color': Colors.deepPurple,
        'services': ['FluffyChat', 'Krille-chan', 'Element.io'],
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: integrations.length,
      itemBuilder: (context, index) {
        final integration = integrations[index];
        return Card(
          elevation: 4,
          child: InkWell(
            onTap: () => _navigateToIntegrationDashboard(),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        integration['icon'] as IconData,
                        color: integration['color'] as Color,
                        size: 32,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[600],
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    integration['title'] as String,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    integration['description'] as String,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 4,
                    children: (integration['services'] as List<String>).map((service) {
                      return Chip(
                        label: Text(
                          service,
                          style: const TextStyle(fontSize: 10),
                        ),
                        backgroundColor: (integration['color'] as Color).withOpacity(0.1),
                        labelStyle: TextStyle(
                          color: integration['color'] as Color,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickActions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    'Send',
                    Icons.send,
                    Colors.blue,
                    _showSendDialog,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    'Receive',
                    Icons.qr_code,
                    Colors.green,
                    _showReceiveDialog,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    'Swap',
                    Icons.swap_horiz,
                    Colors.orange,
                    _showSwapDialog,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: _showAllTransactions,
                  child: const Text('View All'),
                ),
              ],
            ),
            if (_transactionAnalytics != null &&
                _transactionAnalytics!.transactionHistory.isNotEmpty) ...[
              ..._transactionAnalytics!.transactionHistory
                  .take(5)
                  .map((tx) => TransactionCard(
                        transaction: tx,
                        onTap: () => _showTransactionDetails(tx),
                      )),
            ] else ...[
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text('No recent transactions'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDeFiOverview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DeFi Portfolio',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildDeFiMetric(
                    'Total Value',
                    '\$${_defiPortfolio!.totalValue.toStringAsFixed(2)}',
                    Colors.blue,
                  ),
                ),
                Expanded(
                  child: _buildDeFiMetric(
                    'Total APY',
                    '${_defiPortfolio!.totalApy.toStringAsFixed(2)}%',
                    Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeFiMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
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
    );
  }

  Widget _buildDeFiPositions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Active Positions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ..._defiPortfolio!.positions.map((position) => _buildDeFiPosition(position)),
          ],
        ),
      ),
    );
  }

  Widget _buildDeFiPosition(DeFiPosition position) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position.pair,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${position.apy.toStringAsFixed(2)}% APY',
                  style: TextStyle(color: Colors.green[600]),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${position.value.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${position.rewards.toStringAsFixed(2)} rewards',
                style: TextStyle(color: Colors.orange[600], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildYieldFarmingOpportunities() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yield Farming Opportunities',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            // Mock opportunities
            _buildYieldOpportunity('Uniswap ETH/USDC', 15.5, 'UNI'),
            _buildYieldOpportunity('Aave USDC', 8.2, 'AAVE'),
            _buildYieldOpportunity('Curve 3Pool', 12.1, 'CRV'),
          ],
        ),
      ),
    );
  }

  Widget _buildYieldOpportunity(String pair, double apy, String reward) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pair,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '$apy% APY',
                  style: TextStyle(color: Colors.green[600]),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rewards: $reward',
                style: const TextStyle(fontSize: 12),
              ),
              ElevatedButton(
                onPressed: () => _startYieldFarming(pair),
                child: const Text('Start'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetrics() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance Metrics',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Total Return',
                    '${_performanceMetrics!.totalReturn.toStringAsFixed(2)}%',
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    'Sharpe Ratio',
                    _performanceMetrics!.sharpeRatio.toStringAsFixed(2),
                    Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(
                    'Max Drawdown',
                    '${_performanceMetrics!.maxDrawdown.toStringAsFixed(2)}%',
                    Colors.red,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(
                    'Win Rate',
                    '${(_performanceMetrics!.winRate * 100).toStringAsFixed(1)}%',
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String label, String value, Color color) {
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

  Widget _buildRiskAnalysis() {
    if (_riskAnalysis == null) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Risk Analysis',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Overall Risk Score: ${(_riskAnalysis!.overallRiskScore * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                color: _getRiskColor(_riskAnalysis!.overallRiskScore),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ..._riskAnalysis!.riskFactors.map((factor) => _buildRiskFactor(factor)),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskFactor(RiskFactor factor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _getRiskSeverityColor(factor.severity).withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(
            _getRiskSeverityIcon(factor.severity),
            color: _getRiskSeverityColor(factor.severity),
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  factor.description,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  factor.recommendation,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionAnalytics() {
    if (_transactionAnalytics == null) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transaction Analytics',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildAnalyticsMetric(
                    'Total Transactions',
                    _transactionAnalytics!.totalTransactions.toString(),
                  ),
                ),
                Expanded(
                  child: _buildAnalyticsMetric(
                    'Total Volume',
                    '\$${_transactionAnalytics!.totalVolume.toStringAsFixed(2)}',
                  ),
                ),
                Expanded(
                  child: _buildAnalyticsMetric(
                    'Avg Size',
                    '\$${_transactionAnalytics!.averageTransactionSize.toStringAsFixed(2)}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsMetric(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorCard(String message) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.grey[400],
              size: 48,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  /// Loads dashboard data (portfolio, analytics, etc.).
  void _loadDashboardData() {
    try {
      setState(() {
        _isLoading = true;
      });

      // Load all data in parallel
      final results = Future.wait([
        _featureService.getPortfolioOverview(widget.walletAddress),
        _featureService.getTransactionAnalytics(
          walletAddress: widget.walletAddress,
          period: const Duration(days: 30),
        ),
        _featureService.getPerformanceMetrics(
          walletAddress: widget.walletAddress,
          period: const Duration(days: 30),
        ),
        _featureService.getRiskAnalysis(widget.walletAddress),
        _featureService.getDeFiPortfolio(
          walletAddress: widget.walletAddress,
          network: BlockchainNetwork.ethereum,
        ),
        _featureService.getOwnedNFTs(
          walletAddress: widget.walletAddress,
          network: BlockchainNetwork.ethereum,
        ),
      ]);

      setState(() {
        _portfolioOverview = results[0] as PortfolioOverview?;
        _transactionAnalytics = results[1] as TransactionAnalytics?;
        _performanceMetrics = results[2] as PerformanceMetrics?;
        _riskAnalysis = results[3] as RiskAnalysis?;
        _defiPortfolio = results[4] as DeFiPortfolio?;
        _ownedNFTs = results[5] as List<NFT>?;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load dashboard data: $e')),
      );
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
    });

    await _loadDashboardData();

    setState(() {
      _isRefreshing = false;
    });
  }

  Color _getRiskColor(double riskScore) {
    if (riskScore < 0.3) return Colors.green;
    if (riskScore < 0.6) return Colors.orange;
    return Colors.red;
  }

  Color _getRiskSeverityColor(RiskSeverity severity) {
    switch (severity) {
      case RiskSeverity.low:
        return Colors.green;
      case RiskSeverity.medium:
        return Colors.orange;
      case RiskSeverity.high:
        return Colors.red;
      case RiskSeverity.critical:
        return Colors.red[900]!;
    }
  }

  IconData _getRiskSeverityIcon(RiskSeverity severity) {
    switch (severity) {
      case RiskSeverity.low:
        return Icons.info;
      case RiskSeverity.medium:
        return Icons.warning;
      case RiskSeverity.high:
        return Icons.error;
      case RiskSeverity.critical:
        return Icons.priority_high;
    }
  }

  // Action methods
  void _onPriceTap() {
    // TODO: Navigate to price chart
  }

  void _showNotifications() {
    // TODO: Show notifications panel
  }

  void _showSettings() {
    // TODO: Navigate to settings
  }

  void _showPortfolioDetails() {
    // TODO: Navigate to detailed portfolio view
  }

  void _showSendDialog() {
    // TODO: Show send dialog
  }

  void _showReceiveDialog() {
    // TODO: Show receive dialog
  }

  void _showSwapDialog() {
    // TODO: Show swap dialog
  }

  void _showAllTransactions() {
    // TODO: Navigate to transactions list
  }

  void _showTransactionDetails(BlockchainTransaction transaction) {
    // TODO: Navigate to transaction details
  }

  void _startYieldFarming(String pair) {
    // TODO: Start yield farming
  }

  void _navigateToIntegrationDashboard() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const IntegrationDashboard(),
      ),
    );
  }
}

/// Tab Bar Delegate
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _TabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
} 