import 'package:flutter/material.dart';
import 'package:rechainonline/pages/dashboard/dashboard_page.dart';

void main() {
  runApp(MaterialApp(
    home: DashboardPage(walletAddress: '0x...'),
  ));
} 