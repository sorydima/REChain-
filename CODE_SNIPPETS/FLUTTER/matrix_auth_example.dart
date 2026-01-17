import 'package:flutter/foundation.dart';
import 'package:rechain_matrix/rechain_matrix.dart';

/// Matrix Authentication Example
///
/// Demonstrates various authentication methods including:
/// - Password authentication
/// - SSO (Single Sign-On)
/// - Token-based authentication
/// - Refresh tokens
///
/// Usage:
/// ```dart
/// final auth = MatrixAuthExample(homeserverUrl: 'https://matrix.rechain.network');
/// await auth.loginWithPassword(user: '@user:rechain.network', password: 'password');
/// ```
class MatrixAuthExample {
  final String homeserverUrl;
  Client? _client;

  // Token storage keys
  static const String accessTokenKey = 'matrix_access_token';
  static const String refreshTokenKey = 'matrix_refresh_token';
  static const String userIdKey = 'matrix_user_id';
  static const String homeserverKey = 'matrix_homeserver';

  MatrixAuthExample({required this.homeserverUrl});

  /// Create client with stored credentials
  static Future<MatrixAuthExample> createFromStorage({
    required String storageKey,
  }) async {
    // In production, use secure storage like flutter_secure_storage
    // This is a simplified example
    final instance = MatrixAuthExample(
      homeserverUrl: 'https://matrix.rechain.network',
    );

    await instance._initializeFromStorage();
    return instance;
  }

  Future<void> _initializeFromStorage() async {
    _client = Client(
      homeserverUri: Uri.parse(homeserverUrl),
      userID: '', // Will be set after login
    );

    _client!.onLoginStateChanged.add(_handleLoginStateChange);
  }

  void _handleLoginStateChange(LoginState state) {
    if (kDebugMode) {
      print('Login state changed: $state');
    }
  }

  /// Login with username and password
  Future<LoginResponse> loginWithPassword({
    required String user,
    required String password,
    String? deviceName,
    String? initialDeviceId,
  }) async {
    if (_client == null) {
      _client = Client(homeserverUri: Uri.parse(homeserverUrl));
    }

    try {
      final response = await _client!.login(
        LoginType.password,
        user: user,
        password: password,
        initialDeviceDisplayName: deviceName ?? 'REChain Device',
        initialDeviceId: initialDeviceId,
      );

      if (kDebugMode) {
        print('Login successful: ${response.userId}');
        print('Access token received: ${response.accessToken != null}');
      }

      // Store credentials securely in production
      _storeCredentials(
        accessToken: response.accessToken!,
        refreshToken: response.refreshToken,
        userId: response.userId,
      );

      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Login failed: $e');
      }
      rethrow;
    }
  }

  /// Login with SSO (Single Sign-On)
  Future<LoginResponse> loginWithSSO({
    required String ssoProvider,
    String? redirectUri,
    String? deviceName,
  }) async {
    if (_client == null) {
      _client = Client(homeserverUri: Uri.parse(homeserverUrl));
    }

    try {
      // Start SSO flow
      final ssoLoginUrl = await _client!.getSSOLoginUrl(
        ssoProvider,
        redirectUri: redirectUri,
      );

      if (kDebugMode) {
        print(' SSO login URL: $ssoLoginUrl');
      }

      // In a real app, open this URL in a webview and wait for redirect
      // This is a placeholder for the SSO callback handling
      final response = await _client!.login(
        LoginType.sso,
        ssoProvider: ssoProvider,
        initialDeviceDisplayName: deviceName ?? 'REChain SSO Device',
      );

      if (kDebugMode) {
        print('SSO login successful: ${response.userId}');
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print('SSO login failed: $e');
      }
      rethrow;
    }
  }

  /// Login with access token (for token refresh or session restoration)
  Future<void> loginWithToken({
    required String userId,
    required String accessToken,
    String? deviceId,
  }) async {
    if (_client == null) {
      _client = Client(homeserverUri: Uri.parse(homeserverUrl));
    }

    _client!.userID = userId;
    _client!.accessToken = accessToken;
    if (deviceId != null) {
      _client!.deviceId = deviceId;
    }

    try {
      await _client!.start();
      if (kDebugMode) {
        print('Token login successful: $userId');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Token login failed: $e');
      }
      rethrow;
    }
  }

  /// Refresh access token using refresh token
  Future<LoginResponse> refreshToken({
    required String refreshToken,
  }) async {
    if (_client == null) {
      throw Exception('Client not initialized');
    }

    try {
      final response = await _client!.refreshToken(refreshToken);

      if (kDebugMode) {
        print('Token refreshed successfully');
      }

      // Store new tokens
      _storeCredentials(
        accessToken: response.accessToken!,
        refreshToken: response.refreshToken,
        userId: response.userId,
      );

      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Token refresh failed: $e');
      }
      rethrow;
    }
  }

  /// Register a new user
  Future<RegistrationResponse> register({
    required String username,
    required String password,
    String? email,
    Map<String, dynamic>? additionalFields,
  }) async {
    if (_client == null) {
      _client = Client(homeserverUri: Uri.parse(homeserverUrl));
    }

    try {
      final response = await _client!.register(
        username: username,
        password: password,
        email: email,
        additionalFields: additionalFields,
      );

      if (kDebugMode) {
        print('Registration successful: ${response.userId}');
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Registration failed: $e');
      }
      rethrow;
    }
  }

  /// Check if username is available
  Future<bool> checkUsernameAvailable(String username) async {
    if (_client == null) {
      _client = Client(homeserverUri: Uri.parse(homeserverUrl));
    }

    try {
      final available = await _client!.checkUsernameAvailable(username);
      return available;
    } catch (e) {
      if (kDebugMode) {
        print('Username check failed: $e');
      }
      return false;
    }
  }

  /// Get supported login types
  Future<List<LoginType>> getLoginTypes() async {
    if (_client == null) {
      _client = Client(homeserverUri: Uri.parse(homeserverUrl));
    }

    return _client!.supportedLoginTypes;
  }

  /// Logout and revoke tokens
  Future<void> logout() async {
    if (_client == null) return;

    try {
      await _client!.logout();
      _clearStoredCredentials();
      if (kDebugMode) {
        print('Logged out successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Logout failed: $e');
      }
      // Clear local state even if server logout fails
      _clearStoredCredentials();
      rethrow;
    }
  }

  /// Deactivate account
  Future<void> deactivateAccount({
    required String userId,
    required String accessToken,
    String? reason,
    bool eraseData = false,
  }) async {
    if (_client == null) {
      _client = Client(homeserverUri: Uri.parse(homeserverUrl));
    }

    _client!.accessToken = accessToken;

    try {
      await _client!.deactivate(userId, reason: reason, eraseData: eraseData);
      _clearStoredCredentials();
      if (kDebugMode) {
        print('Account deactivated');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Account deactivation failed: $e');
      }
      rethrow;
    }
  }

  /// Get current login state
  LoginState get loginState => _client?.loginState ?? LoginState.loggedOut;

  /// Check if logged in
  bool get isLoggedIn => _client?.isLogged() ?? false;

  /// Get current user ID
  String? get currentUserId => _client?.userID;

  /// Get current device ID
  String? get currentDeviceId => _client?.deviceId;

  /// Get client
  Client? get client => _client;

  /// Store credentials securely
  void _storeCredentials({
    required String accessToken,
    String? refreshToken,
    required String userId,
  }) {
    // In production, use secure storage
    // This is a placeholder implementation
    if (kDebugMode) {
      print('Storing credentials for: $userId');
    }

    // Example using shared_preferences (not secure for tokens in production):
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString(accessTokenKey, accessToken);
    // if (refreshToken != null) {
    //   await prefs.setString(refreshTokenKey, refreshToken);
    // }
    // await prefs.setString(userIdKey, userId);
    // await prefs.setString(homeserverKey, homeserverUrl);
  }

  /// Clear stored credentials
  void _clearStoredCredentials() {
    if (kDebugMode) {
      print('Clearing stored credentials');
    }

    // In production, clear from secure storage
  }

  /// Get stored access token
  Future<String?> getStoredAccessToken() async {
    // In production, retrieve from secure storage
    return null;
  }

  /// Get stored refresh token
  Future<String?> getStoredRefreshToken() async {
    // In production, retrieve from secure storage
    return null;
  }
}

// Login state extension
extension LoginStateExtension on LoginState {
  bool get isLoggedIn => this == LoginState.loggedIn;
  bool get isLoggedOut => this == LoginState.loggedOut;
  bool get isLoggingIn => this == LoginState.loggingIn;
}

