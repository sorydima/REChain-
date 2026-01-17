import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

/// Blockchain Transaction Example
///
/// Demonstrates blockchain transaction handling for REChain including:
/// - Wallet connection
/// - Token transfers
/// - Transaction status tracking
/// - Smart contract interaction
///
/// Usage:
/// ```dart
/// final blockchain = BlockchainExample(
///   rpcUrl: 'https://eth-mainnet.alchemyapi.io/v2/YOUR_KEY',
/// );
/// final txHash = await blockchain.sendTransaction(
///   from: '0x...',
///   to: '0x...',
///   amount: 1.0,
/// );
/// ```
class BlockchainExample {
  final String rpcUrl;
  final String? chainId;
  final String? explorerUrl;

  BlockchainExample({
    required this.rpcUrl,
    this.chainId,
    this.explorerUrl,
  });

  // ===========================================================================
  // TRANSACTION OPERATIONS
  // ===========================================================================

  /// Send a basic ETH/REChain transfer
  Future<String> sendTransaction({
    required String from,
    required String to,
    required double amount,
    String? data,
    int gasLimit = 21000,
    double? gasPrice,
  }) async {
    // Get nonce
    final nonce = await _getNonce(from);

    // Get gas price if not provided
    final effectiveGasPrice = gasPrice ?? await _getGasPrice();

    // Calculate gas limit with some buffer
    final adjustedGasLimit = (gasLimit * 1.5).round();

    // Build transaction
    final transaction = {
      'from': from,
      'to': to,
      'value': _toHex((amount * 1e18).toInt()),
      'data': data ?? '0x',
      'nonce': _toHex(nonce),
      'gasLimit': _toHex(adjustedGasLimit),
      'gasPrice': _toHex((effectiveGasPrice * 1e9).round()),
      'chainId': chainId ?? await _getChainId(),
    };

    // Send transaction
    final response = await _call('eth_sendTransaction', [transaction]);

    if (response['error'] != null) {
      throw Exception(response['error']['message']);
    }

    final txHash = response['result'] as String;
    if (kDebugMode) {
      print('Transaction sent: $txHash');
    }

    return txHash;
  }

  /// Send ERC-20 token transfer
  Future<String> sendErc20Token({
    required String contractAddress,
    required String from,
    required String to,
    required double amount,
    required int decimals,
    String? gasPrice,
  }) async {
    // Calculate amount in smallest unit
    final amountInSmallestUnit = (amount * pow(10, decimals)).toInt();

    // Build transfer data
    final data = _encodeErc20Transfer(to, amountInSmallestUnit);

    // Get gas estimate
    final gasLimit = await _estimateGas(
      from: from,
      to: contractAddress,
      data: data,
    );

    return sendTransaction(
      from: from,
      to: contractAddress,
      amount: 0, // No ETH sent, just data
      data: data,
      gasLimit: gasLimit,
      gasPrice: gasPrice != null ? double.tryParse(gasPrice) : null,
    );
  }

  /// Get transaction status
  Future<TransactionReceipt> getTransactionStatus(String txHash) async {
    final response = await _call('eth_getTransactionReceipt', [txHash]);

    if (response['result'] == null) {
      return TransactionReceipt(
        hash: txHash,
        status: TransactionStatus.pending,
      );
    }

    final result = response['result'] as Map<String, dynamic>;
    final status = result['status'] as String;

    return TransactionReceipt(
      hash: txHash,
      status: status == '0x1' ? TransactionStatus.success : TransactionStatus.failed,
      blockNumber: result['blockNumber'] != null
          ? int.parse(result['blockNumber'] as String, radix: 16)
          : null,
      gasUsed: int.parse(result['gasUsed'] as String, radix: 16),
      logs: (result['logs'] as List? ?? [])
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );
  }

  /// Wait for transaction confirmation
  Future<TransactionReceipt> waitForConfirmation(
    String txHash, {
    int confirmations = 1,
    int timeoutSeconds = 60,
  }) async {
    final startTime = DateTime.now();

    while (DateTime.now().difference(startTime).inSeconds < timeoutSeconds) {
      final receipt = await getTransactionStatus(txHash);

      if (receipt.blockNumber != null) {
        final currentBlock = await _getBlockNumber();
        if (currentBlock - receipt.blockNumber! >= confirmations) {
          return receipt;
        }
      }

      await Future.delayed(const Duration(seconds: 1));
    }

    throw Exception('Transaction confirmation timeout');
  }

  /// Get transaction details
  Future<TransactionInfo?> getTransaction(String txHash) async {
    final response = await _call('eth_getTransactionByHash', [txHash]);

    if (response['result'] == null) return null;

    final result = response['result'] as Map<String, dynamic>;

    return TransactionInfo(
      hash: txHash,
      from: result['from'] as String,
      to: result['to'] as String?,
      value: int.parse(result['value'] as String, radix: 16) / 1e18,
      data: result['input'] as String,
      nonce: int.parse(result['nonce'] as String, radix: 16),
      gasPrice: int.parse(result['gasPrice'] as String, radix: 16) / 1e9,
      gasLimit: int.parse(result['gas'] as String, radix: 16),
    );
  }

  // ===========================================================================
  // BALANCE & TOKEN OPERATIONS
  // ===========================================================================

  /// Get ETH/REChain balance
  Future<double> getBalance(String address) async {
    final response = await _call('eth_getBalance', [address, 'latest']);

    if (response['error'] != null) {
      throw Exception(response['error']['message']);
    }

    final balanceWei = int.parse(response['result'] as String, radix: 16);
    return balanceWei / 1e18;
  }

  /// Get ERC-20 token balance
  Future<double> getErc20Balance({
    required String contractAddress,
    required String walletAddress,
    required int decimals,
  }) async {
    final data = _encodeErc20BalanceOf(walletAddress);

    final response = await _call('eth_call', [
      {'to': contractAddress, 'data': data},
      'latest',
    ]);

    if (response['error'] != null) {
      throw Exception(response['error']['message']);
    }

    final balance = int.parse(
      (response['result'] as String).substring(2),
      radix: 16,
    );

    return balance / pow(10, decimals);
  }

  /// Get token metadata (name, symbol, decimals)
  Future<TokenMetadata> getTokenMetadata(String contractAddress) async {
    final name = _callContractRead(
      contractAddress,
      _erc20NameSelector,
    );
    final symbol = _callContractRead(
      contractAddress,
      _erc20SymbolSelector,
    );
    final decimals = _callContractRead(
      contractAddress,
      _erc20DecimalsSelector,
    );

    return TokenMetadata(
      address: contractAddress,
      name: name,
      symbol: symbol,
      decimals: decimals,
    );
  }

  // ===========================================================================
  // GAS & NETWORK
  // ===========================================================================

  /// Get current gas price
  Future<double> getGasPrice() async {
    return await _getGasPrice();
  }

  /// Estimate gas for a transaction
  Future<int> estimateGas({
    required String from,
    required String to,
    String? data,
    double? value,
  }) async {
    return await _estimateGas(
      from: from,
      to: to,
      data: data,
      value: value,
    );
  }

  /// Get current block number
  Future<int> _getBlockNumber() async {
    final response = await _call('eth_blockNumber', []);
    return int.parse(response['result'] as String, radix: 16);
  }

  // ===========================================================================
  // HELPER METHODS
  // ===========================================================================

  Future<int> _getNonce(String address) async {
    final response = await _call('eth_getTransactionCount', [address, 'pending']);
    return int.parse(response['result'] as String, radix: 16);
  }

  Future<double> _getGasPrice() async {
    final response = await _call('eth_gasPrice', []);
    return int.parse(response['result'] as String, radix: 16) / 1e9;
  }

  Future<int> _getChainId() async {
    final response = await _call('eth_chainId', []);
    return int.parse(response['result'] as String, radix: 16);
  }

  Future<int> _estimateGas({
    required String from,
    required String to,
    String? data,
    double? value,
  }) async {
    final params = <String, dynamic>{
      'from': from,
      'to': to,
      'data': data ?? '0x',
      'value': value != null ? _toHex((value * 1e18).toInt()) : null,
    }..removeWhere((key, value) => value == null);

    final response = await _call('eth_estimateGas', [params]);
    return int.parse(response['result'] as String, radix: 16);
  }

  Future<Map<String, dynamic>> _call(String method, List<dynamic> params) async {
    final response = await http.post(
      Uri.parse(rpcUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'jsonrpc': '2.0',
        'id': 1,
        'method': method,
        'params': params,
      }),
    );

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  String _callContractRead(String to, String data) {
    // Simplified - returns empty for now
    return '';
  }

  String _toHex(int value) {
    return '0x${value.toRadixString(16)}';
  }

  String _encodeErc20Transfer(String to, int amount) {
    final methodId = '0xa9059cbb'; // transfer(address,uint256)
    final paddedTo = to.substring(2).padLeft(64, '0');
    final paddedAmount = amount.toRadixString(16).padLeft(64, '0');
    return '0x$methodId$paddedTo$paddedAmount';
  }

  String _encodeErc20BalanceOf(String owner) {
    final methodId = '0x70a08231'; // balanceOf(address)
    final paddedOwner = owner.substring(2).padLeft(64, '0');
    return '0x$methodId$paddedOwner';
  }

  // ERC-20 selectors
  static const _erc20NameSelector = '0x06fdde03';
  static const _erc20SymbolSelector = '0x95d89b41';
  static const _erc20DecimalsSelector = '0x313ce567';
}

/// Transaction receipt
class TransactionReceipt {
  final String hash;
  final TransactionStatus status;
  final int? blockNumber;
  final int? gasUsed;
  final List<Map<String, dynamic>> logs;

  TransactionReceipt({
    required this.hash,
    required this.status,
    this.blockNumber,
    this.gasUsed,
    this.logs = const [],
  });

  bool get isSuccess => status == TransactionStatus.success;
  bool get isFailed => status == TransactionStatus.failed;
  bool get isPending => status == TransactionStatus.pending;
}

/// Transaction status
enum TransactionStatus {
  pending,
  success,
  failed,
}

/// Transaction info
class TransactionInfo {
  final String hash;
  final String from;
  final String? to;
  final double value;
  final String data;
  final int nonce;
  final double gasPrice;
  final int gasLimit;

  TransactionInfo({
    required this.hash,
    required this.from,
    this.to,
    required this.value,
    required this.data,
    required this.nonce,
    required this.gasPrice,
    required this.gasLimit,
  });

  /// Get transaction URL on explorer
  String getExplorerUrl(String baseUrl) {
    return '$baseUrl/tx/$hash';
  }
}

/// Token metadata
class TokenMetadata {
  final String address;
  final String name;
  final String symbol;
  final int decimals;

  TokenMetadata({
    required this.address,
    required this.name,
    required this.symbol,
    required this.decimals,
  });
}

/// Web3 signature utility
class Web3Signature {
  /// Sign a message
  static String signMessage(String message, String privateKey) {
    // This is a simplified example
    // In production, use web3dart or ethers.dart
    final bytes = utf8.encode(message);
    final hash = crypto.sha256.convert(bytes).bytes;

    // Sign the hash (simplified)
    return '0x${base64Encode(hash).replaceAll(RegExp(r'[+/=]'), '').substring(0, 130)}';
  }

  /// Recover address from signature
  static String recoverAddress(String message, String signature) {
    // Simplified - in production use proper recovery
    return '0x${signature.substring(2, 42)}';
  }

  /// Validate address format
  static bool isValidAddress(String address) {
    return RegExp(r'^0x[a-fA-F0-9]{40}$').hasMatch(address);
  }

  /// Validate private key format
  static bool isValidPrivateKey(String privateKey) {
    return RegExp(r'^0x[a-fA-F0-9]{64}$').hasMatch(privateKey);
  }
}

