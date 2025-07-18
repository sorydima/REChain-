import 'package:flutter/widgets.dart';

enum RTCVideoViewObjectFit {
  RTCVideoViewObjectFitContain,
  RTCVideoViewObjectFitCover,
}

class MediaStream {
  final String id;
  final List<dynamic> tracks;
  
  MediaStream({required this.id, required this.tracks});
  
  void dispose() {
    // Stub implementation
  }
}

class RTCVideoRenderer {
  dynamic srcObject;

  Future<void> initialize() async {
    // Stub implementation
  }

  void dispose() {
    // Stub implementation
  }
  
  Future<void> setSrcObject(MediaStream? stream) async {
    srcObject = stream;
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
    this.filterQuality = FilterQuality.low,
    this.objectFit = RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
    this.placeholderBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // Empty container for web stub
  }
}
