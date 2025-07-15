import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Blockchain Integration Service
/// Provides blockchain features for Matrix communication
class MatrixBlockchainIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Blockchain services
  bool _decentralizedIdentityEnabled = false;
  bool _messageVerificationEnabled = false;
  bool _smartContractsEnabled = false;
  bool _tokenIntegrationEnabled = false;
  bool _nftSupportEnabled = false;
  bool _decentralizedStorageEnabled = false;
  bool _consensusMechanismEnabled = false;
  bool _crossChainEnabled = false;

  MatrixBlockchainIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-blockchain.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix blockchain services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Initializing Matrix blockchain services...');
      }

      // Test connection to Matrix Blockchain API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Blockchain API is not available');
      }

      // Initialize individual services
      await _initializeDecentralizedIdentity();
      await _initializeMessageVerification();
      await _initializeSmartContracts();
      await _initializeTokenIntegration();
      await _initializeNFTSupport();
      await _initializeDecentralizedStorage();
      await _initializeConsensusMechanism();
      await _initializeCrossChain();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Matrix blockchain services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Blockchain API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Decentralized Identity
  Future<void> _initializeDecentralizedIdentity() async {
    try {
      final response = await _makeRequest('POST', '/blockchain/identity/initialize');
      if (response.statusCode == 200) {
        _decentralizedIdentityEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Decentralized identity initialization failed: $e');
      }
    }
  }

  /// Initialize Message Verification
  Future<void> _initializeMessageVerification() async {
    try {
      final response = await _makeRequest('POST', '/blockchain/verification/initialize');
      if (response.statusCode == 200) {
        _messageVerificationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Message verification initialization failed: $e');
      }
    }
  }

  /// Initialize Smart Contracts
  Future<void> _initializeSmartContracts() async {
    try {
      final response = await _makeRequest('POST', '/blockchain/smart-contracts/initialize');
      if (response.statusCode == 200) {
        _smartContractsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Smart contracts initialization failed: $e');
      }
    }
  }

  /// Initialize Token Integration
  Future<void> _initializeTokenIntegration() async {
    try {
      final response = await _makeRequest('POST', '/blockchain/tokens/initialize');
      if (response.statusCode == 200) {
        _tokenIntegrationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Token integration initialization failed: $e');
      }
    }
  }

  /// Initialize NFT Support
  Future<void> _initializeNFTSupport() async {
    try {
      final response = await _makeRequest('POST', '/blockchain/nft/initialize');
      if (response.statusCode == 200) {
        _nftSupportEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] NFT support initialization failed: $e');
      }
    }
  }

  /// Initialize Decentralized Storage
  Future<void> _initializeDecentralizedStorage() async {
    try {
      final response = await _makeRequest('POST', '/blockchain/storage/initialize');
      if (response.statusCode == 200) {
        _decentralizedStorageEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Decentralized storage initialization failed: $e');
      }
    }
  }

  /// Initialize Consensus Mechanism
  Future<void> _initializeConsensusMechanism() async {
    try {
      final response = await _makeRequest('POST', '/blockchain/consensus/initialize');
      if (response.statusCode == 200) {
        _consensusMechanismEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Consensus mechanism initialization failed: $e');
      }
    }
  }

  /// Initialize Cross Chain
  Future<void> _initializeCrossChain() async {
    try {
      final response = await _makeRequest('POST', '/blockchain/cross-chain/initialize');
      if (response.statusCode == 200) {
        _crossChainEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixBlockchainIntegration] Cross chain initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'decentralized_identity': _decentralizedIdentityEnabled,
    'message_verification': _messageVerificationEnabled,
    'smart_contracts': _smartContractsEnabled,
    'token_integration': _tokenIntegrationEnabled,
    'nft_support': _nftSupportEnabled,
    'decentralized_storage': _decentralizedStorageEnabled,
    'consensus_mechanism': _consensusMechanismEnabled,
    'cross_chain': _crossChainEnabled,
  };

  /// Decentralized Identity - Create DID
  Future<Map<String, dynamic>> createDecentralizedIdentity({
    required String userId,
    required Map<String, dynamic> identityData,
    Map<String, dynamic>? verificationMethods,
  }) async {
    if (!_decentralizedIdentityEnabled) {
      throw Exception('Decentralized identity is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/identity/create',
        body: {
          'user_id': userId,
          'identity_data': identityData,
          if (verificationMethods != null) 'verification_methods': verificationMethods,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create decentralized identity: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Message Verification - Verify message signature
  Future<Map<String, dynamic>> verifyMessage({
    required String message,
    required String signature,
    required String publicKey,
    Map<String, dynamic>? options,
  }) async {
    if (!_messageVerificationEnabled) {
      throw Exception('Message verification is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/verification/verify',
        body: {
          'message': message,
          'signature': signature,
          'public_key': publicKey,
          'options': options ?? {
            'algorithm': 'ed25519',
            'verify_timestamp': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to verify message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Smart Contracts - Deploy contract
  Future<Map<String, dynamic>> deploySmartContract({
    required String contractName,
    required String contractCode,
    required Map<String, dynamic> constructorArgs,
    Map<String, dynamic>? options,
  }) async {
    if (!_smartContractsEnabled) {
      throw Exception('Smart contracts is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/smart-contracts/deploy',
        body: {
          'contract_name': contractName,
          'contract_code': contractCode,
          'constructor_args': constructorArgs,
          'options': options ?? {
            'gas_limit': 3000000,
            'gas_price': 'auto',
          },
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

  /// Smart Contracts - Execute contract function
  Future<Map<String, dynamic>> executeContractFunction({
    required String contractAddress,
    required String functionName,
    required List<dynamic> functionArgs,
    Map<String, dynamic>? options,
  }) async {
    if (!_smartContractsEnabled) {
      throw Exception('Smart contracts is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/smart-contracts/execute',
        body: {
          'contract_address': contractAddress,
          'function_name': functionName,
          'function_args': functionArgs,
          'options': options ?? {
            'gas_limit': 1000000,
            'gas_price': 'auto',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to execute contract function: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Token Integration - Transfer tokens
  Future<Map<String, dynamic>> transferTokens({
    required String fromAddress,
    required String toAddress,
    required String amount,
    required String tokenAddress,
    Map<String, dynamic>? options,
  }) async {
    if (!_tokenIntegrationEnabled) {
      throw Exception('Token integration is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/tokens/transfer',
        body: {
          'from_address': fromAddress,
          'to_address': toAddress,
          'amount': amount,
          'token_address': tokenAddress,
          'options': options ?? {
            'gas_limit': 100000,
            'gas_price': 'auto',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to transfer tokens: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// NFT Support - Mint NFT
  Future<Map<String, dynamic>> mintNFT({
    required String toAddress,
    required String tokenURI,
    required Map<String, dynamic> metadata,
    Map<String, dynamic>? options,
  }) async {
    if (!_nftSupportEnabled) {
      throw Exception('NFT support is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/nft/mint',
        body: {
          'to_address': toAddress,
          'token_uri': tokenURI,
          'metadata': metadata,
          'options': options ?? {
            'gas_limit': 500000,
            'gas_price': 'auto',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to mint NFT: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Decentralized Storage - Store data
  Future<Map<String, dynamic>> storeData({
    required String data,
    required String dataType,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? options,
  }) async {
    if (!_decentralizedStorageEnabled) {
      throw Exception('Decentralized storage is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/storage/store',
        body: {
          'data': data,
          'data_type': dataType,
          if (metadata != null) 'metadata': metadata,
          'options': options ?? {
            'encryption': true,
            'replication': 3,
            'compression': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to store data: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Consensus Mechanism - Participate in consensus
  Future<Map<String, dynamic>> participateInConsensus({
    required String consensusType,
    required Map<String, dynamic> stake,
    Map<String, dynamic>? validatorConfig,
  }) async {
    if (!_consensusMechanismEnabled) {
      throw Exception('Consensus mechanism is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/consensus/participate',
        body: {
          'consensus_type': consensusType,
          'stake': stake,
          if (validatorConfig != null) 'validator_config': validatorConfig,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to participate in consensus: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Cross Chain - Bridge assets
  Future<Map<String, dynamic>> bridgeAssets({
    required String fromChain,
    required String toChain,
    required String assetAddress,
    required String amount,
    required String recipient,
    Map<String, dynamic>? options,
  }) async {
    if (!_crossChainEnabled) {
      throw Exception('Cross chain is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/blockchain/cross-chain/bridge',
        body: {
          'from_chain': fromChain,
          'to_chain': toChain,
          'asset_address': assetAddress,
          'amount': amount,
          'recipient': recipient,
          'options': options ?? {
            'gas_limit': 200000,
            'gas_price': 'auto',
            'timeout': 3600,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to bridge assets: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get blockchain status
  Future<Map<String, dynamic>> getBlockchainStatus() async {
    try {
      final response = await _makeRequest('GET', '/blockchain/status');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get blockchain status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get available blockchains
  Future<List<Map<String, dynamic>>> getAvailableBlockchains() async {
    try {
      final response = await _makeRequest('GET', '/blockchain/available');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['blockchains'] ?? []);
      } else {
        throw Exception('Failed to get available blockchains: ${response.statusCode}');
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
      'User-Agent': 'REChain-MatrixBlockchain/1.0',
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
    _isInitialized = false;
  }
} 