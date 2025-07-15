import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ipfs_service.dart';

class FilebaseIpfsService implements IpfsService {
  String? _accessKey;
  String? _secretKey;
  static const _baseUrl = 'https://api.filebase.io/v1/ipfs';

  @override
  String get providerName => 'Filebase';

  @override
  Future<void> initialize({required Map<String, dynamic> config}) async {
    _accessKey = config['accessKey'] as String?;
    _secretKey = config['secretKey'] as String?;
    if (_accessKey == null || _secretKey == null) {
      throw Exception('Filebase access key and secret key are required');
    }
  }

  Map<String, String> get _headers => {
    'Authorization': 'Basic ' + base64Encode(utf8.encode('$_accessKey:$_secretKey')),
    'Content-Type': 'application/json',
  };

  @override
  Future<String> uploadFile({required List<int> fileBytes, required String fileName, Map<String, String>? metadata}) async {
    final uri = Uri.parse('$_baseUrl/add');
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(_headers)
      ..files.add(http.MultipartFile.fromBytes('file', fileBytes, filename: fileName));
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final data = jsonDecode(respStr);
      return data['cid'] as String;
    } else {
      throw Exception('Filebase upload failed: $respStr');
    }
  }

  @override
  Future<List<int>> downloadFile(String cid) async {
    final uri = Uri.parse('https://ipfs.filebase.io/ipfs/$cid');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download file from Filebase: ${response.body}');
    }
  }

  @override
  Future<bool> pinFile(String cid) async {
    // Filebase automatically pins uploads; explicit pinning is not required
    return true;
  }

  @override
  Future<bool> unpinFile(String cid) async {
    // Filebase does not support unpinning via API (as of now)
    return false;
  }

  @override
  Future<List<IpfsFileInfo>> listPinnedFiles() async {
    final uri = Uri.parse('$_baseUrl/pins');
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final pins = data['pins'] as List<dynamic>;
      return pins.map((item) {
        return IpfsFileInfo(
          cid: item['cid'],
          fileName: item['name'] ?? '',
          size: item['size'] != null ? int.tryParse(item['size'].toString()) : null,
          createdAt: item['created'] != null ? DateTime.tryParse(item['created']) : null,
          metadata: null,
        );
      }).toList();
    } else {
      throw Exception('Failed to list pins: ${response.body}');
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