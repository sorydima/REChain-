import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/config/themes.dart';
import 'package:rechainonline/l10n/l10n.dart';

class UnreadBubble extends StatelessWidget {
  final Room room;

  const UnreadBubble({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final unreadEvents = room.notificationCount;
    if (unreadEvents == 0) return const SizedBox.shrink();

    final hasUnreadMessages = unreadEvents > 0;
    final hasUnreadMentions = unreadEvents > 0; // Simplified logic

    return Container(
      decoration: BoxDecoration(
        color: hasUnreadMentions
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(AppConfig.borderRadius / 2),
      ),
      constraints: const BoxConstraints(
        minWidth: 18,
        minHeight: 18,
      ),
      child: Center(
        child: hasUnreadMessages
            ? Text(
                unreadEvents > 99 ? '99+' : unreadEvents.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
