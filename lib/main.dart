import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_vodozemac/flutter_vodozemac.dart' as vod;
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

import 'package:rechainonline/config/app_config.dart';
import 'package:rechainonline/utils/client_manager.dart';
import 'package:rechainonline/utils/notification_background_handler.dart';
import 'package:rechainonline/utils/platform_infos.dart';
import 'config/setting_keys.dart';
import 'utils/background_push.dart';
import 'widgets/rechainonline_chat_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram REChain App',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: TelegramWebApp.instance.themeParams.buttonColor ?? Colors.blue,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  double get safeAreaTop => TelegramWebApp.instance.safeAreaInset.top;

  @override
  Widget build(BuildContext context) {
    final telegram = TelegramWebApp.instance;
    return Scaffold(
      backgroundColor: telegram.backgroundColor ?? Colors.grey,
      appBar: AppBar(
        title: const Text('REChain App'),
        backgroundColor: telegram.headerColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            title: const Text('Expand'),
            onTap: telegram.expand,
          ),
          ExpansionTile(
            title: const Text('Init Data'),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(telegram.initData.toString()),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('Init Data Unsafe'),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(telegram.initDataUnsafe?.toString() ?? 'null'),
              ),
            ],
          ),
          ListTile(
            title: Text('isVerticalSwipesEnabled: ${telegram.isVerticalSwipesEnabled}'),
          ),
          ListTile(
            title: const Text('enableVerticalSwipes'),
            onTap: telegram.enableVerticalSwipes,
          ),
          ListTile(
            title: const Text('disableVerticalSwipes'),
            onTap: telegram.disableVerticalSwipes,
          ),
          ListTile(
            title: Text('Version: ${telegram.version ?? ''}'),
          ),
          ListTile(
            title: Text('Platform: ${telegram.platform ?? ''}'),
          ),
          ListTile(
            title: Text('Color Scheme: ${telegram.colorScheme?.name ?? ''}'),
          ),
          ListTile(
            title: Text('isActive: ${telegram.isActive}'),
          ),
          ListTile(
            title: Text('isExpanded: ${telegram.isExpanded}'),
          ),
          ListTile(
            title: Text('viewportHeight: ${telegram.viewportHeight}'),
          ),
          ListTile(
            title: Text('viewportStableHeight: ${telegram.viewportStableHeight}'),
          ),
          ListTile(
            title: Text('safeAreaInset: ${telegram.safeAreaInset}'),
          ),
          ListTile(
            title: Text('contentSafeAreaInset: ${telegram.contentSafeAreaInset}'),
          ),
          ListTile(
            title: Text('headerColor: ${telegram.headerColor}'),
          ),
          ListTile(
            title: Text('backgroundColor: ${telegram.backgroundColor}'),
          ),
          ListTile(
            title: Text('bottomBarColor: ${telegram.bottomBarColor}'),
          ),
        ],
      ),
    );
  }
}

ReceivePort? mainIsolateReceivePort;

void main() async {
  if (PlatformInfos.isAndroid) {
    final port = mainIsolateReceivePort = ReceivePort();
    IsolateNameServer.removePortNameMapping(AppConfig.mainIsolatePortName);
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      AppConfig.mainIsolatePortName,
    );
    await waitForPushIsolateDone();
  }

  // Our background push shared isolate accesses flutter-internal things very early in the startup proccess
  // To make sure that the parts of flutter needed are started up already, we need to ensure that the
  // widget bindings are initialized already.
  WidgetsFlutterBinding.ensureInitialized();

  final store = await AppSettings.init();
  Logs().i('Welcome to ${AppSettings.applicationName.value} <3');

  await vod.init(wasmPath: './assets/assets/vodozemac/');

  Logs().nativeColors = !PlatformInfos.isIOS;
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
      '${AppSettings.applicationName.value} started in background-fetch mode. No GUI will be created unless the app is no longer detached.',
    );
    return;
  }

  // Started in foreground mode.
  Logs().i(
    '${AppSettings.applicationName.value} started in foreground mode. Rendering GUI...',
  );
  await startGui(clients, store);
}

/// Fetch the pincode for the applock and start the flutter engine.
Future<void> startGui(List<Client> clients, SharedPreferences store) async {
  // Fetch the pin for the applock if existing for mobile applications.
  String? pin;
  if (PlatformInfos.isMobile) {
    try {
      pin = await const FlutterSecureStorage().read(
        key: 'com.rechain.app_lock',
      );
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
      '${AppSettings.applicationName.value} switches from the detached background-fetch mode to ${state.name} mode. Rendering GUI...',
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
