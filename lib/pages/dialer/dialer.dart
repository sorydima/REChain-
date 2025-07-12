import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import '../../utils/voip/video_renderer.dart';
import '../../utils/voip/flutter_webrtc_stub.dart' show RTCVideoRenderer, RTCVideoViewObjectFit;

class Dialer extends StatefulWidget {
  final CallSession call;

  const Dialer({
    super.key,
    required this.call,
  });

  @override
  State<Dialer> createState() => _DialerState();
}

class _DialerState extends State<Dialer> {
  late CallSession call;
  bool _isMuted = false;
  RTCVideoRenderer? _localRenderer;
  RTCVideoRenderer? _remoteRenderer;

  @override
  void initState() {
    super.initState();
    call = widget.call;
    _initializeRenderers();
  }

  Future<void> _initializeRenderers() async {
    _localRenderer = RTCVideoRenderer();
    _remoteRenderer = RTCVideoRenderer();
    
    await _localRenderer?.initialize();
    await _remoteRenderer?.initialize();
    
    setState(() {});
  }

  @override
  void dispose() {
    _localRenderer?.dispose();
    _remoteRenderer?.dispose();
    super.dispose();
  }

  Future<void> _switchCamera() async {
    try {
      // TODO: Implement camera switching
      print('Camera switching not implemented yet');
    } catch (e) {
      print('Failed to switch camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Video views
            Expanded(
              child: Row(
                children: [
                  // Local video
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: _localRenderer != null
                            ? VideoRenderer(
                                renderer: _localRenderer!,
                                mirror: true,
                                objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                                placeholderBuilder: (context) => Container(
                                  color: Colors.black54,
                                  child: const Center(
                                    child: Icon(
                                      Icons.videocam_off,
                                      color: Colors.white54,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                color: Colors.black54,
                                child: const Center(
                                  child: Icon(
                                    Icons.videocam_off,
                                    color: Colors.white54,
                                    size: 32,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                  
                  // Remote video
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: _remoteRenderer != null
                            ? VideoRenderer(
                                renderer: _remoteRenderer!,
                                objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                                placeholderBuilder: (context) => Container(
                                  color: Colors.black54,
                                  child: const Center(
                                    child: Icon(
                                      Icons.videocam_off,
                                      color: Colors.white54,
                                      size: 48,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                color: Colors.black54,
                                child: const Center(
                                  child: Icon(
                                    Icons.videocam_off,
                                    color: Colors.white54,
                                    size: 48,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Controls
            _buildControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  call.room.id,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  call.state.toString(),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Mute button
          _buildControlButton(
            icon: _isMuted ? Icons.mic_off : Icons.mic,
            onPressed: _toggleMute,
            backgroundColor: _isMuted ? Colors.red : Colors.white24,
          ),
          
          // End call button
          _buildControlButton(
            icon: Icons.call_end,
            onPressed: _endCall,
            backgroundColor: Colors.red,
            size: 64,
          ),
          
          // Switch camera button
          _buildControlButton(
            icon: Icons.switch_camera,
            onPressed: _switchCamera,
            backgroundColor: Colors.white24,
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color backgroundColor,
    double size = 48,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
    });
    // TODO: Implement actual mute functionality
  }

  void _endCall() {
    // TODO: Implement actual end call functionality
    Navigator.of(context).pop();
  }
}
