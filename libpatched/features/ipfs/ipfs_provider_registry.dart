import 'ipfs_service.dart';
import 'pinata_ipfs_service.dart';
import 'web3storage_ipfs_service.dart';
import 'nftstorage_ipfs_service.dart';
import 'infura_ipfs_service.dart';
import 'filebase_ipfs_service.dart';
import 'fleek_ipfs_service.dart';
import 'crust_ipfs_service.dart';

class IpfsProviderRegistry {
  static final Map<String, IpfsService Function()> _providers = {
    'pinata': () => PinataIpfsService(),
    'web3storage': () => Web3StorageIpfsService(),
    'nftstorage': () => NftStorageIpfsService(),
    'infura': () => InfuraIpfsService(),
    'filebase': () => FilebaseIpfsService(),
    'fleek': () => FleekIpfsService(),
    'crust': () => CrustIpfsService(),
    // Add more providers here
  };

  static List<String> get availableProviders => _providers.keys.toList();

  static IpfsService create(String providerKey) {
    final factory = _providers[providerKey.toLowerCase()];
    if (factory == null) {
      throw Exception('Unknown IPFS provider: $providerKey');
    }
    return factory();
  }
} 