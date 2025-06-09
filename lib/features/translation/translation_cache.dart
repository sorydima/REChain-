import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';

import 'translation_service.dart';

class TranslationCache {
  static const String _cachePrefix = 'translation_cache_';
  static const String _cacheMetadataKey = 'translation_cache_metadata';
  static const Duration _defaultCacheExpiry = Duration(days: 7);
  static const int _maxCacheSize = 1000;
  
  SharedPreferences? _prefs;
  final Map<String, TranslationResult> _memoryCache = {};
  final Map<String, DateTime> _cacheTimestamps = {};
  
  Future<void> _ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
    await _loadCacheMetadata();
  }
  
  Future<void> _loadCacheMetadata() async {
    final metadataJson = _prefs!.getString(_cacheMetadataKey);
    if (metadataJson != null) {
      final metadata = json.decode(metadataJson) as Map<String, dynamic>;
      for (final entry in metadata.entries) {
        _cacheTimestamps[entry.key] = DateTime.parse(entry.value as String);
      }
    }
  }
  
  Future<void> _saveCacheMetadata() async {
    final metadata = <String, String>{};
    for (final entry in _cacheTimestamps.entries) {
      metadata[entry.key] = entry.value.toIso8601String();
    }
    await _prefs!.setString(_cacheMetadataKey, json.encode(metadata));
  }
  
  String generateCacheKey(String text, String targetLanguage, [String? sourceLanguage]) {
    final input = '$text|$targetLanguage|${sourceLanguage ?? 'auto'}';
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  
  Future<TranslationResult?> getCachedTranslation(String cacheKey) async {
    await _ensureInitialized();
    
    // Check memory cache first
    if (_memoryCache.containsKey(cacheKey)) {
      final timestamp = _cacheTimestamps[cacheKey];
      if (timestamp != null && _isValidCache(timestamp)) {
        return _memoryCache[cacheKey];
      } else {
        // Remove expired cache
        _memoryCache.remove(cacheKey);
        _cacheTimestamps.remove(cacheKey);
      }
    }
    
    // Check persistent cache
    final cachedJson = _prefs!.getString('$_cachePrefix$cacheKey');
    if (cachedJson != null) {
      final timestamp = _cacheTimestamps[cacheKey];
      if (timestamp != null && _isValidCache(timestamp)) {
        try {
          final result = TranslationResult.fromJson(json.decode(cachedJson));
          // Load into memory cache
          _memoryCache[cacheKey] = result;
          return result;
        } catch (e) {
          // Remove corrupted cache
          await _removeCachedTranslation(cacheKey);
        }
      } else {
        // Remove expired cache
        await _removeCachedTranslation(cacheKey);
      }
    }
    
    return null;
  }
  
  Future<void> cacheTranslation(String cacheKey, TranslationResult result) async {
    await _ensureInitialized();
    
    // Don't cache error results
    if (result.hasError) return;
    
    // Check cache size and clean if necessary
    await _cleanupCacheIfNeeded();
    
    // Store in memory cache
    _memoryCache[cacheKey] = result;
    _cacheTimestamps[cacheKey] = DateTime.now();
    
    // Store in persistent cache
    await _prefs!.setString('$_cachePrefix$cacheKey', json.encode(result.toJson()));
    await _saveCacheMetadata();
  }
  
  Future<void> _removeCachedTranslation(String cacheKey) async {
    _memoryCache.remove(cacheKey);
    _cacheTimestamps.remove(cacheKey);
    await _prefs!.remove('$_cachePrefix$cacheKey');
    await _saveCacheMetadata();
  }
  
  bool _isValidCache(DateTime timestamp) {
    return DateTime.now().difference(timestamp) < _defaultCacheExpiry;
  }
  
  Future<void> _cleanupCacheIfNeeded() async {
    if (_cacheTimestamps.length <= _maxCacheSize) return;
    
    // Sort by timestamp and remove oldest entries
    final sortedEntries = _cacheTimestamps.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));
    
    final entriesToRemove = sortedEntries.take(_cacheTimestamps.length - _maxCacheSize);
    
    for (final entry in entriesToRemove) {
      await _removeCachedTranslation(entry.key);
    }
  }
  
  Future<void> clearExpiredCache() async {
    await _ensureInitialized();
    
    final expiredKeys = <String>[];
    for (final entry in _cacheTimestamps.entries) {
      if (!_isValidCache(entry.value)) {
        expiredKeys.add(entry.key);
      }
    }
    
    for (final key in expiredKeys) {
      await _removeCachedTranslation(key);
    }
  }
  
  Future<void> clearAllCache() async {
    await _ensureInitialized();
    
    // Clear memory cache
    _memoryCache.clear();
    
    // Clear persistent cache
    final keys = _prefs!.getKeys()
        .where((key) => key.startsWith(_cachePrefix))
        .toList();
    
    for (final key in keys) {
      await _prefs!.remove(key);
    }
    
    // Clear metadata
    _cacheTimestamps.clear();
    await _prefs!.remove(_cacheMetadataKey);
  }
  
  Future<CacheStatistics> getCacheStatistics() async {
    await _ensureInitialized();
    
    int totalEntries = _cacheTimestamps.length;
    int expiredEntries = 0;
    int memoryEntries = _memoryCache.length;
    
    for (final timestamp in _cacheTimestamps.values) {
      if (!_isValidCache(timestamp)) {
        expiredEntries++;
      }
    }
    
    // Calculate cache size
    final keys = _prefs!.getKeys()
        .where((key) => key.startsWith(_cachePrefix))
        .toList();
    
    int totalSizeBytes = 0;
    for (final key in keys) {
      final value = _prefs!.getString(key);
      if (value != null) {
        totalSizeBytes += utf8.encode(value).length;
      }
    }
    
    return CacheStatistics(
      totalEntries: totalEntries,
      expiredEntries: expiredEntries,
      memoryEntries: memoryEntries,
      totalSizeBytes: totalSizeBytes,
      hitRate: _calculateHitRate(),
    );
  }
  
  double _calculateHitRate() {
    // This would require tracking hits/misses over time
    // For now, return a placeholder
    return 0.0;
  }
  
  void dispose() {
    _memoryCache.clear();
    _cacheTimestamps.clear();
  }
}

class CacheStatistics {
  final int totalEntries;
  final int expiredEntries;
  final int memoryEntries;
  final int totalSizeBytes;
  final double hitRate;
  
  const CacheStatistics({
    required this.totalEntries,
    required this.expiredEntries,
    required this.memoryEntries,
    required this.totalSizeBytes,
    required this.hitRate,
  });
  
  int get validEntries => totalEntries - expiredEntries;
  
  String get formattedSize {
    if (totalSizeBytes < 1024) {
      return '$totalSizeBytes B';
    } else if (totalSizeBytes < 1024 * 1024) {
      return '${(totalSizeBytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(totalSizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }
  
  Map<String, dynamic> toJson() {
    return {
      'totalEntries': totalEntries,
      'expiredEntries': expiredEntries,
      'memoryEntries': memoryEntries,
      'totalSizeBytes': totalSizeBytes,
      'hitRate': hitRate,
    };
  }
}
