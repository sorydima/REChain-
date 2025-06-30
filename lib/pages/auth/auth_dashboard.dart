import 'package:flutter/material.dart';
import 'dart:convert';
import '../../features/auth/ton_auth_service.dart';
import '../../features/auth/telegram_auth_service.dart';
import '../../features/auth/bitget_auth_service.dart';
import '../../features/auth/web3_auth_service.dart';

class AuthDashboard extends StatefulWidget {
  const AuthDashboard({super.key});

  @override
  State<AuthDashboard> createState() => _AuthDashboardState();
}

class _AuthDashboardState extends State<AuthDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  
  // Auth services
  late TONAuthService _tonAuthService;
  late TelegramAuthService _telegramAuthService;
  late BitgetAuthService _bitgetAuthService;
  late Web3AuthService _web3AuthService;
  
  // Service states
  Map<String, bool> _tonServiceStatus = {};
  Map<String, bool> _telegramServiceStatus = {};
  Map<String, bool> _bitgetServiceStatus = {};
  Map<String, bool> _web3ServiceStatus = {};
  
  // UI states
  bool _isLoading = false;
  String? _lastError;
  List<String> _logs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _initializeServices();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tonAuthService.dispose();
    _telegramAuthService.dispose();
    _bitgetAuthService.dispose();
    _web3AuthService.dispose();
    super.dispose();
  }

  Future<void> _initializeServices() async {
    setState(() {
      _isLoading = true;
      _lastError = null;
    });

    try {
      _addLog('Initializing authentication services...');

      // Initialize TON Auth Service
      _tonAuthService = TONAuthService(
        apiKey: 'your_ton_api_key',
        baseUrl: 'https://api.ton-auth.org',
      );
      await _tonAuthService.initialize();
      _tonServiceStatus = _tonAuthService.serviceStatus;
      _addLog('TON Auth Service initialized');

      // Initialize Telegram Auth Service
      _telegramAuthService = TelegramAuthService(
        apiKey: 'your_telegram_api_key',
        botToken: 'your_bot_token',
        baseUrl: 'https://api.telegram-auth.org',
      );
      await _telegramAuthService.initialize();
      _telegramServiceStatus = _telegramAuthService.serviceStatus;
      _addLog('Telegram Auth Service initialized');

      // Initialize Bitget Auth Service
      _bitgetAuthService = BitgetAuthService(
        apiKey: 'your_bitget_api_key',
        secretKey: 'your_bitget_secret_key',
        passphrase: 'your_bitget_passphrase',
        baseUrl: 'https://api.bitget.com',
      );
      await _bitgetAuthService.initialize();
      _bitgetServiceStatus = _bitgetAuthService.serviceStatus;
      _addLog('Bitget Auth Service initialized');

      // Initialize Web3 Auth Service
      _web3AuthService = Web3AuthService(
        apiKey: 'your_web3_api_key',
        baseUrl: 'https://api.web3auth.org',
      );
      await _web3AuthService.initialize();
      _web3ServiceStatus = _web3AuthService.serviceStatus;
      _addLog('Web3 Auth Service initialized');

      setState(() {
        _isLoading = false;
      });

      _addLog('All authentication services initialized successfully');
    } catch (e) {
      setState(() {
        _isLoading = false;
        _lastError = e.toString();
      });
      _addLog('Error initializing services: $e');
    }
  }

  void _addLog(String message) {
    setState(() {
      _logs.add('${DateTime.now().toString().substring(11, 19)}: $message');
      if (_logs.length > 100) {
        _logs.removeAt(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Authentication Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(
              icon: Icon(Icons.account_balance_wallet),
              text: 'TON',
            ),
            Tab(
              icon: Icon(Icons.telegram),
              text: 'Telegram',
            ),
            Tab(
              icon: Icon(Icons.currency_bitcoin),
              text: 'Bitget',
            ),
            Tab(
              icon: Icon(Icons.web),
              text: 'Web3',
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _initializeServices,
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: _showInfoDialog,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Initializing authentication services...'),
                ],
              ),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                _buildTONTab(),
                _buildTelegramTab(),
                _buildBitgetTab(),
                _buildWeb3Tab(),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showLogsDialog,
        backgroundColor: Colors.blue[700],
        child: const Icon(Icons.list, color: Colors.white),
      ),
    );
  }

  Widget _buildTONTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceHeader(
            'TON Authentication',
            'The Open Network blockchain authentication',
            Icons.account_balance_wallet,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildServiceStatus(_tonServiceStatus),
          const SizedBox(height: 16),
          _buildTONActions(),
          const SizedBox(height: 16),
          _buildTONInfo(),
        ],
      ),
    );
  }

  Widget _buildTelegramTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceHeader(
            'Telegram Authentication',
            'Telegram login and bot integration',
            Icons.telegram,
            Colors.blue,
          ),
          const SizedBox(height: 16),
          _buildServiceStatus(_telegramServiceStatus),
          const SizedBox(height: 16),
          _buildTelegramActions(),
          const SizedBox(height: 16),
          _buildTelegramInfo(),
        ],
      ),
    );
  }

  Widget _buildBitgetTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceHeader(
            'Bitget Authentication',
            'Cryptocurrency exchange integration',
            Icons.currency_bitcoin,
            Colors.orange,
          ),
          const SizedBox(height: 16),
          _buildServiceStatus(_bitgetServiceStatus),
          const SizedBox(height: 16),
          _buildBitgetActions(),
          const SizedBox(height: 16),
          _buildBitgetInfo(),
        ],
      ),
    );
  }

  Widget _buildWeb3Tab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServiceHeader(
            'Web3 Authentication',
            'Unified blockchain authentication',
            Icons.web,
            Colors.purple,
          ),
          const SizedBox(height: 16),
          _buildServiceStatus(_web3ServiceStatus),
          const SizedBox(height: 16),
          _buildWeb3Actions(),
          const SizedBox(height: 16),
          _buildWeb3Info(),
        ],
      ),
    );
  }

  Widget _buildServiceHeader(String title, String subtitle, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceStatus(Map<String, bool> status) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Service Status',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...status.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Icon(
                    entry.value ? Icons.check_circle : Icons.error,
                    color: entry.value ? Colors.green : Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      entry.key.replaceAll('_', ' ').toUpperCase(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: entry.value ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      entry.value ? 'ACTIVE' : 'INACTIVE',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildTONActions() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TON Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildActionButton(
                  'Connect Wallet',
                  Icons.link,
                  Colors.blue,
                  () => _connectTONWallet(),
                ),
                _buildActionButton(
                  'Get Balance',
                  Icons.account_balance,
                  Colors.green,
                  () => _getTONBalance(),
                ),
                _buildActionButton(
                  'Sign Transaction',
                  Icons.edit,
                  Colors.orange,
                  () => _signTONTransaction(),
                ),
                _buildActionButton(
                  'Deploy Contract',
                  Icons.build,
                  Colors.purple,
                  () => _deployTONContract(),
                ),
                _buildActionButton(
                  'Get NFTs',
                  Icons.image,
                  Colors.pink,
                  () => _getTONNFTs(),
                ),
                _buildActionButton(
                  'Stake Tokens',
                  Icons.trending_up,
                  Colors.teal,
                  () => _stakeTONTokens(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTelegramActions() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Telegram Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildActionButton(
                  'Login',
                  Icons.login,
                  Colors.blue,
                  () => _loginTelegram(),
                ),
                _buildActionButton(
                  'Send Message',
                  Icons.send,
                  Colors.green,
                  () => _sendTelegramMessage(),
                ),
                _buildActionButton(
                  'Get Chats',
                  Icons.chat,
                  Colors.orange,
                  () => _getTelegramChats(),
                ),
                _buildActionButton(
                  'Create Channel',
                  Icons.broadcast_on_personal,
                  Colors.purple,
                  () => _createTelegramChannel(),
                ),
                _buildActionButton(
                  'Get Bot Info',
                  Icons.smart_toy,
                  Colors.pink,
                  () => _getTelegramBotInfo(),
                ),
                _buildActionButton(
                  'Set Webhook',
                  Icons.webhook,
                  Colors.teal,
                  () => _setTelegramWebhook(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBitgetActions() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bitget Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildActionButton(
                  'Get Account Info',
                  Icons.account_circle,
                  Colors.blue,
                  () => _getBitgetAccountInfo(),
                ),
                _buildActionButton(
                  'Get Balances',
                  Icons.account_balance_wallet,
                  Colors.green,
                  () => _getBitgetBalances(),
                ),
                _buildActionButton(
                  'Place Order',
                  Icons.shopping_cart,
                  Colors.orange,
                  () => _placeBitgetOrder(),
                ),
                _buildActionButton(
                  'Get Market Data',
                  Icons.trending_up,
                  Colors.purple,
                  () => _getBitgetMarketData(),
                ),
                _buildActionButton(
                  'Get Trading History',
                  Icons.history,
                  Colors.pink,
                  () => _getBitgetHistory(),
                ),
                _buildActionButton(
                  'Stake Tokens',
                  Icons.trending_up,
                  Colors.teal,
                  () => _stakeBitgetTokens(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeb3Actions() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Web3 Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildActionButton(
                  'Register User',
                  Icons.person_add,
                  Colors.blue,
                  () => _registerWeb3User(),
                ),
                _buildActionButton(
                  'Login User',
                  Icons.login,
                  Colors.green,
                  () => _loginWeb3User(),
                ),
                _buildActionButton(
                  'Connect Wallet',
                  Icons.link,
                  Colors.orange,
                  () => _connectWeb3Wallet(),
                ),
                _buildActionButton(
                  'Upload to IPFS',
                  Icons.cloud_upload,
                  Colors.purple,
                  () => _uploadToIPFS(),
                ),
                _buildActionButton(
                  'Store on Filecoin',
                  Icons.storage,
                  Colors.pink,
                  () => _storeOnFilecoin(),
                ),
                _buildActionButton(
                  'Get Profile',
                  Icons.person,
                  Colors.teal,
                  () => _getWeb3Profile(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildTONInfo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TON Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Connected Wallet', _tonAuthService.connectedWalletAddress ?? 'Not connected'),
            _buildInfoRow('Wallet Info', _tonAuthService.walletInfo != null ? 'Available' : 'Not available'),
            _buildInfoRow('Balance', _tonAuthService.balance != null ? 'Available' : 'Not available'),
          ],
        ),
      ),
    );
  }

  Widget _buildTelegramInfo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Telegram Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('User Info', _telegramAuthService.userInfo != null ? 'Logged in' : 'Not logged in'),
            _buildInfoRow('Bot Info', _telegramAuthService.botInfo != null ? 'Available' : 'Not available'),
            _buildInfoRow('Chats', '${_telegramAuthService.chats.length} chats'),
            _buildInfoRow('Messages', '${_telegramAuthService.messages.length} messages'),
          ],
        ),
      ),
    );
  }

  Widget _buildBitgetInfo() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bitget Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Account Info', _bitgetAuthService.accountInfo != null ? 'Available' : 'Not available'),
            _buildInfoRow('Balances', '${_bitgetAuthService.balances.length} assets'),
            _buildInfoRow('Orders', '${_bitgetAuthService.orders.length} orders'),
            _buildInfoRow('Trades', '${_bitgetAuthService.trades.length} trades'),
          ],
        ),
      ),
    );
  }

  Widget _buildWeb3Info() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Web3 Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Current User', _web3AuthService.currentUser != null ? 'Logged in' : 'Not logged in'),
            _buildInfoRow('Wallet Info', _web3AuthService.walletInfo != null ? 'Connected' : 'Not connected'),
            _buildInfoRow('Connected Networks', '${_web3AuthService.connectedNetworks.length} networks'),
            _buildInfoRow('Session Info', _web3AuthService.sessionInfo != null ? 'Active' : 'Inactive'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // TON Actions
  Future<void> _connectTONWallet() async {
    try {
      _addLog('Connecting TON wallet...');
      final result = await _tonAuthService.connectWallet(
        walletType: 'tonkeeper',
        connectionParams: {'network': 'mainnet'},
      );
      _addLog('TON wallet connected: ${result['wallet_address']}');
      setState(() {});
    } catch (e) {
      _addLog('Error connecting TON wallet: $e');
    }
  }

  Future<void> _getTONBalance() async {
    try {
      _addLog('Getting TON balance...');
      final result = await _tonAuthService.getWalletBalance();
      _addLog('TON balance retrieved: ${result['balance']}');
      setState(() {});
    } catch (e) {
      _addLog('Error getting TON balance: $e');
    }
  }

  Future<void> _signTONTransaction() async {
    try {
      _addLog('Signing TON transaction...');
      final result = await _tonAuthService.signTransaction(
        transaction: {
          'to': 'EQD...',
          'amount': '1000000000',
          'data': '',
        },
      );
      _addLog('TON transaction signed: ${result['tx_hash']}');
    } catch (e) {
      _addLog('Error signing TON transaction: $e');
    }
  }

  Future<void> _deployTONContract() async {
    try {
      _addLog('Deploying TON smart contract...');
      final result = await _tonAuthService.deploySmartContract(
        contractCode: 'contract code here',
        constructorParams: {'param1': 'value1'},
      );
      _addLog('TON contract deployed: ${result['contract_address']}');
    } catch (e) {
      _addLog('Error deploying TON contract: $e');
    }
  }

  Future<void> _getTONNFTs() async {
    try {
      _addLog('Getting TON NFTs...');
      final result = await _tonAuthService.getNFTCollection();
      _addLog('TON NFTs retrieved: ${result.length} items');
      setState(() {});
    } catch (e) {
      _addLog('Error getting TON NFTs: $e');
    }
  }

  Future<void> _stakeTONTokens() async {
    try {
      _addLog('Staking TON tokens...');
      final result = await _tonAuthService.stakeTokens(
        amount: '1000000000',
        validator: 'validator_address',
      );
      _addLog('TON tokens staked: ${result['stake_id']}');
    } catch (e) {
      _addLog('Error staking TON tokens: $e');
    }
  }

  // Telegram Actions
  Future<void> _loginTelegram() async {
    try {
      _addLog('Logging in with Telegram...');
      final result = await _telegramAuthService.loginWithTelegram(
        authData: {
          'id': 123456789,
          'first_name': 'Test User',
          'username': 'testuser',
        },
      );
      _addLog('Telegram login successful: ${result['user_info']['username']}');
      setState(() {});
    } catch (e) {
      _addLog('Error logging in with Telegram: $e');
    }
  }

  Future<void> _sendTelegramMessage() async {
    try {
      _addLog('Sending Telegram message...');
      final result = await _telegramAuthService.sendMessage(
        chatId: '123456789',
        text: 'Hello from REChain!',
      );
      _addLog('Telegram message sent: ${result['message_id']}');
    } catch (e) {
      _addLog('Error sending Telegram message: $e');
    }
  }

  Future<void> _getTelegramChats() async {
    try {
      _addLog('Getting Telegram chats...');
      final result = await _telegramAuthService.getUserChats();
      _addLog('Telegram chats retrieved: ${result.length} chats');
      setState(() {});
    } catch (e) {
      _addLog('Error getting Telegram chats: $e');
    }
  }

  Future<void> _createTelegramChannel() async {
    try {
      _addLog('Creating Telegram channel...');
      final result = await _telegramAuthService.createChannel(
        title: 'REChain Channel',
        description: 'Official REChain channel',
      );
      _addLog('Telegram channel created: ${result['channel_id']}');
    } catch (e) {
      _addLog('Error creating Telegram channel: $e');
    }
  }

  Future<void> _getTelegramBotInfo() async {
    try {
      _addLog('Getting Telegram bot info...');
      final result = await _telegramAuthService.getBotInfo();
      _addLog('Telegram bot info retrieved: ${result['username']}');
      setState(() {});
    } catch (e) {
      _addLog('Error getting Telegram bot info: $e');
    }
  }

  Future<void> _setTelegramWebhook() async {
    try {
      _addLog('Setting Telegram webhook...');
      final result = await _telegramAuthService.setWebhook(
        url: 'https://your-domain.com/webhook',
      );
      _addLog('Telegram webhook set: ${result['ok']}');
    } catch (e) {
      _addLog('Error setting Telegram webhook: $e');
    }
  }

  // Bitget Actions
  Future<void> _getBitgetAccountInfo() async {
    try {
      _addLog('Getting Bitget account info...');
      final result = await _bitgetAuthService.getAccountInfo();
      _addLog('Bitget account info retrieved: ${result['data']['userId']}');
      setState(() {});
    } catch (e) {
      _addLog('Error getting Bitget account info: $e');
    }
  }

  Future<void> _getBitgetBalances() async {
    try {
      _addLog('Getting Bitget balances...');
      final result = await _bitgetAuthService.getAccountBalances();
      _addLog('Bitget balances retrieved: ${result.length} assets');
      setState(() {});
    } catch (e) {
      _addLog('Error getting Bitget balances: $e');
    }
  }

  Future<void> _placeBitgetOrder() async {
    try {
      _addLog('Placing Bitget order...');
      final result = await _bitgetAuthService.placeSpotOrder(
        symbol: 'BTCUSDT',
        side: 'buy',
        orderType: 'limit',
        quantity: '0.001',
        price: '50000',
      );
      _addLog('Bitget order placed: ${result['data']['orderId']}');
    } catch (e) {
      _addLog('Error placing Bitget order: $e');
    }
  }

  Future<void> _getBitgetMarketData() async {
    try {
      _addLog('Getting Bitget market data...');
      final result = await _bitgetAuthService.getMarketTickers();
      _addLog('Bitget market data retrieved: ${result.length} tickers');
    } catch (e) {
      _addLog('Error getting Bitget market data: $e');
    }
  }

  Future<void> _getBitgetHistory() async {
    try {
      _addLog('Getting Bitget trading history...');
      final result = await _bitgetAuthService.getTradingHistory();
      _addLog('Bitget trading history retrieved: ${result.length} trades');
      setState(() {});
    } catch (e) {
      _addLog('Error getting Bitget trading history: $e');
    }
  }

  Future<void> _stakeBitgetTokens() async {
    try {
      _addLog('Staking Bitget tokens...');
      final result = await _bitgetAuthService.stakeTokens(
        productId: 'product_id',
        amount: '100',
      );
      _addLog('Bitget tokens staked: ${result['data']['orderId']}');
    } catch (e) {
      _addLog('Error staking Bitget tokens: $e');
    }
  }

  // Web3 Actions
  Future<void> _registerWeb3User() async {
    try {
      _addLog('Registering Web3 user...');
      final result = await _web3AuthService.registerUser(
        username: 'testuser',
        email: 'test@example.com',
        password: 'password123',
      );
      _addLog('Web3 user registered: ${result['user']['username']}');
      setState(() {});
    } catch (e) {
      _addLog('Error registering Web3 user: $e');
    }
  }

  Future<void> _loginWeb3User() async {
    try {
      _addLog('Logging in Web3 user...');
      final result = await _web3AuthService.loginUser(
        email: 'test@example.com',
        password: 'password123',
      );
      _addLog('Web3 user logged in: ${result['user']['username']}');
      setState(() {});
    } catch (e) {
      _addLog('Error logging in Web3 user: $e');
    }
  }

  Future<void> _connectWeb3Wallet() async {
    try {
      _addLog('Connecting Web3 wallet...');
      final result = await _web3AuthService.connectWallet(
        network: 'ethereum',
        walletType: 'metamask',
      );
      _addLog('Web3 wallet connected: ${result['wallet_info']['address']}');
      setState(() {});
    } catch (e) {
      _addLog('Error connecting Web3 wallet: $e');
    }
  }

  Future<void> _uploadToIPFS() async {
    try {
      _addLog('Uploading to IPFS...');
      final result = await _web3AuthService.uploadToIPFS(
        fileData: utf8.encode('Hello IPFS!'),
        fileName: 'test.txt',
      );
      _addLog('File uploaded to IPFS: ${result['ipfs_hash']}');
    } catch (e) {
      _addLog('Error uploading to IPFS: $e');
    }
  }

  Future<void> _storeOnFilecoin() async {
    try {
      _addLog('Storing on Filecoin...');
      final result = await _web3AuthService.storeOnFilecoin(
        data: utf8.encode('Hello Filecoin!'),
      );
      _addLog('Data stored on Filecoin: ${result['deal_id']}');
    } catch (e) {
      _addLog('Error storing on Filecoin: $e');
    }
  }

  Future<void> _getWeb3Profile() async {
    try {
      _addLog('Getting Web3 profile...');
      final result = await _web3AuthService.getUserProfile();
      _addLog('Web3 profile retrieved: ${result['user']['username']}');
      setState(() {});
    } catch (e) {
      _addLog('Error getting Web3 profile: $e');
    }
  }

  void _showLogsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Service Logs'),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: ListView.builder(
            itemCount: _logs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  _logs[index],
                  style: const TextStyle(fontSize: 12),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _logs.clear();
              });
              Navigator.of(context).pop();
            },
            child: const Text('Clear'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Authentication Dashboard'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This dashboard provides comprehensive authentication services for:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• TON (The Open Network) - Blockchain authentication'),
            Text('• Telegram - Social media authentication'),
            Text('• Bitget - Cryptocurrency exchange integration'),
            Text('• Web3 - Unified blockchain authentication'),
            SizedBox(height: 16),
            Text(
              'Features:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('• Wallet connection and management'),
            Text('• Transaction signing and sending'),
            Text('• Smart contract deployment'),
            Text('• NFT and DeFi integration'),
            Text('• Real-time service monitoring'),
            Text('• Comprehensive logging system'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
} 