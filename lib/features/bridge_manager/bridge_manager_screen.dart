import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';

import 'package:rechainonline/widgets/matrix.dart';
import 'bridge_config.dart';
import 'bridge_manager.dart';
import 'bridge_status.dart';
import 'widgets/bridge_list_item.dart';
import 'widgets/add_bridge_dialog.dart';
import 'widgets/bridge_status_card.dart';

class BridgeManagerScreen extends StatefulWidget {
  const BridgeManagerScreen({super.key});

  @override
  State<BridgeManagerScreen> createState() => _BridgeManagerScreenState();
}

class _BridgeManagerScreenState extends State<BridgeManagerScreen> {
  late BridgeManager _bridgeManager;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initBridgeManager();
  }

  Future<void> _initBridgeManager() async {
    final matrix = Matrix.of(context);
    _bridgeManager = BridgeManager(matrix.store, matrix.client);
    setState(() => _isLoading = false);
  }

  Future<void> _addNewBridge() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const AddBridgeDialog(),
    );

    if (result != null) {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      try {
        final success = await _bridgeManager.configureBridge(
          result['type'] as String,
          result['config'] as Map<String, dynamic>,
        );

        if (success) {
          scaffoldMessenger.showSnackBar(
            const SnackBar(
              content: Text('Bridge configured successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          scaffoldMessenger.showSnackBar(
            const SnackBar(
              content: Text('Failed to configure bridge'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _removeBridge(String bridgeType) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Bridge'),
        content: Text('Are you sure you want to remove the $bridgeType bridge?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('REMOVE'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      try {
        final success = await _bridgeManager.removeBridge(bridgeType);
        if (success) {
          scaffoldMessenger.showSnackBar(
            const SnackBar(
              content: Text('Bridge removed successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          scaffoldMessenger.showSnackBar(
            const SnackBar(
              content: Text('Failed to remove bridge'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return StreamBuilder<Map<String, BridgeStatus>>(
      stream: _bridgeManager.statusStream,
      initialData: _bridgeManager.bridgeStatuses,
      builder: (context, snapshot) {
        final bridgeStatuses = snapshot.data ?? {};
        final configuredBridges = _bridgeManager.configuredBridges;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Bridge Manager'),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addNewBridge,
                tooltip: 'Add New Bridge',
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              if (configuredBridges.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      'No bridges configured yet.\nTap the + button to add a bridge.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              else ...[
                const Text(
                  'Active Bridges',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: configuredBridges.length,
                  itemBuilder: (context, index) {
                    final bridge = configuredBridges.entries.elementAt(index);
                    final status = bridgeStatuses[bridge.key];
                    return BridgeStatusCard(
                      config: bridge.value,
                      status: status,
                      onRemove: () => _removeBridge(bridge.key),
                    );
                  },
                ),
              ],
              const SizedBox(height: 32),
              const Text(
                'Available Bridges',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: BridgeManager.supportedBridges.length,
                itemBuilder: (context, index) {
                  final bridge = BridgeManager.supportedBridges.entries
                      .elementAt(index);
                  final isConfigured = configuredBridges.containsKey(bridge.key);
                  return BridgeListItem(
                    info: bridge.value,
                    isConfigured: isConfigured,
                    onTap: isConfigured ? null : _addNewBridge,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _bridgeManager.dispose();
    super.dispose();
  }
}
