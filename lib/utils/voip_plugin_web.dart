import 'voip_plugin.dart';

class VoipPluginImpl implements VoipPlugin {
  static final VoipPluginImpl _instance = VoipPluginImpl._internal();
  static VoipPluginImpl get instance => _instance;

  VoipPluginImpl._internal();

  @override
  Future<void> initialize() async => throw UnsupportedError('VOIP not supported on web');
  @override
  Future<void> startCall(String roomId, String userId) async => throw UnsupportedError('VOIP not supported on web');
  @override
  Future<void> endCall() async => throw UnsupportedError('VOIP not supported on web');
  @override
  Future<void> joinCall(String roomId) async => throw UnsupportedError('VOIP not supported on web');
  @override
  Future<void> leaveCall() async => throw UnsupportedError('VOIP not supported on web');
  @override
  bool get isCallActive => false;
  @override
  String? get currentRoomId => null;
  @override
  Future<void> dispose() async {}
} 