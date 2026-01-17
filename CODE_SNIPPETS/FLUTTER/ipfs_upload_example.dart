import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// IPFS Upload Example
///
/// Demonstrates how to upload files to IPFS and use the resulting
/// Content Identifier (CID) in Matrix messages.
///
/// Usage:
/// ```dart
/// final uploader = IpfsUploaderExample(
///   infuraProjectId: 'YOUR_PROJECT_ID',
///   infuraSecret: 'YOUR_SECRET',
/// );
/// final cid = await uploader.uploadFile('/path/to/file.png');
/// ```
class IpfsUploaderExample {
  final String? infuraProjectId;
  final String? infuraSecret;
  final String? customNodeUrl;
  final String? customNodeToken;

  // Infura IPFS endpoint
  static const String _infuraEndpoint =
      'https://ipfs.infura.io:5001/api/v0/add';
  // Public IPFS gateway
  static const String _publicGateway = 'https://ipfs.io/ipfs/';

  IpfsUploaderExample({
    this.infuraProjectId,
    this.infuraSecret,
    this.customNodeUrl,
    this.customNodeToken,
  });

  /// Upload a file to IPFS
  ///
  /// [filePath] - Path to the file to upload
  /// [progressCallback] - Optional callback for upload progress
  /// Returns the IPFS CID (Content Identifier)
  Future<String> uploadFile(
    String filePath, {
    void Function(int, int)? progressCallback,
  }) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('File not found: $filePath');
    }

    final fileName = filePath.split('/').last;
    final fileSize = await file.length();

    // Create multipart request
    final request = http.MultipartRequest('POST', _getUploadUri())
      ..files.add(
        http.MultipartFile(
          'file',
          file.openRead(),
          fileSize,
          filename: fileName,
        ),
      );

    // Add authentication header if configured
    if (customNodeToken != null) {
      request.headers['Authorization'] = 'Bearer $customNodeToken';
    }

    // Send request
    final response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('IPFS upload failed: ${response.statusCode}');
    }

    final responseBody = await response.stream.bytesToString();
    final json = jsonDecode(responseBody);

    final cid = json['Hash'] as String;
    if (kDebugMode) {
      print('Uploaded file: $fileName -> CID: $cid');
    }

    return cid;
  }

  /// Upload multiple files
  Future<List<String>> uploadMultiple(
    List<String> filePaths, {
    void Function(int, int)? progressCallback,
  }) async {
    final cids = <String>[];

    for (int i = 0; i < filePaths.length; i++) {
      final cid = await uploadFile(filePaths[i]);
      cids.add(cid);
      progressCallback?.call(i + 1, filePaths.length);
    }

    return cids;
  }

  /// Upload text content to IPFS
  Future<String> uploadText(
    String content, {
    String fileName = 'text.txt',
  }) async {
    final bytes = utf8.encode(content);
    final stream = http.ByteStream.fromIterable(bytes);
    final length = bytes.length;

    final request = http.MultipartRequest('POST', _getUploadUri())
      ..files.add(
        http.MultipartFile(
          'file',
          stream,
          length,
          filename: fileName,
        ),
      );

    if (customNodeToken != null) {
      request.headers['Authorization'] = 'Bearer $customNodeToken';
    }

    final response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('IPFS upload failed: ${response.statusCode}');
    }

    final responseBody = await response.stream.bytesToString();
    final json = jsonDecode(responseBody);

    return json['Hash'] as String;
  }

  /// Upload JSON to IPFS
  Future<String> uploadJson(Map<String, dynamic> data) async {
    final content = jsonEncode(data);
    return uploadText(content, fileName: 'data.json');
  }

  /// Get IPFS gateway URL for a CID
  String getGatewayUrl(String cid, {bool publicGateway = false}) {
    if (publicGateway) {
      return '$_publicGateway$cid';
    }

    // Use custom gateway if provided, otherwise try to use Matrix content repo
    return 'mxc://$cid'; // Matrix will handle the gateway
  }

  /// Download file from IPFS
  Future<Uint8List> downloadFile(String cid) async {
    final response = await http.get(Uri.parse('$_publicGateway$cid'));
    if (response.statusCode != 200) {
      throw Exception('Failed to download: ${response.statusCode}');
    }
    return response.bodyBytes;
  }

  /// Get file metadata from IPFS
  Future<Map<String, dynamic>> getFileMetadata(String cid) async {
    // Using a public IPFS node to get stats
    final response = await http.get(
      Uri.parse('https://ipfs.io/api/v0/files/stat?arg=/ipfs/$cid'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to get metadata: ${response.statusCode}');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  /// Pin a CID to local IPFS node
  Future<void> pinFile(String cid) async {
    final response = await http.post(
      Uri.parse('${_getApiUrl()}/pin/add?arg=$cid'),
      headers: _getAuthHeaders(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to pin file: ${response.statusCode}');
    }

    if (kDebugMode) {
      print('Pinned CID: $cid');
    }
  }

  /// Unpin a CID
  Future<void> unpinFile(String cid) async {
    final response = await http.post(
      Uri.parse('${_getApiUrl()}/pin/rm?arg=$cid'),
      headers: _getAuthHeaders(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to unpin file: ${response.statusCode}');
    }

    if (kDebugMode) {
      print('Unpinned CID: $cid');
    }
  }

  /// List pinned files
  Future<List<String>> listPinnedFiles() async {
    final response = await http.post(
      Uri.parse('${_getApiUrl()}/pin/ls'),
      headers: _getAuthHeaders(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to list pins: ${response.statusCode}');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final keys = json['Keys'] as Map<String, dynamic>;
    return keys.keys.toList();
  }

  /// Create a Matrix-compatible IPFS URL
  String createMatrixContentUri(String cid, {String? fileName}) {
    final uri = 'mxc://$cid';
    if (fileName != null) {
      return '$uri/$fileName';
    }
    return uri;
  }

  Uri _getUploadUri() {
    if (customNodeUrl != null) {
      return Uri.parse('$customNodeUrl/api/v0/add');
    }

    if (infuraProjectId != null && infuraSecret != null) {
      return Uri.parse(_infuraEndpoint);
    }

    throw Exception('No IPFS configuration provided');
  }

  String _getApiUrl() {
    if (customNodeUrl != null) {
      return customNodeUrl!;
    }

    if (infuraProjectId != null && infuraSecret != null) {
      return 'https://ipfs.infura.io:5001/api/v0';
    }

    throw Exception('No IPFS configuration provided');
  }

  Map<String, String> _getAuthHeaders() {
    if (customNodeToken != null) {
      return {'Authorization': 'Bearer $customNodeToken'};
    }

    if (infuraProjectId != null && infuraSecret != null) {
      final credentials = base64Encode(
        utf8.encode('$infuraProjectId:$infuraSecret'),
      );
      return {'Authorization': 'Basic $credentials'};
    }

    throw Exception('No IPFS configuration provided');
  }
}

/// IPFS Media Info class
class IpfsMediaInfo {
  final String cid;
  final String fileName;
  final int fileSize;
  final String mimeType;
  final DateTime? createdAt;
  final Map<String, dynamic>? metadata;

  IpfsMediaInfo({
    required this.cid,
    required this.fileName,
    required this.fileSize,
    required this.mimeType,
    this.createdAt,
    this.metadata,
  });

  /// Create from Matrix content info
  factory IpfsMediaInfo.fromMatrixInfo(
    String cid,
    Map<String, dynamic> info,
  ) {
    return IpfsMediaInfo(
      cid: cid,
      fileName: info['filename'] ?? 'unknown',
      fileSize: (info['size'] ?? 0) as int,
      mimeType: info['mimetype'] ?? 'application/octet-stream',
      metadata: info['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Create Matrix-compatible content info
  Map<String, dynamic> toMatrixInfo() {
    return {
      'size': fileSize,
      'mimetype': mimeType,
      'filename': fileName,
      'metadata': metadata,
    };
  }
}

