import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import '../lib/features/integration/integration_manager.dart';

final integrationManager = IntegrationManager();

Future<Response> uploadToIpfs(Request request) async {
  final bytes = await request.read().expand((x) => x).toList();
  final fileName = request.headers['x-filename'] ?? 'file';
  final cid = await integrationManager.uploadToIpfs(fileBytes: bytes, fileName: fileName);
  return Response.ok(jsonEncode({'cid': cid}), headers: {'Content-Type': 'application/json'});
}

Future<Response> downloadFromIpfs(Request request, String cid) async {
  final bytes = await integrationManager.downloadFromIpfs(cid);
  if (bytes == null) return Response.notFound('File not found');
  return Response.ok(bytes, headers: {'Content-Type': 'application/octet-stream'});
}

void main() async {
  final handler = Cascade()
      .add((Request request) async {
        if (request.url.path == 'api/ipfs/upload' && request.method == 'POST') {
          return await uploadToIpfs(request);
        }
        if (request.url.pathSegments.length == 3 &&
            request.url.pathSegments[0] == 'api' &&
            request.url.pathSegments[1] == 'ipfs' &&
            request.url.pathSegments[2].startsWith('download')) {
          final cid = request.url.pathSegments[2].replaceFirst('download/', '');
          return await downloadFromIpfs(request, cid);
        }
        return Response.notFound('Not Found');
      })
      .handler;

  final server = await io.serve(handler, InternetAddress.anyIPv4, 8080);
  print('IPFS API server listening on port ${server.port}');
} 