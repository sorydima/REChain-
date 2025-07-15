import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Element Call Integration Service
/// Provides video and voice calling capabilities through Element Call
class ElementCallIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Call features
  bool _voiceCallEnabled = false;
  bool _videoCallEnabled = false;
  bool _screenShareEnabled = false;
  bool _recordingEnabled = false;
  bool _transcriptionEnabled = false;

  ElementCallIntegration({
    required String apiKey,
    String baseUrl = 'https://call.element.io',
    http.Client? client,
  })  : _apiKey = apiKey,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize Element Call services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[ElementCallIntegration] Initializing Element Call services...');
      }

      // Test connection to Element Call API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Element Call API is not available');
      }

      // Initialize call features
      await _initializeVoiceCall();
      await _initializeVideoCall();
      await _initializeScreenShare();
      await _initializeRecording();
      await _initializeTranscription();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[ElementCallIntegration] Element Call services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[ElementCallIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Element Call API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize voice call features
  Future<void> _initializeVoiceCall() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/voice/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _voiceCallEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementCallIntegration] Voice call status: $_voiceCallEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementCallIntegration] Voice call initialization failed: $e');
      }
    }
  }

  /// Initialize video call features
  Future<void> _initializeVideoCall() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/video/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _videoCallEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementCallIntegration] Video call status: $_videoCallEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementCallIntegration] Video call initialization failed: $e');
      }
    }
  }

  /// Initialize screen share features
  Future<void> _initializeScreenShare() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/screenshare/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _screenShareEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementCallIntegration] Screen share status: $_screenShareEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementCallIntegration] Screen share initialization failed: $e');
      }
    }
  }

  /// Initialize recording features
  Future<void> _initializeRecording() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/recording/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _recordingEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementCallIntegration] Recording status: $_recordingEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementCallIntegration] Recording initialization failed: $e');
      }
    }
  }

  /// Initialize transcription features
  Future<void> _initializeTranscription() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/transcription/status');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _transcriptionEnabled = data['enabled'] ?? false;
        
        if (kDebugMode) {
          print('[ElementCallIntegration] Transcription status: $_transcriptionEnabled');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('[ElementCallIntegration] Transcription initialization failed: $e');
      }
    }
  }

  /// Create a new call
  Future<Map<String, dynamic>> createCall({
    required String roomId,
    required String callType, // 'voice' or 'video'
    required List<String> participants,
    Map<String, dynamic>? callOptions,
  }) async {
    if (!_isCallTypeEnabled(callType)) {
      throw Exception('$callType calls are not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/create',
        body: {
          'room_id': roomId,
          'call_type': callType,
          'participants': participants,
          'options': callOptions ?? {
            'audio': true,
            'video': callType == 'video',
            'screen_share': _screenShareEnabled,
            'recording': _recordingEnabled,
            'transcription': _transcriptionEnabled,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create call: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Join an existing call
  Future<Map<String, dynamic>> joinCall({
    required String callId,
    required String userId,
    Map<String, dynamic>? joinOptions,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/$callId/join',
        body: {
          'user_id': userId,
          'options': joinOptions ?? {
            'audio': true,
            'video': true,
            'mute_audio': false,
            'mute_video': false,
            'screen_share': false,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to join call: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Leave a call
  Future<Map<String, dynamic>> leaveCall({
    required String callId,
    required String userId,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/$callId/leave',
        body: {
          'user_id': userId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to leave call: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// End a call
  Future<Map<String, dynamic>> endCall({
    required String callId,
    required String userId,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/$callId/end',
        body: {
          'user_id': userId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to end call: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get call status
  Future<Map<String, dynamic>> getCallStatus({
    required String callId,
  }) async {
    try {
      final response = await _makeRequest('GET', '/api/v1/calls/$callId/status');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get call status: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get call participants
  Future<List<Map<String, dynamic>>> getCallParticipants({
    required String callId,
  }) async {
    try {
      final response = await _makeRequest('GET', '/api/v1/calls/$callId/participants');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['participants'] ?? []);
      } else {
        throw Exception('Failed to get call participants: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Mute/unmute audio
  Future<Map<String, dynamic>> toggleAudio({
    required String callId,
    required String userId,
    required bool muted,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/$callId/audio',
        body: {
          'user_id': userId,
          'muted': muted,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to toggle audio: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Mute/unmute video
  Future<Map<String, dynamic>> toggleVideo({
    required String callId,
    required String userId,
    required bool muted,
  }) async {
    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/$callId/video',
        body: {
          'user_id': userId,
          'muted': muted,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to toggle video: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Start/stop screen sharing
  Future<Map<String, dynamic>> toggleScreenShare({
    required String callId,
    required String userId,
    required bool sharing,
    Map<String, dynamic>? shareOptions,
  }) async {
    if (!_screenShareEnabled) {
      throw Exception('Screen sharing is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/$callId/screenshare',
        body: {
          'user_id': userId,
          'sharing': sharing,
          'options': shareOptions ?? {
            'audio': false,
            'video': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to toggle screen share: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Start call recording
  Future<Map<String, dynamic>> startRecording({
    required String callId,
    required String userId,
    Map<String, dynamic>? recordingOptions,
  }) async {
    if (!_recordingEnabled) {
      throw Exception('Call recording is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/$callId/recording/start',
        body: {
          'user_id': userId,
          'options': recordingOptions ?? {
            'audio': true,
            'video': true,
            'quality': 'high',
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to start recording: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Stop call recording
  Future<Map<String, dynamic>> stopRecording({
    required String callId,
    required String userId,
  }) async {
    if (!_recordingEnabled) {
      throw Exception('Call recording is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/api/v1/calls/$callId/recording/stop',
        body: {
          'user_id': userId,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to stop recording: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get call transcription
  Future<Map<String, dynamic>> getTranscription({
    required String callId,
    Map<String, dynamic>? options,
  }) async {
    if (!_transcriptionEnabled) {
      throw Exception('Call transcription is not enabled');
    }

    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/calls/$callId/transcription',
        queryParams: {
          if (options != null) 'options': jsonEncode(options),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get transcription: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get call statistics
  Future<Map<String, dynamic>> getCallStatistics({
    required String callId,
  }) async {
    try {
      final response = await _makeRequest('GET', '/api/v1/calls/$callId/statistics');

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get call statistics: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get active calls
  Future<List<Map<String, dynamic>>> getActiveCalls({
    String? roomId,
    String? callType,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/api/v1/calls/active',
        queryParams: {
          if (roomId != null) 'room_id': roomId,
          if (callType != null) 'call_type': callType,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data['calls'] ?? []);
      } else {
        throw Exception('Failed to get active calls: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Check if call type is enabled
  bool _isCallTypeEnabled(String callType) {
    switch (callType.toLowerCase()) {
      case 'voice':
        return _voiceCallEnabled;
      case 'video':
        return _videoCallEnabled;
      default:
        return false;
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'voice_call': _voiceCallEnabled,
    'video_call': _videoCallEnabled,
    'screen_share': _screenShareEnabled,
    'recording': _recordingEnabled,
    'transcription': _transcriptionEnabled,
  };

  /// Get service health
  Future<Map<String, dynamic>> getHealthStatus() async {
    try {
      final response = await _makeRequest('GET', '/api/v1/health');
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'status': 'healthy',
          'services': serviceStatus,
          'last_error': _lastError,
          'details': data,
        };
      } else {
        return {
          'status': 'unhealthy',
          'services': serviceStatus,
          'last_error': 'Health check failed',
        };
      }
    } catch (e) {
      return {
        'status': 'error',
        'services': serviceStatus,
        'last_error': e.toString(),
      };
    }
  }

  /// Make HTTP request
  Future<http.Response> _makeRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
  }) async {
    final uri = Uri.parse('$_baseUrl$endpoint').replace(
      queryParameters: queryParams,
    );

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
      'User-Agent': 'REChain-ElementCall/1.0',
    };

    try {
      http.Response response;
      
      switch (method.toUpperCase()) {
        case 'GET':
          response = await _client.get(uri, headers: headers);
          break;
        case 'POST':
          response = await _client.post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          );
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      return response;
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Dispose resources
  Future<void> dispose() async {
    _client.close();
    _isInitialized = false;
  }
} 