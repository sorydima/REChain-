import 'dart:convert';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/bridge_manager/bridge_manager.dart';
import '../features/security/security_manager.dart';
import '../features/security/encryption_settings.dart';
import '../features/security/message_retention_policy.dart';
import '../features/message_scheduling/message_scheduler.dart';
import '../features/message_scheduling/scheduled_message.dart';
import '../features/translation/translation_service.dart';

class ServicesManager {
  final Client client;
  final SharedPreferences store;
  
  late final BridgeManager bridgeManager;
  late final SecurityManager securityManager;
  late final MessageScheduler messageScheduler;
  late final TranslationService translationService;
  
  bool _isDisposed = false;
  
  ServicesManager({
    required this.client,
    required this.store,
  }) {
    initializeServices();
  }
  
  Future<void> initializeServices() async {
    bridgeManager = BridgeManager(store, client);
    securityManager = SecurityManager(store, client);
    messageScheduler = MessageScheduler(store, client);
    translationService = TranslationService(store);
    
    // Set up any necessary event listeners or cross-service integrations
    _setupEventListeners();
  }
  
  SecurityManager get securityAudit => securityManager;
  SecurityManager get threatDetection => securityManager;
  
  bool get isDisposed => _isDisposed;
  
  void _setupEventListeners() {
    // Listen for new messages to handle auto-translation
    client.onEvent.stream.listen((eventUpdate) {
      if (eventUpdate.type == EventTypes.Message && 
          translationService.autoTranslateEnabled) {
        _handleAutoTranslation(eventUpdate);
      }
    });

    // Listen for scheduled messages that need encryption
    messageScheduler.scheduledMessagesStream.listen((messages) {
      for (final message in messages.values) {
        if (message.status == ScheduledMessageStatus.pending) {
          _checkMessageEncryption(message);
        }
      }
    });
  }
  
  Future<void> _handleAutoTranslation(EventUpdate eventUpdate) async {
    try {
      final content = eventUpdate.content['body'] as String?;
      if (content == null || content.isEmpty) return;

      final targetLanguage = translationService.preferredLanguage;
      final result = await translationService.translateText(
        content,
        targetLanguage: targetLanguage,
      );

      if (!result.hasError && result.sourceLanguage != targetLanguage) {
        // Store translation in account data
        final translationData = {
          'translated_text': result.translatedText,
          'source_language': result.sourceLanguage,
          'target_language': result.targetLanguage,
          'timestamp': result.timestamp.toIso8601String(),
        };
        await client.setAccountData(
          'translation.${eventUpdate.content['event_id'] ?? 'unknown'}',
          jsonDecode(jsonEncode(translationData)),
          {'room_id': eventUpdate.roomID ?? ''},
        );
      }
    } catch (e) {
      Logs().e('Auto-translation failed: $e');
    }
  }
  
  Future<void> _checkMessageEncryption(ScheduledMessage message) async {
    try {
      final room = client.getRoomById(message.roomId);
      if (room == null) return;
      
      if (room.encrypted) {
        // Ensure encryption is properly set up for scheduled messages
        final encryptionSettings = securityManager.getEncryptionSettings(message.roomId);
        if (encryptionSettings != null && !encryptionSettings.encryptionEnabled) {
          await securityManager.setEncryptionSettings(
            message.roomId,
            encryptionSettings.copyWith(encryptionEnabled: true),
          );
        }
      }
    } catch (e) {
      Logs().e('Failed to check message encryption: $e');
    }
  }
  
  Future<void> performSecurityAudit() async {
    try {
      final report = await securityManager.performSecurityAudit();

      // Store audit results
      await client.setAccountData(
        'security.audit.${DateTime.now().toIso8601String()}',
        jsonDecode(jsonEncode(report.toJson())),
        {},
      );

      // Take action on critical security issues
      if (report.encryptionScore < 50.0) {
        // Notify user about encryption issues
        Logs().w('Security audit found low encryption score: ${report.encryptionScore}');
      }

      if (report.unverifiedDevices > 0) {
        // Notify user about unverified devices
        Logs().w('Security audit found ${report.unverifiedDevices} unverified devices');
      }
    } catch (e) {
      Logs().e('Security audit failed: $e');
    }
  }
  
  Future<void> cleanupServices() async {
    try {
      // Cleanup translation cache
      await translationService.clearExpiredCache();
      
      // Check for failed scheduled messages
      final failedMessages = messageScheduler.getFailedMessages();
      if (failedMessages.isNotEmpty) {
        Logs().w('Found ${failedMessages.length} failed scheduled messages');
        // Could implement retry logic here
      }
      
      // Perform retention policy cleanup
      for (final room in client.rooms) {
        final policy = securityManager.getRetentionPolicy(room.id);
        if (policy != null && policy.enabled) {
          // Policy cleanup is handled by SecurityManager
          continue;
        }
      }
    } catch (e) {
      Logs().e('Services cleanup failed: $e');
    }
  }
  
  Future<void> dispose() async {
    bridgeManager.dispose();
    securityManager.dispose();
    messageScheduler.dispose();
    translationService.dispose();
    _isDisposed = true;
  }
  
  // Helper methods for coordinated actions across services
  
  Future<void> prepareRoom(String roomId) async {
    // Set up default security settings
    if (securityManager.getEncryptionSettings(roomId) == null) {
      await securityManager.setEncryptionSettings(
        roomId,
        EncryptionSettings.createDefault(),
      );
    }
    
    // Set up default retention policy
    if (securityManager.getRetentionPolicy(roomId) == null) {
      await securityManager.setRetentionPolicy(
        roomId,
        MessageRetentionPolicy.createDefault(),
      );
    }
  }
  
  Future<void> handleRoomCreation(String roomId) async {
    await prepareRoom(roomId);
    
    // Check if any bridges need to be configured for this room
    final room = client.getRoomById(roomId);
    if (room != null) {
      final bridgeInfo = await _detectBridgeRequirements(room);
      if (bridgeInfo != null) {
        // Suggest bridge configuration to user
        Logs().i('Bridge suggested for room $roomId: ${bridgeInfo.name}');
      }
    }
  }
  
  Future<BridgeInfo?> _detectBridgeRequirements(Room room) async {
    // Analyze room for potential bridge requirements
    // This could look at room name, members, or other characteristics
    return null; // Placeholder for actual implementation
  }
}
