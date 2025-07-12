import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'aurora_plugins_integration.dart';

abstract class AuroraPluginManager {
  Future<void> initializePlugins();
  void disposePlugins();
}

AuroraPluginManager getPluginManager() {
  if (kIsWeb) {
    return WebPluginManager();
  } else {
    return AuroraOSPluginManager();
  }
}

class WebPluginManager implements AuroraPluginManager {
  @override
  Future<void> initializePlugins() async {
    // Initialize web plugins if any
  }

  @override
  void disposePlugins() {
    // Dispose web plugins if any
  }
}

class AuroraOSPluginManager implements AuroraPluginManager {
  final AuroraPluginsIntegration _integration = AuroraPluginsIntegration();

  @override
  Future<void> initializePlugins() async {
    await _integration.initialize();
  }

  @override
  void disposePlugins() {
    _integration.dispose();
  }
}
