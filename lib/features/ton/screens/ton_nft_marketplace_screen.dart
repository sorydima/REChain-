import 'package:flutter/material.dart';

import '../nft/ton_nft_service.dart';
import '../wallet/ton_wallet_service.dart';

class TonNftMarketplaceScreen extends StatefulWidget {
  const TonNftMarketplaceScreen({Key? key}) : super(key: key);

  @override
  State<TonNftMarketplaceScreen> createState() => _TonNftMarketplaceScreenState();
}

class _TonNftMarketplaceScreenState extends State<TonNftMarketplaceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _nftService = TonNftService.instance;
  final _searchController = TextEditingController();
  
  List<TonNftListing> _listings = [];
  List<TonNftCollection> _collections = [];
  List<TonNftItem> _searchResults = [];
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadMarketplaceData();
  }
  
  Future<void> _loadMarketplaceData() async {
    setState(() => _isLoading = true);
    
    try {
      final listings = await _nftService.getMarketplaceListings();
      final collections = await _nftService.getCollections();
      
      setState(() {
        _listings = listings;
        _collections = collections;
      });
    } catch (e) {
      debugPrint('Failed to load marketplace data: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFT Marketplace'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Listings'),
            Tab(text: 'Collections'),
            Tab(text: 'Search'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildListingsTab(),
          _buildCollectionsTab(),
          _buildSearchTab(),
        ],
      ),
    );
  }
  
  Widget _buildListingsTab() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (_listings.isEmpty) {
      return const Center(
        child: Text('No listings available'),
      );
    }
    
    return RefreshIndicator(
      onRefresh: _loadMarketplaceData,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _listings.length,
        itemBuilder: (context, index) {
          final listing = _listings[index];
          return _NftListingCard(
            listing: listing,
            onBuy: () => _buyNft(listing),
          );
        },
      ),
    );
  }
  
  Widget _buildCollectionsTab() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (_collections.isEmpty) {
      return const Center(
        child: Text('No collections available'),
      );
    }
    
    return RefreshIndicator(
      onRefresh: _loadMarketplaceData,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: _collections.length,
        itemBuilder: (context, index) {
          final collection = _collections[index];
          return _CollectionCard(
            collection: collection,
            onTap: () => _viewCollection(collection),
          );
        },
      ),
    );
  }
  
  Widget _buildSearchTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search NFTs...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() => _searchResults.clear());
                },
              ),
            ),
            onSubmitted: _searchNfts,
          ),
        ),
        Expanded(
          child: _searchResults.isEmpty
              ? const Center(
                  child: Text('Enter a search term to find NFTs'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final nft = _searchResults[index];
                    return _NftCard(
                      nft: nft,
                      onTap: () => _viewNftDetails(nft),
                    );
                  },
                ),
        ),
      ],
    );
  }
  
  Future<void> _searchNfts(String query) async {
    if (query.isEmpty) return;
    
    setState(() => _isLoading = true);
    
    try {
      final results = await _nftService.searchNfts(query);
      setState(() => _searchResults = results);
    } catch (e) {
      debugPrint('Search failed: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }
  
  Future<void> _buyNft(TonNftListing listing) async {
    final wallet = TonWalletService.instance.activeWallet;
    if (wallet == null) {
      _showError('Please create a wallet first');
      return;
    }
    
    if (wallet.balance < listing.price) {
      _showError('Insufficient balance');
      return;
    }
    
    final confirmed = await _showConfirmationDialog(
      'Buy NFT',
      'Are you sure you want to buy this NFT for ${listing.formattedPrice}?',
    );
    
    if (!confirmed) return;
    
    try {
      final txHash = await _nftService.buyNft(
        listingId: listing.id,
        buyerAddress: wallet.address,
        privateKey: '', // This would need to be retrieved securely
      );
      
      _showSuccess('NFT purchased successfully!\nTransaction: $txHash');
      await _loadMarketplaceData();
    } catch (e) {
      _showError('Failed to buy NFT: $e');
    }
  }
  
  void _viewCollection(TonNftCollection collection) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _CollectionDetailScreen(collection: collection),
      ),
    );
  }
  
  void _viewNftDetails(TonNftItem nft) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _NftDetailScreen(nft: nft),
      ),
    );
  }
  
  Future<bool> _showConfirmationDialog(String title, String message) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    
    return result ?? false;
  }
  
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
  
  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}

class _NftListingCard extends StatelessWidget {
  final TonNftListing listing;
  final VoidCallback onBuy;

  const _NftListingCard({
    required this.listing,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                listing.nft?.imageUrl ?? '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listing.nft?.name ?? 'Unknown NFT',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Seller: ${_formatAddress(listing.sellerAddress)}',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        listing.formattedPrice,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: listing.isActive && !listing.isExpired ? onBuy : null,
                        child: const Text('Buy'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  String _formatAddress(String address) {
    if (address.length <= 10) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }
}

class _CollectionCard extends StatelessWidget {
  final TonNftCollection collection;
  final VoidCallback onTap;

  const _CollectionCard({
    required this.collection,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                collection.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.collections),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collection.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Floor: ${collection.formattedFloorPrice}',
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${collection.totalSupply} items',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NftCard extends StatelessWidget {
  final TonNftItem nft;
  final VoidCallback onTap;

  const _NftCard({
    required this.nft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                nft.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nft.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (nft.isForSale) ...[
                    const SizedBox(height: 4),
                    Text(
                      nft.formattedPrice,
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder screens for navigation
class _CollectionDetailScreen extends StatelessWidget {
  final TonNftCollection collection;

  const _CollectionDetailScreen({required this.collection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collection.name),
      ),
      body: const Center(
        child: Text('Collection details coming soon...'),
      ),
    );
  }
}

class _NftDetailScreen extends StatelessWidget {
  final TonNftItem nft;

  const _NftDetailScreen({required this.nft});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nft.name),
      ),
      body: const Center(
        child: Text('NFT details coming soon...'),
      ),
    );
  }
}
