import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

/// Biometric Authentication Service
class BiometricAuthService {
  static final LocalAuthentication _localAuth = LocalAuthentication();
  static bool _isInitialized = false;

  /// Initialize biometric authentication
  static Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Check if device supports biometric authentication
      final isAvailable = await _localAuth.canCheckBiometrics;
      final isDeviceSupported = await _localAuth.isDeviceSupported();

      if (kDebugMode) {
        print('Biometric Auth - Available: $isAvailable, Supported: $isDeviceSupported');
      }

      if (!isAvailable || !isDeviceSupported) {
        throw Exception('Biometric authentication not available on this device');
      }

      _isInitialized = true;
    } catch (e) {
      throw Exception('Failed to initialize biometric authentication: $e');
    }
  }

  /// Get available biometric types
  static Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      await initialize();
      
      final availableBiometrics = await _localAuth.getAvailableBiometrics();
      
      if (kDebugMode) {
        print('Available biometrics: $availableBiometrics');
      }

      return availableBiometrics;
    } catch (e) {
      throw Exception('Failed to get available biometrics: $e');
    }
  }

  /// Check if biometric authentication is available
  static Future<bool> isBiometricAvailable() async {
    try {
      await initialize();
      
      final isAvailable = await _localAuth.canCheckBiometrics;
      final isDeviceSupported = await _localAuth.isDeviceSupported();
      
      return isAvailable && isDeviceSupported;
    } catch (e) {
      return false;
    }
  }

  /// Authenticate using biometrics
  static Future<bool> authenticate({
    String reason = 'Please authenticate to access REChain',
    String cancelText = 'Cancel',
    String fallbackTitle = 'Use PIN',
    bool allowCredentials = true,
  }) async {
    try {
      await initialize();

      final isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        throw Exception('Biometric authentication not available');
      }

      final result = await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
          sensitiveTransaction: true,
        ),
      );

      if (kDebugMode) {
        print('Biometric authentication result: $result');
      }

      return result;
    } catch (e) {
      if (kDebugMode) {
        print('Biometric authentication failed: $e');
      }
      return false;
    }
  }

  /// Authenticate with specific biometric type
  static Future<bool> authenticateWithBiometric({
    required BiometricType biometricType,
    String reason = 'Please authenticate to access REChain',
  }) async {
    try {
      await initialize();

      final availableBiometrics = await getAvailableBiometrics();
      if (!availableBiometrics.contains(biometricType)) {
        throw Exception('$biometricType not available on this device');
      }

      final result = await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          sensitiveTransaction: true,
        ),
      );

      return result;
    } catch (e) {
      if (kDebugMode) {
        print('Biometric authentication failed: $e');
      }
      return false;
    }
  }

  /// Authenticate for sensitive operations (transactions, etc.)
  static Future<bool> authenticateForSensitiveOperation({
    required String operation,
    String reason = 'Please authenticate to complete this operation',
  }) async {
    try {
      await initialize();

      final customReason = '$reason: $operation';
      
      final result = await _localAuth.authenticate(
        localizedReason: customReason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
          sensitiveTransaction: true,
        ),
      );

      if (kDebugMode) {
        print('Sensitive operation authentication result: $result');
      }

      return result;
    } catch (e) {
      if (kDebugMode) {
        print('Sensitive operation authentication failed: $e');
      }
      return false;
    }
  }

  /// Authenticate for wallet access
  static Future<bool> authenticateForWalletAccess({
    required String walletName,
  }) async {
    return authenticateForSensitiveOperation(
      operation: 'Access wallet: $walletName',
      reason: 'Please authenticate to access your wallet',
    );
  }

  /// Authenticate for transaction signing
  static Future<bool> authenticateForTransaction({
    required String transactionType,
    required double amount,
    required String recipient,
  }) async {
    return authenticateForSensitiveOperation(
      operation: 'Sign $transactionType transaction of $amount to $recipient',
      reason: 'Please authenticate to sign this transaction',
    );
  }

  /// Authenticate for settings changes
  static Future<bool> authenticateForSettings({
    required String settingName,
  }) async {
    return authenticateForSensitiveOperation(
      operation: 'Change setting: $settingName',
      reason: 'Please authenticate to change this setting',
    );
  }

  /// Check if user has enrolled biometrics
  static Future<bool> hasEnrolledBiometrics() async {
    try {
      await initialize();
      
      final availableBiometrics = await getAvailableBiometrics();
      return availableBiometrics.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Get biometric strength score
  static Future<int> getBiometricStrengthScore() async {
    try {
      await initialize();
      
      final availableBiometrics = await getAvailableBiometrics();
      int score = 0;

      // Score based on available biometric types
      for (final biometric in availableBiometrics) {
        switch (biometric) {
          case BiometricType.face:
            score += 30;
            break;
          case BiometricType.fingerprint:
            score += 25;
            break;
          case BiometricType.iris:
            score += 35;
            break;
          default:
            score += 10;
        }
      }

      // Cap at 100
      return score.clamp(0, 100);
    } catch (e) {
      return 0;
    }
  }

  /// Get authentication status
  static Future<BiometricAuthStatus> getAuthStatus() async {
    try {
      await initialize();
      
      final isAvailable = await isBiometricAvailable();
      final hasEnrolled = await hasEnrolledBiometrics();
      final availableBiometrics = await getAvailableBiometrics();
      final strengthScore = await getBiometricStrengthScore();

      return BiometricAuthStatus(
        isAvailable: isAvailable,
        hasEnrolled: hasEnrolled,
        availableBiometrics: availableBiometrics,
        strengthScore: strengthScore,
        isEnabled: isAvailable && hasEnrolled,
      );
    } catch (e) {
      return BiometricAuthStatus(
        isAvailable: false,
        hasEnrolled: false,
        availableBiometrics: [],
        strengthScore: 0,
        isEnabled: false,
      );
    }
  }

  /// Stop authentication (cancel ongoing auth)
  static Future<void> stopAuthentication() async {
    try {
      await _localAuth.stopAuthentication();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to stop authentication: $e');
      }
    }
  }
}

/// Biometric Authentication Status
class BiometricAuthStatus {
  final bool isAvailable;
  final bool hasEnrolled;
  final List<BiometricType> availableBiometrics;
  final int strengthScore;
  final bool isEnabled;

  BiometricAuthStatus({
    required this.isAvailable,
    required this.hasEnrolled,
    required this.availableBiometrics,
    required this.strengthScore,
    required this.isEnabled,
  });

  /// Get primary biometric type
  BiometricType? get primaryBiometric {
    if (availableBiometrics.isEmpty) return null;
    
    // Priority order: iris > face > fingerprint > others
    if (availableBiometrics.contains(BiometricType.iris)) {
      return BiometricType.iris;
    } else if (availableBiometrics.contains(BiometricType.face)) {
      return BiometricType.face;
    } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
      return BiometricType.fingerprint;
    } else {
      return availableBiometrics.first;
    }
  }

  /// Get biometric type name
  String getBiometricTypeName(BiometricType type) {
    switch (type) {
      case BiometricType.face:
        return 'Face ID';
      case BiometricType.fingerprint:
        return 'Fingerprint';
      case BiometricType.iris:
        return 'Iris';
      case BiometricType.strong:
        return 'Strong Biometric';
      case BiometricType.weak:
        return 'Weak Biometric';
      default:
        return 'Biometric';
    }
  }

  /// Get strength level
  String getStrengthLevel() {
    if (strengthScore >= 80) return 'Very Strong';
    if (strengthScore >= 60) return 'Strong';
    if (strengthScore >= 40) return 'Medium';
    if (strengthScore >= 20) return 'Weak';
    return 'Very Weak';
  }
}

/// Biometric Authentication Manager
class BiometricAuthManager {
  static final BiometricAuthManager _instance = BiometricAuthManager._internal();
  factory BiometricAuthManager() => _instance;
  BiometricAuthManager._internal();

  bool _isEnabled = false;
  BiometricAuthStatus? _authStatus;
  final StreamController<BiometricAuthEvent> _eventController = 
      StreamController<BiometricAuthEvent>.broadcast();

  /// Initialize the manager
  Future<void> initialize() async {
    try {
      await BiometricAuthService.initialize();
      _authStatus = await BiometricAuthService.getAuthStatus();
      _isEnabled = _authStatus?.isEnabled ?? false;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to initialize BiometricAuthManager: $e');
      }
    }
  }

  /// Enable biometric authentication
  Future<bool> enable() async {
    try {
      final isAuthenticated = await BiometricAuthService.authenticate(
        reason: 'Enable biometric authentication for REChain',
      );

      if (isAuthenticated) {
        _isEnabled = true;
        _eventController.add(BiometricAuthEvent.enabled);
        return true;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to enable biometric authentication: $e');
      }
      return false;
    }
  }

  /// Disable biometric authentication
  Future<bool> disable() async {
    try {
      final isAuthenticated = await BiometricAuthService.authenticate(
        reason: 'Disable biometric authentication for REChain',
      );

      if (isAuthenticated) {
        _isEnabled = false;
        _eventController.add(BiometricAuthEvent.disabled);
        return true;
      }

      return false;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to disable biometric authentication: $e');
      }
      return false;
    }
  }

  /// Check if biometric authentication is enabled
  bool get isEnabled => _isEnabled;

  /// Get current auth status
  BiometricAuthStatus? get authStatus => _authStatus;

  /// Get auth events stream
  Stream<BiometricAuthEvent> get events => _eventController.stream;

  /// Authenticate for app access
  Future<bool> authenticateForAppAccess() async {
    if (!_isEnabled) return true; // Skip if not enabled

    return BiometricAuthService.authenticate(
      reason: 'Access REChain',
    );
  }

  /// Authenticate for wallet operations
  Future<bool> authenticateForWalletOperation({
    required String operation,
    required String walletName,
  }) async {
    if (!_isEnabled) return true; // Skip if not enabled

    return BiometricAuthService.authenticateForWalletAccess(
      walletName: walletName,
    );
  }

  /// Authenticate for transaction signing
  Future<bool> authenticateForTransactionSigning({
    required String transactionType,
    required double amount,
    required String recipient,
  }) async {
    if (!_isEnabled) return true; // Skip if not enabled

    return BiometricAuthService.authenticateForTransaction(
      transactionType: transactionType,
      amount: amount,
      recipient: recipient,
    );
  }

  /// Refresh auth status
  Future<void> refreshAuthStatus() async {
    _authStatus = await BiometricAuthService.getAuthStatus();
    _isEnabled = _authStatus?.isEnabled ?? false;
  }

  /// Dispose resources
  void dispose() {
    _eventController.close();
  }
}

/// Biometric Authentication Events
enum BiometricAuthEvent {
  enabled,
  disabled,
  failed,
  success,
} 