import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import '../widgets/matrix.dart';
import 'services_manager.dart';

// Global services manager instance
ServicesManager? _globalServicesManager;

extension MatrixExtension on MatrixState {
  ServicesManager get services {
    if (_globalServicesManager == null) {
      throw Exception('ServicesManager not initialized. Call initServices() first.');
    }
    return _globalServicesManager!;
  }

  bool get hasServices => _globalServicesManager != null;

  Future<void> initServices() async {
    if (_globalServicesManager != null) return;

    _globalServicesManager = ServicesManager(
      client: client,
      store: store,
    );

    // Set up periodic maintenance tasks
    _setupMaintenanceTasks();
  }

  void _setupMaintenanceTasks() {
    // Perform security audit periodically
    Future.delayed(const Duration(minutes: 5), () async {
      if (_globalServicesManager != null) {
        await _globalServicesManager!.performSecurityAudit();
      }
    });

    // Clean up services periodically
    Future.delayed(const Duration(hours: 1), () async {
      if (_globalServicesManager != null) {
        await _globalServicesManager!.cleanupServices();
      }
    });
  }

  Future<void> disposeServices() async {
    await _globalServicesManager?.dispose();
    _globalServicesManager = null;
  }
}
