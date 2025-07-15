// Native platform implementation stub for VOIP plugin
import 'voip_plugin.dart';

/// Native VOIP plugin implementation stub
class VoipPluginImpl implements VoipPlugin {
  static final VoipPluginImpl _instance = VoipPluginImpl._internal();
  static VoipPluginImpl get instance => _instance;

  VoipPluginImpl._internal();

  @override
  Future<void> initialize() async {
    // TODO: Implement native initialization
  }

  @override
  Future<void> startCall(String roomId, String userId) async {
    // TODO: Implement native start call
  }

  @override
  Future<void> endCall() async {
    // TODO: Implement native end call
  }

  @override
  Future<void> joinCall(String roomId) async {
    // TODO: Implement native join call
  }

  @override
  Future<void> leaveCall() async {
    // TODO: Implement native leave call
  }

  @override
  bool get isCallActive => false;

  @override
  String? get currentRoomId => null;

  @override
  Future<void> dispose() async {
    // TODO: Implement native dispose
  }
}
