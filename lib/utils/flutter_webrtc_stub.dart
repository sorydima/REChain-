// Stub implementation for flutter_webrtc for web compilation
import 'dart:async';
import 'dart:html' as html;
import 'package:flutter/widgets.dart';

// Basic WebRTC interfaces
class MediaStream {
  final html.MediaStream? _stream;
  final String id;
  final List<MediaStreamTrack> tracks;

  MediaStream(this._stream, {this.id = '', this.tracks = const []});
  
  html.MediaStream? get stream => _stream;
  
  List<MediaStreamTrack> getVideoTracks() {
    return _stream?.getVideoTracks().map((track) => MediaStreamTrack(track)).toList() ?? [];
  }
  
  List<MediaStreamTrack> getAudioTracks() {
    return _stream?.getAudioTracks().map((track) => MediaStreamTrack(track)).toList() ?? [];
  }

  Future<void> addTrack(MediaStreamTrack track) async {
    // Stub implementation
  }

  Future<void> removeTrack(MediaStreamTrack track) async {
    // Stub implementation
  }

  Future<void> dispose() async {
    // Stub implementation
  }
}

class MediaStreamTrack {
  final html.MediaStreamTrack? _track;
  final String kind;
  final String id;
  final bool enabled;

  MediaStreamTrack(this._track, {this.kind = '', this.id = '', this.enabled = true});
  
  html.MediaStreamTrack? get track => _track;
  
  Future<void> stop() async {
    _track?.stop();
  }
}

class RTCPeerConnection {
  dynamic _connection;
  final Map<String, dynamic> configuration;

  RTCPeerConnection(this.configuration);

  static Future<RTCPeerConnection> createPeerConnection(
    Map<String, dynamic> configuration,
  ) async {
    try {
      // Use dynamic to avoid type issues with HTML API
      final config = {
        'iceServers': (configuration['iceServers'] as List?)
            ?.map((server) => {
                  'urls': server['urls'] as List<String>,
                  'username': server['username'] as String?,
                  'credential': server['credential'] as String?,
                })
            .toList() ?? [],
      };
      
      // Create connection using dynamic
      final connection = html.RtcPeerConnection(config);
      return RTCPeerConnection(configuration).._connection = connection;
    } catch (e) {
      // Return stub implementation if WebRTC is not available
      return RTCPeerConnection(configuration);
    }
  }

  Future<RTCSessionDescription> createOffer([Map<String, dynamic>? constraints]) async {
    try {
      final offer = await _connection?.createOffer();
      return RTCSessionDescription(
        offer?.sdp ?? '',
        offer?.type ?? 'offer',
      );
    } catch (e) {
      return RTCSessionDescription('', 'offer');
    }
  }

  Future<RTCSessionDescription> createAnswer([Map<String, dynamic>? constraints]) async {
    try {
      final answer = await _connection?.createAnswer();
      return RTCSessionDescription(
        answer?.sdp ?? '',
        answer?.type ?? 'answer',
      );
    } catch (e) {
      return RTCSessionDescription('', 'answer');
    }
  }

  Future<void> setLocalDescription(RTCSessionDescription description) async {
    try {
      await _connection?.setLocalDescription({
        'sdp': description.sdp,
        'type': description.type,
      });
    } catch (e) {
      // Stub implementation
    }
  }

  Future<void> setRemoteDescription(RTCSessionDescription description) async {
    try {
      await _connection?.setRemoteDescription({
        'sdp': description.sdp,
        'type': description.type,
      });
    } catch (e) {
      // Stub implementation
    }
  }

  Future<void> addIceCandidate(RTCIceCandidate candidate) async {
    try {
      await _connection?.addIceCandidate({
        'candidate': candidate.candidate,
        'sdpMid': candidate.sdpMid,
        'sdpMLineIndex': candidate.sdpMLineIndex,
      });
    } catch (e) {
      // Stub implementation
    }
  }

  void addEventListener(String type, Function callback) {
    // Stub implementation
  }

  void removeEventListener(String type, Function callback) {
    // Stub implementation
  }

  Future<void> close() async {
    try {
      _connection?.close();
    } catch (e) {
      // Stub implementation
    }
  }

  Future<void> addStream(MediaStream stream) async {
    // Stub implementation
  }

  Future<void> removeStream(MediaStream stream) async {
    // Stub implementation
  }
}

class RTCSessionDescription {
  final String sdp;
  final String type;

  RTCSessionDescription(this.sdp, this.type);
}

class RTCIceCandidate {
  final String candidate;
  final String? sdpMid;
  final int? sdpMLineIndex;

  RTCIceCandidate(this.candidate, {this.sdpMid, this.sdpMLineIndex});
}

// Video renderer stub
class RTCVideoRenderer {
  static Future<void> initialize() async {
    // Stub implementation
  }

  void dispose() {
    // Stub implementation
  }

  Future<void> setSrcObject(MediaStream? stream) async {
    // Stub implementation
  }

  set srcObject(MediaStream? stream) {
    // Stub implementation
  }
}

// Video view stub
class RTCVideoView extends StatelessWidget {
  final RTCVideoRenderer renderer;
  final bool mirror;
  final FilterQuality filterQuality;
  final RTCVideoViewObjectFit objectFit;
  final Widget Function(BuildContext)? placeholderBuilder;

  const RTCVideoView(
    this.renderer, {
    this.mirror = false,
    this.filterQuality = FilterQuality.medium,
    this.objectFit = RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
    this.placeholderBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return placeholderBuilder?.call(context) ?? Container();
  }
}

// Video view object fit enum
enum RTCVideoViewObjectFit {
  RTCVideoViewObjectFitContain,
  RTCVideoViewObjectFitCover,
}

// Helper class for camera switching
class CameraSwitcher {
  static Future<MediaStream?> switchCamera(MediaStream? currentStream) async {
    try {
      final constraints = {
        'video': {
          'facingMode': 'user', // Switch to front camera
        },
        'audio': true,
      };
      
      final stream = await html.window.navigator.mediaDevices?.getUserMedia(constraints);
      if (stream != null) {
        return MediaStream(stream);
      }
    } catch (e) {
      print('Failed to switch camera: $e');
    }
    return null;
  }

  static Future<MediaStream?> getDisplayMedia() async {
    try {
      final constraints = {
        'video': true,
        'audio': false,
      };
      
      // Use getUserMedia as fallback since getDisplayMedia might not be available
      final stream = await html.window.navigator.mediaDevices?.getUserMedia(constraints);
      if (stream != null) {
        return MediaStream(stream);
      }
    } catch (e) {
      print('Failed to get display media: $e');
    }
    return null;
  }
}

// Helper functions
Future<RTCPeerConnection> createPeerConnection(
  Map<String, dynamic> configuration, [
  Map<String, dynamic> constraints = const {},
]) => RTCPeerConnection.createPeerConnection(configuration);

Future<MediaStream> getUserMedia(Map<String, dynamic> constraints) async {
  try {
    final stream = await html.window.navigator.mediaDevices?.getUserMedia(constraints);
    if (stream != null) {
      return MediaStream(stream);
    }
  } catch (e) {
    print('Failed to get user media: $e');
  }
  throw Exception('Failed to get user media');
}

class Helper {
  static Future<void> switchCamera(MediaStreamTrack track) async {
    await track.stop();
  }
}

// Export the main functions
MediaDevices get mediaDevices => Navigator.mediaDevices;

Future<List<MediaDeviceInfo>> enumerateDevices() async {
  throw UnsupportedError('WebRTC not supported on this platform');
}

class MediaDeviceInfo {
  final String deviceId;
  final String kind;
  final String label;

  MediaDeviceInfo(this.deviceId, this.kind, this.label);
}

class MediaDevices {
  Future<MediaStream> getUserMedia(Map<String, dynamic> constraints) async {
    try {
      final stream = await html.window.navigator.mediaDevices?.getUserMedia(constraints);
      if (stream != null) {
        return MediaStream(stream);
      }
    } catch (e) {
      print('Failed to get user media: $e');
    }
    throw Exception('Failed to get user media');
  }

  Future<List<MediaDeviceInfo>> enumerateDevices() async {
    throw UnsupportedError('WebRTC not supported on this platform');
  }
}

class Navigator {
  static final MediaDevices mediaDevices = MediaDevices();
} 