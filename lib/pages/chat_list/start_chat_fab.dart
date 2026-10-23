// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:rechainonline/config/themes.dart';
import 'package:rechainonline/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class StartChatFab extends StatelessWidget {
  final bool extended;
  const StartChatFab({this.extended = false, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: 'start_chat_fab',
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      onPressed: () => context.go('/rooms/newprivatechat'),
      extendedIconLabelSpacing: extended ? 10 : 0,
      extendedPadding: extended
          ? null
          : const EdgeInsets.symmetric(horizontal: 16),
      label: AnimatedSize(
        alignment: Alignment.centerLeft,
        duration: rechainonlineThemes.animationDuration,
        curve: rechainonlineThemes.animationCurve,
        child: extended ? Text(L10n.of(context).newChat) : SizedBox.shrink(),
      ),
      icon: const Icon(Icons.edit_square),
    );
  }
}
