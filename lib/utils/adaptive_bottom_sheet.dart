import 'package:flutter/material.dart';

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/config/themes.dart';

Future<T?> showAdaptiveBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool isDismissible = true,
  bool isScrollControlled = true,
  double maxHeight = 480.0,
}) =>
    showModalBottomSheet(
      context: context,
      builder: builder,
      // this sadly is ugly on desktops but otherwise breaks `.of(context)` calls
      useRootNavigator: false,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: rechainonlineThemes.columnWidth * 1.5,
      ),
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConfig.borderRadius),
          topRight: Radius.circular(AppConfig.borderRadius),
        ),
      ),
    );
