import 'package:flutter/foundation.dart';
import 'package:pointycastle/export.dart' as pc;

/// Encryption Example
///
/// Demonstrates end-to-end encryption (E2EE) setup and usage
/// using the Olm/Megolm protocol.
///
/// Usage:
/// ```dart
/// final encryption = EncryptionExample(client: client);
/// await encryption.enableEncryptionInRoom(roomId);
/// ```
class EncryptionExample {
  final Client client;
  bool _initialized = false;

  EncryptionExample({required this.client});

  /// Initialize encryption for the client
  Future<void> initialize() async {
    if (_initialized) return;

    // Enable encryption
    await client.encryption!;

    // Set up key backup if available
    // await client.encryption!.setupKeyBackup();

    _initialized = true;
    if (kDebugMode) {
      print('Encryption initialized');
    }
  }

  /// Enable encryption in a room
  Future<void> enableEncryptionInRoom(String roomId) async {
    final room = client.getRoomById(roomId);
    if (room == null) {
      throw Exception('Room not found: $roomId');
    }

    await room.enableEncryption();
    if (kDebugMode) {
      print('Encryption enabled in room: $roomId');
    }
  }

  /// Check if a room is encrypted
  bool isRoomEncrypted(String roomId) {
    final room = client.getRoomById(roomId);
    return room?.encrypted ?? false;
  }

  /// Get encryption algorithm for a room
  String? getRoomEncryptionAlgorithm(String roomId) {
    final room = client.getRoomById(roomId);
    return room?.encryptionAlgorithm;
  }

  /// Get all devices for a user
  Future<List<DeviceInfo>> getUserDevices(String userId) async {
    final devices = await client.encryption!.getUserDevices(userId);
    return devices;
  }

  /// Verify a device
  Future<void> verifyDevice(String deviceId) async {
    await client.encryption!.verifyDevice(deviceId);
    if (kDebugMode) {
      print('Device verified: $deviceId');
    }
  }

  /// Unverify a device
  Future<void> unverifyDevice(String deviceId) async {
    await client.encryption!.unverifyDevice(deviceId);
    if (kDebugMode) {
      print('Device unverified: $deviceId');
    }
  }

  /// Set device as blacklisted
  Future<void> blacklistDevice(String deviceId) async {
    await client.encryption!.setDeviceBlocked(deviceId, blocked: true);
    if (kDebugMode) {
      print('Device blacklisted: $deviceId');
    }
  }

  /// Set device as verified
  Future<void> setDeviceVerified(String deviceId) async {
    await client.encryption!.setDeviceVerified(deviceId);
    if (kDebugMode) {
      print('Device verified: $deviceId');
    }
  }

  /// Get encryption status for a user
  Future<Map<String, DeviceTrustStatus>> getUserTrustStatus(String userId) async {
    final status = <String, DeviceTrustStatus>{};

    final devices = await getUserDevices(userId);
    for (final device in devices) {
      status[device.deviceId] = DeviceTrustStatus(
        verified: device.verified,
        blocked: device.blocked,
        trusted: device.trusted,
      );
    }

    return status;
  }

  /// Check if all devices for a user are verified
  Future<bool> allDevicesVerified(String userId) async {
    final devices = await getUserDevices(userId);
    return devices.every((device) => device.verified);
  }

  /// Get the number of unverified devices
  Future<int> countUnverifiedDevices(String userId) async {
    final devices = await getUserDevices(userId);
    return devices.where((d) => !d.verified).length;
  }

  /// Export keys for backup
  Future<String> exportKeys(String passphrase) async {
    final keys = await client.encryption!.exportKeys(passphrase);
    return keys;
  }

  /// Import keys from backup
  Future<int> importKeys(String keys, String passphrase) async {
    final count = await client.encryption!.importKeys(keys, passphrase);
    if (kDebugMode) {
      print('Imported $count keys');
    }
    return count;
  }

  /// Set up key backup
  Future<void> setupKeyBackup({
    required String keyBackupUrl,
    String? passphrase,
  }) async {
    await client.encryption!.setupKeyBackup(
      uri: keyBackupUrl,
      passphrase: passphrase,
    );
    if (kDebugMode) {
      print('Key backup configured');
    }
  }

  /// Backup keys to server
  Future<void> backupKeys() async {
    await client.encryption!.backupKeys();
    if (kDebugMode) {
      print('Keys backed up');
    }
  }

  /// Restore keys from backup
  Future<void> restoreKeys({
    required String keyBackupUrl,
    String? passphrase,
  }) async {
    await client.encryption!.restoreKeyBackup(
      uri: keyBackupUrl,
      passphrase: passphrase,
    );
    if (kDebugMode) {
      print('Keys restored from backup');
    }
  }

  /// Get the Olm account
  Future<pc.OlmAccount?> getOlmAccount() async {
    return client.encryption!.olmAccount;
  }

  /// Get the Megolm session for a room
  Future<pc.InboundGroupSession?> getMegolmSession(String roomId) async {
    return client.encryption!.getGroupSession(roomId);
  }

  /// Get identity keys
  Future<Map<String, String>> getIdentityKeys() async {
    final account = await getOlmAccount();
    if (account == null) return {};

    return {
      'curve25519': account.identityKeys()['curve25519'] ?? '',
      'ed25519': account.identityKeys()['ed25519'] ?? '',
    };
  }

  /// Create a verification request
  Future<VerificationRequest> startVerification(String userId) async {
    final request = await client.encryption!.requestVerification(userId);
    return request;
  }

  /// Start verification with specific device
  Future<VerificationRequest> startDeviceVerification(
    String userId,
    String deviceId,
  ) async {
    final request = await client.encryption!.requestVerification(
      userId,
      deviceIds: [deviceId],
    );
    return request;
  }

  /// Accept verification request
  Future<void> acceptVerification(VerificationRequest request) async {
    await request.accept();
  }

  /// Complete verification with emoji
  Future<void> completeEmojiVerification(
    VerificationRequest request,
    List<String> emoji,
  ) async {
    await request.confirmEmoji(emoji);
  }

  /// Cancel verification
  Future<void> cancelVerification(VerificationRequest request) async {
    await request.cancel();
  }

  /// Get all verification requests
  List<VerificationRequest> getVerificationRequests() {
    return client.encryption!.verificationRequests;
  }

  /// Get status of a room's encryption
  RoomEncryptionStatus getRoomEncryptionStatus(String roomId) {
    final room = client.getRoomById(roomId);
    if (room == null) {
      return RoomEncryptionStatus.notFound;
    }

    if (!room.encrypted) {
      return RoomEncryptionStatus.disabled;
    }

    // Check if we have sessions for this room
    if (client.encryption!.hasInboundGroupSession(roomId)) {
      return RoomEncryptionStatus.encrypted;
    }

    return RoomEncryptionStatus.encrypting;
  }
}

/// Device trust status
class DeviceTrustStatus {
  final bool verified;
  final bool blocked;
  final bool trusted;

  DeviceTrustStatus({
    required this.verified,
    required this.blocked,
    required this.trusted,
  });
}

/// Room encryption status
enum RoomEncryptionStatus {
  notFound,
  disabled,
  encrypting,
  encrypted,
}

/// Extension methods
extension EncryptionStatusExtension on RoomEncryptionStatus {
  bool get isEncrypted => this == RoomEncryptionStatus.encrypted;
  bool get isEnabled => this != RoomEncryptionStatus.disabled;
  String get displayName {
    switch (this) {
      case RoomEncryptionStatus.notFound:
        return 'Room not found';
      case RoomEncryptionStatus.disabled:
        return 'Not encrypted';
      case RoomEncryptionStatus.encrypting:
        return 'Encrypting...';
      case RoomEncryptionStatus.encrypted:
        return 'Encrypted';
    }
  }
}

