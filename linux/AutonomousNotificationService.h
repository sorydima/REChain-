#pragma once

#include <string>
#include <map>
#include <memory>
#include <functional>
#include <vector>
#include <libnotify/notify.h>
#include <gio/gio.h>

class AutonomousNotificationService {
public:
    static AutonomousNotificationService& GetInstance();
    
    // Initialization and cleanup
    bool Initialize();
    void Shutdown();
    
    // Notification methods
    void ShowMessageNotification(const std::string& sender, const std::string& message, const std::string& roomId);
    void ShowCallNotification(const std::string& caller, const std::string& callId, bool isVideo = false);
    void ShowMissedCallNotification(const std::string& caller, const std::string& callId);
    void ShowUserJoinedNotification(const std::string& username, const std::string& roomName, const std::string& roomId);
    void ShowUserLeftNotification(const std::string& username, const std::string& roomName, const std::string& roomId);
    void ShowFileUploadNotification(const std::string& filename, const std::string& roomName, const std::string& roomId);
    void ShowRoomCreatedNotification(const std::string& roomName, const std::string& creator, const std::string& roomId);
    void ShowSyncErrorNotification(const std::string& error);
    void ShowLoginSuccessNotification(const std::string& username);
    void ShowDeviceVerificationNotification(const std::string& deviceName);
    void ShowBackupNotification(const std::string& status);
    void ShowSpaceJoinedNotification(const std::string& spaceName, const std::string& spaceId);
    
    // Notification management
    void CancelNotification(const std::string& notificationId);
    void CancelAllNotifications();
    void CancelNotificationsByType(const std::string& type);
    
    // Settings
    void SetNotificationsEnabled(bool enabled);
    bool AreNotificationsEnabled() const;
    void SetSoundEnabled(bool enabled);
    bool IsSoundEnabled() const;
    void SetUrgencyLevel(NotifyUrgency urgency);
    NotifyUrgency GetUrgencyLevel() const;
    
    // Desktop integration
    void SetDesktopEntry(const std::string& desktopEntry);
    void SetApplicationName(const std::string& appName);
    void SetApplicationIcon(const std::string& iconPath);
    
    // D-Bus integration
    bool InitializeDBus();
    void ShutdownDBus();
    void RegisterDBusService();
    void UnregisterDBusService();
    
    // Event handlers
    void SetNotificationActionHandler(std::function<void(const std::string&, const std::string&)> handler);
    void SetNotificationClosedHandler(std::function<void(const std::string&)> handler);

private:
    AutonomousNotificationService() = default;
    ~AutonomousNotificationService() = default;
    
    // Prevent copying
    AutonomousNotificationService(const AutonomousNotificationService&) = delete;
    AutonomousNotificationService& operator=(const AutonomousNotificationService&) = delete;
    
    // Internal methods
    void ShowNotification(const std::string& type, const std::string& title, 
                         const std::string& content, const std::string& tag,
                         NotifyUrgency urgency = NOTIFY_URGENCY_NORMAL,
                         const std::vector<std::string>& actions = {});
    
    std::string GetNotificationIcon(const std::string& type);
    std::string GetNotificationSound(const std::string& type);
    std::string GenerateNotificationId(const std::string& type, const std::string& identifier = "");
    
    void LogNotification(const std::string& type, const std::string& title, const std::string& content);
    void PlayNotificationSound(const std::string& soundPath);
    
    // D-Bus callbacks
    static void OnActionInvoked(NotifyNotification* notification, char* action, gpointer user_data);
    static void OnNotificationClosed(NotifyNotification* notification, gpointer user_data);
    
    // D-Bus service methods
    static void HandleDBusMethodCall(GDBusConnection* connection,
                                   const gchar* sender,
                                   const gchar* object_path,
                                   const gchar* interface_name,
                                   const gchar* method_name,
                                   GVariant* parameters,
                                   GDBusMethodInvocation* invocation,
                                   gpointer user_data);
    
    // Member variables
    bool m_initialized = false;
    bool m_notificationsEnabled = true;
    bool m_soundEnabled = true;
    NotifyUrgency m_defaultUrgency = NOTIFY_URGENCY_NORMAL;
    
    std::string m_applicationName = "REChain";
    std::string m_applicationIcon = "rechain";
    std::string m_desktopEntry = "com.rechain.dapp";
    
    // D-Bus integration
    GDBusConnection* m_dbusConnection = nullptr;
    guint m_dbusRegistrationId = 0;
    bool m_dbusInitialized = false;
    
    // Event handlers
    std::function<void(const std::string&, const std::string&)> m_actionHandler;
    std::function<void(const std::string&)> m_closedHandler;
    
    // Active notifications tracking
    std::map<std::string, NotifyNotification*> m_activeNotifications;
    std::map<std::string, int> m_notificationCounts;
    
    // D-Bus interface definition
    static const gchar* DBUS_INTERFACE_XML;
    static const GDBusInterfaceVTable DBUS_INTERFACE_VTABLE;
};
