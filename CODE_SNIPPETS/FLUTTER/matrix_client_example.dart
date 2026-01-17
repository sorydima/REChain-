import 'package:flutter/foundation.dart';
import 'package:rechain_matrix/rechain_matrix.dart';

/// Matrix Client Example
///
/// A complete example of setting up and using the Matrix client in REChain.
/// This snippet demonstrates authentication, room management, and messaging.
///
/// Usage:
/// ```dart
/// final client = MatrixClientExample.createClient(
///   homeserverUrl: 'https://matrix.rechain.network',
///   userId: '@user:rechain.network',
/// );
/// ```
class MatrixClientExample {
  final String homeserverUrl;
  final String userId;
  Client? _client;

  MatrixClientExample({
    required this.homeserverUrl,
    required this.userId,
  });

  /// Create a new Matrix client with basic authentication
  static Future<MatrixClientExample> createClient({
    required String homeserverUrl,
    required String userId,
    String? accessToken,
  }) async {
    final instance = MatrixClientExample(
      homeserverUrl: homeserverUrl,
      userId: userId,
    );

    await instance._initializeClient(accessToken: accessToken);
    return instance;
  }

  Future<void> _initializeClient({String? accessToken}) async {
    _client = Client(
      homeserverUri: Uri.parse(homeserverUrl),
      userID: userId,
    );

    if (accessToken != null) {
      _client!.accessToken = accessToken;
    }

    // Set up event handlers
    _client!.onEvent.add(_handleEvent);
    _client!.onSyncUpdate.add(_handleSync);
    _client!.onLoginStateChanged.add(_handleLoginStateChange);

    // Start syncing
    await _client!.start();
  }

  /// Handle incoming Matrix events
  void _handleEvent(Event event) {
    if (kDebugMode) {
      print('Received event: ${event.type}');
    }

    switch (event.type) {
      case EventTypes.message:
      case EventTypes.encrypted:
        _handleMessageEvent(event);
        break;
      case EventTypes.typing:
        _handleTypingEvent(event);
        break;
      case EventTypes.presence:
        _handlePresenceEvent(event);
        break;
      default:
        _handleGenericEvent(event);
    }
  }

  void _handleMessageEvent(Event event) {
    if (kDebugMode) {
      print('Message from ${event.senderId}: ${event.content}');
    }
  }

  void _handleTypingEvent(Event event) {
    // Handle typing notifications
  }

  void _handlePresenceEvent(Event event) {
    // Handle presence updates
  }

  void _handleGenericEvent(Event event) {
    if (kDebugMode) {
      print('Unhandled event type: ${event.type}');
    }
  }

  void _handleSync(SyncUpdate update) {
    if (kDebugMode) {
      print('Sync update: ${update.rooms?.join?.length ?? 0} new rooms');
    }
  }

  void _handleLoginStateChange(LoginState state) {
    if (kDebugMode) {
      print('Login state changed: $state');
    }
  }

  /// Get the underlying Matrix client
  Client? get client => _client;

  /// Check if client is connected and authenticated
  bool get isConnected => _client?.isLogged() ?? false;

  /// Send a message to a room
  Future<void> sendMessage({
    required String roomId,
    required String message,
    String? txId,
  }) async {
    if (_client == null) {
      throw Exception('Client not initialized');
    }

    final room = _client!.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.sendMessage(
      body: message,
      type: MessageTypes.text,
      txId: txId ?? DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }

  /// Send a formatted message (HTML)
  Future<void> sendFormattedMessage({
    required String roomId,
    required String htmlContent,
    required String plainContent,
    String? txId,
  }) async {
    if (_client == null) {
      throw Exception('Client not initialized');
    }

    final room = _client!.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.sendMessage(
      body: plainContent,
      formattedBody: htmlContent,
      format: 'org.matrix.custom.html',
      type: MessageTypes.text,
      txId: txId ?? DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }

  /// Join a room by ID or alias
  Future<Room> joinRoom(String roomIdOrAlias) async {
    if (_client == null) {
      throw Exception('Client not initialized');
    }

    try {
      final room = await _client!.joinRoom(roomIdOrAlias);
      return room;
    } catch (e) {
      throw Exception('Failed to join room: $e');
    }
  }

  /// Create a new room
  Future<Room> createRoom({
    required String name,
    String? topic,
    bool isPrivate = false,
    List<String>? invites,
  }) async {
    if (_client == null) {
      throw Exception('Client not initialized');
    }

    final room = await _client!.createRoom(
      name: name,
      topic: topic,
      isPrivate: isPrivate,
      invites: invites,
    );

    return room;
  }

  /// Get all joined rooms
  List<Room> getJoinedRooms() {
    if (_client == null) {
      return [];
    }

    return _client!.rooms.where((room) => room.isJoined).toList();
  }

  /// Get room by ID
  Room? getRoom(String roomId) {
    return _client?.getRoomById(roomId);
  }

  /// Logout and cleanup
  Future<void> logout() async {
    if (_client != null) {
      await _client!.logout();
      _client = null;
    }
  }

  /// Dispose resources
  void dispose() {
    _client?.onEvent.remove(_handleEvent);
    _client?.onSyncUpdate.remove(_handleSync);
    _client?.onLoginStateChanged.remove(_handleLoginStateChange);
    _client?.stop();
    _client = null;
  }
}

// Example usage
Future<void> main() async {
  try {
    // Create client with access token
    final client = await MatrixClientExample.createClient(
      homeserverUrl: 'https://matrix.rechain.network',
      userId: '@user:rechain.network',
      accessToken: 'your_access_token_here',
    );

    if (kDebugMode) {
      print('Client connected: ${client.isConnected}');
    }

    // Get list of joined rooms
    final rooms = client.getJoinedRooms();
    if (kDebugMode) {
      print('Joined rooms: ${rooms.length}');
    }

    // Send a message (replace with valid room ID)
    // await client.sendMessage(
    //   roomId: '!roomId:rechain.network',
    //   message: 'Hello from REChain!',
    // );

    // Cleanup
    client.logout();
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}

