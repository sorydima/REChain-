import 'dart:core';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:matrix/matrix.dart';
import 'package:webrtc_interface/webrtc_interface.dart' hide Navigator;

import 'package:rechainonline/pages/chat_list/chat_list.dart';

import 'package:rechainonline/pages/dialer/dialer.dart';
import 'package:rechainonline/utils/platform_infos.dart';
import '../../utils/voip/user_media_manager.dart';
import '../widgets/matrix.dart';

import 'flutter_webrtc_stub.dart' if (dart.library.html) 'flutter_webrtc_stub.dart' if (dart.library.io) 'flutter_webrtc_mobile.dart' as webrtc_impl;

// Conditional import for VOIP plugin
// ignore: unused_import
import 'voip_plugin_stub.dart'
    if (dart.library.io) 'voip_plugin_io.dart'
    if (dart.library.html) 'voip_plugin_web.dart';

/// VOIP plugin interface for REChain.
///
/// Provides methods for initializing, starting, joining, and ending calls.
///
/// Example usage:
/// ```dart
/// final voip = VoipPlugin.instance;
/// await voip.initialize();
/// await voip.startCall('roomId', 'userId');
/// ```
abstract class VoipPlugin {
  /// Singleton instance of the VOIP plugin.
  static VoipPlugin get instance => VoipPluginImpl.instance;

  /// Initialize the VOIP plugin.
  Future<void> initialize();

  /// Start a call with the given room and user ID.
  Future<void> startCall(String roomId, String userId);

  /// End the current call.
  Future<void> endCall();

  /// Join an existing call in the given room.
  Future<void> joinCall(String roomId);

  /// Leave the current call.
  Future<void> leaveCall();

  /// Whether a call is currently active.
  bool get isCallActive;

  /// The current call's room ID, if any.
  String? get currentRoomId;

  /// Dispose of VOIP resources.
  Future<void> dispose();
}
