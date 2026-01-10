import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_vodozemac/flutter_vodozemac.dart' as vod;
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/utils/client_manager.dart';
import 'package:rechainonline/utils/platform_infos.dart';
import 'config/setting_keys.dart';
import 'utils/background_push.dart';
import 'widgets/rechainonline_chat_app.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import 'widgets/missing_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (TelegramWebApp.instance.isSupported) {
      TelegramWebApp.instance.ready();
      Future.delayed(const Duration(seconds: 1), TelegramWebApp.instance.expand);
    }
  } catch (e) {
    print("Error happened in Flutter while loading Telegram $e");
    // add delay for 'Telegram not loading sometimes' bug
    await Future.delayed(const Duration(milliseconds: 200));
    main();
    return;
  }

  try {
    await vod.init(wasmPath: './assets/vodozemac/');
  } catch (e, s) {
    Logs().e('Failed to initialize flutter_vodozemac', e, s);
  }

  Logs().nativeColors = !PlatformInfos.isIOS;
  final store = await SharedPreferences.getInstance();
  final clients = await ClientManager.getClients(store: store);

  // If the app starts in detached mode, we assume that it is in
  // background fetch mode for processing push notifications. This is
  // currently only supported on Android.
  if (PlatformInfos.isAndroid &&
      AppLifecycleState.detached == WidgetsBinding.instance.lifecycleState) {
    // Do not send online presences when app is in background fetch mode.
    for (final client in clients) {
      client.backgroundSync = false;
      client.syncPresence = PresenceType.offline;
    }

    // In the background fetch mode we do not want to waste ressources with
    // starting the Flutter engine but process incoming push notifications.
    BackgroundPush.clientOnly(clients.first);
    // To start the flutter engine afterwards we add an custom observer.
    WidgetsBinding.instance.addObserver(AppStarter(clients, store));
    Logs().i(
      '${AppConfig.applicationName} started in background-fetch mode. No GUI will be created unless the app is no longer detached.',
    );
    return;
  }

  // Started in foreground mode.
  Logs().i(
    '${AppConfig.applicationName} started in foreground mode. Rendering GUI...',
  );
  await startGui(clients, store);
}

/// Fetch the pincode for the applock and start the flutter engine.
Future<void> startGui(List<Client> clients, SharedPreferences store) async {
  // Fetch the pin for the applock if existing for mobile applications.
  String? pin;
  if (PlatformInfos.isMobile) {
    try {
      pin =
          await const FlutterSecureStorage().read(key: AppSettings.appLockKey.key);
    } catch (e, s) {
      Logs().d('Unable to read PIN from Secure storage', e, s);
    }
  }

  // Preload first client
  final firstClient = clients.firstOrNull;
  await firstClient?.roomsLoading;
  await firstClient?.accountDataLoading;

  runApp(REChainApp(clients: clients, pincode: pin, store: store));
}

/// Watches the lifecycle changes to start the application when it
/// is no longer detached.
class AppStarter with WidgetsBindingObserver {
  final List<Client> clients;
  final SharedPreferences store;
  bool guiStarted = false;

  AppStarter(this.clients, this.store);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (guiStarted) return;
    if (state == AppLifecycleState.detached) return;

    Logs().i(
      '${AppConfig.applicationName} switches from the detached background-fetch mode to ${state.name} mode. Rendering GUI...',
    );
    // Switching to foreground mode needs to reenable send online sync presence.
    for (final client in clients) {
      client.backgroundSync = true;
      client.syncPresence = PresenceType.online;
    }
    startGui(clients, store);
    // We must make sure that the GUI is only started once.
    guiStarted = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram REChain App',
      theme: TelegramThemeUtil.getTheme(TelegramWebApp.instance),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  double get safeAreaTop => 0.0;

  @override
  Widget build(BuildContext context) {
    final TelegramWebApp telegram = TelegramWebApp.instance;
    return Scaffold(
      backgroundColor: telegram.backgroundColor ?? Colors.grey,
      appBar: TeleAppbar(title: 'REChain App', top: safeAreaTop),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListButton('Expand', onPress: telegram.expand),
          InfoExpandableTile(
            'Init Data',
            telegram.initData.toString(),
          ),
          InfoExpandableTile(
            'Init Data Unsafe',
            telegram.initDataUnsafe?.toReadableString() ?? 'null',
          ),
          InfoExpandableTile(
            'isVerticalSwipesEnabled',
            telegram.isVerticalSwipesEnabled.toString(),
          ),
          ListButton('enableVerticalSwipes', onPress: telegram.enableVerticalSwipes),
          ListButton('disableVerticalSwipes', onPress: telegram.disableVerticalSwipes),
          InfoExpandableTile('Version', telegram.version),
          InfoExpandableTile('Platform', telegram.platform),
          InfoExpandableTile('Color Scheme', telegram.colorScheme.name),
          ThemeParamsWidget(telegram.themeParams),
          InfoExpandableTile('isActive', telegram.isActive.toString()),
          InfoExpandableTile('isExpanded', telegram.isExpanded.toString()),
          InfoExpandableTile('viewportHeight', telegram.viewportHeight.toString()),
          InfoExpandableTile('viewportStableHeight', telegram.viewportStableHeight.toString()),
          InfoExpandableTile('safeAreaInset', telegram.safeAreaInset.toString()),
          InfoExpandableTile('contentSafeAreaInset', telegram.contentSafeAreaInset.toString()),
          OneColorExpandableTile('headerColor', telegram.headerColor),
          OneColorExpandableTile('backgroundColor', telegram.backgroundColor),
          OneColorExpandableTile('bottomBarColor', telegram.bottomBarColor),
        ],
      ),
    );
  }
}
