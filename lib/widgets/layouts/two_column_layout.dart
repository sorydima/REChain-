// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:rechainonline/config/themes.dart';
import 'package:material_ui/material_ui.dart';

class TwoColumnLayout extends StatelessWidget {
  final Widget mainView;
  final Widget sideView;
  final bool hasNavigationRail;

  const TwoColumnLayout({
    super.key,
    required this.mainView,
    required this.sideView,
    this.hasNavigationRail = true,
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
              width:
                  rechainonlineThemes.columnWidth +
                  (hasNavigationRail ? rechainonlineThemes.navRailWidth : 0),
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
