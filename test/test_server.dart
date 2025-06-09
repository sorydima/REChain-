import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matrix/matrix.dart';

import '../lib/utils/services_manager.dart';
import '../lib/features/message_scheduling/message_scheduler.dart';

// CORS middleware
Middleware corsHeaders() {
  return (Handler innerHandler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        });
      }

      final response = await innerHandler(request);
      return response.change(headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        ...response.headers,
      });
    };
  };
}

void main() async {
  final app = Router();
  
  // Mock client and services for testing
  final client = Client('test_client');
  final prefs = await SharedPreferences.getInstance();
  final servicesManager = ServicesManager(client: client, store: prefs);

  // Serve static files
  app.get('/', (Request request) async {
    final file = File('test/test_page.html');
    final content = await file.readAsString();
    return Response.ok(
      content,
      headers: {'content-type': 'text/html'},
    );
  });

  // Schedule message endpoint
  app.post('/api/schedule', (Request request) async {
    try {
      final payload = await request.readAsString();
      final data = json.decode(payload);
      
      final messageId = await servicesManager.messageScheduler.scheduleMessage(
        roomId: data['roomId'],
        content: data['content'],
        scheduledTime: DateTime.parse(data['scheduledTime']),
        messageType: MessageType.values.firstWhere(
          (t) => t.name == data['messageType'],
          orElse: () => MessageType.text,
        ),
      );

      return Response.ok(
        json.encode({'messageId': messageId}),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: json.encode({'error': e.toString()}),
        headers: {'content-type': 'application/json'},
      );
    }
  });

  // Get scheduled messages endpoint
  app.get('/api/schedule/<roomId>', (Request request, String roomId) {
    final messages = servicesManager.messageScheduler
        .getScheduledMessagesForRoom(roomId);
    
    return Response.ok(
      json.encode({
        'messages': messages.map((m) => m.toJson()).toList(),
      }),
      headers: {'content-type': 'application/json'},
    );
  });

  // Translation endpoint
  app.post('/api/translate', (Request request) async {
    try {
      final payload = await request.readAsString();
      final data = json.decode(payload);
      
      final result = await servicesManager.translationService.translateText(
        data['text'],
        targetLanguage: data['targetLanguage'],
        sourceLanguage: data['sourceLanguage'],
      );

      return Response.ok(
        json.encode(result.toJson()),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: json.encode({'error': e.toString()}),
        headers: {'content-type': 'application/json'},
      );
    }
  });

  // Security endpoints
  app.get('/api/security/audit', (Request request) async {
    try {
      await servicesManager.performSecurityAudit();
      return Response.ok(
        json.encode({'status': 'completed'}),
        headers: {'content-type': 'application/json'},
      );
    } catch (e) {
      return Response.internalServerError(
        body: json.encode({'error': e.toString()}),
        headers: {'content-type': 'application/json'},
      );
    }
  });

  final handler = Pipeline()
      .addMiddleware(corsHeaders())
      .addMiddleware(logRequests())
      .addHandler(app);

  final server = await serve(handler, 'localhost', 3000);
  print('Server running on http://localhost:${server.port}');
}
