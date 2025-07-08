import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';

import '../core/ton_client.dart';
import '../core/ton_config.dart';

/// Service for managing TON wallets
class TonWalletService {
  static TonWalletService? _instance;
  static TonWalletService get instance => _instance ??= TonWalletService._();
  
  TonWalletService._();
  
  static const String _walletsKey = 'ton_wallets';
  static const String _activeWalletKey = 'active_ton_wallet';
  static const String _seedPhrasePrefix = 'ton_seed_';
  static const String _privateKeyPrefix = 'ton_private_';
  
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  SharedPreferences? _prefs;
  
  final List<TonWallet> _wallets = [];
  TonWallet? _activeWallet;
  
  final StreamController<List<TonWallet>> _walletsController = 
      StreamController<List<TonWallet>>.broadcast();
  final StreamController<TonWallet?> _activeWalletController = 
      StreamController<TonWallet?>.broadcast();
  final StreamController<double> _balanceController = 
      StreamController<double>.broadcast();
  
  Stream<List<TonWallet>> get walletsStream => _walletsController.stream;
  Stream<TonWallet?> get activeWalletStream => _activeWalletController.stream;
  Stream<double> get balanceStream => _balanceController.stream;
  
  List<TonWallet> get wallets => List.unmodifiable(_wallets);
  TonWallet? get activeWallet => _activeWallet;
  
  Timer? _balanceUpdateTimer;
  
  /// Initialize the wallet service
  Future<void> initialize() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      await _loadWallets();
      await _loadActiveWallet();
      _startBalanceUpdates();
      
      Logs.i('TON Wallet Service initialized');
    } catch (e) {
      Logs.e('Failed to initialize TON Wallet Service: $e');
      rethrow;
    }
  }
  
  /// Load wallets from storage
  Future<void> _loadWallets() async {
    try {
      final walletsJson = _prefs?.getString(_walletsKey);
      if (walletsJson != null) {
        final walletsList = jsonDecode(walletsJson) as List;
        _wallets.clear();
        
        for (final walletData in walletsList) {
          final wallet = TonWallet.fromJson(walletData);
          _wallets.add(wallet);
        }
        
        _walletsController.add(_wallets);
      }
    } catch (e) {
      Logs.e('Failed to load wallets: $e');
    }
  }
  
  /// Load active wallet
  Future<void> _loadActiveWallet() async {
    try {
      final activeWalletId = _prefs?.getString(_activeWalletKey);
      if (activeWalletId != null) {
        _activeWallet = _wallets.firstWhere(
          (wallet) => wallet.id == activeWalletId,
          orElse: () => _wallets.isNotEmpty ? _wallets.first : null,
        );
        _activeWalletController.add(_activeWallet);
      }
    } catch (e) {
      Logs.e('Failed to load active wallet: $e');
    }
  }
  
  /// Save wallets to storage
  Future<void> _saveWallets() async {
    try {
      final walletsJson = jsonEncode(_wallets.map((w) => w.toJson()).toList());
      await _prefs?.setString(_walletsKey, walletsJson);
      _walletsController.add(_wallets);
    } catch (e) {
      Logs.e('Failed to save wallets: $e');
    }
  }
  
  /// Create a new wallet
  Future<TonWallet> createWallet({
    required String name,
    String? password,
  }) async {
    try {
      // Generate seed phrase (24 words)
      final seedPhrase = _generateSeedPhrase();
      
      // Generate key pair from seed
      final keyPair = await _generateKeyPairFromSeed(seedPhrase);
      
      // Generate wallet address
      final address = await _generateAddress(keyPair.publicKey);
      
      // Create wallet object
      final wallet = TonWallet(
        id: _generateWalletId(),
        name: name,
        address: address,
        publicKey: keyPair.publicKey,
        balance: 0.0,
        isActive: _wallets.isEmpty,
        createdAt: DateTime.now(),
        lastUpdated: DateTime.now(),
      );
      
      // Store sensitive data securely
      await _secureStorage.write(
        key: '$_seedPhrasePrefix${wallet.id}',
        value: seedPhrase.join(' '),
      );
      await _secureStorage.write(
        key: '$_privateKeyPrefix${wallet.id}',
        value: keyPair.privateKey,
      );
      
      // Add to wallets list
      _wallets.add(wallet);
      
      // Set as active if first wallet
      if (_activeWallet == null) {
        await setActiveWallet(wallet.id);
      }
      
      await _saveWallets();
      
      Logs.i('Created new TON wallet: ${wallet.name}');
      return wallet;
    } catch (e) {
      Logs.e('Failed to create wallet: $e');
      rethrow;
    }
  }
  
  /// Import wallet from seed phrase
  Future<TonWallet> importWallet({
    required String name,
    required List<String> seedPhrase,
    String? password,
  }) async {
    try {
      // Validate seed phrase
      if (seedPhrase.length != 24) {
        throw Exception('Seed phrase must contain 24 words');
      }
      
      // Generate key pair from seed
      final keyPair = await _generateKeyPairFromSeed(seedPhrase);
      
      // Generate wallet address
      final address = await _generateAddress(keyPair.publicKey);
      
      // Check if wallet already exists
      if (_wallets.any((w) => w.address == address)) {
        throw Exception('Wallet already exists');
      }
      
      // Create wallet object
      final wallet = TonWallet(
        id: _generateWalletId(),
        name: name,
        address: address,
        publicKey: keyPair.publicKey,
        balance: 0.0,
        isActive: _wallets.isEmpty,
        createdAt: DateTime.now(),
        lastUpdated: DateTime.now(),
      );
      
      // Store sensitive data securely
      await _secureStorage.write(
        key: '$_seedPhrasePrefix${wallet.id}',
        value: seedPhrase.join(' '),
      );
      await _secureStorage.write(
        key: '$_privateKeyPrefix${wallet.id}',
        value: keyPair.privateKey,
      );
      
      // Add to wallets list
      _wallets.add(wallet);
      
      // Set as active if first wallet
      if (_activeWallet == null) {
        await setActiveWallet(wallet.id);
      }
      
      await _saveWallets();
      
      Logs.i('Imported TON wallet: ${wallet.name}');
      return wallet;
    } catch (e) {
      Logs.e('Failed to import wallet: $e');
      rethrow;
    }
  }
  
  /// Set active wallet
  Future<void> setActiveWallet(String walletId) async {
    try {
      final wallet = _wallets.firstWhere((w) => w.id == walletId);
      
      // Update active status
      for (final w in _wallets) {
        w.isActive = w.id == walletId;
      }
      
      _activeWallet = wallet;
      await _prefs?.setString(_activeWalletKey, walletId);
      await _saveWallets();
      
      _activeWalletController.add(_activeWallet);
      
      // Update balance for new active wallet
      await updateBalance();
      
      Logs.i('Set active wallet: ${wallet.name}');
    } catch (e) {
      Logs.e('Failed to set active wallet: $e');
      rethrow;
    }
  }
  
  /// Find wallet by ID
  TonWallet? findWallet(String walletId) {
    try {
      return _wallets.firstWhere((w) => w.id == walletId);
    } catch (e) {
      return null;
    }
  }
  
  /// Update wallet balance
  Future<void> updateBalance([String? walletId]) async {
    try {
      final targetWallet = walletId != null 
          ? findWallet(walletId) 
          : _activeWallet;
      
      if (targetWallet == null) return;
      
      // Get balance from TON network
      final balance = await TonClient.instance.getBalance(targetWallet.address);
      
      // Update wallet balance
      targetWallet.balance = balance;
      targetWallet.lastUpdated = DateTime.now();
      
      // Update active wallet if this is the active one
      if (targetWallet.id == _activeWallet?.id) {
        _balanceController.add(balance);
      }
      
      await _saveWallets();
      
      Logs.i('Updated balance for wallet ${targetWallet.name}: $balance TON');
    } catch (e) {
      Logs.e('Failed to update balance: $e');
    }
  }
  
  /// Send TON transaction
  Future<String> sendTransaction({
    required String toAddress,
    required double amount,
    String? comment,
    String? walletId,
  }) async {
    try {
      final wallet = walletId != null 
          ? _wallets.firstWhere((w) => w.id == walletId)
          : _activeWallet;
      
      if (wallet == null) {
        throw Exception('No wallet selected');
      }
      
      // Validate amount
      if (!TonConfig.isValidAmount(amount)) {
        throw Exception('Invalid amount');
      }
      
      // Validate address
      if (!TonConfig.isValidTonAddress(toAddress)) {
        throw Exception('Invalid TON address');
      }
      
      // Check balance
      if (wallet.balance < amount + TonConfig.networkFee) {
        throw Exception('Insufficient balance');
      }
      
      // Get private key
      final privateKey = await _secureStorage.read(
        key: '$_privateKeyPrefix${wallet.id}',
      );
      
      if (privateKey == null) {
        throw Exception('Private key not found');
      }
      
      // Send transaction
      final txHash = await TonClient.instance.sendTransaction(
        fromAddress: wallet.address,
        toAddress: toAddress,
        amount: amount,
        privateKey: privateKey,
        comment: comment,
      );
      
      // Update balance after transaction
      await updateBalance(wallet.id);
      
      Logs.i('Sent transaction: $txHash');
      return txHash;
    } catch (e) {
      Logs.e('Failed to send transaction: $e');
      rethrow;
    }
  }
  
  /// Get transaction history
  Future<List<TonTransaction>> getTransactionHistory([String? walletId]) async {
    try {
      final wallet = walletId != null 
          ? _wallets.firstWhere((w) => w.id == walletId)
          : _activeWallet;
      
      if (wallet == null) return [];
      
      return await TonClient.instance.getTransactions(
        wallet.address,
        limit: TonConfig.transactionHistoryLimit,
      );
    } catch (e) {
      Logs.e('Failed to get transaction history: $e');
      return [];
    }
  }
  
  /// Get seed phrase for wallet
  Future<List<String>> getSeedPhrase(String walletId) async {
    try {
      final seedPhrase = await _secureStorage.read(
        key: '$_seedPhrasePrefix$walletId',
      );
      
      if (seedPhrase == null) {
        throw Exception('Seed phrase not found');
      }
      
      return seedPhrase.split(' ');
    } catch (e) {
      Logs.e('Failed to get seed phrase: $e');
      rethrow;
    }
  }
  
  /// Delete wallet
  Future<void> deleteWallet(String walletId) async {
    try {
      // Remove from storage
      await _secureStorage.delete(key: '$_seedPhrasePrefix$walletId');
      await _secureStorage.delete(key: '$_privateKeyPrefix$walletId');
      
      // Remove from list
      _wallets.removeWhere((w) => w.id == walletId);
      
      // Update active wallet if deleted
      if (_activeWallet?.id == walletId) {
        _activeWallet = _wallets.isNotEmpty ? _wallets.first : null;
        if (_activeWallet != null) {
          await setActiveWallet(_activeWallet!.id);
        } else {
          _activeWalletController.add(null);
        }
      }
      
      await _saveWallets();
      
      Logs.i('Deleted wallet: $walletId');
    } catch (e) {
      Logs.e('Failed to delete wallet: $e');
      rethrow;
    }
  }
  
  /// Start periodic balance updates
  void _startBalanceUpdates() {
    _balanceUpdateTimer?.cancel();
    _balanceUpdateTimer = Timer.periodic(
      Duration(seconds: TonConfig.walletRefreshInterval.toInt()),
      (_) => updateBalance(),
    );
  }
  
  /// Generate seed phrase
  List<String> _generateSeedPhrase() {
    // This is a simplified implementation
    // In a real implementation, you would use BIP39 wordlist
    final words = [
      'abandon', 'ability', 'able', 'about', 'above', 'absent', 'absorb', 'abstract',
      'absurd', 'abuse', 'access', 'accident', 'account', 'accuse', 'achieve', 'acid',
      'acoustic', 'acquire', 'across', 'act', 'action', 'actor', 'actress', 'actual',
      // ... (full BIP39 wordlist would be here)
    ];
    
    final random = Random.secure();
    final seedPhrase = <String>[];
    
    for (int i = 0; i < 24; i++) {
      seedPhrase.add(words[random.nextInt(words.length)]);
    }
    
    return seedPhrase;
  }
  
  /// Generate key pair from seed phrase
  Future<TonKeyPair> _generateKeyPairFromSeed(List<String> seedPhrase) async {
    // This is a simplified implementation
    // In a real implementation, you would use proper cryptographic libraries
    final seed = seedPhrase.join(' ');
    final bytes = utf8.encode(seed);
    final hash = sha256.convert(bytes);
    
    final privateKey = base64Encode(hash.bytes);
    final publicKey = base64Encode(sha256.convert(utf8.encode(privateKey)).bytes);
    
    return TonKeyPair(privateKey: privateKey, publicKey: publicKey);
  }
  
  /// Generate wallet address from public key
  Future<String> _generateAddress(String publicKey) async {
    // This is a simplified implementation
    // In a real implementation, you would use TON address generation
    final bytes = utf8.encode(publicKey);
    final hash = sha256.convert(bytes);
    final addressBytes = hash.bytes.take(32).toList();
    
    // Add TON address prefix
    return 'EQ${base64Encode(addressBytes)}';
  }
  
  /// Generate unique wallet ID
  String _generateWalletId() {
    return 'wallet_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';
  }
  
  /// Dispose resources
  void dispose() {
    _balanceUpdateTimer?.cancel();
    _walletsController.close();
    _activeWalletController.close();
    _balanceController.close();
  }
}

/// TON wallet model
class TonWallet {
  final String id;
  final String name;
  final String address;
  final String publicKey;
  double balance;
  bool isActive;
  final DateTime createdAt;
  DateTime lastUpdated;
  
  TonWallet({
    required this.id,
    required this.name,
    required this.address,
    required this.publicKey,
    required this.balance,
    required this.isActive,
    required this.createdAt,
    required this.lastUpdated,
  });
  
  factory TonWallet.fromJson(Map<String, dynamic> json) {
    return TonWallet(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      publicKey: json['public_key'] as String,
      balance: (json['balance'] as num).toDouble(),
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'public_key': publicKey,
      'balance': balance,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'last_updated': lastUpdated.toIso8601String(),
    };
  }
  
  String get shortAddress {
    if (address.length <= 10) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }
  
  String get formattedBalance {
    return '${balance.toStringAsFixed(4)} TON';
  }
}

/// TON key pair model
class TonKeyPair {
  final String privateKey;
  final String publicKey;
  
  TonKeyPair({
    required this.privateKey,
    required this.publicKey,
  });
}

// Add Logs class if not available
class Logs {
  static void i(String message) => debugPrint('[INFO] $message');
  static void e(String message) => debugPrint('[ERROR] $message');
  static void w(String message) => debugPrint('[WARNING] $message');
  static void d(String message) => debugPrint('[DEBUG] $message');
}
