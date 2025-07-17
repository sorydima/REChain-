import 'package:flutter/material.dart';

class DebuggerPanel extends StatefulWidget {
  const DebuggerPanel({super.key});

  @override
  State<DebuggerPanel> createState() => _DebuggerPanelState();
}

class _DebuggerPanelState extends State<DebuggerPanel> {
  final List<String> _logs = [];

  @override
  void initState() {
    super.initState();
    // Start capturing debug logs here
    // For demonstration, we add a sample log entry
    _addLog('Debugger started');
  }

  void _addLog(String log) {
    setState(() {
      _logs.add(log);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: [
          Container(
            color: Colors.grey[900],
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Debugger Panel',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _logs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    _logs[index],
                    style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
