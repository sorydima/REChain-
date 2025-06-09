import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../core/ton_client.dart';
import '../core/ton_config.dart';

/// Service for managing TON NFTs
class TonNftService {
  static TonNftService? _instance;
  static TonNftService get instance => _instance ??= TonNftService._();
  
  TonNftService._();
  
  static const String _nftCacheKey = 'ton_nft_cache';
  static const String _favoritesKey = 'ton_nft_favorites';
  
  final http.Client _httpClient = http.Client();
  SharedPreferences? _prefs;
  
  final Map<String, List<TonNftItem>> _nftCache = {};
  final Set<String> _favoriteNfts = {};
  
  final StreamController<List<TonNftItem>> _nftsController = 
      StreamController<List<TonNftItem>>.broadcast();
  final StreamController<List<TonNftCollection>> _collectionsController = 
      StreamController<List<TonNftCollection>>.broadcast();
  final StreamController<Set<String>> _favoritesController = 
      StreamController<Set<String>>.broadcast();
  
  Stream<List<TonNftItem>> get nftsStream => _nftsController.stream;
  Stream<List<TonNftCollection>> get collectionsStream => _collectionsController.stream;
  Stream<Set<String>> get favoritesStream => _favoritesController.stream;
  
  Set<String> get favoriteNfts => Set.unmodifiable(_favoriteNfts);
  
  /// Initialize the NFT service
  Future<void> initialize() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      await _loadFavorites();
      
      Logs().i('TON NFT Service initialized');
    } catch (e) {
      Logs().e('Failed to initialize TON NFT Service: $e');
      rethrow;
    }
  }
  
  /// Load favorite NFTs from storage
  Future<void> _loadFavorites() async {
    try {
      final favoritesJson = _prefs?.getString(_favoritesKey);
      if (favoritesJson != null) {
        final favoritesList = jsonDecode(favoritesJson) as List;
        _favoriteNfts.clear();
        _favoriteNfts.addAll(favoritesList.cast<String>());
        _favoritesController.add(_favoriteNfts);
      }
    } catch (e) {
      Logs().e('Failed to load favorites: $e');
    }
  }
  
  /// Save favorite NFTs to storage
  Future<void> _saveFavorites() async {
    try {
      final favoritesJson = jsonEncode(_favoriteNfts.toList());
      await _prefs?.setString(_favoritesKey, favoritesJson);
      _favoritesController.add(_favoriteNfts);
    } catch (e) {
      Logs().e('Failed to save favorites: $e');
    }
  }
  
  /// Get NFTs for a wallet address
  Future<List<TonNftItem>> getNftsForAddress(String address) async {
    try {
      // Check cache first
      if (_nftCache.containsKey(address)) {
        final cachedNfts = _nftCache[address]!;
        _nftsController.add(cachedNfts);
        return cachedNfts;
      }
      
      final nfts = await TonClient.instance.getNfts(address);
      final nftItems = nfts.map((nft) => TonNftItem.fromTonNft(nft)).toList();
      
      // Cache the results
      _nftCache[address] = nftItems;
      _nftsController.add(nftItems);
      
      return nftItems;
    } catch (e) {
      Logs().e('Failed to get NFTs for address: $e');
      return [];
    }
  }
  
  /// Get NFT details by address
  Future<TonNftItem?> getNftDetails(String nftAddress) async {
    try {
      final url = Uri.parse('${TonConfig.tonNftApiUrl}/nfts/$nftAddress');
      final response = await _httpClient.get(url);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch NFT details');
      }
      
      final data = jsonDecode(response.body);
      return TonNftItem.fromJson(data);
    } catch (e) {
      Logs().e('Failed to get NFT details: $e');
      return null;
    }
  }
  
  /// Get NFT collections
  Future<List<TonNftCollection>> getCollections({
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final url = Uri.parse('${TonConfig.tonNftApiUrl}/nfts/collections')
          .replace(queryParameters: {
        'limit': limit.toString(),
        'offset': offset.toString(),
      });
      
      final response = await _httpClient.get(url);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch collections');
      }
      
      final data = jsonDecode(response.body);
      final collections = (data['nft_collections'] as List)
          .map((collection) => TonNftCollection.fromJson(collection))
          .toList();
      
      _collectionsController.add(collections);
      return collections;
    } catch (e) {
      Logs().e('Failed to get collections: $e');
      return [];
    }
  }
  
  /// Get NFTs from a specific collection
  Future<List<TonNftItem>> getCollectionNfts(
    String collectionAddress, {
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      final url = Uri.parse('${TonConfig.tonNftApiUrl}/nfts/collections/$collectionAddress/items')
          .replace(queryParameters: {
        'limit': limit.toString(),
        'offset': offset.toString(),
      });
      
      final response = await _httpClient.get(url);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch collection NFTs');
      }
      
      final data = jsonDecode(response.body);
      final nfts = (data['nft_items'] as List)
          .map((nft) => TonNftItem.fromJson(nft))
          .toList();
      
      return nfts;
    } catch (e) {
      Logs().e('Failed to get collection NFTs: $e');
      return [];
    }
  }
  
  /// Search NFTs
  Future<List<TonNftItem>> searchNfts(String query) async {
    try {
      final url = Uri.parse('${TonConfig.tonNftApiUrl}/nfts/search')
          .replace(queryParameters: {
        'query': query,
        'limit': '50',
      });
      
      final response = await _httpClient.get(url);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to search NFTs');
      }
      
      final data = jsonDecode(response.body);
      final nfts = (data['nft_items'] as List)
          .map((nft) => TonNftItem.fromJson(nft))
          .toList();
      
      return nfts;
    } catch (e) {
      Logs().e('Failed to search NFTs: $e');
      return [];
    }
  }
  
  /// Get NFT marketplace listings
  Future<List<TonNftListing>> getMarketplaceListings({
    int limit = 50,
    int offset = 0,
    String? collectionAddress,
    double? minPrice,
    double? maxPrice,
  }) async {
    try {
      final queryParams = <String, String>{
        'limit': limit.toString(),
        'offset': offset.toString(),
      };
      
      if (collectionAddress != null) {
        queryParams['collection'] = collectionAddress;
      }
      if (minPrice != null) {
        queryParams['min_price'] = (minPrice * 1e9).toInt().toString();
      }
      if (maxPrice != null) {
        queryParams['max_price'] = (maxPrice * 1e9).toInt().toString();
      }
      
      final url = Uri.parse('${TonConfig.nftMarketplaceUrl}/marketplace/listings')
          .replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        if (TonConfig.nftMarketplaceApiKey.isNotEmpty)
          'Authorization': 'Bearer ${TonConfig.nftMarketplaceApiKey}',
      };
      
      final response = await _httpClient.get(url, headers: headers);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to fetch marketplace listings');
      }
      
      final data = jsonDecode(response.body);
      final listings = (data['listings'] as List)
          .map((listing) => TonNftListing.fromJson(listing))
          .toList();
      
      return listings;
    } catch (e) {
      Logs().e('Failed to get marketplace listings: $e');
      return [];
    }
  }
  
  /// Transfer NFT
  Future<String> transferNft({
    required String nftAddress,
    required String fromAddress,
    required String toAddress,
    required String privateKey,
    double? forwardAmount,
  }) async {
    try {
      // This is a simplified implementation
      // In a real implementation, you would use proper NFT transfer methods
      
      final transferBody = {
        'nft_address': nftAddress,
        'from_address': fromAddress,
        'to_address': toAddress,
        'forward_amount': forwardAmount ?? 0.01,
      };
      
      // Create and sign transaction
      final txHash = await TonClient.instance.sendTransaction(
        fromAddress: fromAddress,
        toAddress: nftAddress, // NFT contract address
        amount: forwardAmount ?? 0.01,
        privateKey: privateKey,
        comment: 'NFT Transfer',
      );
      
      // Clear cache for the address
      _nftCache.remove(fromAddress);
      
      Logs().i('NFT transferred: $txHash');
      return txHash;
    } catch (e) {
      Logs().e('Failed to transfer NFT: $e');
      rethrow;
    }
  }
  
  /// Create NFT listing on marketplace
  Future<String> createListing({
    required String nftAddress,
    required String ownerAddress,
    required double price,
    required String privateKey,
    String? description,
  }) async {
    try {
      final listingData = {
        'nft_address': nftAddress,
        'owner_address': ownerAddress,
        'price': (price * 1e9).toInt(),
        'description': description ?? '',
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      
      final url = Uri.parse('${TonConfig.nftMarketplaceUrl}/marketplace/create-listing');
      final headers = <String, String>{
        'Content-Type': 'application/json',
        if (TonConfig.nftMarketplaceApiKey.isNotEmpty)
          'Authorization': 'Bearer ${TonConfig.nftMarketplaceApiKey}',
      };
      
      final response = await _httpClient.post(
        url,
        headers: headers,
        body: jsonEncode(listingData),
      );
      
      if (response.statusCode != 200) {
        throw Exception('Failed to create listing');
      }
      
      final data = jsonDecode(response.body);
      final listingId = data['listing_id'] as String;
      
      Logs().i('Created NFT listing: $listingId');
      return listingId;
    } catch (e) {
      Logs().e('Failed to create listing: $e');
      rethrow;
    }
  }
  
  /// Buy NFT from marketplace
  Future<String> buyNft({
    required String listingId,
    required String buyerAddress,
    required String privateKey,
  }) async {
    try {
      final purchaseData = {
        'listing_id': listingId,
        'buyer_address': buyerAddress,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      
      final url = Uri.parse('${TonConfig.nftMarketplaceUrl}/marketplace/buy');
      final headers = <String, String>{
        'Content-Type': 'application/json',
        if (TonConfig.nftMarketplaceApiKey.isNotEmpty)
          'Authorization': 'Bearer ${TonConfig.nftMarketplaceApiKey}',
      };
      
      final response = await _httpClient.post(
        url,
        headers: headers,
        body: jsonEncode(purchaseData),
      );
      
      if (response.statusCode != 200) {
        throw Exception('Failed to buy NFT');
      }
      
      final data = jsonDecode(response.body);
      final txHash = data['transaction_hash'] as String;
      
      // Clear cache for the buyer address
      _nftCache.remove(buyerAddress);
      
      Logs().i('Bought NFT: $txHash');
      return txHash;
    } catch (e) {
      Logs().e('Failed to buy NFT: $e');
      rethrow;
    }
  }
  
  /// Add NFT to favorites
  Future<void> addToFavorites(String nftAddress) async {
    _favoriteNfts.add(nftAddress);
    await _saveFavorites();
  }
  
  /// Remove NFT from favorites
  Future<void> removeFromFavorites(String nftAddress) async {
    _favoriteNfts.remove(nftAddress);
    await _saveFavorites();
  }
  
  /// Check if NFT is favorite
  bool isFavorite(String nftAddress) {
    return _favoriteNfts.contains(nftAddress);
  }
  
  /// Get favorite NFTs
  Future<List<TonNftItem>> getFavoriteNfts() async {
    try {
      final favoriteNfts = <TonNftItem>[];
      
      for (final nftAddress in _favoriteNfts) {
        final nft = await getNftDetails(nftAddress);
        if (nft != null) {
          favoriteNfts.add(nft);
        }
      }
      
      return favoriteNfts;
    } catch (e) {
      Logs().e('Failed to get favorite NFTs: $e');
      return [];
    }
  }
  
  /// Clear NFT cache
  void clearCache([String? address]) {
    if (address != null) {
      _nftCache.remove(address);
    } else {
      _nftCache.clear();
    }
  }
  
  /// Dispose resources
  void dispose() {
    _httpClient.close();
    _nftsController.close();
    _collectionsController.close();
    _favoritesController.close();
    _nftCache.clear();
  }
}

/// TON NFT item model
class TonNftItem {
  final String address;
  final String name;
  final String description;
  final String imageUrl;
  final String? animationUrl;
  final String collectionAddress;
  final String? collectionName;
  final String ownerAddress;
  final Map<String, dynamic> metadata;
  final List<TonNftAttribute> attributes;
  final double? price;
  final bool isForSale;
  final DateTime? lastSaleDate;
  final String? lastSalePrice;
  
  TonNftItem({
    required this.address,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.animationUrl,
    required this.collectionAddress,
    this.collectionName,
    required this.ownerAddress,
    required this.metadata,
    required this.attributes,
    this.price,
    required this.isForSale,
    this.lastSaleDate,
    this.lastSalePrice,
  });
  
  factory TonNftItem.fromJson(Map<String, dynamic> json) {
    final metadata = json['metadata'] as Map<String, dynamic>? ?? {};
    final attributesList = metadata['attributes'] as List? ?? [];
    
    return TonNftItem(
      address: json['address'] as String,
      name: metadata['name'] as String? ?? 'Unknown NFT',
      description: metadata['description'] as String? ?? '',
      imageUrl: metadata['image'] as String? ?? '',
      animationUrl: metadata['animation_url'] as String?,
      collectionAddress: json['collection_address'] as String? ?? '',
      collectionName: json['collection_name'] as String?,
      ownerAddress: json['owner_address'] as String? ?? '',
      metadata: metadata,
      attributes: attributesList
          .map((attr) => TonNftAttribute.fromJson(attr))
          .toList(),
      price: json['price'] != null ? (json['price'] as num).toDouble() / 1e9 : null,
      isForSale: json['is_for_sale'] as bool? ?? false,
      lastSaleDate: json['last_sale_date'] != null 
          ? DateTime.parse(json['last_sale_date'] as String)
          : null,
      lastSalePrice: json['last_sale_price'] as String?,
    );
  }
  
  factory TonNftItem.fromTonNft(TonNft tonNft) {
    final attributesList = tonNft.metadata['attributes'] as List? ?? [];
    
    return TonNftItem(
      address: tonNft.address,
      name: tonNft.name,
      description: tonNft.description,
      imageUrl: tonNft.imageUrl,
      animationUrl: tonNft.metadata['animation_url'] as String?,
      collectionAddress: tonNft.collectionAddress,
      collectionName: null,
      ownerAddress: '',
      metadata: tonNft.metadata,
      attributes: attributesList
          .map((attr) => TonNftAttribute.fromJson(attr))
          .toList(),
      price: null,
      isForSale: false,
      lastSaleDate: null,
      lastSalePrice: null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'animation_url': animationUrl,
      'collection_address': collectionAddress,
      'collection_name': collectionName,
      'owner_address': ownerAddress,
      'metadata': metadata,
      'attributes': attributes.map((attr) => attr.toJson()).toList(),
      'price': price != null ? (price! * 1e9).toInt() : null,
      'is_for_sale': isForSale,
      'last_sale_date': lastSaleDate?.toIso8601String(),
      'last_sale_price': lastSalePrice,
    };
  }
  
  String get shortAddress {
    if (address.length <= 10) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }
  
  String get formattedPrice {
    if (price == null) return 'Not for sale';
    return '${price!.toStringAsFixed(2)} TON';
  }
}

/// TON NFT attribute model
class TonNftAttribute {
  final String traitType;
  final dynamic value;
  final String? displayType;
  final double? maxValue;
  
  TonNftAttribute({
    required this.traitType,
    required this.value,
    this.displayType,
    this.maxValue,
  });
  
  factory TonNftAttribute.fromJson(Map<String, dynamic> json) {
    return TonNftAttribute(
      traitType: json['trait_type'] as String,
      value: json['value'],
      displayType: json['display_type'] as String?,
      maxValue: json['max_value'] != null 
          ? (json['max_value'] as num).toDouble()
          : null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'trait_type': traitType,
      'value': value,
      'display_type': displayType,
      'max_value': maxValue,
    };
  }
}

/// TON NFT collection model
class TonNftCollection {
  final String address;
  final String name;
  final String description;
  final String imageUrl;
  final String? coverImageUrl;
  final int totalSupply;
  final String ownerAddress;
  final Map<String, dynamic> metadata;
  final double floorPrice;
  final double totalVolume;
  
  TonNftCollection({
    required this.address,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.coverImageUrl,
    required this.totalSupply,
    required this.ownerAddress,
    required this.metadata,
    required this.floorPrice,
    required this.totalVolume,
  });
  
  factory TonNftCollection.fromJson(Map<String, dynamic> json) {
    final metadata = json['metadata'] as Map<String, dynamic>? ?? {};
    
    return TonNftCollection(
      address: json['address'] as String,
      name: metadata['name'] as String? ?? 'Unknown Collection',
      description: metadata['description'] as String? ?? '',
      imageUrl: metadata['image'] as String? ?? '',
      coverImageUrl: metadata['cover_image'] as String?,
      totalSupply: json['total_supply'] as int? ?? 0,
      ownerAddress: json['owner_address'] as String? ?? '',
      metadata: metadata,
      floorPrice: json['floor_price'] != null 
          ? (json['floor_price'] as num).toDouble() / 1e9
          : 0.0,
      totalVolume: json['total_volume'] != null 
          ? (json['total_volume'] as num).toDouble() / 1e9
          : 0.0,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'cover_image_url': coverImageUrl,
      'total_supply': totalSupply,
      'owner_address': ownerAddress,
      'metadata': metadata,
      'floor_price': (floorPrice * 1e9).toInt(),
      'total_volume': (totalVolume * 1e9).toInt(),
    };
  }
  
  String get formattedFloorPrice {
    return '${floorPrice.toStringAsFixed(2)} TON';
  }
  
  String get formattedTotalVolume {
    return '${totalVolume.toStringAsFixed(2)} TON';
  }
}

/// TON NFT marketplace listing model
class TonNftListing {
  final String id;
  final String nftAddress;
  final String sellerAddress;
  final double price;
  final String? description;
  final DateTime createdAt;
  final DateTime? expiresAt;
  final bool isActive;
  final TonNftItem? nft;
  
  TonNftListing({
    required this.id,
    required this.nftAddress,
    required this.sellerAddress,
    required this.price,
    this.description,
    required this.createdAt,
    this.expiresAt,
    required this.isActive,
    this.nft,
  });
  
  factory TonNftListing.fromJson(Map<String, dynamic> json) {
    return TonNftListing(
      id: json['id'] as String,
      nftAddress: json['nft_address'] as String,
      sellerAddress: json['seller_address'] as String,
      price: (json['price'] as num).toDouble() / 1e9,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: json['expires_at'] != null 
          ? DateTime.parse(json['expires_at'] as String)
          : null,
      isActive: json['is_active'] as bool? ?? true,
      nft: json['nft'] != null ? TonNftItem.fromJson(json['nft']) : null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nft_address': nftAddress,
      'seller_address': sellerAddress,
      'price': (price * 1e9).toInt(),
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'is_active': isActive,
      'nft': nft?.toJson(),
    };
  }
  
  String get formattedPrice {
    return '${price.toStringAsFixed(2)} TON';
  }
  
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }
}

// Add Logs class if not available
class Logs {
  static void i(String message) => debugPrint('[INFO] $message');
  static void e(String message) => debugPrint('[ERROR] $message');
  static void w(String message) => debugPrint('[WARNING] $message');
  static void d(String message) => debugPrint('[DEBUG] $message');
}
