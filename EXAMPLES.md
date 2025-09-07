# Examples and Tutorials for REChain

This document provides example code snippets and tutorials to help developers get started with REChain integrations and features.

## Matrix Bot Example

```dart
import 'package:matrix_sdk/matrix_sdk.dart';

void main() async {
  final client = MatrixClient('https://matrix.org');
  await client.login('username', 'password');
  client.onMessage.listen((event) {
    print('New message: ${event.body}');
  });
  await client.joinRoom('!roomid:matrix.org');
}
```

## Blockchain Transaction Example

```dart
import 'package:web3dart/web3dart.dart';

void sendTransaction() async {
  final client = Web3Client('https://mainnet.infura.io/v3/YOUR-PROJECT-ID', Client());
  final credentials = EthPrivateKey.fromHex('YOUR-PRIVATE-KEY');
  final txHash = await client.sendTransaction(
    credentials,
    Transaction(
      to: EthereumAddress.fromHex('0x...'),
      value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
    ),
  );
  print('Transaction hash: $txHash');
}
```

## IPFS File Upload Example

```dart
import 'package:ipfs_client/ipfs_client.dart';

void uploadFile() async {
  final client = IpfsClient();
  final cid = await client.addFile('path/to/file.txt');
  print('File uploaded with CID: $cid');
}
```

## AI Integration Example

```dart
import 'package:rechain_ai/rechain_ai.dart';

void analyzeText() async {
  final aiClient = RechainAIClient(apiKey: 'YOUR_API_KEY');
  final result = await aiClient.analyzeText('Hello, world!');
  print('Analysis result: $result');
}
```

## Getting Started

- Clone the repository
- Follow the [Development Guide](DEVELOPMENT.md)
- Explore the [API Documentation](API.md)
- Join the community on Matrix for support

---

*This examples document is part of the REChain documentation suite.*
