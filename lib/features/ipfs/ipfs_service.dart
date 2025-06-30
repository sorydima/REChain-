/// Abstract interface for IPFS service providers.
///
/// Implement this to support different IPFS backends (Pinata, Web3.Storage, Infura, etc.).
///
/// Example usage:
/// ```dart
/// final ipfs = MyIpfsService();
/// await ipfs.initialize(config: {...});
/// final cid = await ipfs.uploadFile(fileBytes: bytes, fileName: 'file.txt');
/// ```
abstract class IpfsService {
  /// The name of the provider (e.g., Pinata, Web3.Storage, Infura)
  String get providerName;

  /// Initialize the service (e.g., with API keys)
  Future<void> initialize({required Map<String, dynamic> config});

  /// Upload a file to IPFS. Returns the CID (hash).
  Future<String> uploadFile({required List<int> fileBytes, required String fileName, Map<String, String>? metadata});

  /// Download a file from IPFS by CID. Returns the file bytes.
  Future<List<int>> downloadFile(String cid);

  /// Pin a file by CID (if supported by provider).
  Future<bool> pinFile(String cid);

  /// Unpin a file by CID (if supported by provider).
  Future<bool> unpinFile(String cid);

  /// List pinned files (if supported by provider).
  Future<List<IpfsFileInfo>> listPinnedFiles();

  /// Get provider status/usage info.
  Future<IpfsProviderStatus> getStatus();
}

/// Information about a file stored on IPFS.
class IpfsFileInfo {
  /// The content identifier (CID) of the file.
  final String cid;
  /// The file name.
  final String fileName;
  /// The file size in bytes (optional).
  final int? size;
  /// The creation date/time (optional).
  final DateTime? createdAt;
  /// Additional metadata (optional).
  final Map<String, String>? metadata;

  IpfsFileInfo({
    required this.cid,
    required this.fileName,
    this.size,
    this.createdAt,
    this.metadata,
  });
}

/// Status and usage information for an IPFS provider.
class IpfsProviderStatus {
  /// The provider name.
  final String providerName;
  /// Whether the provider is healthy.
  final bool isHealthy;
  /// Storage used in bytes (optional).
  final int? storageUsed;
  /// Storage limit in bytes (optional).
  final int? storageLimit;
  /// Extra provider-specific info (optional).
  final Map<String, dynamic>? extra;

  IpfsProviderStatus({
    required this.providerName,
    required this.isHealthy,
    this.storageUsed,
    this.storageLimit,
    this.extra,
  });
} 