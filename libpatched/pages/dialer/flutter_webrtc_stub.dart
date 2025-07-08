// Stub implementation for flutter_webrtc for dialer (hiding VideoRenderer)
import 'dart:async';
import 'dart:html' as html;

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

  Future<void> close() async {
    try {
      _connection?.close();
    } catch (e) {
      // Stub implementation
    }
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

// Video renderer stub (hidden for web)
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
}

// Video view object fit enum
enum RTCVideoViewObjectFit {
  RTCVideoViewObjectFitContain,
  RTCVideoViewObjectFitCover,
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