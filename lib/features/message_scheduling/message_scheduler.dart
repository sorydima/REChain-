import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'scheduled_message.dart';

class MessageScheduler {
  static const String _scheduledMessagesKey = 'scheduled_messages';
  
  final SharedPreferences _prefs;
  final Client _client;
  final Map<String, ScheduledMessage> _scheduledMessages = {};
  final Map<String, Timer> _activeTimers = {};
  
  final StreamController<Map<String, ScheduledMessage>> _messagesController = 
      StreamController<Map<String, ScheduledMessage>>.broadcast();
  
  Stream<Map<String, ScheduledMessage>> get scheduledMessagesStream => 
      _messagesController.stream;
  
  MessageScheduler(this._prefs, this._client) {
    _loadScheduledMessages();
  }
  
  Future<void> _loadScheduledMessages() async {
    final messagesJson = _prefs.getString(_scheduledMessagesKey);
    if (messagesJson != null) {
      final Map<String, dynamic> messages = json.decode(messagesJson);
      for (final entry in messages.entries) {
        final message = ScheduledMessage.fromJson(entry.value);
        _scheduledMessages[entry.key] = message;
        
        // Set up timer if message is still pending
        if (message.status == ScheduledMessageStatus.pending) {
          _scheduleMessage(message);
        }
      }
    }
    
    _messagesController.add(Map.from(_scheduledMessages));
  }
  
  Future<void> _saveScheduledMessages() async {
    final messagesMap = <String, dynamic>{};
    for (final entry in _scheduledMessages.entries) {
      messagesMap[entry.key] = entry.value.toJson();
    }
    await _prefs.setString(_scheduledMessagesKey, json.encode(messagesMap));
  }
  
  Future<String> scheduleMessage({
    required String roomId,
    required String content,
    required DateTime scheduledTime,
    MessageType messageType = MessageType.text,
    String? replyToEventId,
    Map<String, dynamic>? metadata,
  }) async {
    final message = ScheduledMessage(
      id: _generateMessageId(),
      roomId: roomId,
      content: content,
      messageType: messageType,
      scheduledTime: scheduledTime,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      status: ScheduledMessageStatus.pending,
      replyToEventId: replyToEventId,
      metadata: metadata,
    );
    
    _scheduledMessages[message.id] = message;
    await _saveScheduledMessages();
    
    // Schedule the message
    _scheduleMessage(message);
    
    _messagesController.add(Map.from(_scheduledMessages));
    
    return message.id;
  }
  
  void _scheduleMessage(ScheduledMessage message) {
    final now = DateTime.now();
    final delay = message.scheduledTime.difference(now);
    
    if (delay.isNegative) {
      // Message should have been sent already, send it now
      _sendScheduledMessage(message.id);
      return;
    }
    
    _activeTimers[message.id] = Timer(delay, () {
      _sendScheduledMessage(message.id);
    });
  }
  
  Future<void> _sendScheduledMessage(String messageId) async {
    final message = _scheduledMessages[messageId];
    if (message == null) return;
    
    try {
      final room = _client.getRoomById(message.roomId);
      if (room == null) {
        await _updateMessageStatus(messageId, ScheduledMessageStatus.failed, 
            errorMessage: 'Room not found');
        return;
      }
      
      // Update status to sending
      await _updateMessageStatus(messageId, ScheduledMessageStatus.sending);
      
      Event? sentEvent;
      
      Event? replyEvent;
      if (message.replyToEventId != null) {
        replyEvent = await room.getEventById(message.replyToEventId!);
      }

      switch (message.messageType) {
        case MessageType.text:
          final result = await room.sendTextEvent(
            message.content,
            inReplyTo: replyEvent,
          );
          final resultMap = result is String ? jsonDecode(result) : result;
          sentEvent = Event.fromJson(resultMap, room);
          break;
        case MessageType.notice:
          final result = await room.sendTextEvent(
            message.content,
            msgtype: MessageTypes.Notice,
            inReplyTo: replyEvent,
          );
          final resultMap = result is String ? jsonDecode(result) : result;
          sentEvent = Event.fromJson(resultMap, room);
          break;
        case MessageType.emote:
          final result = await room.sendTextEvent(
            message.content,
            msgtype: MessageTypes.Emote,
            inReplyTo: replyEvent,
          );
          final resultMap = result is String ? jsonDecode(result) : result;
          sentEvent = Event.fromJson(resultMap, room);
          break;
        case MessageType.file:
          if (message.metadata?['file_path'] != null) {
            final file = await MatrixFile.fromMimeType(
              bytes: await File(message.metadata!['file_path']).readAsBytes(),
              name: message.metadata!['file_name'] ?? 'file',
            );
            final result = await room.sendFileEvent(
              file,
              inReplyTo: replyEvent,
            );
            final resultMap = result is String ? jsonDecode(result) : result;
            sentEvent = Event.fromJson(resultMap, room);
          }
          break;
        case MessageType.image:
          if (message.metadata?['image_path'] != null) {
            final file = await MatrixFile.fromMimeType(
              bytes: await File(message.metadata!['image_path']).readAsBytes(),
              name: message.metadata!['image_name'] ?? 'image',
            );
            final result = await room.sendFileEvent(
              file,
              inReplyTo: replyEvent,
            );
            final resultMap = result is String ? jsonDecode(result) : result;
            sentEvent = Event.fromJson(resultMap, room);
          }
          break;
        case MessageType.video:
          if (message.metadata?['video_path'] != null) {
            final file = await MatrixFile.fromMimeType(
              bytes: await File(message.metadata!['video_path']).readAsBytes(),
              name: message.metadata!['video_name'] ?? 'video',
            );
            final result = await room.sendFileEvent(
              file,
              inReplyTo: replyEvent,
            );
            final resultMap = result is String ? jsonDecode(result) : result;
            sentEvent = Event.fromJson(resultMap, room);
          }
          break;
        case MessageType.audio:
          if (message.metadata?['audio_path'] != null) {
            final file = await MatrixFile.fromMimeType(
              bytes: await File(message.metadata!['audio_path']).readAsBytes(),
              name: message.metadata!['audio_name'] ?? 'audio',
            );
            final result = await room.sendFileEvent(
              file,
              inReplyTo: replyEvent,
            );
            final resultMap = result is String ? jsonDecode(result) : result;
            sentEvent = Event.fromJson(resultMap, room);
          }
          break;
      }
      
      if (sentEvent != null) {
        await _updateMessageStatus(messageId, ScheduledMessageStatus.sent, 
            sentEventId: sentEvent.eventId);
      } else {
        await _updateMessageStatus(messageId, ScheduledMessageStatus.failed,
            errorMessage: 'Failed to send message');
      }
      
    } catch (e) {
      await _updateMessageStatus(messageId, ScheduledMessageStatus.failed,
          errorMessage: e.toString());
      Logs().e('Failed to send scheduled message $messageId: $e');
    } finally {
      _activeTimers.remove(messageId);
    }
  }
  
  Future<void> _updateMessageStatus(
    String messageId, 
    ScheduledMessageStatus status, {
    String? errorMessage,
    String? sentEventId,
  }) async {
    final message = _scheduledMessages[messageId];
    if (message == null) return;
    
    _scheduledMessages[messageId] = message.copyWith(
      status: status,
      errorMessage: errorMessage,
      sentEventId: sentEventId,
      updatedAt: DateTime.now(),
    );
    
    await _saveScheduledMessages();
    _messagesController.add(Map.from(_scheduledMessages));
  }
  
  Future<bool> cancelScheduledMessage(String messageId) async {
    final message = _scheduledMessages[messageId];
    if (message == null) return false;
    
    if (message.status != ScheduledMessageStatus.pending) {
      return false; // Can only cancel pending messages
    }
    
    // Cancel the timer
    _activeTimers[messageId]?.cancel();
    _activeTimers.remove(messageId);
    
    // Update status
    await _updateMessageStatus(messageId, ScheduledMessageStatus.cancelled);
    
    return true;
  }
  
  Future<bool> rescheduleMessage(String messageId, DateTime newTime) async {
    final message = _scheduledMessages[messageId];
    if (message == null) return false;
    
    if (message.status != ScheduledMessageStatus.pending) {
      return false; // Can only reschedule pending messages
    }
    
    // Cancel existing timer
    _activeTimers[messageId]?.cancel();
    _activeTimers.remove(messageId);
    
    // Update scheduled time
    _scheduledMessages[messageId] = message.copyWith(
      scheduledTime: newTime,
      updatedAt: DateTime.now(),
    );
    
    await _saveScheduledMessages();
    
    // Schedule with new time
    _scheduleMessage(_scheduledMessages[messageId]!);
    
    _messagesController.add(Map.from(_scheduledMessages));
    
    return true;
  }
  
  Future<void> deleteScheduledMessage(String messageId) async {
    // Cancel timer if active
    _activeTimers[messageId]?.cancel();
    _activeTimers.remove(messageId);
    
    // Remove from storage
    _scheduledMessages.remove(messageId);
    await _saveScheduledMessages();
    
    _messagesController.add(Map.from(_scheduledMessages));
  }
  
  List<ScheduledMessage> getScheduledMessagesForRoom(String roomId) {
    return _scheduledMessages.values
        .where((message) => message.roomId == roomId)
        .toList()
      ..sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
  }
  
  List<ScheduledMessage> getPendingMessages() {
    return _scheduledMessages.values
        .where((message) => message.status == ScheduledMessageStatus.pending)
        .toList()
      ..sort((a, b) => a.scheduledTime.compareTo(b.scheduledTime));
  }
  
  List<ScheduledMessage> getFailedMessages() {
    return _scheduledMessages.values
        .where((message) => message.status == ScheduledMessageStatus.failed)
        .toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }
  
  Future<void> retryFailedMessage(String messageId) async {
    final message = _scheduledMessages[messageId];
    if (message == null || message.status != ScheduledMessageStatus.failed) {
      return;
    }
    
    // Reset status to pending
    _scheduledMessages[messageId] = message.copyWith(
      status: ScheduledMessageStatus.pending,
      errorMessage: null,
      updatedAt: DateTime.now(),
    );
    
    await _saveScheduledMessages();
    
    // Schedule immediately or at original time if in future
    final now = DateTime.now();
    if (message.scheduledTime.isAfter(now)) {
      _scheduleMessage(_scheduledMessages[messageId]!);
    } else {
      // Schedule for immediate sending
      _scheduledMessages[messageId] = _scheduledMessages[messageId]!.copyWith(
        scheduledTime: now.add(const Duration(seconds: 1)),
      );
      _scheduleMessage(_scheduledMessages[messageId]!);
    }
    
    _messagesController.add(Map.from(_scheduledMessages));
  }
  
  String _generateMessageId() {
    return 'scheduled_${DateTime.now().millisecondsSinceEpoch}_${_scheduledMessages.length}';
  }
  
  Map<String, ScheduledMessage> get scheduledMessages => 
      Map.unmodifiable(_scheduledMessages);
  
  void dispose() {
    // Cancel all active timers
    for (final timer in _activeTimers.values) {
      timer.cancel();
    }
    _activeTimers.clear();
    _messagesController.close();
  }
}

enum MessageType {
  text,
  notice,
  emote,
  file,
  image,
  video,
  audio,
}
