import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ipfs_service.dart';

class InfuraIpfsService implements IpfsService {
  String? _projectId;
  String? _projectSecret;
  static const _baseUrl = 'https://ipfs.infura.io:5001/api/v0';

  @override
  String get providerName => 'Infura';

  @override
  Future<void> initialize({required Map<String, dynamic> config}) async {
    _projectId = config['projectId'] as String?;
    _projectSecret = config['projectSecret'] as String?;
    if (_projectId == null || _projectSecret == null) {
      throw Exception('Infura project ID and secret are required');
    }
  }

  Map<String, String> get _headers => {
    'authorization': 'Basic ' + base64Encode(utf8.encode('$_projectId:$_projectSecret')),
  };

  @override
  Future<String> uploadFile({required List<int> fileBytes, required String fileName, Map<String, String>? metadata}) async {
    final uri = Uri.parse('$_baseUrl/add?pin=true');
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(_headers)
      ..files.add(http.MultipartFile.fromBytes('file', fileBytes, filename: fileName));
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final data = jsonDecode(respStr);
      return data['Hash'] as String;
    } else {
      throw Exception('Infura upload failed: $respStr');
    }
  }

  @override
  Future<List<int>> downloadFile(String cid) async {
    final uri = Uri.parse('https://ipfs.infura.io/ipfs/$cid');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download file from Infura: ${response.body}');
    }
  }

  @override
  Future<bool> pinFile(String cid) async {
    final uri = Uri.parse('$_baseUrl/pin/add?arg=$cid');
    final response = await http.post(uri, headers: _headers);
    return response.statusCode == 200;
  }

  @override
  Future<bool> unpinFile(String cid) async {
    final uri = Uri.parse('$_baseUrl/pin/rm?arg=$cid');
    final response = await http.post(uri, headers: _headers);
    return response.statusCode == 200;
  }

  @override
  Future<List<IpfsFileInfo>> listPinnedFiles() async {
    final uri = Uri.parse('$_baseUrl/pin/ls?type=all');
    final response = await http.post(uri, headers: _headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final keys = (data['Keys'] as Map<String, dynamic>).keys;
      return keys.map((cid) {
        return IpfsFileInfo(
          cid: cid,
          fileName: '',
          size: null,
          createdAt: null,
          metadata: null,
        );
      }).toList();
    } else {
      throw Exception('Failed to list pinned files: ${response.body}');
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