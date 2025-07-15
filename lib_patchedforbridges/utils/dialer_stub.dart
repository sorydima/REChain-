// Stub implementation for dialer
// This file provides empty implementations for dialer functionality

import 'dialer.dart';

/// Stub dialer implementation
class DialerImpl implements Dialer {
  static final DialerImpl _instance = DialerImpl._internal();
  static DialerImpl get instance => _instance;
  
  DialerImpl._internal();

  @override
  Future<void> initialize() async {
    // Stub implementation
  }

  @override
  Future<void> makeCall(String number) async {
    // Stub implementation
  }

  @override
  Future<void> endCall() async {
    // Stub implementation
  }

  @override
  bool get isCallActive => false;

  @override
  String? get currentNumber => null;

  @override
  Future<void> dispose() async {
    // Stub implementation
  }
} 