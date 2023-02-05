import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';
import 'package:vrouter/vrouter.dart';

import 'package:rechainonline/config/routes.dart';
import 'package:rechainonline/config/themes.dart';
import '../config/app_config.dart';
import '../utils/custom_scroll_behaviour.dart';
import 'matrix.dart';

class rechainonlineChatApp extends StatefulWidget {
  final Widget? testWidget;
  final List<Client> clients;
  final Map<String, String>? queryParameters;
  static GlobalKey<VRouterState> routerKey = GlobalKey<VRouterState>();
  const rechainonlineChatApp({
    Key? key,
    this.testWidget,
    required this.clients,
    this.queryParameters,
  }) : super(key: key);

  /// getInitialLink may rereturn the value multiple times if this view is
  /// opened multiple times for example if the user logs out after they logged
  /// in with qr code or magic link.
  static bool gotInitialLink = false;

  @override
  rechainonlineChatAppState createState() => rechainonlineChatAppState();
}

class rechainonlineChatAppState extends State<rechainonlineChatApp> {
  bool? columnMode;
  String? _initialUrl;

  @override
  void initState() {
    super.initState();
    _initialUrl =
        widget.clients.any((client) => client.isLogged()) ? '/rooms' : '/home';
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) => AdaptiveTheme(
        light: rechainonlineThemes.buildTheme(
          Brightness.light,
          lightColorScheme,
        ),
        dark: rechainonlineThemes.buildTheme(
          Brightness.dark,
          lightColorScheme,
        ),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => LayoutBuilder(
          builder: (context, constraints) {
            final isColumnMode =
                rechainonlineThemes.isColumnModeByWidth(constraints.maxWidth);
            if (isColumnMode != columnMode) {
              Logs().v('Set Column Mode = $isColumnMode');
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  _initialUrl = rechainonlineChatApp.routerKey.currentState?.url;
                  columnMode = isColumnMode;
                  rechainonlineChatApp.routerKey = GlobalKey<VRouterState>();
                });
              });
            }
            return VRouter(
              key: rechainonlineChatApp.routerKey,
              title: AppConfig.applicationName,
              theme: theme,
              scrollBehavior: CustomScrollBehavior(),
              logs: kReleaseMode ? VLogs.none : VLogs.info,
              darkTheme: darkTheme,
              localizationsDelegates: L10n.localizationsDelegates,
              supportedLocales: L10n.supportedLocales,
              initialUrl: _initialUrl ?? '/',
              routes: AppRoutes(columnMode ?? false).routes,
              builder: (context, child) => Matrix(
                context: context,
                router: rechainonlineChatApp.routerKey,
                clients: widget.clients,
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
