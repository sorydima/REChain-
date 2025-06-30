// Conditional import for video renderer
// ignore: unused_import
import 'video_renderer_stub.dart'
    if (dart.library.io) 'video_renderer_io.dart'
    if (dart.library.html) 'video_renderer_web.dart';

/// Video renderer interface
abstract class VideoRenderer {
  static VideoRenderer get instance => VideoRendererImpl.instance;

  /// Initialize the video renderer
  Future<void> initialize();

  /// Render video frame
  Future<void> renderFrame(dynamic frame);

  /// Set video size
  Future<void> setSize(int width, int height);

  /// Dispose resources
  Future<void> dispose();
} 