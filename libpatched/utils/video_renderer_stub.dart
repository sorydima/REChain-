// Stub implementation for video renderer
// This file provides empty implementations for video renderer functionality

import 'video_renderer.dart';

/// Stub video renderer implementation
class VideoRendererImpl implements VideoRenderer {
  static final VideoRendererImpl _instance = VideoRendererImpl._internal();
  static VideoRendererImpl get instance => _instance;
  
  VideoRendererImpl._internal();

  @override
  Future<void> initialize() async {
    // Stub implementation
  }

  @override
  Future<void> renderFrame(dynamic frame) async {
    // Stub implementation
  }

  @override
  Future<void> setSize(int width, int height) async {
    // Stub implementation
  }

  @override
  Future<void> dispose() async {
    // Stub implementation
  }
} 