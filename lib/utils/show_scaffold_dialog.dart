// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/config/themes.dart';
import 'package:material_ui/material_ui.dart';

Future<T?> showScaffoldDialog<T>({
  required BuildContext context,
  Color? barrierColor,
  Color? containerColor,
  double maxWidth = 480,
  double maxHeight = 720,
  required Widget Function(BuildContext context) builder,
}) => showDialog<T>(
  context: context,
  useSafeArea: false,
  builder: rechainonlineThemes.isColumnMode(context)
      ? (context) => Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConfig.borderRadius),
              color:
                  containerColor ?? Theme.of(context).scaffoldBackgroundColor,
            ),
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: builder(context),
          ),
        )
      : builder,
);
