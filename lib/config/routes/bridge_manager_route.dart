import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/bridge_manager/bridge_manager_screen.dart';

class BridgeManagerRoute extends GoRoute {
  BridgeManagerRoute()
      : super(
          path: '/settings/bridges',
          builder: (BuildContext context, GoRouterState state) {
            return const BridgeManagerScreen();
          },
        );
}
