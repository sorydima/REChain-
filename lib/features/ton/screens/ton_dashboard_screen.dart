import 'package:flutter/material.dart';

import '../core/ton_config.dart';
import '../wallet/ton_wallet_service.dart';
import '../nft/ton_nft_service.dart';
import '../hyip/ton_investment_service.dart';

class TonDashboardScreen extends StatefulWidget {
  const TonDashboardScreen({Key? key}) : super(key: key);

  @override
  State<TonDashboardScreen> createState() => _TonDashboardScreenState();
}

class _TonDashboardScreenState extends State<TonDashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _walletService = TonWalletService.instance;
  final _nftService = TonNftService.instance;
  final _investmentService = TonInvestmentService.instance;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeServices();
  }
  
  Future<void> _initializeServices() async {
    try {
      await _walletService.initialize();
      await _nftService.initialize();
      await _investmentService.initialize();
    } catch (e) {
      // Handle initialization errors
      debugPrint('Failed to initialize services: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TON Dashboard'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Wallet'),
            Tab(text: 'NFTs'),
            Tab(text: 'Investments'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildWalletTab(),
          _buildNftTab(),
          _buildInvestmentTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showActionMenu(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildWalletTab() {
    return StreamBuilder<TonWallet?>(
      stream: _walletService.activeWalletStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final wallet = snapshot.data;
        if (wallet == null) {
          return Center(
            child: ElevatedButton(
              onPressed: () => _createWallet(context),
              child: const Text('Create Wallet'),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => _walletService.updateBalance(wallet.id),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _WalletCard(wallet: wallet),
              const SizedBox(height: 16),
              _TransactionsList(walletAddress: wallet.address),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNftTab() {
    return StreamBuilder<TonWallet?>(
      stream: _walletService.activeWalletStream,
      builder: (context, snapshot) {
        final wallet = snapshot.data;
        if (wallet == null) {
          return const Center(
            child: Text('Please create a wallet first'),
          );
        }

        return StreamBuilder<List<TonNftItem>>(
          stream: _nftService.nftsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final nfts = snapshot.data ?? [];
            if (nfts.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No NFTs found'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _browseNftMarketplace(context),
                      child: const Text('Browse Marketplace'),
                    ),
                  ],
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: nfts.length,
              itemBuilder: (context, index) => _NftCard(nft: nfts[index]),
            );
          },
        );
      },
    );
  }

  Widget _buildInvestmentTab() {
    return StreamBuilder<TonWallet?>(
      stream: _walletService.activeWalletStream,
      builder: (context, snapshot) {
        final wallet = snapshot.data;
        if (wallet == null) {
          return const Center(
            child: Text('Please create a wallet first'),
          );
        }

        return FutureBuilder<List<TonInvestmentPool>>(
          future: _investmentService.getAvailablePools(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final pools = snapshot.data ?? [];
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _InvestmentStats(walletAddress: wallet.address),
                const SizedBox(height: 16),
                const Text(
                  'Investment Opportunities',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...pools.map((pool) => _InvestmentPoolCard(
                  pool: pool,
                  onInvest: () => _showInvestmentDialog(context, pool),
                )),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _createWallet(BuildContext context) async {
    try {
      final name = await _showWalletNameDialog(context);
      if (name != null) {
        await _walletService.createWallet(name: name);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create wallet: $e')),
      );
    }
  }

  Future<String?> _showWalletNameDialog(BuildContext context) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Wallet'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Wallet Name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showActionMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text('Send TON'),
            onTap: () {
              Navigator.pop(context);
              _showSendDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Buy NFT'),
            onTap: () {
              Navigator.pop(context);
              _browseNftMarketplace(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.trending_up),
            title: const Text('Invest'),
            onTap: () {
              Navigator.pop(context);
              _showInvestmentOptions(context);
            },
          ),
        ],
      ),
    );
  }

  void _showSendDialog(BuildContext context) {
    // Implement send TON dialog
  }

  void _browseNftMarketplace(BuildContext context) {
    // Implement NFT marketplace navigation
  }

  void _showInvestmentOptions(BuildContext context) {
    // Implement investment options dialog
  }

  void _showInvestmentDialog(BuildContext context, TonInvestmentPool pool) {
    // Implement investment dialog
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _WalletCard extends StatelessWidget {
  final TonWallet wallet;

  const _WalletCard({required this.wallet});

  @override
  Widget build(BuildContext context) {
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
                  wallet.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    // Copy address to clipboard
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              wallet.shortAddress,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Balance'),
                Text(
                  wallet.formattedBalance,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionsList extends StatelessWidget {
  final String walletAddress;

  const _TransactionsList({required this.walletAddress});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TonTransaction>>(
      future: TonWalletService.instance.getTransactionHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final transactions = snapshot.data ?? [];
        if (transactions.isEmpty) {
          return const Center(
            child: Text('No transactions yet'),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...transactions.map((tx) => _TransactionItem(transaction: tx)),
          ],
        );
      },
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final TonTransaction transaction;

  const _TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncoming = transaction.isIncoming;
    final amount = transaction.amount;
    final formattedAmount = '${isIncoming ? '+' : '-'}${amount.toStringAsFixed(2)} TON';

    return ListTile(
      leading: Icon(
        isIncoming ? Icons.arrow_downward : Icons.arrow_upward,
        color: isIncoming ? Colors.green : Colors.red,
      ),
      title: Text(
        isIncoming ? 'Received' : 'Sent',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(transaction.timestamp.toString()),
      trailing: Text(
        formattedAmount,
        style: TextStyle(
          color: isIncoming ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _NftCard extends StatelessWidget {
  final TonNftItem nft;

  const _NftCard({required this.nft});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              nft.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.broken_image),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nft.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (nft.isForSale) ...[
                  const SizedBox(height: 4),
                  Text(
                    nft.formattedPrice,
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InvestmentStats extends StatelessWidget {
  final String walletAddress;

  const _InvestmentStats({required this.walletAddress});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TonInvestmentStats>(
      future: TonInvestmentService.instance.getInvestmentStats(walletAddress),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final stats = snapshot.data ?? TonInvestmentStats.empty();
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Investment Overview',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _StatRow(
                  label: 'Total Invested',
                  value: '${stats.totalInvested.toStringAsFixed(2)} TON',
                ),
                const SizedBox(height: 8),
                _StatRow(
                  label: 'Total Returns',
                  value: '${stats.totalReturns.toStringAsFixed(2)} TON',
                ),
                const SizedBox(height: 8),
                _StatRow(
                  label: 'Active Investments',
                  value: stats.activeInvestments.toString(),
                ),
                const SizedBox(height: 8),
                _StatRow(
                  label: 'Average APR',
                  value: '${stats.averageApr.toStringAsFixed(1)}%',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;

  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _InvestmentPoolCard extends StatelessWidget {
  final TonInvestmentPool pool;
  final VoidCallback onInvest;

  const _InvestmentPoolCard({
    required this.pool,
    required this.onInvest,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pool.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getRiskLevelColor(pool.riskLevel),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    pool.riskLevelText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(pool.description),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PoolStat(
                  label: 'APR',
                  value: pool.formattedApr,
                ),
                _PoolStat(
                  label: 'Lock Period',
                  value: pool.lockPeriodText,
                ),
                _PoolStat(
                  label: 'TVL',
                  value: pool.formattedTvl,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onInvest,
                child: const Text('Invest Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRiskLevelColor(InvestmentRiskLevel level) {
    switch (level) {
      case InvestmentRiskLevel.low:
        return Colors.green;
      case InvestmentRiskLevel.medium:
        return Colors.orange;
      case InvestmentRiskLevel.high:
        return Colors.red;
      case InvestmentRiskLevel.extreme:
        return Colors.purple;
    }
  }
}

class _PoolStat extends StatelessWidget {
  final String label;
  final String value;

  const _PoolStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
