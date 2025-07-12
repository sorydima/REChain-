import 'package:flutter/material.dart';

class TelegramWebAppInitPage extends StatelessWidget {
  final String? tgWebAppData;

  const TelegramWebAppInitPage({super.key, this.tgWebAppData});

  @override
  Widget build(BuildContext context) {
    // TODO: Parse tgWebAppData and initialize app accordingly
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telegram WebApp Initialization'),
      ),
      body: Center(
        child: Text(
          'Initializing Telegram WebApp with data:\n$tgWebAppData',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
