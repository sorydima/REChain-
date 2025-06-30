import 'package:rechainonline/features/blockchain/ton/ton_service.dart';

void main() async {
  final config = ChainConfig(rpcUrl: 'https://ton.org/rpc');
  final tonService = TonService(config);
  await tonService.initialize();

  final address = 'EQC...';
  final balance = await tonService.getBalance(address);
  print('TON balance: $balance');

  final stats = await tonService.getNetworkStats();
  print('TON network stats: ${stats.toString()}');
} 