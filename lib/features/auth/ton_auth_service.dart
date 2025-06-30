import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';

/// TON Authentication Service
/// Provides TON blockchain authentication and wallet integration
class TONAuthService {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // TON services
  bool _walletConnectionEnabled = false;
  bool _transactionSigningEnabled = false;
  bool _smartContractEnabled = false;
  bool _nftSupportEnabled = false;
  bool _deFiIntegrationEnabled = false;
  bool _governanceEnabled = false;
  bool _analyticsEnabled = false;
  bool _stakingEnabled = false;

  // Wallet state
  String? _connectedWalletAddress;
  Map<String, dynamic>? _walletInfo;
  List<Map<String, dynamic>> _transactions = [];
  Map<String, dynamic>? _balance;

  // Stream controllers for real-time updates
  final StreamController<Map<String, dynamic>> _walletUpdateController = 
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _transactionController = 
      StreamController<Map<String, dynamic>>.broadcast();

  TONAuthService({
    required String apiKey,
    String baseUrl = 'https://api.ton-auth.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize TON authentication services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[TONAuthService] Initializing TON authentication services...');
      }

      // Test connection to TON Auth API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('TON Auth API is not available');
      }

      // Initialize individual services
      await _initializeWalletConnection();
      await _initializeTransactionSigning();
      await _initializeSmartContract();
      await _initializeNFTSupport();
      await _initializeDeFiIntegration();
      await _initializeGovernance();
      await _initializeAnalytics();
      await _initializeStaking();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[TONAuthService] TON authentication services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[TONAuthService] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to TON Auth API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Wallet Connection
  Future<void> _initializeWalletConnection() async {
    try {
      final response = await _makeRequest('POST', '/auth/wallet/initialize');
      if (response.statusCode == 200) {
        _walletConnectionEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TONAuthService] Wallet connection initialization failed: $e');
      }
    }
  }

  /// Initialize Transaction Signing
  Future<void> _initializeTransactionSigning() async {
    try {
      final response = await _makeRequest('POST', '/auth/transactions/initialize');
      if (response.statusCode == 200) {
        _transactionSigningEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TONAuthService] Transaction signing initialization failed: $e');
      }
    }
  }

  /// Initialize Smart Contract
  Future<void> _initializeSmartContract() async {
    try {
      final response = await _makeRequest('POST', '/auth/smart-contracts/initialize');
      if (response.statusCode == 200) {
        _smartContractEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TONAuthService] Smart contract initialization failed: $e');
      }
    }
  }

  /// Initialize NFT Support
  Future<void> _initializeNFTSupport() async {
    try {
      final response = await _makeRequest('POST', '/auth/nft/initialize');
      if (response.statusCode == 200) {
        _nftSupportEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TONAuthService] NFT support initialization failed: $e');
      }
    }
  }

  /// Initialize DeFi Integration
  Future<void> _initializeDeFiIntegration() async {
    try {
      final response = await _makeRequest('POST', '/auth/defi/initialize');
      if (response.statusCode == 200) {
        _deFiIntegrationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TONAuthService] DeFi integration initialization failed: $e');
      }
    }
  }

  /// Initialize Governance
  Future<void> _initializeGovernance() async {
    try {
      final response = await _makeRequest('POST', '/auth/governance/initialize');
      if (response.statusCode == 200) {
        _governanceEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TONAuthService] Governance initialization failed: $e');
      }
    }
  }

  /// Initialize Analytics
  Future<void> _initializeAnalytics() async {
    try {
      final response = await _makeRequest('POST', '/auth/analytics/initialize');
      if (response.statusCode == 200) {
        _analyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TONAuthService] Analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Staking
  Future<void> _initializeStaking() async {
    try {
      final response = await _makeRequest('POST', '/auth/staking/initialize');
      if (response.statusCode == 200) {
        _stakingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[TONAuthService] Staking initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'wallet_connection': _walletConnectionEnabled,
    'transaction_signing': _transactionSigningEnabled,
    'smart_contract': _smartContractEnabled,
    'nft_support': _nftSupportEnabled,
    'defi_integration': _deFiIntegrationEnabled,
    'governance': _governanceEnabled,
    'analytics': _analyticsEnabled,
    'staking': _stakingEnabled,
  };

  /// Get wallet update stream
  Stream<Map<String, dynamic>> get walletUpdateStream => _walletUpdateController.stream;

  /// Get transaction stream
  Stream<Map<String, dynamic>> get transactionStream => _transactionController.stream;

  /// Get connected wallet address
  String? get connectedWalletAddress => _connectedWalletAddress;

  /// Get wallet info
  Map<String, dynamic>? get walletInfo => _walletInfo;

  /// Get balance
  Map<String, dynamic>? get balance => _balance;

  /// Connect TON wallet
  Future<Map<String, dynamic>> connectWallet({
    required String walletType,
    Map<String, dynamic>? connectionParams,
  }) async {
    if (!_walletConnectionEnabled) {
      throw Exception('Wallet connection is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/wallet/connect',
        body: {
          'wallet_type': walletType,
          if (connectionParams != null) 'connection_params': connectionParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _connectedWalletAddress = data['wallet_address'];
        _walletInfo = data['wallet_info'];
        _walletUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to connect wallet: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Disconnect wallet
  Future<Map<String, dynamic>> disconnectWallet() async {
    if (!_walletConnectionEnabled) {
      throw Exception('Wallet connection is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/wallet/disconnect',
        body: {
          'wallet_address': _connectedWalletAddress,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _connectedWalletAddress = null;
        _walletInfo = null;
        _walletUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to disconnect wallet: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get wallet balance
  Future<Map<String, dynamic>> getWalletBalance({
    String? walletAddress,
  }) async {
    if (!_walletConnectionEnabled) {
      throw Exception('Wallet connection is not enabled');
    }

    try {
      final address = walletAddress ?? _connectedWalletAddress;
      if (address == null) {
        throw Exception('No wallet connected');
      }

      final response = await _makeRequest(
        'GET',
        '/auth/wallet/balance',
        queryParams: {
          'wallet_address': address,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _balance = data;
        return data;
      } else {
        throw Exception('Failed to get wallet balance: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Sign transaction
  Future<Map<String, dynamic>> signTransaction({
    required Map<String, dynamic> transaction,
    Map<String, dynamic>? signingParams,
  }) async {
    if (!_transactionSigningEnabled) {
      throw Exception('Transaction signing is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/transactions/sign',
        body: {
          'transaction': transaction,
          'wallet_address': _connectedWalletAddress,
          if (signingParams != null) 'signing_params': signingParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _transactions.add(data);
        _transactionController.add(data);
        return data;
      } else {
        throw Exception('Failed to sign transaction: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Send transaction
  Future<Map<String, dynamic>> sendTransaction({
    required Map<String, dynamic> signedTransaction,
  }) async {
    if (!_transactionSigningEnabled) {
      throw Exception('Transaction signing is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/transactions/send',
        body: {
          'signed_transaction': signedTransaction,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _transactionController.add(data);
        return data;
      } else {
        throw Exception('Failed to send transaction: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Deploy smart contract
  Future<Map<String, dynamic>> deploySmartContract({
    required String contractCode,
    required Map<String, dynamic> constructorParams,
    Map<String, dynamic>? deploymentParams,
  }) async {
    if (!_smartContractEnabled) {
      throw Exception('Smart contract is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/smart-contracts/deploy',
        body: {
          'contract_code': contractCode,
          'constructor_params': constructorParams,
          'wallet_address': _connectedWalletAddress,
          if (deploymentParams != null) 'deployment_params': deploymentParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to deploy smart contract: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get NFT collection
  Future<List<Map<String, dynamic>>> getNFTCollection({
    String? walletAddress,
  }) async {
    if (!_nftSupportEnabled) {
      throw Exception('NFT support is not enabled');
    }

    try {
      final address = walletAddress ?? _connectedWalletAddress;
      if (address == null) {
        throw Exception('No wallet connected');
      }

      final response = await _makeRequest(
        'GET',
        '/auth/nft/collection',
        queryParams: {
          'wallet_address': address,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['nfts'] ?? []);
      } else {
        throw Exception('Failed to get NFT collection: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get DeFi positions
  Future<List<Map<String, dynamic>>> getDeFiPositions({
    String? walletAddress,
  }) async {
    if (!_deFiIntegrationEnabled) {
      throw Exception('DeFi integration is not enabled');
    }

    try {
      final address = walletAddress ?? _connectedWalletAddress;
      if (address == null) {
        throw Exception('No wallet connected');
      }

      final response = await _makeRequest(
        'GET',
        '/auth/defi/positions',
        queryParams: {
          'wallet_address': address,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['positions'] ?? []);
      } else {
        throw Exception('Failed to get DeFi positions: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get governance proposals
  Future<List<Map<String, dynamic>>> getGovernanceProposals() async {
    if (!_governanceEnabled) {
      throw Exception('Governance is not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/auth/governance/proposals');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['proposals'] ?? []);
      } else {
        throw Exception('Failed to get governance proposals: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Vote on governance proposal
  Future<Map<String, dynamic>> voteOnProposal({
    required String proposalId,
    required String vote,
    Map<String, dynamic>? votingParams,
  }) async {
    if (!_governanceEnabled) {
      throw Exception('Governance is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/governance/vote',
        body: {
          'proposal_id': proposalId,
          'vote': vote,
          'wallet_address': _connectedWalletAddress,
          if (votingParams != null) 'voting_params': votingParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to vote on proposal: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get staking info
  Future<Map<String, dynamic>> getStakingInfo({
    String? walletAddress,
  }) async {
    if (!_stakingEnabled) {
      throw Exception('Staking is not enabled');
    }

    try {
      final address = walletAddress ?? _connectedWalletAddress;
      if (address == null) {
        throw Exception('No wallet connected');
      }

      final response = await _makeRequest(
        'GET',
        '/auth/staking/info',
        queryParams: {
          'wallet_address': address,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get staking info: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Stake tokens
  Future<Map<String, dynamic>> stakeTokens({
    required String amount,
    required String validator,
    Map<String, dynamic>? stakingParams,
  }) async {
    if (!_stakingEnabled) {
      throw Exception('Staking is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/staking/stake',
        body: {
          'amount': amount,
          'validator': validator,
          'wallet_address': _connectedWalletAddress,
          if (stakingParams != null) 'staking_params': stakingParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to stake tokens: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get analytics
  Future<Map<String, dynamic>> getAnalytics({
    String? walletAddress,
    String? timeRange,
  }) async {
    if (!_analyticsEnabled) {
      throw Exception('Analytics is not enabled');
    }

    try {
      final address = walletAddress ?? _connectedWalletAddress;
      if (address == null) {
        throw Exception('No wallet connected');
      }

      final response = await _makeRequest(
        'GET',
        '/auth/analytics/dashboard',
        queryParams: {
          'wallet_address': address,
          if (timeRange != null) 'time_range': timeRange,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get analytics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service health
  Future<Map<String, dynamic>> getHealthStatus() async {
    try {
      final response = await _makeRequest('GET', '/health');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'status': 'healthy',
          'services': serviceStatus,
          'last_error': _lastError,
          'details': data,
        };
      } else {
        return {
          'status': 'unhealthy',
          'services': serviceStatus,
          'last_error': 'Health check failed',
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'services': serviceStatus,
        'last_error': e.toString(),
      };
    }
  }

  /// Make HTTP request
  Future<http.Response> _makeRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    final uri = Uri.parse('$_baseUrl$endpoint').replace(
      queryParameters: queryParams,
    );

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
      'User-Agent': 'REChain-TONAuth/1.0',
    };

    try {
      http.Response response;
      
      switch (method.toUpperCase()) {
        case 'GET':
          response = await _client.get(uri, headers: headers);
          break;
        case 'POST':
          response = await _client.post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      return response;
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    _client.close();
    _walletUpdateController.close();
    _transactionController.close();
    _isInitialized = false;
  }
} 