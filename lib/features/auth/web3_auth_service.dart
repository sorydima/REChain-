import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';

/// Web3 Authentication Service
/// Provides unified authentication for multiple blockchain networks and Web3 services
class Web3AuthService {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Web3 services
  bool _ethereumEnabled = false;
  bool _polygonEnabled = false;
  bool _binanceSmartChainEnabled = false;
  bool _arbitrumEnabled = false;
  bool _optimismEnabled = false;
  bool _avalancheEnabled = false;
  bool _solanaEnabled = false;
  bool _polkadotEnabled = false;
  bool _cosmosEnabled = false;
  bool _ipfsEnabled = false;
  bool _filecoinEnabled = false;
  bool _decentralizedStorageEnabled = false;

  // Authentication state
  Map<String, dynamic>? _currentUser;
  Map<String, dynamic>? _walletInfo;
  List<Map<String, dynamic>> _connectedNetworks = [];
  Map<String, dynamic>? _sessionInfo;

  // Stream controllers for real-time updates
  final StreamController<Map<String, dynamic>> _authUpdateController = 
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _walletUpdateController = 
      StreamController<Map<String, dynamic>>.broadcast();

  Web3AuthService({
    required String apiKey,
    String baseUrl = 'https://api.web3auth.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize Web3 authentication services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[Web3AuthService] Initializing Web3 authentication services...');
      }

      // Test connection to Web3 Auth API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Web3 Auth API is not available');
      }

      // Initialize individual blockchain networks
      await _initializeEthereum();
      await _initializePolygon();
      await _initializeBinanceSmartChain();
      await _initializeArbitrum();
      await _initializeOptimism();
      await _initializeAvalanche();
      await _initializeSolana();
      await _initializePolkadot();
      await _initializeCosmos();
      await _initializeIPFS();
      await _initializeFilecoin();
      await _initializeDecentralizedStorage();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[Web3AuthService] Web3 authentication services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[Web3AuthService] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Web3 Auth API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Ethereum
  Future<void> _initializeEthereum() async {
    try {
      final response = await _makeRequest('POST', '/auth/ethereum/initialize');
      if (response.statusCode == 200) {
        _ethereumEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Ethereum initialization failed: $e');
      }
    }
  }

  /// Initialize Polygon
  Future<void> _initializePolygon() async {
    try {
      final response = await _makeRequest('POST', '/auth/polygon/initialize');
      if (response.statusCode == 200) {
        _polygonEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Polygon initialization failed: $e');
      }
    }
  }

  /// Initialize Binance Smart Chain
  Future<void> _initializeBinanceSmartChain() async {
    try {
      final response = await _makeRequest('POST', '/auth/bsc/initialize');
      if (response.statusCode == 200) {
        _binanceSmartChainEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] BSC initialization failed: $e');
      }
    }
  }

  /// Initialize Arbitrum
  Future<void> _initializeArbitrum() async {
    try {
      final response = await _makeRequest('POST', '/auth/arbitrum/initialize');
      if (response.statusCode == 200) {
        _arbitrumEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Arbitrum initialization failed: $e');
      }
    }
  }

  /// Initialize Optimism
  Future<void> _initializeOptimism() async {
    try {
      final response = await _makeRequest('POST', '/auth/optimism/initialize');
      if (response.statusCode == 200) {
        _optimismEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Optimism initialization failed: $e');
      }
    }
  }

  /// Initialize Avalanche
  Future<void> _initializeAvalanche() async {
    try {
      final response = await _makeRequest('POST', '/auth/avalanche/initialize');
      if (response.statusCode == 200) {
        _avalancheEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Avalanche initialization failed: $e');
      }
    }
  }

  /// Initialize Solana
  Future<void> _initializeSolana() async {
    try {
      final response = await _makeRequest('POST', '/auth/solana/initialize');
      if (response.statusCode == 200) {
        _solanaEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Solana initialization failed: $e');
      }
    }
  }

  /// Initialize Polkadot
  Future<void> _initializePolkadot() async {
    try {
      final response = await _makeRequest('POST', '/auth/polkadot/initialize');
      if (response.statusCode == 200) {
        _polkadotEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Polkadot initialization failed: $e');
      }
    }
  }

  /// Initialize Cosmos
  Future<void> _initializeCosmos() async {
    try {
      final response = await _makeRequest('POST', '/auth/cosmos/initialize');
      if (response.statusCode == 200) {
        _cosmosEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Cosmos initialization failed: $e');
      }
    }
  }

  /// Initialize IPFS
  Future<void> _initializeIPFS() async {
    try {
      final response = await _makeRequest('POST', '/auth/ipfs/initialize');
      if (response.statusCode == 200) {
        _ipfsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] IPFS initialization failed: $e');
      }
    }
  }

  /// Initialize Filecoin
  Future<void> _initializeFilecoin() async {
    try {
      final response = await _makeRequest('POST', '/auth/filecoin/initialize');
      if (response.statusCode == 200) {
        _filecoinEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Filecoin initialization failed: $e');
      }
    }
  }

  /// Initialize Decentralized Storage
  Future<void> _initializeDecentralizedStorage() async {
    try {
      final response = await _makeRequest('POST', '/auth/storage/initialize');
      if (response.statusCode == 200) {
        _decentralizedStorageEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[Web3AuthService] Decentralized storage initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'ethereum': _ethereumEnabled,
    'polygon': _polygonEnabled,
    'binance_smart_chain': _binanceSmartChainEnabled,
    'arbitrum': _arbitrumEnabled,
    'optimism': _optimismEnabled,
    'avalanche': _avalancheEnabled,
    'solana': _solanaEnabled,
    'polkadot': _polkadotEnabled,
    'cosmos': _cosmosEnabled,
    'ipfs': _ipfsEnabled,
    'filecoin': _filecoinEnabled,
    'decentralized_storage': _decentralizedStorageEnabled,
  };

  /// Get auth update stream
  Stream<Map<String, dynamic>> get authUpdateStream => _authUpdateController.stream;

  /// Get wallet update stream
  Stream<Map<String, dynamic>> get walletUpdateStream => _walletUpdateController.stream;

  /// Get current user
  Map<String, dynamic>? get currentUser => _currentUser;

  /// Get wallet info
  Map<String, dynamic>? get walletInfo => _walletInfo;

  /// Get connected networks
  List<Map<String, dynamic>> get connectedNetworks => _connectedNetworks;

  /// Get session info
  Map<String, dynamic>? get sessionInfo => _sessionInfo;

  /// Register new user
  Future<Map<String, dynamic>> registerUser({
    required String username,
    required String email,
    required String password,
    Map<String, dynamic>? userData,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/auth/register',
        body: {
          'username': username,
          'email': email,
          'password': _hashPassword(password),
          if (userData != null) 'user_data': userData,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        _currentUser = data['user'];
        _sessionInfo = data['session'];
        _authUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to register user: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Login user
  Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/auth/login',
        body: {
          'email': email,
          'password': _hashPassword(password),
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _currentUser = data['user'];
        _sessionInfo = data['session'];
        _authUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to login user: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Logout user
  Future<Map<String, dynamic>> logoutUser() async {
    try {
      final response = await _makeRequest(
        'POST',
        '/auth/logout',
        body: {
          'session_id': _sessionInfo?['id'],
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _currentUser = null;
        _walletInfo = null;
        _connectedNetworks.clear();
        _sessionInfo = null;
        _authUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to logout user: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Connect wallet
  Future<Map<String, dynamic>> connectWallet({
    required String network,
    required String walletType,
    Map<String, dynamic>? connectionParams,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/auth/wallet/connect',
        body: {
          'network': network,
          'wallet_type': walletType,
          'user_id': _currentUser?['id'],
          if (connectionParams != null) 'connection_params': connectionParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _walletInfo = data['wallet_info'];
        _connectedNetworks.add({
          'network': network,
          'wallet_type': walletType,
          'connected_at': DateTime.now().toIso8601String(),
        });
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
  Future<Map<String, dynamic>> disconnectWallet({
    required String network,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/auth/wallet/disconnect',
        body: {
          'network': network,
          'user_id': _currentUser?['id'],
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _connectedNetworks.removeWhere((network) => network['network'] == network);
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
    required String network,
    String? walletAddress,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/auth/wallet/balance',
        queryParams: {
          'network': network,
          'wallet_address': walletAddress ?? _walletInfo?['address'],
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
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
    required String network,
    required Map<String, dynamic> transaction,
    Map<String, dynamic>? signingParams,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/auth/transaction/sign',
        body: {
          'network': network,
          'transaction': transaction,
          'wallet_address': _walletInfo?['address'],
          if (signingParams != null) 'signing_params': signingParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
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
    required String network,
    required Map<String, dynamic> signedTransaction,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/auth/transaction/send',
        body: {
          'network': network,
          'signed_transaction': signedTransaction,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send transaction: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Upload file to IPFS
  Future<Map<String, dynamic>> uploadToIPFS({
    required List<int> fileData,
    required String fileName,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_ipfsEnabled) {
      throw Exception('IPFS is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/ipfs/upload',
        body: {
          'file_data': base64Encode(fileData),
          'file_name': fileName,
          if (metadata != null) 'metadata': metadata,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to upload to IPFS: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Store data on Filecoin
  Future<Map<String, dynamic>> storeOnFilecoin({
    required List<int> data,
    Map<String, dynamic>? storageParams,
  }) async {
    if (!_filecoinEnabled) {
      throw Exception('Filecoin is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/auth/filecoin/store',
        body: {
          'data': base64Encode(data),
          if (storageParams != null) 'storage_params': storageParams,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to store on Filecoin: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get user profile
  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      if (_currentUser == null) {
        throw Exception('User not authenticated');
      }

      final response = await _makeRequest(
        'GET',
        '/auth/profile',
        queryParams: {
          'user_id': _currentUser!['id'].toString(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _currentUser = data['user'];
        return data;
      } else {
        throw Exception('Failed to get user profile: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Update user profile
  Future<Map<String, dynamic>> updateUserProfile({
    required Map<String, dynamic> updates,
  }) async {
    try {
      if (_currentUser == null) {
        throw Exception('User not authenticated');
      }

      final response = await _makeRequest(
        'PUT',
        '/auth/profile',
        body: {
          'user_id': _currentUser!['id'],
          'updates': updates,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _currentUser = data['user'];
        _authUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to update user profile: ${response.statusCode}');
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

  /// Hash password for security
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
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
      'User-Agent': 'REChain-Web3Auth/1.0',
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
        case 'PUT':
          response = await _client.put(
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
    _authUpdateController.close();
    _walletUpdateController.close();
    _isInitialized = false;
  }
} 