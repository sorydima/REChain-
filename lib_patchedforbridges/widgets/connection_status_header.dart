import 'dart:async';

import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import '../config/themes.dart';
import '../utils/localized_exception_extension.dart';
import 'matrix.dart';

class ConnectionStatusHeader extends StatefulWidget {
  const ConnectionStatusHeader({super.key});

  @override
  ConnectionStatusHeaderState createState() => ConnectionStatusHeaderState();
}

class ConnectionStatusHeaderState extends State<ConnectionStatusHeader> {
  late final StreamSubscription _onSyncSub;

  @override
  void initState() {
    _onSyncSub = Matrix.of(context).client.onSyncStatus.stream.listen(
          (_) => setState(() {}),
        );
    super.initState();
  }

  @override
  void dispose() {
    _onSyncSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final client = Matrix.of(context).client;
    final status = client.onSyncStatus.value ??
        const SyncStatusUpdate(SyncStatus.waitingForResponse);
    final hide = client.onSync.value != null &&
        status.status != SyncStatus.error &&
        client.prevBatch != null;

    return AnimatedContainer(
      duration: rechainonlineThemes.animationDuration,
      curve: rechainonlineThemes.animationCurve,
      height: hide ? 0 : 36,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(color: Colors.transparent),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 2,
              value: hide ? 1.0 : status.progress,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            status.toLocalizedString(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: theme.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}

extension on SyncStatusUpdate {
  String toLocalizedString(BuildContext context) {
    switch (status) {
      case SyncStatus.waitingForResponse:
        return 'Loading Please Wait';
      case SyncStatus.error:
        return ((error?.exception ?? Object()) as Object)
            .toLocalizedString(context);
      case SyncStatus.processing:
      case SyncStatus.cleaningUp:
      case SyncStatus.finished:
      default:
        return 'Synchronizing Please Wait';
    }
  }
}
