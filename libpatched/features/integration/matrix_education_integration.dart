import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';

/// Matrix Education Integration Service
/// Provides education features for Matrix communication
class MatrixEducationIntegration {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;
  final Client? _matrixClient;
  
  // Service status
  bool _isInitialized = false;
  String? _lastError;
  
  // Education services
  bool _virtualClassroomsEnabled = false;
  bool _assignmentManagementEnabled = false;
  bool _studentTeacherCommunicationEnabled = false;
  bool _contentDeliveryEnabled = false;
  bool _gradingSystemEnabled = false;
  bool _attendanceTrackingEnabled = false;
  bool _collaborativeLearningEnabled = false;
  bool _parentCommunicationEnabled = false;

  MatrixEducationIntegration({
    required String apiKey,
    Client? matrixClient,
    String baseUrl = 'https://api.matrix-education.org',
    http.Client? client,
  })  : _apiKey = apiKey,
        _matrixClient = matrixClient,
        _baseUrl = baseUrl,
        _client = client ?? http.Client();

  /// Initialize all Matrix education services
  Future<void> initialize() async {
    try {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Initializing Matrix education services...');
      }

      // Test connection to Matrix Education API
      final isAvailable = await _testConnection();
      if (!isAvailable) {
        throw Exception('Matrix Education API is not available');
      }

      // Initialize individual services
      await _initializeVirtualClassrooms();
      await _initializeAssignmentManagement();
      await _initializeStudentTeacherCommunication();
      await _initializeContentDelivery();
      await _initializeGradingSystem();
      await _initializeAttendanceTracking();
      await _initializeCollaborativeLearning();
      await _initializeParentCommunication();

      _isInitialized = true;
      _lastError = null;

      if (kDebugMode) {
        print('[MatrixEducationIntegration] Matrix education services initialized successfully');
      }
    } catch (e) {
      _lastError = e.toString();
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Initialization failed: $e');
      }
      rethrow;
    }
  }

  /// Test connection to Matrix Education API
  Future<bool> _testConnection() async {
    try {
      final response = await _makeRequest('GET', '/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Initialize Virtual Classrooms
  Future<void> _initializeVirtualClassrooms() async {
    try {
      final response = await _makeRequest('POST', '/education/classrooms/initialize');
      if (response.statusCode == 200) {
        _virtualClassroomsEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Virtual classrooms initialization failed: $e');
      }
    }
  }

  /// Initialize Assignment Management
  Future<void> _initializeAssignmentManagement() async {
    try {
      final response = await _makeRequest('POST', '/education/assignments/initialize');
      if (response.statusCode == 200) {
        _assignmentManagementEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Assignment management initialization failed: $e');
      }
    }
  }

  /// Initialize Student Teacher Communication
  Future<void> _initializeStudentTeacherCommunication() async {
    try {
      final response = await _makeRequest('POST', '/education/communication/initialize');
      if (response.statusCode == 200) {
        _studentTeacherCommunicationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Student teacher communication initialization failed: $e');
      }
    }
  }

  /// Initialize Content Delivery
  Future<void> _initializeContentDelivery() async {
    try {
      final response = await _makeRequest('POST', '/education/content/initialize');
      if (response.statusCode == 200) {
        _contentDeliveryEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Content delivery initialization failed: $e');
      }
    }
  }

  /// Initialize Grading System
  Future<void> _initializeGradingSystem() async {
    try {
      final response = await _makeRequest('POST', '/education/grading/initialize');
      if (response.statusCode == 200) {
        _gradingSystemEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Grading system initialization failed: $e');
      }
    }
  }

  /// Initialize Attendance Tracking
  Future<void> _initializeAttendanceTracking() async {
    try {
      final response = await _makeRequest('POST', '/education/attendance/initialize');
      if (response.statusCode == 200) {
        _attendanceTrackingEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Attendance tracking initialization failed: $e');
      }
    }
  }

  /// Initialize Collaborative Learning
  Future<void> _initializeCollaborativeLearning() async {
    try {
      final response = await _makeRequest('POST', '/education/collaboration/initialize');
      if (response.statusCode == 200) {
        _collaborativeLearningEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Collaborative learning initialization failed: $e');
      }
    }
  }

  /// Initialize Parent Communication
  Future<void> _initializeParentCommunication() async {
    try {
      final response = await _makeRequest('POST', '/education/parents/initialize');
      if (response.statusCode == 200) {
        _parentCommunicationEnabled = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('[MatrixEducationIntegration] Parent communication initialization failed: $e');
      }
    }
  }

  /// Get service status
  Map<String, bool> get serviceStatus => {
    'virtual_classrooms': _virtualClassroomsEnabled,
    'assignment_management': _assignmentManagementEnabled,
    'student_teacher_communication': _studentTeacherCommunicationEnabled,
    'content_delivery': _contentDeliveryEnabled,
    'grading_system': _gradingSystemEnabled,
    'attendance_tracking': _attendanceTrackingEnabled,
    'collaborative_learning': _collaborativeLearningEnabled,
    'parent_communication': _parentCommunicationEnabled,
  };

  /// Virtual Classrooms - Create classroom
  Future<Map<String, dynamic>> createVirtualClassroom({
    required String className,
    required String subject,
    required String teacherId,
    required List<String> studentIds,
    Map<String, dynamic>? classroomConfig,
  }) async {
    if (!_virtualClassroomsEnabled) {
      throw Exception('Virtual classrooms is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/classrooms/create',
        body: {
          'class_name': className,
          'subject': subject,
          'teacher_id': teacherId,
          'student_ids': studentIds,
          'classroom_config': classroomConfig ?? {
            'max_participants': 30,
            'recording_enabled': true,
            'chat_enabled': true,
            'screen_sharing': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create virtual classroom: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Virtual Classrooms - Start class session
  Future<Map<String, dynamic>> startClassSession({
    required String classroomId,
    required String teacherId,
    Map<String, dynamic>? sessionConfig,
  }) async {
    if (!_virtualClassroomsEnabled) {
      throw Exception('Virtual classrooms is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/classrooms/start-session',
        body: {
          'classroom_id': classroomId,
          'teacher_id': teacherId,
          'session_config': sessionConfig ?? {
            'duration': 60,
            'auto_record': true,
            'attendance_tracking': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to start class session: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Assignment Management - Create assignment
  Future<Map<String, dynamic>> createAssignment({
    required String title,
    required String description,
    required String classroomId,
    required DateTime dueDate,
    Map<String, dynamic>? requirements,
    Map<String, dynamic>? gradingCriteria,
  }) async {
    if (!_assignmentManagementEnabled) {
      throw Exception('Assignment management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/assignments/create',
        body: {
          'title': title,
          'description': description,
          'classroom_id': classroomId,
          'due_date': dueDate.toIso8601String(),
          if (requirements != null) 'requirements': requirements,
          if (gradingCriteria != null) 'grading_criteria': gradingCriteria,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create assignment: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Assignment Management - Submit assignment
  Future<Map<String, dynamic>> submitAssignment({
    required String assignmentId,
    required String studentId,
    required Map<String, dynamic> submission,
    List<Map<String, dynamic>>? attachments,
  }) async {
    if (!_assignmentManagementEnabled) {
      throw Exception('Assignment management is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/assignments/submit',
        body: {
          'assignment_id': assignmentId,
          'student_id': studentId,
          'submission': submission,
          if (attachments != null) 'attachments': attachments,
          'submission_time': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to submit assignment: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Student Teacher Communication - Send message
  Future<Map<String, dynamic>> sendEducationalMessage({
    required String senderId,
    required String recipientId,
    required String message,
    String? messageType,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_studentTeacherCommunicationEnabled) {
      throw Exception('Student teacher communication is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/communication/send-message',
        body: {
          'sender_id': senderId,
          'recipient_id': recipientId,
          'message': message,
          'message_type': messageType ?? 'text',
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send educational message: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Content Delivery - Upload educational content
  Future<Map<String, dynamic>> uploadEducationalContent({
    required String title,
    required String contentType,
    required List<int> contentData,
    required String classroomId,
    Map<String, dynamic>? metadata,
  }) async {
    if (!_contentDeliveryEnabled) {
      throw Exception('Content delivery is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/content/upload',
        body: {
          'title': title,
          'content_type': contentType,
          'content_data': base64Encode(contentData),
          'classroom_id': classroomId,
          if (metadata != null) 'metadata': metadata,
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to upload educational content: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Content Delivery - Share content with students
  Future<Map<String, dynamic>> shareContentWithStudents({
    required String contentId,
    required List<String> studentIds,
    Map<String, dynamic>? accessPermissions,
  }) async {
    if (!_contentDeliveryEnabled) {
      throw Exception('Content delivery is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/content/share',
        body: {
          'content_id': contentId,
          'student_ids': studentIds,
          'access_permissions': accessPermissions ?? {
            'view': true,
            'download': false,
            'comment': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to share content with students: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Grading System - Grade assignment
  Future<Map<String, dynamic>> gradeAssignment({
    required String assignmentId,
    required String studentId,
    required int score,
    required String feedback,
    Map<String, dynamic>? rubricScores,
  }) async {
    if (!_gradingSystemEnabled) {
      throw Exception('Grading system is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/grading/grade',
        body: {
          'assignment_id': assignmentId,
          'student_id': studentId,
          'score': score,
          'feedback': feedback,
          if (rubricScores != null) 'rubric_scores': rubricScores,
          'graded_time': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to grade assignment: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Attendance Tracking - Mark attendance
  Future<Map<String, dynamic>> markAttendance({
    required String classroomId,
    required String studentId,
    required bool present,
    String? notes,
  }) async {
    if (!_attendanceTrackingEnabled) {
      throw Exception('Attendance tracking is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/attendance/mark',
        body: {
          'classroom_id': classroomId,
          'student_id': studentId,
          'present': present,
          if (notes != null) 'notes': notes,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to mark attendance: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Collaborative Learning - Create study group
  Future<Map<String, dynamic>> createStudyGroup({
    required String groupName,
    required String subject,
    required List<String> studentIds,
    Map<String, dynamic>? groupConfig,
  }) async {
    if (!_collaborativeLearningEnabled) {
      throw Exception('Collaborative learning is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/collaboration/create-group',
        body: {
          'group_name': groupName,
          'subject': subject,
          'student_ids': studentIds,
          'group_config': groupConfig ?? {
            'max_members': 10,
            'auto_approve': false,
            'chat_enabled': true,
            'file_sharing': true,
          },
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create study group: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Parent Communication - Send parent notification
  Future<Map<String, dynamic>> sendParentNotification({
    required String studentId,
    required String parentId,
    required String notificationType,
    required String message,
    Map<String, dynamic>? additionalData,
  }) async {
    if (!_parentCommunicationEnabled) {
      throw Exception('Parent communication is not enabled');
    }

    try {
      final response = await _makeRequest(
        'POST',
        '/education/parents/send-notification',
        body: {
          'student_id': studentId,
          'parent_id': parentId,
          'notification_type': notificationType,
          'message': message,
          if (additionalData != null) 'additional_data': additionalData,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to send parent notification: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get education dashboard
  Future<Map<String, dynamic>> getEducationDashboard() async {
    try {
      final response = await _makeRequest('GET', '/education/dashboard');
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get education dashboard: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get student progress
  Future<Map<String, dynamic>> getStudentProgress({
    required String studentId,
    String? subject,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final response = await _makeRequest(
        'GET',
        '/education/students/progress',
        queryParams: {
          'student_id': studentId,
          if (subject != null) 'subject': subject,
          if (startDate != null) 'start_date': startDate.toIso8601String(),
          if (endDate != null) 'end_date': endDate.toIso8601String(),
        },
      );
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to get student progress: ${response.statusCode}');
      }
    } catch (e) {
      _lastError = e.toString();
      rethrow;
    }
  }

  /// Get service health
  Future<Map<String, dynamic>> getHealthStatus() async {
    try {
      final response = await _makeRequest('GET', '/health');
      
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
      'User-Agent': 'REChain-MatrixEducation/1.0',
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