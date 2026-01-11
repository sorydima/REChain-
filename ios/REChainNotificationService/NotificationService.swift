import UserNotifications
import os.log

class NotificationService: UNNotificationServiceExtension {
    private let logger = OSLog(subsystem: "com.rechain.online.notification-service", category: "NotificationService")
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        guard let bestAttemptContent = bestAttemptContent else {
            contentHandler(request.content)
            return
        }
        
        os_log("Processing notification: %@", log: logger, type: .info, request.identifier)
        
        // Modify the notification content here
        processNotification(content: bestAttemptContent, request: request)
        
        contentHandler(bestAttemptContent)
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content,
        // otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent = bestAttemptContent {
            os_log("Service extension time will expire", log: logger, type: .warning)
            contentHandler(bestAttemptContent)
        }
    }
    
    private func processNotification(content: UNMutableNotificationContent, request: UNNotificationRequest) {
        let userInfo = content.userInfo
        
        // Extract notification type
        let notificationType = userInfo["type"] as? String ?? "unknown"
        
        // Process based on type
        switch notificationType {
        case "message_received":
            processMessageNotification(content: content, userInfo: userInfo)
        case "call_incoming":
            processCallNotification(content: content, userInfo: userInfo)
        case "user_joined", "user_left":
            processUserActivityNotification(content: content, userInfo: userInfo)
        case "file_uploaded":
            processFileNotification(content: content, userInfo: userInfo)
        case "sync_error":
            processErrorNotification(content: content, userInfo: userInfo)
        default:
            processGenericNotification(content: content, userInfo: userInfo)
        }
        
        // Set thread identifier for grouping
        if let roomId = userInfo["roomId"] as? String {
            content.threadIdentifier = roomId
        }
        
        // Set category for actions
        content.categoryIdentifier = getCategoryIdentifier(for: notificationType)
        
        // Add badge count
        updateBadgeCount(content: content)
        
        os_log("Notification processed: %@ - %@", log: logger, type: .info, notificationType, content.title)
    }
    
    private func processMessageNotification(content: UNMutableNotificationContent, userInfo: [AnyHashable: Any]) {
        // Enhance message notifications
        if let sender = userInfo["sender"] as? String,
           let message = userInfo["message"] as? String {
            content.title = sender
            content.body = message
            
            // Add summary for multiple messages
            if let messageCount = userInfo["messageCount"] as? Int, messageCount > 1 {
                content.summaryArgument = sender
                content.summaryArgumentCount = messageCount
            }
        }
        
        content.sound = UNNotificationSound.default
    }
    
    private func processCallNotification(content: UNMutableNotificationContent, userInfo: [AnyHashable: Any]) {
        // Enhance call notifications
        if let caller = userInfo["caller"] as? String {
            let isVideo = userInfo["isVideo"] as? Bool ?? false
            let callType = isVideo ? "Video call" : "Voice call"
            
            content.title = "\(callType) from \(caller)"
            content.body = "Tap to answer"
        }
        
        // Use custom sound for calls
        content.sound = UNNotificationSound(named: UNNotificationSoundName("notification.caf"))
        
        // Set as critical alert for calls
        content.interruptionLevel = .critical
    }
    
    private func processUserActivityNotification(content: UNMutableNotificationContent, userInfo: [AnyHashable: Any]) {
        // Group user activity notifications
        if let roomId = userInfo["roomId"] as? String {
            content.threadIdentifier = roomId
            content.summaryArgument = "user activity"
        }
        
        content.sound = UNNotificationSound.default
    }
    
    private func processFileNotification(content: UNMutableNotificationContent, userInfo: [AnyHashable: Any]) {
        // Enhance file notifications
        if let filename = userInfo["filename"] as? String,
           let roomName = userInfo["roomName"] as? String {
            content.title = "File uploaded"
            content.body = "\(filename) uploaded to \(roomName)"
        }
        
        content.sound = UNNotificationSound.default
    }
    
    private func processErrorNotification(content: UNMutableNotificationContent, userInfo: [AnyHashable: Any]) {
        // Enhance error notifications
        content.title = "REChain Error"
        
        if let error = userInfo["error"] as? String {
            content.body = error
        }
        
        // Use critical sound for errors
        content.sound = UNNotificationSound.defaultCritical
        content.interruptionLevel = .critical
    }
    
    private func processGenericNotification(content: UNMutableNotificationContent, userInfo: [AnyHashable: Any]) {
        // Default processing for unknown notification types
        content.sound = UNNotificationSound.default
    }
    
    private func getCategoryIdentifier(for type: String) -> String {
        switch type {
        case "message_received":
            return "MESSAGE_CATEGORY"
        case "call_incoming":
            return "CALL_CATEGORY"
        default:
            return "DEFAULT_CATEGORY"
        }
    }
    
    private func updateBadgeCount(content: UNMutableNotificationContent) {
        // Get current badge count and increment
        let currentBadge = content.badge?.intValue ?? 0
        content.badge = NSNumber(value: currentBadge + 1)
    }
}
