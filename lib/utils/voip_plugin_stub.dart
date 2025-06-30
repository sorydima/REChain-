// Stub implementation for VOIP plugin
// This file provides empty implementations for VOIP functionality

import 'voip_plugin.dart';

/// Stub VOIP plugin implementation
class VoipPluginImpl implements VoipPlugin {
  static final VoipPluginImpl _instance = VoipPluginImpl._internal();
  static VoipPluginImpl get instance => _instance;
  
  VoipPluginImpl._internal();

  @override
  Future<void> initialize() async {
    // Stub implementation
  }

  @override
  Future<void> startCall(String roomId, String userId) async {
    // Stub implementation
  }

  @override
  Future<void> endCall() async {
    // Stub implementation
  }

  @override
  Future<void> joinCall(String roomId) async {
    // Stub implementation
  }

  @override
  Future<void> leaveCall() async {
    // Stub implementation
  }

  @override
  bool get isCallActive => false;

  @override
  String? get currentRoomId => null;

  @override
  Future<void> dispose() async {
    // Stub implementation
  }
} 