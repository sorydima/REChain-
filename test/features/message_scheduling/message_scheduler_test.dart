import 'package:flutter_test/flutter_test.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';

import 'package:rechainonline/features/message_scheduling/message_scheduler.dart';
import 'package:rechainonline/features/message_scheduling/scheduled_message.dart';

class MockClient extends Mock implements Client {}
class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockRoom extends Mock implements Room {}
class MockEvent extends Mock implements Event {}

void main() {
  late MessageScheduler scheduler;
  late MockClient client;
  late MockSharedPreferences prefs;
  late MockRoom mockRoom;

  setUp(() {
    client = MockClient();
    prefs = MockSharedPreferences();
    mockRoom = MockRoom();
    scheduler = MessageScheduler(prefs, client);

    when(client.getRoomById(any)).thenReturn(mockRoom);
    when(mockRoom.sendTextEvent(any, msgtype: anyNamed('msgtype'), inReplyTo: anyNamed('inReplyTo')))
        .thenAnswer((_) => Future.value(MockEvent()));
  });

  group('Message Scheduling', () {
    test('should schedule message successfully', () async {
      final now = DateTime.now();
      final scheduledTime = now.add(Duration(minutes: 5));
      
      final messageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Test scheduled message',
        scheduledTime: scheduledTime,
      );

      expect(messageId, isNotEmpty);
      
      final message = scheduler.scheduledMessages[messageId];
      expect(message, isNotNull);
      expect(message?.content, equals('Test scheduled message'));
      expect(message?.scheduledTime, equals(scheduledTime));
      expect(message?.status, equals(ScheduledMessageStatus.pending));
    });

    test('should handle immediate scheduling', () async {
      final now = DateTime.now();
      
      final messageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Send immediately',
        scheduledTime: now,
      );

      // Wait for message to be processed
      await Future.delayed(Duration(seconds: 1));

      final message = scheduler.scheduledMessages[messageId];
      expect(message?.status, equals(ScheduledMessageStatus.sent));
    });

    test('should handle message types correctly', () async {
      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      // Test text message
      final textMessageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Text message',
        scheduledTime: scheduledTime,
        messageType: MessageType.text,
      );

      // Test notice message
      final noticeMessageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Notice message',
        scheduledTime: scheduledTime,
        messageType: MessageType.notice,
      );

      // Test emote message
      final emoteMessageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: '/me is testing',
        scheduledTime: scheduledTime,
        messageType: MessageType.emote,
      );

      expect(scheduler.scheduledMessages[textMessageId]?.messageType, equals(MessageType.text));
      expect(scheduler.scheduledMessages[noticeMessageId]?.messageType, equals(MessageType.notice));
      expect(scheduler.scheduledMessages[emoteMessageId]?.messageType, equals(MessageType.emote));
    });
  });

  group('Message Management', () {
    test('should cancel scheduled message', () async {
      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      final messageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Test message',
        scheduledTime: scheduledTime,
      );

      final cancelled = await scheduler.cancelScheduledMessage(messageId);
      expect(cancelled, true);

      final message = scheduler.scheduledMessages[messageId];
      expect(message?.status, equals(ScheduledMessageStatus.cancelled));
    });

    test('should reschedule message', () async {
      final initialTime = DateTime.now().add(Duration(minutes: 5));
      final newTime = DateTime.now().add(Duration(minutes: 10));
      
      final messageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Test message',
        scheduledTime: initialTime,
      );

      final rescheduled = await scheduler.rescheduleMessage(messageId, newTime);
      expect(rescheduled, true);

      final message = scheduler.scheduledMessages[messageId];
      expect(message?.scheduledTime, equals(newTime));
      expect(message?.status, equals(ScheduledMessageStatus.pending));
    });

    test('should handle failed messages', () async {
      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      // Mock room to throw error
      when(mockRoom.sendTextEvent(any, msgtype: anyNamed('msgtype'), inReplyTo: anyNamed('inReplyTo')))
          .thenThrow(Exception('Failed to send message'));

      final messageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Test message',
        scheduledTime: scheduledTime,
      );

      // Force message sending
      await scheduler.retryFailedMessage(messageId);

      final message = scheduler.scheduledMessages[messageId];
      expect(message?.status, equals(ScheduledMessageStatus.failed));
      expect(message?.errorMessage, isNotNull);
    });

    test('should retry failed messages', () async {
      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      final messageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Test message',
        scheduledTime: scheduledTime,
      );

      // Simulate failed message
      await scheduler.retryFailedMessage(messageId);
      
      // Mock successful send for retry
      when(mockRoom.sendTextEvent(any, msgtype: anyNamed('msgtype'), inReplyTo: anyNamed('inReplyTo')))
          .thenAnswer((_) => Future.value(MockEvent()));

      await scheduler.retryFailedMessage(messageId);

      final message = scheduler.scheduledMessages[messageId];
      expect(message?.status, equals(ScheduledMessageStatus.sent));
    });
  });

  group('Message Queries', () {
    test('should get scheduled messages for room', () async {
      final roomId = '!test:example.com';
      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      // Schedule multiple messages
      await scheduler.scheduleMessage(
        roomId: roomId,
        content: 'Message 1',
        scheduledTime: scheduledTime,
      );
      
      await scheduler.scheduleMessage(
        roomId: roomId,
        content: 'Message 2',
        scheduledTime: scheduledTime.add(Duration(minutes: 5)),
      );

      await scheduler.scheduleMessage(
        roomId: '!other:example.com',
        content: 'Other room message',
        scheduledTime: scheduledTime,
      );

      final roomMessages = scheduler.getScheduledMessagesForRoom(roomId);
      expect(roomMessages.length, equals(2));
      expect(roomMessages.every((m) => m.roomId == roomId), true);
    });

    test('should get pending messages', () async {
      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      // Schedule messages with different statuses
      await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Pending message',
        scheduledTime: scheduledTime,
      );

      final cancelledMessageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'To be cancelled',
        scheduledTime: scheduledTime,
      );
      await scheduler.cancelScheduledMessage(cancelledMessageId);

      final pendingMessages = scheduler.getPendingMessages();
      expect(pendingMessages.length, equals(1));
      expect(pendingMessages.first.status, equals(ScheduledMessageStatus.pending));
    });

    test('should get failed messages', () async {
      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      // Mock room to throw error
      when(mockRoom.sendTextEvent(any, msgtype: anyNamed('msgtype'), inReplyTo: anyNamed('inReplyTo')))
          .thenThrow(Exception('Failed to send message'));

      final messageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Will fail',
        scheduledTime: scheduledTime,
      );

      // Force message sending
      await scheduler.retryFailedMessage(messageId);

      final failedMessages = scheduler.getFailedMessages();
      expect(failedMessages.length, equals(1));
      expect(failedMessages.first.status, equals(ScheduledMessageStatus.failed));
    });
  });

  group('Persistence', () {
    test('should persist scheduled messages', () async {
      final scheduledTime = DateTime.now().add(Duration(minutes: 5));
      
      // Mock SharedPreferences
      when(prefs.setString(any, any)).thenAnswer((_) => Future.value(true));
      when(prefs.getString(any)).thenReturn(null);

      final messageId = await scheduler.scheduleMessage(
        roomId: '!test:example.com',
        content: 'Test message',
        scheduledTime: scheduledTime,
      );

      verify(prefs.setString(any, any)).called(1);

      final message = scheduler.scheduledMessages[messageId];
      expect(message, isNotNull);
    });

    test('should load persisted messages on init', () async {
      final now = DateTime.now();
      final message = ScheduledMessage(
        id: 'test-id',
        roomId: '!test:example.com',
        content: 'Test message',
        messageType: MessageType.text,
        scheduledTime: now.add(Duration(minutes: 5)),
        createdAt: now,
        updatedAt: now,
        status: ScheduledMessageStatus.pending,
      );

      // Mock persisted data
      when(prefs.getString(any)).thenReturn(
        '{"test-id": ${message.toJson()}}',
      );

      // Create new scheduler instance to test loading
      final newScheduler = MessageScheduler(prefs, client);
      
      expect(newScheduler.scheduledMessages['test-id'], isNotNull);
      expect(newScheduler.scheduledMessages['test-id']?.content, equals('Test message'));
    });
  });
}
