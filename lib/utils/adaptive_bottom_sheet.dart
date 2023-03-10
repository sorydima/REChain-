import 'package:flutter/material.dart';

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/config/themes.dart';
import 'package:rechainonline/utils/platform_infos.dart';

Future<T?> showAdaptiveBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool isDismissible = true,
  bool isScrollControlled = false,
}) =>
    showModalBottomSheet(
      context: context,
      builder: builder,
      useRootNavigator: !PlatformInfos.isMobile,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 128,
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
