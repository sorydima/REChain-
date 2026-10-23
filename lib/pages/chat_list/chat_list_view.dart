// SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
// SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/config/setting_keys.dart';
import 'package:rechainonline/config/themes.dart';
import 'package:rechainonline/pages/chat_list/chat_list.dart';
import 'package:rechainonline/pages/chat_list/navigation_rail.dart';
import 'package:rechainonline/pages/chat_list/start_chat_fab.dart';
import 'package:material_ui/material_ui.dart';

import 'chat_list_body.dart';

class ChatListView extends StatelessWidget {
  final ChatListController controller;

  const ChatListView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final oneColumnSpacesMode =
        !rechainonlineThemes.isColumnMode(context) &&
        AppSettings.displayNavigationRail.value;
    return PopScope(
      canPop: !controller.isSearchMode && controller.activeSpaceId == null,
      onPopInvokedWithResult: (pop, _) {
        if (pop) return;
        if (controller.activeSpaceId != null) {
          controller.clearActiveSpace();
          return;
        }
        if (controller.isSearchMode) {
          controller.cancelSearch();
          return;
        }
      },
      child: Row(
        children: [
          Material(
            color: Theme.of(context).colorScheme.surface,
            child: AnimatedSize(
              duration: rechainonlineThemes.animationDuration,
              curve: rechainonlineThemes.animationCurve,
              child:
                  (rechainonlineThemes.isColumnMode(context) ||
                      AppSettings.displayNavigationRail.value)
                  ? SpacesNavigationRail(
                      activeSpaceId: controller.activeSpaceId,
                      onGoToChats: controller.clearActiveSpace,
                      onGoToSpaceId: controller.setActiveSpace,
                    )
                  : SizedBox(
                      width: 0,
                      height: MediaQuery.sizeOf(context).height,
                    ),
            ),
          ),
          if (rechainonlineThemes.isColumnMode(context) ||
              AppSettings.displayNavigationRail.value)
            if (rechainonlineThemes.isColumnMode(context))
              Container(width: 1, color: Theme.of(context).dividerColor),

          Expanded(
            child: GestureDetector(
              onTap: FocusManager.instance.primaryFocus?.unfocus,
              excludeFromSemantics: true,
              behavior: HitTestBehavior.translucent,
              child: Scaffold(
                backgroundColor: oneColumnSpacesMode
                    ? Theme.of(context).colorScheme.surfaceContainer
                    : null,
                body: SafeArea(
                  top: oneColumnSpacesMode,
                  bottom: false,
                  left: false,
                  right: false,
                  child: Material(
                    clipBehavior: oneColumnSpacesMode
                        ? Clip.hardEdge
                        : Clip.none,
                    borderRadius: oneColumnSpacesMode
                        ? BorderRadius.only(
                            topLeft: Radius.circular(AppConfig.borderRadius),
                          )
                        : null,
                    color: oneColumnSpacesMode
                        ? Theme.of(context).colorScheme.surface
                        : null,
                    child: ChatListViewBody(controller),
                  ),
                ),
                floatingActionButton:
                    !controller.isSearchMode &&
                        controller.activeSpaceId == null &&
                        !rechainonlineThemes.isColumnMode(context)
                    ? ValueListenableBuilder(
                        valueListenable: controller.scrolledToTop,
                        builder: (context, scrolledToTop, _) => StartChatFab(
                          extended:
                              scrolledToTop &&
                              !AppSettings.displayNavigationRail.value,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
