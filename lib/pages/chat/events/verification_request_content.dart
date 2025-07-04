import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import '../../../config/app_config.dart';

class VerificationRequestContent extends StatelessWidget {
  final Event event;
  final Timeline timeline;

  const VerificationRequestContent({
    required this.event,
    required this.timeline,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final events = event.aggregatedEvents(timeline, 'm.reference');
    final done = events.where((e) => e.type == EventTypes.KeyVerificationDone);
    final start =
        events.where((e) => e.type == EventTypes.KeyVerificationStart);
    final cancel =
        events.where((e) => e.type == EventTypes.KeyVerificationCancel);
    final fullyDone = done.length >= 2;
    final started = start.isNotEmpty;
    final canceled = cancel.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.dividerColor,
            ),
            borderRadius: BorderRadius.circular(AppConfig.borderRadius),
            color: theme.colorScheme.surface,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lock_outlined,
                color: canceled
                    ? Colors.red
                    : (fullyDone ? Colors.green : Colors.grey),
              ),
              const SizedBox(width: 8),
              Text(
                canceled
                    ? 'Error ${cancel.first.content.tryGet<String>('code')}: ${cancel.first.content.tryGet<String>('reason')}'
                    : (fullyDone
                        ? 'Verify Success'
                        : (started
                            ? 'Loading Please Wait'
                            : 'New Verification Request')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
