import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:rechain_matrix/rechain_matrix.dart';

/// Custom Widgets Example
///
/// Demonstrates creating custom Matrix-aware widgets including:
/// - Message bubbles with avatars
/// - Room list tiles
/// - Typing indicators
/// - Read receipts
///
/// Usage:
/// ```dart
/// import 'custom_widgets_example.dart' as widgets;
/// Widget messageBubble = widgets.MessageBubble(
///   message: 'Hello!',
///   isFromMe: true,
/// );
/// ```
class CustomWidgetsExample {
  // Example widgets are defined as classes below
  // This file serves as a reference and export point
}

/// Message bubble widget
class MessageBubble extends StatelessWidget {
  final Event message;
  final bool isFromMe;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? trailing;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isFromMe,
    this.onTap,
    this.onLongPress,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isFromMe
        ? theme.colorScheme.primary
        : theme.colorScheme.surfaceVariant;

    return Align(
      alignment: isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isFromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isFromMe) _buildSenderName(context),
            _buildMessageContent(context),
            _buildTimestamp(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSenderName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        message.senderId.split(':')[0].substring(1),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    final content = message.content;

    switch (content['msgtype']) {
      case MessageTypes.text:
        return SelectableText(content['body'] ?? '');

      case MessageTypes.image:
        return _ImageMessageWidget(content: content);

      case MessageTypes.file:
        return _FileMessageWidget(content: content);

      case MessageTypes.location:
        return _LocationMessageWidget(content: content);

      default:
        return Text(content.toString());
    }
  }

  Widget _buildTimestamp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        _formatTimestamp(message.originServerTs),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }

  String _formatTimestamp(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return '${date.hour.toString().padLeft(2, '0')}:'
        '${date.minute.toString().padLeft(2, '0')}';
  }
}

/// Image message widget
class _ImageMessageWidget extends StatelessWidget {
  final Map<String, dynamic> content;

  const _ImageMessageWidget({required this.content});

  @override
  Widget build(BuildContext context) {
    final url = content['url'] ?? '';
    final info = content['info'] ?? {};
    final width = (info['w'] ?? 200) as int;
    final height = (info['h'] ?? 200) as int;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: AspectRatio(
        aspectRatio: width / height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            '$_urlToMxc(url)',
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stack) {
              return const Icon(Icons.broken_image, size: 48);
            },
          ),
        ),
      ),
    );
  }

  String _urlToMxc(String url) {
    if (url.startsWith('mxc://')) {
      return 'https://matrix.rechain.network/_matrix/media/r0/download/'
          '${url.substring(6)}';
    }
    return url;
  }
}

/// File message widget
class _FileMessageWidget extends StatelessWidget {
  final Map<String, dynamic> content;

  const _FileMessageWidget({required this.content});

  @override
  Widget build(BuildContext context) {
    final filename = content['filename'] ?? 'File';
    final size = content['info']?['size'] ?? 0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.attach_file),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                filename,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                _formatSize(size),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

/// Location message widget
class _LocationMessageWidget extends StatelessWidget {
  final Map<String, dynamic> content;

  const _LocationMessageWidget({required this.content});

  @override
  Widget build(BuildContext context) {
    final geoUri = content['geo_uri'] ?? '';
    final body = content['body'] ?? '';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.location_on),
        Expanded(
          child: Text(body.isNotEmpty ? body : geoUri),
        ),
      ],
    );
  }
}

/// Room list tile widget
class RoomListTile extends StatelessWidget {
  final Room room;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;

  const RoomListTile({
    super.key,
    required this.room,
    this.onTap,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final subtitle = _getLastMessagePreview();

    return ListTile(
      leading: leading ?? _buildAvatar(context),
      title: Text(room.name ?? 'Unnamed Room'),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: trailing ?? _buildTrailing(context),
      onTap: onTap,
    );
  }

  Widget _buildAvatar(BuildContext context) {
    final avatarUrl = room.avatar;
    if (avatarUrl == null) {
      return CircleAvatar(
        child: Text(room.name?.substring(0, 1).toUpperCase() ?? '?'),
      );
    }

    return CircleAvatar(
      backgroundImage: NetworkImage(_mxcToUrl(avatarUrl)),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    final notificationCount = room.notificationCount;
    final timestamp = room.timeSinceLastActive;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (timestamp != null) Text(_formatTime(timestamp)),
        if (notificationCount > 0)
          Badge(
            label: Text(notificationCount.toString()),
            child: const SizedBox(width: 20),
          ),
      ],
    );
  }

  String _getLastMessagePreview() {
    final lastEvent = room.getLastEvent();
    if (lastEvent == null) return 'No messages yet';

    final content = lastEvent.content;
    switch (content['msgtype']) {
      case MessageTypes.image:
        return 'Sent an image';
      case MessageTypes.video:
        return 'Sent a video';
      case MessageTypes.file:
        return 'Sent a file';
      case MessageTypes.location:
        return 'Shared a location';
      default:
        return content['body'] ?? 'Sent a message';
    }
  }

  String _mxcToUrl(String mxc) {
    if (mxc.startsWith('mxc://')) {
      return 'https://matrix.rechain.network/_matrix/media/r0/download/'
          '${mxc.substring(6)}';
    }
    return mxc;
  }

  String _formatTime(Duration ago) {
    if (ago.inMinutes < 1) return 'Just now';
    if (ago.inMinutes < 60) return '${ago.inMinutes}m';
    if (ago.inHours < 24) return '${ago.inHours}h';
    return '${ago.inDays}d';
  }
}

/// Typing indicator widget
class TypingIndicator extends StatelessWidget {
  final List<String> typingUsers;

  const TypingIndicator({super.key, required this.typingUsers});

  @override
  Widget build(BuildContext context) {
    if (typingUsers.isEmpty) return const SizedBox.shrink();

    String text;
    if (typingUsers.length == 1) {
      text = '${typingUsers[0]} is typing...';
    } else if (typingUsers.length == 2) {
      text = '${typingUsers[0]} and ${typingUsers[1]} are typing...';
    } else {
      text = '${typingUsers.length} people are typing...';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
      ),
    );
  }
}

/// Read receipts widget
class ReadReceipts extends StatelessWidget {
  final List<String> userIds;
  final Client client;
  final int maxVisible;

  const ReadReceipts({
    super.key,
    required this.userIds,
    required this.client,
    this.maxVisible = 3,
  });

  @override
  Widget build(BuildContext context) {
    final visibleUsers = userIds.take(maxVisible).toList();
    final remainingCount = userIds.length - maxVisible;

    return Row(
      children: [
        ...visibleUsers.map((userId) => _buildUserAvatar(userId, context)),
        if (remainingCount > 0)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              '+$remainingCount',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
      ],
    );
  }

  Widget _buildUserAvatar(String userId, BuildContext context) {
    final room = client.getRoomById(userId); // This is a simplification
    final member = room?.getMember(userId);
    final displayName = member?.displayName ?? userId.split(':')[0].substring(1);

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Tooltip(
        message: displayName,
        child: CircleAvatar(
          radius: 10,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            displayName.substring(0, 1).toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

/// Online presence indicator
class PresenceIndicator extends StatelessWidget {
  final String userId;
  final Client client;

  const PresenceIndicator({
    super.key,
    required this.userId,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
    final room = client.getRoomById(userId);
    final member = room?.getMember(userId);
    final presence = member?.presence ?? 'offline';

    final color = switch (presence) {
      'online' => Colors.green,
      'unavailable' => Colors.orange,
      'offline' => Colors.grey,
      _ => Colors.grey,
    };

    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 2,
        ),
      ),
    );
  }
}

