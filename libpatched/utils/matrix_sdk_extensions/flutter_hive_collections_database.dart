import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' hide Key;
import 'package:flutter/services.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;

// Stub implementation for web compatibility
class FlutterHiveCollectionsDatabase {
  final String name;
  final String path;
  final HiveAesCipher? key;

  FlutterHiveCollectionsDatabase(
    this.name,
    this.path, {
    this.key,
  });

  static const String _cipherStorageKey = 'hive_encryption_key';

  static Future<FlutterHiveCollectionsDatabase> databaseBuilder(
    Client client,
  ) async {
    debugPrint('Open Hive...');
    HiveAesCipher? hiverCipher;
    try {
      // Workaround for secure storage is calling Platform.operatingSystem on web
      if (kIsWeb) {
        // ignore: unawaited_futures
        html.window.navigator.storage?.persist();
        throw MissingPluginException();
      }

      const secureStorage = FlutterSecureStorage();
      final containsEncryptionKey =
          await secureStorage.read(key: _cipherStorageKey) != null;
      if (!containsEncryptionKey) {
        // do not try to create a buggy secure storage for new Linux users
        if (Platform.isLinux) throw MissingPluginException();
        final key = Hive.generateSecureKey();
        await secureStorage.write(
          key: _cipherStorageKey,
          value: base64UrlEncode(key),
        );
      }

      // workaround for if we just wrote to the key and it still doesn't exist
      final rawEncryptionKey = await secureStorage.read(key: _cipherStorageKey);
      if (rawEncryptionKey == null) throw MissingPluginException();

      hiverCipher = HiveAesCipher(base64Url.decode(rawEncryptionKey));
    } on MissingPluginException catch (_) {
      const FlutterSecureStorage()
          .delete(key: _cipherStorageKey)
          .catchError((_) {});
      debugPrint('Hive encryption is not supported on this platform');
    } catch (e, s) {
      const FlutterSecureStorage()
          .delete(key: _cipherStorageKey)
          .catchError((_) {});
      debugPrint('Unable to init Hive encryption: $e');
    }

    final db = FlutterHiveCollectionsDatabase(
      'hive_collections_${client.clientName.replaceAll(' ', '_').toLowerCase()}',
      await findDatabasePath(client),
      key: hiverCipher,
    );
    try {
      await db.open();
    } catch (e, s) {
      debugPrint('Unable to open Hive. Delete database and storage key...');
      const FlutterSecureStorage().delete(key: _cipherStorageKey);
      await db.clear().catchError((_) {});
      await Hive.deleteFromDisk();
      rethrow;
    }
    debugPrint('Hive is ready');
    return db;
  }

  static Future<String> findDatabasePath(Client client) async {
    var path = client.clientName;
    if (!kIsWeb) {
      Directory directory;
      try {
        if (Platform.isLinux) {
          directory = await getApplicationSupportDirectory();
        } else {
          directory = await getApplicationDocumentsDirectory();
        }
      } catch (_) {
        try {
          directory = await getLibraryDirectory();
        } catch (_) {
          directory = Directory.current;
        }
      }
      // do not destroy your stable REChain in debug mode
      directory = Directory(
        directory.uri.resolve(kDebugMode ? 'hive_debug' : 'hive').toFilePath(),
      );
      directory.create(recursive: true);
      path = directory.path;
    }
    return path;
  }

  int get maxFileSize => supportsFileStoring ? 100 * 1000 * 1000 : 0;
  bool get supportsFileStoring => !kIsWeb;

  Future<String> _getFileStoreDirectory() async {
    try {
      try {
        return (await getTemporaryDirectory()).path;
      } catch (_) {
        return (await getApplicationDocumentsDirectory()).path;
      }
    } catch (_) {
      return (await getDownloadsDirectory())!.path;
    }
  }

  Future<Uint8List?> getFile(Uri mxcUri) async {
    if (!supportsFileStoring) return null;
    final tempDirectory = await _getFileStoreDirectory();
    final file =
        File('$tempDirectory/${Uri.encodeComponent(mxcUri.toString())}');
    if (await file.exists() == false) return null;
    final bytes = await file.readAsBytes();
    return bytes;
  }

  Future storeFile(Uri mxcUri, Uint8List bytes, int time) async {
    if (!supportsFileStoring) return null;
    final tempDirectory = await _getFileStoreDirectory();
    final file =
        File('$tempDirectory/${Uri.encodeComponent(mxcUri.toString())}');
    if (await file.exists()) return;
    await file.writeAsBytes(bytes);
    return;
  }

  // Stub methods for web compatibility
  Future<void> open() async {
    // Web stub implementation
  }

  Future<void> clear() async {
    // Web stub implementation
  }

  Future<void> close() async {
    // Web stub implementation
  }
}
