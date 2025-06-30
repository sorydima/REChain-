# REChain Code Samples

Find practical code examples for using REChain services in Dart/Flutter:

## Dart Code Samples
- [TON Blockchain Service](../docs/code_samples/ton_service_sample.dart)
- [IPFS Service](../docs/code_samples/ipfs_service_sample.dart)
- [Etke AI Service](../docs/code_samples/etke_service_sample.dart)
- [VoIP Plugin](../docs/code_samples/voip_plugin_sample.dart)
- [Dashboard Page (Flutter UI)](../docs/code_samples/dashboard_page_sample.dart)

## More Examples
- [API Auth](API-Auth.md)
- [API AI](API-AI.md)
- [API IPFS](API-IPFS.md)
- [API Blockchain](API-Blockchain.md)
- [API Matrix](API-Matrix.md)

For full API reference, see [API-Reference.md](API-Reference.md).

## Send Matrix Message

### Dart/Flutter
```dart
final response = await http.post(
  Uri.parse('https://your.api/api/v1/matrix/sendMessage'),
  headers: { 'Authorization': 'Bearer <token>' },
  body: jsonEncode({
    'room_id': '!abc123:matrix.org',
    'content': 'Hello, world!'
  })
);
```

### curl
```sh
curl -X POST https://your.api/api/v1/matrix/sendMessage \
  -H 'Authorization: Bearer <token>' \
  -d '{"room_id": "!abc123:matrix.org", "content": "Hello, world!"}'
```

## Upload IPFS File

### Dart/Flutter
```dart
var request = http.MultipartRequest('POST', Uri.parse('https://your.api/api/v1/ipfs/upload'));
request.headers['Authorization'] = 'Bearer <token>';
request.files.add(await http.MultipartFile.fromPath('file', '/path/to/file'));
final response = await request.send();
```

### curl
```sh
curl -X POST https://your.api/api/v1/ipfs/upload \
  -H 'Authorization: Bearer <token>' \
  -F 'file=@/path/to/file'
```

## Login

### Dart/Flutter
```dart
final response = await http.post(
  Uri.parse('https://your.api/api/v1/auth/login'),
  body: jsonEncode({
    'username': 'alice',
    'password': 'password123'
  })
);
```

### curl
```sh
curl -X POST https://your.api/api/v1/auth/login \
  -d '{"username": "alice", "password": "password123"}'
```

## AI Moderation

### Dart/Flutter
```dart
final response = await http.post(
  Uri.parse('https://your.api/api/v1/ai/moderate'),
  headers: { 'Authorization': 'Bearer <token>' },
  body: jsonEncode({ 'text': 'Some message to moderate' })
);
```

### curl
```sh
curl -X POST https://your.api/api/v1/ai/moderate \
  -H 'Authorization: Bearer <token>' \
  -d '{"text": "Some message to moderate"}'
```

## gRPC Example (Send Matrix Message)

```proto
service MatrixService {
  rpc SendMessage (SendMessageRequest) returns (SendMessageResponse);
}

message SendMessageRequest {
  string room_id = 1;
  string content = 2;
}

message SendMessageResponse {
  string event_id = 1;
}
``` 