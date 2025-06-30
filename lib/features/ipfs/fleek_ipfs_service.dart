import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ipfs_service.dart';

class FleekIpfsService implements IpfsService {
  String? _apiKey;
  String? _apiSecret;
  static const _baseUrl = 'https://api.fleek.co/ipfs';

  @override
  String get providerName => 'Fleek';

  @override
  Future<void> initialize({required Map<String, dynamic> config}) async {
    _apiKey = config['apiKey'] as String?;
    _apiSecret = config['apiSecret'] as String?;
    if (_apiKey == null || _apiSecret == null) {
      throw Exception('Fleek API key and secret are required');
    }
  }

  Map<String, String> get _headers => {
    'Authorization': 'Basic ' + base64Encode(utf8.encode('$_apiKey:$_apiSecret')),
    'Content-Type': 'application/json',
  };

  @override
  Future<String> uploadFile({required List<int> fileBytes, required String fileName, Map<String, String>? metadata}) async {
    final uri = Uri.parse('$_baseUrl/upload');
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(_headers)
      ..files.add(http.MultipartFile.fromBytes('file', fileBytes, filename: fileName));
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final data = jsonDecode(respStr);
      return data['hash'] as String;
    } else {
      throw Exception('Fleek upload failed: $respStr');
    }
  }

  @override
  Future<List<int>> downloadFile(String cid) async {
    final uri = Uri.parse('https://ipfs.fleek.co/ipfs/$cid');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download file from Fleek: ${response.body}');
    }
  }

  @override
  Future<bool> pinFile(String cid) async {
    // Fleek automatically pins uploads; explicit pinning is not required
    return true;
  }

  @override
  Future<bool> unpinFile(String cid) async {
    // Fleek does not support unpinning via API (as of now)
    return false;
  }

  @override
  Future<List<IpfsFileInfo>> listPinnedFiles() async {
    // Fleek API for listing pins is not public; return empty for now
    return [];
  }

  @override
  Future<IpfsProviderStatus> getStatus() async {
    try {
      await listPinnedFiles();
      return IpfsProviderStatus(providerName: providerName, isHealthy: true);
    } catch (e) {
      return IpfsProviderStatus(providerName: providerName, isHealthy: false, extra: {'error': e.toString()});
    }
  }
} 