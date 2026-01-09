import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rechainonline/config/routes.dart';
import 'package:rechainonline/config/setting_keys.dart';
import 'package:rechainonline/config/themes.dart';
import 'package:rechainonline/l10n/l10n.dart';
import 'package:rechainonline/widgets/app_lock.dart';
import 'package:rechainonline/widgets/theme_builder.dart';
import '../utils/custom_scroll_behaviour.dart';
import 'matrix.dart';

// Global REChain class for accessing app-wide properties
class REChain {
  static final REChain _instance = REChain._internal();
  factory REChain() => _instance;
  REChain._internal();

  static REChain get pp => _instance;
  
  late GoRouter router;
  
  void initializeRouter(GoRouter router) {
    this.router = router;
  }
}

class REChainApp extends StatelessWidget {
  final Widget? testWidget;
  final List<Client> clients;
  final String? pincode;
  final SharedPreferences store;

  const REChainApp({
    super.key,
    this.testWidget,
    required this.clients,
    required this.store,
    this.pincode,
  });

  /// getInitialLink may rereturn the value multiple times if this view is
  /// opened multiple times for example if the user logs out after they logged
  /// in with qr code or magic link.
  static bool gotInitialLink = false;

  // Router must be outside of build method so that hot reload does not reset
  // the current path.
  static final GoRouter router = GoRouter(
    routes: AppRoutes.routes,
    debugLogDiagnostics: true,
  );

  @override
  Widget build(BuildContext context) {
    // Initialize the global router
    REChain.pp.initializeRouter(router);
    
    return ThemeBuilder(
      builder: (context, themeMode, primaryColor) => MaterialApp.router(
        title: AppSettings.applicationName.value,
        themeMode: themeMode,
        theme: rechainonlineThemes.buildTheme(context, Brightness.light, primaryColor),
        darkTheme: rechainonlineThemes.buildTheme(
          context,
          Brightness.dark,
          primaryColor,
        ),
        scrollBehavior: CustomScrollBehavior(),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.supportedLocales,
        routerConfig: router,
        builder: (context, child) => AppLockWidget(
          pincode: pincode,
          clients: clients,
          // Need a navigator above the Matrix widget for
          // displaying dialogs
          child: Matrix(
            clients: clients,
            store: store,
            child: testWidget ?? child,
          ),
        ),
      ),
    );
  }
}
