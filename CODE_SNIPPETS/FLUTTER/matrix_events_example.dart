import 'package:flutter/foundation.dart';

/// Matrix Events Example
///
/// Demonstrates how to handle and process Matrix events including
/// message events, state events, and encrypted events.
///
/// Usage:
/// ```dart
/// final handler = MatrixEventsExample();
/// client.onEvent.add(handler.handleEvent);
/// ```
class MatrixEventsExample {
  /// Handle incoming Matrix events
  void handleEvent(Event event) {
    if (kDebugMode) {
      print('=== Event Received ===');
      print('Type: ${event.type}');
      print('Sender: ${event.senderId}');
      print('Room: ${event.roomId}');
      print('Content: ${event.content}');
    }

    // Route to specific handler based on event type
    switch (event.type) {
      case EventTypes.message:
      case EventTypes.encrypted:
        _handleMessageEvent(event);
        break;

      case EventTypes.sticker:
        _handleStickerEvent(event);
        break;

      case EventTypes.reaction:
        _handleReactionEvent(event);
        break;

      case EventTypes.edit:
        _handleEditEvent(event);
        break;

      case EventTypes.reply:
        _handleReplyEvent(event);
        break;

      case EventTypes.redaction:
        _handleRedactionEvent(event);
        break;

      // State events
      case EventTypes.roomName:
        _handleRoomNameEvent(event);
        break;

      case EventTypes.roomTopic:
        _handleRoomTopicEvent(event);
        break;

      case EventTypes.roomAvatar:
        _handleRoomAvatarEvent(event);
        break;

      case EventTypes.member:
        _handleMemberEvent(event);
        break;

      case EventTypes.canonicalAlias:
        _handleCanonicalAliasEvent(event);
        break;

      case EventTypes.encryption:
        _handleEncryptionEvent(event);
        break;

      default:
        _handleUnknownEvent(event);
    }
  }

  /// Handle text and media messages
  void _handleMessageEvent(Event event) {
    final messageType = event.content['msgtype'] ?? 'unknown';

    switch (messageType) {
      case MessageTypes.text:
        _handleTextMessage(event);
        break;

      case MessageTypes.notice:
        _handleNoticeMessage(event);
        break;

      case MessageTypes.emote:
        _handleEmoteMessage(event);
        break;

      case MessageTypes.image:
        _handleImageMessage(event);
        break;

      case MessageTypes.video:
        _handleVideoMessage(event);
        break;

      case MessageTypes.audio:
        _handleAudioMessage(event);
        break;

      case MessageTypes.file:
        _handleFileMessage(event);
        break;

      case MessageTypes.location:
        _handleLocationMessage(event);
        break;

      default:
        if (kDebugMode) {
          print('Unknown message type: $messageType');
        }
    }
  }

  void _handleTextMessage(Event event) {
    final body = event.content['body'] ?? '';
    final formattedBody = event.content['formatted_body'] ?? '';
    final format = event.content['format'] ?? '';

    if (kDebugMode) {
      print('Text message: $body');
      if (formattedBody.isNotEmpty) {
        print('Formatted: $formattedBody');
      }
    }
  }

  void _handleNoticeMessage(Event event) {
    final body = event.content['body'] ?? '';
    if (kDebugMode) {
      print('Notice from ${event.senderId}: $body');
    }
  }

  void _handleEmoteMessage(Event event) {
    final body = event.content['body'] ?? '';
    if (kDebugMode) {
      print('Emote: * ${event.senderId} $body');
    }
  }

  void _handleImageMessage(Event event) {
    final url = event.content['url'] ?? '';
    final info = event.content['info'] ?? {};
    final width = info['w'] ?? 0;
    final height = info['h'] ?? 0;
    final size = info['size'] ?? 0;

    if (kDebugMode) {
      print('Image: $url ($width x $height, ${_formatSize(size)})');
    }
  }

  void _handleVideoMessage(Event event) {
    final url = event.content['url'] ?? '';
    final info = event.content['info'] ?? {};

    if (kDebugMode) {
      print('Video: $url');
    }
  }

  void _handleAudioMessage(Event event) {
    final url = event.content['url'] ?? '';
    final info = event.content['info'] ?? {};
    final duration = info['duration'] ?? 0;

    if (kDebugMode) {
      print('Audio: $url (${duration}ms)');
    }
  }

  void _handleFileMessage(Event event) {
    final filename = event.content['filename'] ?? 'unknown';
    final url = event.content['url'] ?? '';
    final size = event.content['info']?['size'] ?? 0;

    if (kDebugMode) {
      print('File: $filename ($url, ${_formatSize(size)})');
    }
  }

  void _handleLocationMessage(Event event) {
    final geoUri = event.content['geo_uri'] ?? '';
    final body = event.content['body'] ?? '';

    if (kDebugMode) {
      print('Location: $geoUri - $body');
    }
  }

  void _handleStickerEvent(Event event) {
    final url = event.content['url'] ?? '';
    final body = event.content['body'] ?? '';

    if (kDebugMode) {
      print('Sticker: $body ($url)');
    }
  }

  void _handleReactionEvent(Event event) {
    final reaction = event.content['m.relates_to'] ?? {};
    final targetEventId = reaction['event_id'] ?? '';
    final emoji = reaction['key'] ?? '';

    if (kDebugMode) {
      print('Reaction to $targetEventId: $emoji');
    }
  }

  void _handleEditEvent(Event event) {
    const relationType = 'm.replace';
    final relation = event.content['m.relates_to'] ?? {};
    final targetEventId = relation['event_id'] ?? '';
    final newContent = event.content['m.new_content'] ?? {};

    if (kDebugMode) {
      print('Edit of $targetEventId: ${newContent['body'] ?? ''}');
    }
  }

  void _handleReplyEvent(Event event) {
    const relationType = 'm.reference';
    final relation = event.content['m.relates_to'] ?? {};
    final targetEventId = relation['event_id'] ?? '';

    if (kDebugMode) {
      print('Reply to $targetEventId');
    }
  }

  void _handleRedactionEvent(Event event) {
    final reason = event.content['reason'] ?? '';
    final redacts = event.unsigned?['redacts'] ?? '';

    if (kDebugMode) {
      print('Redaction of $redacts: $reason');
    }
  }

  // State event handlers

  void _handleRoomNameEvent(Event event) {
    final name = event.content['name'] ?? '';
    if (kDebugMode) {
      print('Room name changed to: $name');
    }
  }

  void _handleRoomTopicEvent(Event event) {
    final topic = event.content['topic'] ?? '';
    if (kDebugMode) {
      print('Room topic: $topic');
    }
  }

  void _handleRoomAvatarEvent(Event event) {
    final url = event.content['url'] ?? '';
    if (kDebugMode) {
      print('Room avatar: $url');
    }
  }

  void _handleMemberEvent(Event event) {
    final content = event.content;
    final membership = content['membership'] ?? '';
    final displayName = content['displayname'] ?? '';
    final avatarUrl = content['avatar_url'] ?? '';

    if (kDebugMode) {
      print('Member ${event.senderId}: $membership');
      if (displayName.isNotEmpty) print('  Display name: $displayName');
      if (avatarUrl.isNotEmpty) print('  Avatar: $avatarUrl');
    }
  }

  void _handleCanonicalAliasEvent(Event event) {
    final alias = event.content['alias'] ?? '';
    if (kDebugMode) {
      print('Canonical alias: $alias');
    }
  }

  void _handleEncryptionEvent(Event event) {
    final algorithm = event.content['algorithm'] ?? '';
    if (kDebugMode) {
      print('Room encryption: $algorithm');
    }
  }

  void _handleUnknownEvent(Event event) {
    if (kDebugMode) {
      print('Unknown event type: ${event.type}');
    }
  }

  /// Filter events by type
  bool shouldProcessEvent(Event event, List<String> eventTypes) {
    return eventTypes.contains(event.type);
  }

  /// Check if event is a message
  bool isMessageEvent(Event event) {
    return event.type == EventTypes.message ||
        event.type == EventTypes.encrypted;
  }

  /// Check if event is editable
  bool isEditableEvent(Event event) {
    return event.type == EventTypes.message &&
        event.content['msgtype'] == MessageTypes.text;
  }

  /// Check if event can be reacted to
  bool canReactToEvent(Event event) {
    return event.type == EventTypes.message ||
        event.type == EventTypes.sticker;
  }

  /// Format file size
  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }
}

// Event filtering utilities
extension EventFilter on Event {
  /// Check if event is from a specific user
  bool isFromUser(String userId) => senderId == userId;

  /// Check if event is in a specific room
  bool isInRoom(String roomId) => roomId == roomId;

  /// Check if event has a specific type
  bool isType(String type) => this.type == type;

  /// Check if event is editable
  bool get isEditable =>
      type == EventTypes.message &&
      content['msgtype'] == MessageTypes.text;

  /// Get the display name for this event
  String get displayName {
    return content['displayname'] ?? senderId;
  }
}

