// Stub implementation for flutter_webrtc on mobile platforms (no dart:html import)
import 'dart:async';
import 'package:flutter/widgets.dart';

// Basic WebRTC interfaces stub for mobile

class MediaStream {
  final String id;
  final List<MediaStreamTrack> tracks;

  MediaStream({this.id = '', this.tracks = const []});

  List<MediaStreamTrack> getVideoTracks() {
    return [];
  }

  List<MediaStreamTrack> getAudioTracks() {
    return [];
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
  final String kind;
  final String id;
  final bool enabled;

  MediaStreamTrack({this.kind = '', this.id = '', this.enabled = true});

  Future<void> stop() async {
    // Stub implementation
  }
}

class RTCPeerConnection {
  final Map<String, dynamic> configuration;

  RTCPeerConnection(this.configuration);

  static Future<RTCPeerConnection> createPeerConnection(
    Map<String, dynamic> configuration,
  ) async {
    return RTCPeerConnection(configuration);
  }

  Future<RTCSessionDescription> createOffer([Map<String, dynamic>? constraints]) async {
    return RTCSessionDescription('', 'offer');
  }

  Future<RTCSessionDescription> createAnswer([Map<String, dynamic>? constraints]) async {
    return RTCSessionDescription('', 'answer');
  }

  Future<void> setLocalDescription(RTCSessionDescription description) async {
    // Stub implementation
  }

  Future<void> setRemoteDescription(RTCSessionDescription description) async {
    // Stub implementation
  }

  Future<void> addIceCandidate(RTCIceCandidate candidate) async {
    // Stub implementation
  }

  void addEventListener(String type, Function callback) {
    // Stub implementation
  }

  void removeEventListener(String type, Function callback) {
    // Stub implementation
  }

  Future<void> close() async {
    // Stub implementation
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

enum RTCVideoViewObjectFit {
  RTCVideoViewObjectFitContain,
  RTCVideoViewObjectFitCover,
}

class CameraSwitcher {
  static Future<MediaStream?> switchCamera(MediaStream? currentStream) async {
    // Stub implementation
    return null;
  }

  static Future<MediaStream?> getDisplayMedia() async {
    // Stub implementation
    return null;
  }
}

Future<RTCPeerConnection> createPeerConnection(
  Map<String, dynamic> configuration, [
  Map<String, dynamic> constraints = const {},
]) => RTCPeerConnection.createPeerConnection(configuration);
