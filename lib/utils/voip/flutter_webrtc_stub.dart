import 'dart:async';

class MediaDevices {
  Future<List<String>> getUserMedia([Map<String, dynamic>? constraints]) async {
    return [];
  }
}

class RTCVideoRenderer {
  Future<void> initialize() async {}
  set srcObject(dynamic stream) {}
  void dispose() {}
}

class RTCVideoView extends StatelessWidget {
  final RTCVideoRenderer renderer;
  final bool mirror;
  final Object? filterQuality;
  final Object? objectFit;
  final Widget Function(BuildContext)? placeholderBuilder;

  const RTCVideoView(
    this.renderer, {
    this.mirror = false,
    this.filterQuality,
    this.objectFit,
    this.placeholderBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // Empty container for web stub
  }
}

Future<dynamic> createPeerConnection(
    Map<String, dynamic> configuration, [
    Map<String, dynamic> constraints = const {},
  ]) async {
  return null;
}

final MediaDevices navigator = MediaDevices();
