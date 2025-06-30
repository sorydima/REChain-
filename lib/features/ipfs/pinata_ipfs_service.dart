import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'ipfs_service.dart';

class PinataIpfsService implements IpfsService {
  String? _apiKey;
  String? _secretApiKey;
  static const _baseUrl = 'https://api.pinata.cloud';

  @override
  String get providerName => 'Pinata';

  @override
  Future<void> initialize({required Map<String, dynamic> config}) async {
    _apiKey = config['apiKey'] as String?;
    _secretApiKey = config['secretApiKey'] as String?;
    if (_apiKey == null || _secretApiKey == null) {
      throw Exception('Pinata API keys are required');
    }
  }

  Map<String, String> get _headers => {
    'pinata_api_key': _apiKey!,
    'pinata_secret_api_key': _secretApiKey!,
  };

  @override
  Future<String> uploadFile({required List<int> fileBytes, required String fileName, Map<String, String>? metadata}) async {
    final uri = Uri.parse('$_baseUrl/pinning/pinFileToIPFS');
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(_headers)
      ..files.add(http.MultipartFile.fromBytes('file', fileBytes, filename: fileName));
    if (metadata != null) {
      request.fields['pinataMetadata'] = jsonEncode({'name': fileName, 'keyvalues': metadata});
    }
    final response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      final data = jsonDecode(respStr);
      return data['IpfsHash'] as String;
    } else {
      throw Exception('Pinata upload failed: $respStr');
    }
  }

  @override
  Future<List<int>> downloadFile(String cid) async {
    final uri = Uri.parse('https://gateway.pinata.cloud/ipfs/$cid');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download file from IPFS: ${response.body}');
    }
  }

  @override
  Future<bool> pinFile(String cid) async {
    final uri = Uri.parse('$_baseUrl/pinning/pinByHash');
    final response = await http.post(uri, headers: _headers, body: jsonEncode({'hashToPin': cid}));
    return response.statusCode == 200;
  }

  @override
  Future<bool> unpinFile(String cid) async {
    final uri = Uri.parse('$_baseUrl/pinning/unpin/$cid');
    final response = await http.delete(uri, headers: _headers);
    return response.statusCode == 200;
  }

  @override
  Future<List<IpfsFileInfo>> listPinnedFiles() async {
    final uri = Uri.parse('$_baseUrl/data/pinList?status=pinned');
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final rows = data['rows'] as List<dynamic>;
      return rows.map((row) {
        return IpfsFileInfo(
          cid: row['ipfs_pin_hash'],
          fileName: row['metadata']?['name'] ?? '',
          size: row['size'] != null ? int.tryParse(row['size'].toString()) : null,
          createdAt: row['date_pinned'] != null ? DateTime.tryParse(row['date_pinned']) : null,
          metadata: (row['metadata']?['keyvalues'] as Map?)?.cast<String, String>(),
        );
      }).toList();
    } else {
      throw Exception('Failed to list pinned files: ${response.body}');
    }
  }

  @override
  Future<IpfsProviderStatus> getStatus() async {
    // Pinata does not provide a direct status API, so we check pin list as a health check
    try {
      await listPinnedFiles();
      return IpfsProviderStatus(providerName: providerName, isHealthy: true);
    } catch (e) {
      return IpfsProviderStatus(providerName: providerName, isHealthy: false, extra: {'error': e.toString()});
    }
  }
} 