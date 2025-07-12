import 'package:flutter/material.dart';

// Use only the stub imports to avoid conflicts
import 'flutter_webrtc_stub.dart' show RTCVideoRenderer, RTCVideoViewObjectFit, MediaStream;

class VideoRenderer extends StatefulWidget {
  final RTCVideoRenderer renderer;
  final bool mirror;
  final FilterQuality filterQuality;
  final RTCVideoViewObjectFit objectFit;
  final Widget Function(BuildContext)? placeholderBuilder;

  const VideoRenderer({
    super.key,
    required this.renderer,
    this.mirror = false,
    this.filterQuality = FilterQuality.medium,
    this.objectFit = RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
    this.placeholderBuilder,
  });

  @override
  State<VideoRenderer> createState() => _VideoRendererState();
}

class _VideoRendererState extends State<VideoRenderer> {
  @override
  Widget build(BuildContext context) {
    // For web, use placeholder or empty container
    if (widget.placeholderBuilder != null) {
      return widget.placeholderBuilder!(context);
    }
    
    // Return a placeholder container for web
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: const Center(
        child: Icon(
          Icons.videocam_off,
          color: Colors.white54,
          size: 48,
        ),
      ),
    );
  }
}

// Helper class for video renderer management
class VideoRendererHelper {
  static Future<RTCVideoRenderer> createRenderer() async {
    final renderer = RTCVideoRenderer();
    await renderer.initialize();
    return renderer;
  }

  static void disposeRenderer(RTCVideoRenderer renderer) {
    renderer.dispose();
  }

  static Future<void> setSrcObject(RTCVideoRenderer renderer, MediaStream? stream) async {
    await renderer.setSrcObject(stream);
  }
}
