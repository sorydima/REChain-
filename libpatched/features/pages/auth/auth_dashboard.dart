import 'package:flutter/material.dart';

class AuthDashboard extends StatelessWidget {
  const AuthDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Dashboard'),
      ),
      body: const Center(
        child: Text('Auth Dashboard Placeholder'),
      ),
    );
  }
}
