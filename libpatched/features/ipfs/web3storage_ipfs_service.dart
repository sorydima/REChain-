import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ipfs_service.dart';

class Web3StorageIpfsService implements IpfsService {
  String? _apiToken;
  static const _baseUrl = 'https://api.web3.storage';

  @override
  String get providerName => 'Web3.Storage';

  @override
  Future<void> initialize({required Map<String, dynamic> config}) async {
    _apiToken = config['apiToken'] as String?;
    if (_apiToken == null) {
      throw Exception('Web3.Storage API token is required');
    }
  }

  Map<String, String> get _headers => {
    'Authorization': 'Bearer $_apiToken',
  };

  @override
  Future<String> uploadFile({required List<int> fileBytes, required String fileName, Map<String, String>? metadata}) async {
    final uri = Uri.parse('$_baseUrl/upload');
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(_headers)
      ..files.add(http.MultipartFile.fromBytes('file', fileBytes, filename: fileName));
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 202) {
      final data = jsonDecode(respStr);
      return data['cid'] as String;
    } else {
      throw Exception('Web3.Storage upload failed: $respStr');
    }
  }

  @override
  Future<List<int>> downloadFile(String cid) async {
    final uri = Uri.parse('https://$cid.ipfs.w3s.link');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download file from Web3.Storage: ${response.body}');
    }
  }

  @override
  Future<bool> pinFile(String cid) async {
    // Web3.Storage automatically pins uploads; explicit pinning is not required
    return true;
  }

  @override
  Future<bool> unpinFile(String cid) async {
    // Web3.Storage does not support unpinning via API (as of now)
    return false;
  }

  @override
  Future<List<IpfsFileInfo>> listPinnedFiles() async {
    final uri = Uri.parse('$_baseUrl/user/uploads');
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((item) {
        return IpfsFileInfo(
          cid: item['cid'],
          fileName: item['name'] ?? '',
          size: item['dagSize'] != null ? int.tryParse(item['dagSize'].toString()) : null,
          createdAt: item['created'] != null ? DateTime.tryParse(item['created']) : null,
          metadata: null,
        );
      }).toList();
    } else {
      throw Exception('Failed to list uploads: ${response.body}');
    }
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