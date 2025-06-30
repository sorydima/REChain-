import 'package:rechainonline/features/ipfs/ipfs_service.dart';

void main() async {
  final ipfs = MyIpfsService(); // Replace with your implementation
  await ipfs.initialize(config: {'apiKey': 'YOUR_KEY'});

  final fileBytes = [/* ... */];
  final cid = await ipfs.uploadFile(fileBytes: fileBytes, fileName: 'example.txt');
  print('Uploaded to IPFS: $cid');

  final downloaded = await ipfs.downloadFile(cid);
  print('Downloaded file bytes: ${downloaded.length}');
} 