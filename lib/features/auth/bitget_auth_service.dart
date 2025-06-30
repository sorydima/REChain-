import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';

/// Bitget Authentication Service
/// Provides Bitget cryptocurrency exchange integration
class BitgetAuthService {
  final String _baseUrl;
  final String _apiKey;
  final String _secretKey;
  final String _passphrase;
  final http.Client _client;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Bitget services
  bool _spotTradingEnabled = false;
  bool _futuresTradingEnabled = false;
  bool _walletManagementEnabled = false;
  bool _orderManagementEnabled = false;
  bool _marketDataEnabled = false;
  bool _copyTradingEnabled = false;
  bool _analyticsEnabled = false;
  bool _stakingEnabled = false;

  // Account state
  Map<String, dynamic>? _accountInfo;
  List<Map<String, dynamic>> _balances = [];
  List<Map<String, dynamic>> _orders = [];
  List<Map<String, dynamic>> _trades = [];
  Map<String, dynamic>? _marketData;

  // Stream controllers for real-time updates
  final StreamController<Map<String, dynamic>> _accountUpdateController = 
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _orderController = 
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _marketDataController = 
      StreamController<Map<String, dynamic>>.broadcast();

  BitgetAuthService({
    required String apiKey,
    required String secretKey,
    required String passphrase,
    String baseUrl = 'https://api.bitget.com',
    http.Client? client,
  })  : _apiKey = apiKey,
        _secretKey = secretKey,
        _passphrase = passphrase,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize Bitget authentication services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[BitgetAuthService] Initializing Bitget authentication services...');
      }

      // Test connection to Bitget API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Bitget API is not available');
      }

      // Initialize individual services
      await _initializeSpotTrading();
      await _initializeFuturesTrading();
      await _initializeWalletManagement();
      await _initializeOrderManagement();
      await _initializeMarketData();
      await _initializeCopyTrading();
      await _initializeAnalytics();
      await _initializeStaking();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[BitgetAuthService] Bitget authentication services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[BitgetAuthService] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Bitget API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/api/spot/v1/public/time');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Spot Trading
  Future<void> _initializeSpotTrading() async {
    try {
      final response = await _makeRequest('GET', '/api/spot/v1/account/assets');
      if (response.statusCode == 200) {
        _spotTradingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BitgetAuthService] Spot trading initialization failed: $e');
      }
    }
  }

  /// Initialize Futures Trading
  Future<void> _initializeFuturesTrading() async {
    try {
      final response = await _makeRequest('GET', '/api/mix/v1/account/accounts');
      if (response.statusCode == 200) {
        _futuresTradingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BitgetAuthService] Futures trading initialization failed: $e');
      }
    }
  }

  /// Initialize Wallet Management
  Future<void> _initializeWalletManagement() async {
    try {
      final response = await _makeRequest('GET', '/api/spot/v1/account/assets');
      if (response.statusCode == 200) {
        _walletManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BitgetAuthService] Wallet management initialization failed: $e');
      }
    }
  }

  /// Initialize Order Management
  Future<void> _initializeOrderManagement() async {
    try {
      final response = await _makeRequest('GET', '/api/spot/v1/trade/orders');
      if (response.statusCode == 200) {
        _orderManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BitgetAuthService] Order management initialization failed: $e');
      }
    }
  }

  /// Initialize Market Data
  Future<void> _initializeMarketData() async {
    try {
      final response = await _makeRequest('GET', '/api/spot/v1/market/tickers');
      if (response.statusCode == 200) {
        _marketDataEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BitgetAuthService] Market data initialization failed: $e');
      }
    }
  }

  /// Initialize Copy Trading
  Future<void> _initializeCopyTrading() async {
    try {
      final response = await _makeRequest('GET', '/api/copy/v1/trader/list');
      if (response.statusCode == 200) {
        _copyTradingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BitgetAuthService] Copy trading initialization failed: $e');
      }
    }
  }

  /// Initialize Analytics
  Future<void> _initializeAnalytics() async {
    try {
      final response = await _makeRequest('GET', '/api/spot/v1/account/bills');
      if (response.statusCode == 200) {
        _analyticsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BitgetAuthService] Analytics initialization failed: $e');
      }
    }
  }

  /// Initialize Staking
  Future<void> _initializeStaking() async {
    try {
      final response = await _makeRequest('GET', '/api/earn/v1/product/list');
      if (response.statusCode == 200) {
        _stakingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BitgetAuthService] Staking initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'spot_trading': _spotTradingEnabled,
    'futures_trading': _futuresTradingEnabled,
    'wallet_management': _walletManagementEnabled,
    'order_management': _orderManagementEnabled,
    'market_data': _marketDataEnabled,
    'copy_trading': _copyTradingEnabled,
    'analytics': _analyticsEnabled,
    'staking': _stakingEnabled,
  };

  /// Get account update stream
  Stream<Map<String, dynamic>> get accountUpdateStream => _accountUpdateController.stream;

  /// Get order stream
  Stream<Map<String, dynamic>> get orderStream => _orderController.stream;

  /// Get market data stream
  Stream<Map<String, dynamic>> get marketDataStream => _marketDataController.stream;

  /// Get account info
  Map<String, dynamic>? get accountInfo => _accountInfo;

  /// Get balances
  List<Map<String, dynamic>> get balances => _balances;

  /// Get orders
  List<Map<String, dynamic>> get orders => _orders;

  /// Get trades
  List<Map<String, dynamic>> get trades => _trades;

  /// Get market data
  Map<String, dynamic>? get marketData => _marketData;

  /// Get account information
  Future<Map<String, dynamic>> getAccountInfo() async {
    try {
      final response = await _makeRequest('GET', '/api/spot/v1/account/account');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _accountInfo = data['data'];
        _accountUpdateController.add(data);
        return data;
      } else {
        throw Exception('Failed to get account info: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get account balances
  Future<List<Map<String, dynamic>>> getAccountBalances() async {
    if (!_walletManagementEnabled) {
      throw Exception('Wallet management is not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/api/spot/v1/account/assets');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _balances = List<Map<String, dynamic>>.from(data['data'] ?? []);
        return _balances;
      } else {
        throw Exception('Failed to get account balances: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Place spot order
  Future<Map<String, dynamic>> placeSpotOrder({
    required String symbol,
    required String side,
    required String orderType,
    required String quantity,
    String? price,
    Map<String, dynamic>? orderParams,
  }) async {
    if (!_spotTradingEnabled) {
      throw Exception('Spot trading is not enabled');
    }

    try {
      final body = {
        'symbol': symbol,
        'side': side,
        'orderType': orderType,
        'quantity': quantity,
        if (price != null) 'price': price,
        if (orderParams != null) ...orderParams,
      };

      final response = await _makeRequest(
        'POST',
        '/api/spot/v1/trade/orders',
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _orders.add(data['data']);
        _orderController.add(data);
        return data;
      } else {
        throw Exception('Failed to place spot order: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Place futures order
  Future<Map<String, dynamic>> placeFuturesOrder({
    required String symbol,
    required String side,
    required String orderType,
    required String quantity,
    String? price,
    Map<String, dynamic>? orderParams,
  }) async {
    if (!_futuresTradingEnabled) {
      throw Exception('Futures trading is not enabled');
    }

    try {
      final body = {
        'symbol': symbol,
        'side': side,
        'orderType': orderType,
        'quantity': quantity,
        if (price != null) 'price': price,
        if (orderParams != null) ...orderParams,
      };

      final response = await _makeRequest(
        'POST',
        '/api/mix/v1/order/placeOrder',
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _orders.add(data['data']);
        _orderController.add(data);
        return data;
      } else {
        throw Exception('Failed to place futures order: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get open orders
  Future<List<Map<String, dynamic>>> getOpenOrders({
    String? symbol,
    String? orderType,
  }) async {
    if (!_orderManagementEnabled) {
      throw Exception('Order management is not enabled');
    }

    try {
      final queryParams = <String, String>{};
      if (symbol != null) queryParams['symbol'] = symbol;
      if (orderType != null) queryParams['orderType'] = orderType;

      final response = await _makeRequest(
        'GET',
        '/api/spot/v1/trade/orders',
        queryParams: queryParams,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['data'] ?? []);
      } else {
        throw Exception('Failed to get open orders: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Cancel order
  Future<Map<String, dynamic>> cancelOrder({
    required String orderId,
    String? symbol,
  }) async {
    if (!_orderManagementEnabled) {
      throw Exception('Order management is not enabled');
    }

    try {
      final body = {
        'orderId': orderId,
        if (symbol != null) 'symbol': symbol,
      };

      final response = await _makeRequest(
        'POST',
        '/api/spot/v1/trade/cancel-order',
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _orderController.add(data);
        return data;
      } else {
        throw Exception('Failed to cancel order: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get market tickers
  Future<List<Map<String, dynamic>>> getMarketTickers({
    String? symbol,
  }) async {
    if (!_marketDataEnabled) {
      throw Exception('Market data is not enabled');
    }

    try {
      final queryParams = <String, String>{};
      if (symbol != null) queryParams['symbol'] = symbol;

      final response = await _makeRequest(
        'GET',
        '/api/spot/v1/market/tickers',
        queryParams: queryParams,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['data'] ?? []);
      } else {
        throw Exception('Failed to get market tickers: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get kline data
  Future<List<Map<String, dynamic>>> getKlineData({
    required String symbol,
    required String period,
    required String startTime,
    required String endTime,
  }) async {
    if (!_marketDataEnabled) {
      throw Exception('Market data is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/spot/v1/market/candles',
        queryParams: {
          'symbol': symbol,
          'period': period,
          'startTime': startTime,
          'endTime': endTime,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['data'] ?? []);
      } else {
        throw Exception('Failed to get kline data: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get copy trading traders
  Future<List<Map<String, dynamic>>> getCopyTradingTraders() async {
    if (!_copyTradingEnabled) {
      throw Exception('Copy trading is not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/api/copy/v1/trader/list');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['data'] ?? []);
      } else {
        throw Exception('Failed to get copy trading traders: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Start copy trading
  Future<Map<String, dynamic>> startCopyTrading({
    required String traderId,
    required String amount,
    Map<String, dynamic>? copyParams,
  }) async {
    if (!_copyTradingEnabled) {
      throw Exception('Copy trading is not enabled');
    }

    try {
      final body = {
        'traderId': traderId,
        'amount': amount,
        if (copyParams != null) ...copyParams,
      };

      final response = await _makeRequest(
        'POST',
        '/api/copy/v1/trader/start',
        body: body,
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to start copy trading: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get staking products
  Future<List<Map<String, dynamic>>> getStakingProducts() async {
    if (!_stakingEnabled) {
      throw Exception('Staking is not enabled');
    }

    try {
      final response = await _makeRequest('GET', '/api/earn/v1/product/list');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['data'] ?? []);
      } else {
        throw Exception('Failed to get staking products: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Stake tokens
  Future<Map<String, dynamic>> stakeTokens({
    required String productId,
    required String amount,
    Map<String, dynamic>? stakingParams,
  }) async {
    if (!_stakingEnabled) {
      throw Exception('Staking is not enabled');
    }

    try {
      final body = {
        'productId': productId,
        'amount': amount,
        if (stakingParams != null) ...stakingParams,
      };

      final response = await _makeRequest(
        'POST',
        '/api/earn/v1/product/subscribe',
        body: body,
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

  /// Get trading history
  Future<List<Map<String, dynamic>>> getTradingHistory({
    String? symbol,
    String? startTime,
    String? endTime,
  }) async {
    if (!_analyticsEnabled) {
      throw Exception('Analytics is not enabled');
    }

    try {
      final queryParams = <String, String>{};
      if (symbol != null) queryParams['symbol'] = symbol;
      if (startTime != null) queryParams['startTime'] = startTime;
      if (endTime != null) queryParams['endTime'] = endTime;

      final response = await _makeRequest(
        'GET',
        '/api/spot/v1/trade/fills',
        queryParams: queryParams,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _trades = List<Map<String, dynamic>>.from(data['data'] ?? []);
        return _trades;
      } else {
        throw Exception('Failed to get trading history: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service health
  Future<Map<String, dynamic>> getHealthStatus() async {
    try {
      final response = await _makeRequest('GET', '/api/spot/v1/public/time');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'status': 'healthy',
          'services': serviceStatus,
          'last_error': _lastError,
          'server_time': data['data'],
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

  /// Generate signature for authenticated requests
  String _generateSignature({
    required String timestamp,
    required String method,
    required String requestPath,
    String? body,
  }) {
    final message = timestamp + method + requestPath + (body ?? '');
    final hmac = Hmac(sha256, utf8.encode(_secretKey));
    final digest = hmac.convert(utf8.encode(message));
    return base64.encode(digest.bytes);
  }

  /// Make HTTP request
  Future<http.Response> _makeRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final requestPath = endpoint + (queryParams != null ? '?${Uri(queryParameters: queryParams).query}' : '');
    
    final uri = Uri.parse('$_baseUrl$endpoint').replace(
      queryParameters: queryParams,
    );

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'ACCESS-KEY': _apiKey,
      'ACCESS-SIGN': _generateSignature(
        timestamp: timestamp,
        method: method,
        requestPath: requestPath,
        body: body != null ? jsonEncode(body) : null,
      ),
      'ACCESS-TIMESTAMP': timestamp,
      'ACCESS-PASSPHRASE': _passphrase,
      'User-Agent': 'REChain-BitgetAuth/1.0',
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
    _accountUpdateController.close();
    _orderController.close();
    _marketDataController.close();
    _isInitialized = false;
  }
} 