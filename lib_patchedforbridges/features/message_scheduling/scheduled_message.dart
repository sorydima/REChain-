import 'message_scheduler.dart';

enum ScheduledMessageStatus {
  pending,
  sending,
  sent,
  failed,
  cancelled,
}

class ScheduledMessage {
  final String id;
  final String roomId;
  final String content;
  final MessageType messageType;
  final DateTime scheduledTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ScheduledMessageStatus status;
  final String? replyToEventId;
  final String? sentEventId;
  final String? errorMessage;
  final Map<String, dynamic>? metadata;

  const ScheduledMessage({
    required this.id,
    required this.roomId,
    required this.content,
    required this.messageType,
    required this.scheduledTime,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    this.replyToEventId,
    this.sentEventId,
    this.errorMessage,
    this.metadata,
  });

  ScheduledMessage copyWith({
    String? id,
    String? roomId,
    String? content,
    MessageType? messageType,
    DateTime? scheduledTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    ScheduledMessageStatus? status,
    String? replyToEventId,
    String? sentEventId,
    String? errorMessage,
    Map<String, dynamic>? metadata,
  }) {
    return ScheduledMessage(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      content: content ?? this.content,
      messageType: messageType ?? this.messageType,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      replyToEventId: replyToEventId ?? this.replyToEventId,
      sentEventId: sentEventId ?? this.sentEventId,
      errorMessage: errorMessage ?? this.errorMessage,
      metadata: metadata ?? this.metadata,
    );
  }

  bool get isPending => status == ScheduledMessageStatus.pending;
  bool get isSent => status == ScheduledMessageStatus.sent;
  bool get isFailed => status == ScheduledMessageStatus.failed;
  bool get isCancelled => status == ScheduledMessageStatus.cancelled;
  bool get isSending => status == ScheduledMessageStatus.sending;

  Duration get timeUntilSend {
    if (!isPending) return Duration.zero;
    final now = DateTime.now();
    return scheduledTime.isAfter(now) 
        ? scheduledTime.difference(now) 
        : Duration.zero;
  }

  bool get isOverdue {
    return isPending && DateTime.now().isAfter(scheduledTime);
  }

  String get statusText {
    switch (status) {
      case ScheduledMessageStatus.pending:
        return isOverdue ? 'Overdue' : 'Scheduled';
      case ScheduledMessageStatus.sending:
        return 'Sending...';
      case ScheduledMessageStatus.sent:
        return 'Sent';
      case ScheduledMessageStatus.failed:
        return 'Failed';
      case ScheduledMessageStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get statusIcon {
    switch (status) {
      case ScheduledMessageStatus.pending:
        return isOverdue ? '⚠️' : '⏰';
      case ScheduledMessageStatus.sending:
        return '📤';
      case ScheduledMessageStatus.sent:
        return '✅';
      case ScheduledMessageStatus.failed:
        return '❌';
      case ScheduledMessageStatus.cancelled:
        return '🚫';
    }
  }

  String get messageTypeIcon {
    switch (messageType) {
      case MessageType.text:
        return '💬';
      case MessageType.notice:
        return '📢';
      case MessageType.emote:
        return '😊';
      case MessageType.file:
        return '📎';
      case MessageType.image:
        return '🖼️';
      case MessageType.video:
        return '🎥';
      case MessageType.audio:
        return '🎵';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomId': roomId,
      'content': content,
      'messageType': messageType.name,
      'scheduledTime': scheduledTime.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'status': status.name,
      'replyToEventId': replyToEventId,
      'sentEventId': sentEventId,
      'errorMessage': errorMessage,
      'metadata': metadata,
    };
  }

  factory ScheduledMessage.fromJson(Map<String, dynamic> json) {
    return ScheduledMessage(
      id: json['id'] as String,
      roomId: json['roomId'] as String,
      content: json['content'] as String,
      messageType: MessageType.values.firstWhere(
        (e) => e.name == json['messageType'],
        orElse: () => MessageType.text,
      ),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      status: ScheduledMessageStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ScheduledMessageStatus.pending,
      ),
      replyToEventId: json['replyToEventId'] as String?,
      sentEventId: json['sentEventId'] as String?,
      errorMessage: json['errorMessage'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  @override
  String toString() {
    return 'ScheduledMessage(id: $id, roomId: $roomId, status: $status, scheduledTime: $scheduledTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScheduledMessage &&
        other.id == id &&
        other.roomId == roomId &&
        other.content == content &&
        other.messageType == messageType &&
        other.scheduledTime == scheduledTime &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        roomId.hashCode ^
        content.hashCode ^
        messageType.hashCode ^
        scheduledTime.hashCode ^
        status.hashCode;
  }
}
