// Conditional import for dialer
// ignore: unused_import
import 'dialer_stub.dart'
    if (dart.library.io) 'dialer_io.dart'
    if (dart.library.html) 'dialer_web.dart';

/// Dialer interface
abstract class Dialer {
  static Dialer get instance => DialerImpl.instance;

  /// Initialize the dialer
  Future<void> initialize();

  /// Make a call
  Future<void> makeCall(String number);

  /// End a call
  Future<void> endCall();

  /// Check if call is active
  bool get isCallActive;

  /// Get current call number
  String? get currentNumber;

  /// Dispose resources
  Future<void> dispose();
} 