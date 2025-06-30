import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ipfs_service.dart';

class CrustIpfsService implements IpfsService {
  // Crust is decentralized; for demo, use public gateway and optional pinning service
  static const _gatewayUrl = 'https://crustwebsites.net/ipfs';
  // If you have a Crust pinning service, add API config here

  @override
  String get providerName => 'Crust';

  @override
  Future<void> initialize({required Map<String, dynamic> config}) async {
    // No API key required for public gateway usage
  }

  @override
  Future<String> uploadFile({required List<int> fileBytes, required String fileName, Map<String, String>? metadata}) async {
    // For demo: Use a public IPFS node or your own node for upload
    // In production, use a Crust-powered node or pinning service
    throw UnimplementedError('Direct upload to Crust is not supported via public gateway. Use your own node or pinning service.');
  }

  @override
  Future<List<int>> downloadFile(String cid) async {
    final uri = Uri.parse('$_gatewayUrl/$cid');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download file from Crust: ${response.body}');
    }
  }

  @override
  Future<bool> pinFile(String cid) async {
    // Pinning requires a Crust pinning service or node
    return false;
  }

  @override
  Future<bool> unpinFile(String cid) async {
    // Unpinning requires a Crust pinning service or node
    return false;
  }

  @override
  Future<List<IpfsFileInfo>> listPinnedFiles() async {
    // Listing pins requires a Crust pinning service or node
    return [];
  }

  @override
  Future<IpfsProviderStatus> getStatus() async {
    // For demo, just check gateway health
    try {
      final response = await http.get(Uri.parse('$_gatewayUrl/QmYwAPJzv5CZsnAzt8auVZRnQZb1pYhQ2Qb6QK1QwQ1Q1Q'));
      return IpfsProviderStatus(providerName: providerName, isHealthy: response.statusCode == 200);
    } catch (e) {
      return IpfsProviderStatus(providerName: providerName, isHealthy: false, extra: {'error': e.toString()});
    }
  }
} 