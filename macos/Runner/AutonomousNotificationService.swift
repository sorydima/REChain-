import Foundation
import UserNotifications
import os.log

class AutonomousNotificationService {
    private let logger = OSLog(subsystem: "com.rechain.online", category: "AutonomousNotificationService")
    private let notificationCenter = UNUserNotificationCenter.current()
    
    init() {
        setupNotificationCategories()
        os_log("AutonomousNotificationService initialized", log: logger, type: .info)
    }
    
    private func setupNotificationCategories() {
        let messageAction = UNNotificationAction(
            identifier: "REPLY_ACTION",
            title: "Reply",
            options: [.foreground]
        )
        
        let callAcceptAction = UNNotificationAction(
            identifier: "ACCEPT_CALL",
            title: "Accept",
            options: [.foreground]
        )
        
        let callDeclineAction = UNNotificationAction(
            identifier: "DECLINE_CALL",
            title: "Decline",
            options: []
        )
        
        let messageCategory = UNNotificationCategory(
            identifier: "MESSAGE_CATEGORY",
            actions: [messageAction],
            intentIdentifiers: [],
            options: [.customDismissAction]
        )
        
        let callCategory = UNNotificationCategory(
            identifier: "CALL_CATEGORY",
            actions: [callAcceptAction, callDeclineAction],
            intentIdentifiers: [],
            options: [.customDismissAction]
        )
        
        notificationCenter.setNotificationCategories([messageCategory, callCategory])
    }
    
    func showNotification(type: String, title: String, message: String, payload: [String: Any] = [:]) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = getNotificationSound(for: type)
        content.userInfo = payload
        
        // Set category based on type
        switch type {
        case "message_received", "message_sent":
            content.categoryIdentifier = "MESSAGE_CATEGORY"
        case "call_incoming", "call_missed":
            content.categoryIdentifier = "CALL_CATEGORY"
        default:
            content.categoryIdentifier = "DEFAULT_CATEGORY"
        }
        
        // Set thread identifier for grouping
        if let roomId = payload["roomId"] as? String {
            content.threadIdentifier = roomId
        }
        
        // Set interruption level for macOS 12+
        if #available(macOS 12.0, *) {
            switch type {
            case "call_incoming", "sync_error":
                content.interruptionLevel = .critical
            case "message_received":
                content.interruptionLevel = .active
            default:
                content.interruptionLevel = .passive
            }
        }
        
        // Create request
        let identifier = "\(type)_\(UUID().uuidString)"
        let request = UNNotificationRequest(
            identifier: identifier,
            content: content,
            trigger: nil // Immediate delivery
        )
        
        // Add notification
        notificationCenter.add(request) { [weak self] error in
            if let error = error {
                os_log("Failed to add notification: %@", log: self?.logger ?? OSLog.default, type: .error, error.localizedDescription)
            } else {
                os_log("Notification added successfully: %@ - %@", log: self?.logger ?? OSLog.default, type: .info, type, title)
            }
        }
    }
    
    func showMessageNotification(sender: String, message: String, roomId: String) {
        let payload: [String: Any] = [
            "type": "message_received",
            "roomId": roomId,
            "sender": sender
        ]
        
        showNotification(
            type: "message_received",
            title: sender,
            message: message,
            payload: payload
        )
    }
    
    func showCallNotification(caller: String, callId: String, isVideo: Bool = false) {
        let callType = isVideo ? "Video call" : "Voice call"
        let payload: [String: Any] = [
            "type": "call_incoming",
            "callId": callId,
            "caller": caller,
            "isVideo": isVideo
        ]
        
        showNotification(
            type: "call_incoming",
            title: "\(callType) from \(caller)",
            message: "Click to answer",
            payload: payload
        )
    }
    
    func showUserJoinedNotification(username: String, roomName: String, roomId: String) {
        let payload: [String: Any] = [
            "type": "user_joined",
            "roomId": roomId,
            "username": username
        ]
        
        showNotification(
            type: "user_joined",
            title: "User joined",
            message: "\(username) joined \(roomName)",
            payload: payload
        )
    }
    
    func showUserLeftNotification(username: String, roomName: String, roomId: String) {
        let payload: [String: Any] = [
            "type": "user_left",
            "roomId": roomId,
            "username": username
        ]
        
        showNotification(
            type: "user_left",
            title: "User left",
            message: "\(username) left \(roomName)",
            payload: payload
        )
    }
    
    func showFileUploadNotification(filename: String, roomName: String, roomId: String) {
        let payload: [String: Any] = [
            "type": "file_uploaded",
            "roomId": roomId,
            "filename": filename
        ]
        
        showNotification(
            type: "file_uploaded",
            title: "File uploaded",
            message: "\(filename) uploaded to \(roomName)",
            payload: payload
        )
    }
    
    func showRoomCreatedNotification(roomName: String, roomId: String) {
        let payload: [String: Any] = [
            "type": "room_created",
            "roomId": roomId
        ]
        
        showNotification(
            type: "room_created",
            title: "Room created",
            message: "New room: \(roomName)",
            payload: payload
        )
    }
    
    func showEncryptionEventNotification(message: String, roomId: String) {
        let payload: [String: Any] = [
            "type": "encryption_event",
            "roomId": roomId
        ]
        
        showNotification(
            type: "encryption_event",
            title: "Encryption Event",
            message: message,
            payload: payload
        )
    }
    
    func showSyncErrorNotification(error: String) {
        let payload: [String: Any] = [
            "type": "sync_error",
            "error": error
        ]
        
        showNotification(
            type: "sync_error",
            title: "Sync Error",
            message: error,
            payload: payload
        )
    }
    
    func showLoginSuccessNotification(userId: String) {
        let payload: [String: Any] = [
            "type": "login_success",
            "userId": userId
        ]
        
        showNotification(
            type: "login_success",
            title: "Login Successful",
            message: "Welcome back to REChain!",
            payload: payload
        )
    }
    
    func showDeviceVerificationNotification(deviceName: String) {
        let payload: [String: Any] = [
            "type": "device_verified",
            "deviceName": deviceName
        ]
        
        showNotification(
            type: "device_verified",
            title: "Device Verified",
            message: "Device \(deviceName) has been verified",
            payload: payload
        )
    }
    
    func showBackupNotification(message: String) {
        let payload: [String: Any] = [
            "type": "backup_event"
        ]
        
        showNotification(
            type: "backup_event",
            title: "Backup Event",
            message: message,
            payload: payload
        )
    }
    
    func showSpaceJoinedNotification(spaceName: String, spaceId: String) {
        let payload: [String: Any] = [
            "type": "space_joined",
            "spaceId": spaceId
        ]
        
        showNotification(
            type: "space_joined",
            title: "Space Joined",
            message: "You joined \(spaceName)",
            payload: payload
        )
    }
    
    func cancelNotification(identifier: String) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.removeDeliveredNotifications(withIdentifiers: [identifier])
        os_log("Notification cancelled: %@", log: logger, type: .info, identifier)
    }
    
    func cancelAllNotifications() {
        notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.removeAllDeliveredNotifications()
        os_log("All notifications cancelled", log: logger, type: .info)
    }
    
    private func getNotificationSound(for type: String) -> UNNotificationSound {
        switch type {
        case "call_incoming":
            return UNNotificationSound.default
        case "message_received":
            return UNNotificationSound.default
        case "sync_error":
            if #available(macOS 12.0, *) {
                return UNNotificationSound.defaultCritical
            } else {
                return UNNotificationSound.default
            }
        default:
            return UNNotificationSound.default
        }
    }
}
