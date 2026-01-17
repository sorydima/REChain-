import 'package:flutter/foundation.dart';

/// Matrix Rooms Example
///
/// Demonstrates room operations including creating, joining, leaving,
/// and managing room state.
///
/// Usage:
/// ```dart
/// final rooms = MatrixRoomsExample(client: client);
/// await rooms.createRoom(name: 'My Room');
/// ```
class MatrixRoomsExample {
  final Client client;

  MatrixRoomsExample({required this.client});

  /// Create a new room with specified options
  ///
  /// [name] - The display name for the room
  /// [topic] - Optional room topic/description
  /// [isPrivate] - Whether the room should be private (invite-only)
  /// [invites] - List of user IDs to invite
  /// [enableEncryption] - Enable end-to-end encryption
  /// [preset] - Room preset (private_chat, public_chat, etc.)
  Future<Room> createRoom({
    required String name,
    String? topic,
    bool isPrivate = false,
    List<String>? invites,
    bool enableEncryption = false,
    String preset = 'private_chat',
  }) async {
    final creationContent = enableEncryption
        ? {
            'm.room.encryption': {
              'algorithm': 'm.megolm.v1.aes-sha2',
            },
          }
        : null;

    final room = await client.createRoom(
      name: name,
      topic: topic,
      isPrivate: isPrivate,
      invites: invites,
      creationContent: creationContent,
      preset: preset,
    );

    if (kDebugMode) {
      print('Created room: ${room.id} - $name');
    }

    return room;
  }

  /// Join a room by ID or alias
  Future<Room> joinRoom(String roomIdOrAlias) async {
    try {
      final room = await client.joinRoom(roomIdOrAlias);
      if (kDebugMode) {
        print('Joined room: ${room.id}');
      }
      return room;
    } catch (e) {
      if (kDebugMode) {
        print('Failed to join room: $e');
      }
      rethrow;
    }
  }

  /// Leave a room
  Future<void> leaveRoom(String roomId) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.leave();
    if (kDebugMode) {
      print('Left room: $roomId');
    }
  }

  /// Invite a user to a room
  Future<void> inviteUser(String roomId, String userId) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.invite(userId);
    if (kDebugMode) {
      print('Invited $userId to $roomId');
    }
  }

  /// Kick a user from a room
  Future<void> kickUser({
    required String roomId,
    required String userId,
    String? reason,
  }) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.kick(userId, reason: reason);
    if (kDebugMode) {
      print('Kicked $userId from $roomId');
    }
  }

  /// Ban a user from a room
  Future<void> banUser({
    required String roomId,
    required String userId,
    String? reason,
  }) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.ban(userId, reason: reason);
    if (kDebugMode) {
      print('Banned $userId from $roomId');
    }
  }

  /// Unban a user from a room
  Future<void> unbanUser({
    required String roomId,
    required String userId,
  }) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.unban(userId);
    if (kDebugMode) {
      print('Unbanned $userId from $roomId');
    }
  }

  /// Set room name
  Future<void> setRoomName(String roomId, String name) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.setName(name);
    if (kDebugMode) {
      print('Set room name to: $name');
    }
  }

  /// Set room topic
  Future<void> setRoomTopic(String roomId, String topic) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.setTopic(topic);
    if (kDebugMode) {
      print('Set room topic to: $topic');
    }
  }

  /// Set room avatar
  Future<void> setRoomAvatar(String roomId, String avatarUrl) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.setAvatar(avatarUrl);
    if (kDebugMode) {
      print('Set room avatar to: $avatarUrl');
    }
  }

  /// Set room visibility (directory)
  Future<void> setRoomVisibility({
    required String roomId,
    required bool isPublic,
  }) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.setVisibility(isPublic
        ? RoomVisibility.public
        : RoomVisibility.private);
    if (kDebugMode) {
      print('Set room visibility to: ${isPublic ? 'public' : 'private'}');
    }
  }

  /// Enable end-to-end encryption for a room
  Future<void> enableEncryption(String roomId) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.enableEncryption();
    if (kDebugMode) {
      print('Enabled encryption for room: $roomId');
    }
  }

  /// Get room member list
  Future<List<RoomMember>> getRoomMembers(String roomId) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    // Ensure we have the member list
    await room.requestMembers();

    return room.getMembers();
  }

  /// Get room member by user ID
  RoomMember? getRoomMember(String roomId, String userId) {
    final room = client.getRoomById(roomId);
    if (room == null) return null;

    return room.getMember(userId);
  }

  /// Get list of all joined rooms
  List<Room> getJoinedRooms() {
    return client.rooms.where((room) => room.isJoined).toList();
  }

  /// Get list of invited rooms
  List<Room> getInvitedRooms() {
    return client.rooms.where((room) => room.isInvited).toList();
  }

  /// Get list of left rooms
  List<Room> getLeftRooms() {
    return client.rooms.where((room) => room.isLeft).toList();
  }

  /// Search rooms by name
  List<Room> searchRoomsByName(String query) {
    final lowercaseQuery = query.toLowerCase();
    return client.rooms
        .where((room) =>
            room.name?.toLowerCase().contains(lowercaseQuery) ?? false)
        .toList();
  }

  /// Get direct message room for a user
  Room? getDirectMessageRoom(String userId) {
    return client.rooms.firstWhere(
      (room) =>
          room.isJoined &&
          room.directChatMatrixID == userId,
      orElse: () => throw Exception('No direct message room found for $userId'),
    );
  }

  /// Create or get existing direct message room
  Future<Room> getOrCreateDirectMessage(String userId) async {
    try {
      return getDirectMessageRoom(userId);
    } catch (e) {
      return createRoom(
        name: userId,
        isPrivate: true,
        invites: [userId],
      );
    }
  }

  /// Get room by ID
  Room? getRoom(String roomId) {
    return client.getRoomById(roomId);
  }

  /// Get recent messages from a room
  Future<List<Event>> getRecentMessages(
    String roomId, {
    int limit = 20,
    String? fromEventId,
  }) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    final events = await room.getEventList(
      limit: limit,
      from: fromEventId,
    );

    return events;
  }

  /// Get room notification settings
  RoomNotificationState? getNotificationState(String roomId) {
    final room = client.getRoomById(roomId);
    return room?.notificationSettings;
  }

  /// Set room notification level
  Future<void> setNotificationLevel(
    String roomId,
    RoomNotificationState level,
  ) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.setNotificationMode(level);
  }
}

