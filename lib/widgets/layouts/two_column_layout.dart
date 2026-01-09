import 'package:flutter/material.dart';

import 'package:rechainonline/config/themes.dart';

class TwoColumnLayout extends StatelessWidget {
  final Widget mainView;
  final Widget sideView;

  const TwoColumnLayout({
    super.key,
    required this.mainView,
    required this.sideView,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaffoldMessenger(
      child: Scaffold(
        body: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              width: rechainonlineThemes.columnWidth + rechainonlineThemes.navRailWidth,
              child: mainView,
            ),
            Container(width: 1.0, color: theme.dividerColor),
            Expanded(child: ClipRRect(child: sideView)),
          ],
        ),
      ),
    );
  }
}
