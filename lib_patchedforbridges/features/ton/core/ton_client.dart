import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'ton_config.dart';

/// TON blockchain client for interacting with the TON network
class TonClient {
  static TonClient? _instance;
  static TonClient get instance => _instance ??= TonClient._();
  
  TonClient._();
  
  final http.Client _httpClient = http.Client();
  final Map<String, dynamic> _cache = {};
  DateTime? _lastCacheClean;
  
  /// Initialize the TON client
  Future<void> initialize() async {
    try {
      // Test connection to TON network
      await _testConnection();
      Logs().i('TON Client initialized successfully');
    } catch (e) {
      Logs().e('Failed to initialize TON Client: $e');
      rethrow;
    }
  }
  
  /// Test connection to TON network
  Future<void> _testConnection() async {
    final response = await _makeRequest('getAddressInformation', {
      'address': 'EQD4FPq-PRDieyQKkizFTRtSDyucUIqrj0v_zXJmqaDp6_0t'
    });
    
    if (response['ok'] != true) {
      throw Exception('Failed to connect to TON network');
    }
  }
  
  /// Make HTTP request to TON API
  Future<Map<String, dynamic>> _makeRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    final url = Uri.parse(TonConfig.currentEndpoint);
    final body = jsonEncode({
      'id': DateTime.now().millisecondsSinceEpoch,
      'jsonrpc': '2.0',
      'method': method,
      'params': params,
    });
    
    final headers = {
      'Content-Type': 'application/json',
      if (TonConfig.tonCenterApiKey.isNotEmpty)
        'X-API-Key': TonConfig.tonCenterApiKey,
    };
    
    try {
      final response = await _httpClient.post(
        url,
        headers: headers,
        body: body,
      ).timeout(Duration(seconds: TonConfig.transactionTimeout));
      
      if (response.statusCode != 200) {
        throw Exception('HTTP ${response.statusCode}: ${response.body}');
      }
      
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      
      if (data.containsKey('error')) {
        throw Exception('TON API Error: ${data['error']}');
      }
      
      return data['result'] as Map<String, dynamic>;
    } catch (e) {
      Logs().e('TON API request failed: $e');
      rethrow;
    }
  }
  
  /// Get account information
  Future<TonAccountInfo> getAccountInfo(String address) async {
    final cacheKey = 'account_$address';
    
    // Check cache first
    if (_isValidCache(cacheKey)) {
      return TonAccountInfo.fromJson(_cache[cacheKey]);
    }
    
    final result = await _makeRequest('getAddressInformation', {
      'address': address,
    });
    
    final accountInfo = TonAccountInfo.fromJson(result);
    _cache[cacheKey] = result;
    
    return accountInfo;
  }
  
  /// Get account balance
  Future<double> getBalance(String address) async {
    final accountInfo = await getAccountInfo(address);
    return accountInfo.balance;
  }
  
  /// Get transaction history
  Future<List<TonTransaction>> getTransactions(
    String address, {
    int limit = 50,
    String? fromTransactionHash,
  }) async {
    final params = {
      'address': address,
      'limit': limit,
    };
    
    if (fromTransactionHash != null) {
      params['from_transaction_hash'] = fromTransactionHash;
    }
    
    final result = await _makeRequest('getTransactions', params);
    final transactions = (result['transactions'] as List)
        .map((tx) => TonTransaction.fromJson(tx))
        .toList();
    
    return transactions;
  }
  
  /// Send TON transaction
  Future<String> sendTransaction({
    required String fromAddress,
    required String toAddress,
    required double amount,
    required String privateKey,
    String? comment,
  }) async {
    try {
      // Create transaction body
      final transactionBody = await _createTransactionBody(
        fromAddress: fromAddress,
        toAddress: toAddress,
        amount: amount,
        comment: comment,
      );
      
      // Sign transaction
      final signedTransaction = await _signTransaction(
        transactionBody,
        privateKey,
      );
      
      // Send transaction
      final result = await _makeRequest('sendBoc', {
        'boc': signedTransaction,
      });
      
      return result['hash'] as String;
    } catch (e) {
      Logs().e('Failed to send transaction: $e');
      rethrow;
    }
  }
  
  /// Create transaction body
  Future<Map<String, dynamic>> _createTransactionBody({
    required String fromAddress,
    required String toAddress,
    required double amount,
    String? comment,
  }) async {
    // This is a simplified implementation
    // In a real implementation, you would use the TON SDK
    return {
      'from': fromAddress,
      'to': toAddress,
      'amount': (amount * 1e9).toInt(), // Convert to nanotons
      'comment': comment ?? '',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
  }
  
  /// Sign transaction (simplified implementation)
  Future<String> _signTransaction(
    Map<String, dynamic> transactionBody,
    String privateKey,
  ) async {
    // This is a placeholder implementation
    // In a real implementation, you would use proper cryptographic signing
    final message = jsonEncode(transactionBody);
    final bytes = utf8.encode(message + privateKey);
    final digest = sha256.convert(bytes);
    
    return base64Encode(digest.bytes);
  }
  
  /// Get NFT information
  Future<List<TonNft>> getNfts(String address) async {
    try {
      final url = Uri.parse('${TonConfig.tonNftApiUrl}/accounts/$address/nfts');
      final response = await _httpClient.get(url);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch NFTs');
      }
      
      final data = jsonDecode(response.body);
      final nfts = (data['nft_items'] as List)
          .map((nft) => TonNft.fromJson(nft))
          .toList();
      
      return nfts;
    } catch (e) {
      Logs().e('Failed to fetch NFTs: $e');
      return [];
    }
  }
  
  /// Get smart contract state
  Future<Map<String, dynamic>> getSmartContractState(String address) async {
    final result = await _makeRequest('runGetMethod', {
      'address': address,
      'method': 'get_contract_state',
      'stack': [],
    });
    
    return result;
  }
  
  /// Execute smart contract method
  Future<Map<String, dynamic>> executeSmartContractMethod(
    String address,
    String method,
    List<dynamic> params,
  ) async {
    final result = await _makeRequest('runGetMethod', {
      'address': address,
      'method': method,
      'stack': params,
    });
    
    return result;
  }
  
  /// Check if cache is valid
  bool _isValidCache(String key) {
    if (!_cache.containsKey(key)) return false;
    
    final now = DateTime.now();
    if (_lastCacheClean == null || 
        now.difference(_lastCacheClean!).inHours >= TonConfig.cacheExpirationHours) {
      _cleanCache();
      _lastCacheClean = now;
    }
    
    return _cache.containsKey(key);
  }
  
  /// Clean expired cache entries
  void _cleanCache() {
    if (_cache.length > TonConfig.maxCacheSize) {
      _cache.clear();
    }
  }
  
  /// Dispose resources
  void dispose() {
    _httpClient.close();
    _cache.clear();
  }
}

/// TON account information model
class TonAccountInfo {
  final String address;
  final double balance;
  final String state;
  final int lastTransactionId;
  final DateTime lastActivity;
  
  TonAccountInfo({
    required this.address,
    required this.balance,
    required this.state,
    required this.lastTransactionId,
    required this.lastActivity,
  });
  
  factory TonAccountInfo.fromJson(Map<String, dynamic> json) {
    return TonAccountInfo(
      address: json['address'] as String,
      balance: (json['balance'] as int) / 1e9, // Convert from nanotons
      state: json['state'] as String,
      lastTransactionId: json['last_transaction_id'] as int? ?? 0,
      lastActivity: DateTime.fromMillisecondsSinceEpoch(
        (json['last_activity'] as int? ?? 0) * 1000,
      ),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'balance': (balance * 1e9).toInt(),
      'state': state,
      'last_transaction_id': lastTransactionId,
      'last_activity': lastActivity.millisecondsSinceEpoch ~/ 1000,
    };
  }
}

/// TON transaction model
class TonTransaction {
  final String hash;
  final String fromAddress;
  final String toAddress;
  final double amount;
  final double fee;
  final String? comment;
  final DateTime timestamp;
  final bool isIncoming;
  
  TonTransaction({
    required this.hash,
    required this.fromAddress,
    required this.toAddress,
    required this.amount,
    required this.fee,
    this.comment,
    required this.timestamp,
    required this.isIncoming,
  });
  
  factory TonTransaction.fromJson(Map<String, dynamic> json) {
    return TonTransaction(
      hash: json['hash'] as String,
      fromAddress: json['from_address'] as String? ?? '',
      toAddress: json['to_address'] as String? ?? '',
      amount: (json['amount'] as int? ?? 0) / 1e9,
      fee: (json['fee'] as int? ?? 0) / 1e9,
      comment: json['comment'] as String?,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        (json['timestamp'] as int) * 1000,
      ),
      isIncoming: json['is_incoming'] as bool? ?? false,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'from_address': fromAddress,
      'to_address': toAddress,
      'amount': (amount * 1e9).toInt(),
      'fee': (fee * 1e9).toInt(),
      'comment': comment,
      'timestamp': timestamp.millisecondsSinceEpoch ~/ 1000,
      'is_incoming': isIncoming,
    };
  }
}

/// TON NFT model
class TonNft {
  final String address;
  final String name;
  final String description;
  final String imageUrl;
  final String collectionAddress;
  final Map<String, dynamic> metadata;
  
  TonNft({
    required this.address,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.collectionAddress,
    required this.metadata,
  });
  
  factory TonNft.fromJson(Map<String, dynamic> json) {
    final metadata = json['metadata'] as Map<String, dynamic>? ?? {};
    
    return TonNft(
      address: json['address'] as String,
      name: metadata['name'] as String? ?? 'Unknown NFT',
      description: metadata['description'] as String? ?? '',
      imageUrl: metadata['image'] as String? ?? '',
      collectionAddress: json['collection_address'] as String? ?? '',
      metadata: metadata,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'collection_address': collectionAddress,
      'metadata': metadata,
    };
  }
}

// Add Logs class if not available
class Logs {
  static void i(String message) => debugPrint('[INFO] $message');
  static void e(String message) => debugPrint('[ERROR] $message');
  static void w(String message) => debugPrint('[WARNING] $message');
  static void d(String message) => debugPrint('[DEBUG] $message');
}
