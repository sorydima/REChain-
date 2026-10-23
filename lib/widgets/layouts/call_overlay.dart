// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/config/themes.dart';
import 'package:rechainonline/pages/call/call_page.dart';
import 'package:rechainonline/widgets/matrix.dart';
import 'package:material_ui/material_ui.dart';

class CallOverlay extends StatelessWidget {
  final Widget child;
  const CallOverlay({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Matrix.of(context).activeCallRoomId,
      builder: (context, value, _) {
        final roomId = value;
        if (roomId == null) return child;
        return ValueListenableBuilder(
          valueListenable: Matrix.of(context).callPosition,
          builder: (context, value, _) {
            final callPosition = value;
            final callFullScreen = callPosition == .fullScreen;
            return Stack(
              children: [
                child,
                AnimatedPositioned(
                  duration: rechainonlineThemes.animationDuration,
                  curve: rechainonlineThemes.animationCurve,
                  top: callFullScreen
                      ? 0
                      : callPosition == .top
                      ? 86
                      : null,
                  left: callFullScreen ? 0 : null,
                  right: callFullScreen ? 0 : 8,
                  bottom: callFullScreen ? 0 : null,
                  height: callFullScreen ? null : 256,
                  width: callFullScreen ? null : 256,
                  child: Material(
                    elevation: callFullScreen ? 0 : 4,
                    clipBehavior: .hardEdge,
                    shape: callFullScreen
                        ? null
                        : RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(
                              AppConfig.borderRadius,
                            ),
                          ),
                    child: Navigator(
                      onDidRemovePage: (_) {
                        Matrix.of(context).activeCallRoomId.value = null;
                      },
                      pages: [MaterialPage(child: CallPage(roomId: roomId))],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
