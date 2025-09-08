#include "AutonomousNotificationService.h"
#include <iostream>
#include <sstream>
#include <chrono>
#include <cstdlib>
#include <glib.h>
#include <pulse/pulseaudio.h>

// D-Bus interface XML definition
const gchar* AutonomousNotificationService::DBUS_INTERFACE_XML =
    "<node>"
    "  <interface name='com.rechain.dapp.Notifications'>"
    "    <method name='ShowNotification'>"
    "      <arg type='s' name='type' direction='in'/>"
    "      <arg type='s' name='title' direction='in'/>"
    "      <arg type='s' name='message' direction='in'/>"
    "      <arg type='s' name='tag' direction='in'/>"
    "    </method>"
    "    <method name='CancelNotification'>"
    "      <arg type='s' name='tag' direction='in'/>"
    "    </method>"
    "    <method name='CancelAllNotifications'>"
    "    </method>"
    "    <signal name='NotificationActionInvoked'>"
    "      <arg type='s' name='tag'/>"
    "      <arg type='s' name='action'/>"
    "    </signal>"
    "    <signal name='NotificationClosed'>"
    "      <arg type='s' name='tag'/>"
    "    </signal>"
    "  </interface>"
    "</node>";

const GDBusInterfaceVTable AutonomousNotificationService::DBUS_INTERFACE_VTABLE = {
    AutonomousNotificationService::HandleDBusMethodCall,
    nullptr, // get_property
    nullptr  // set_property
};

AutonomousNotificationService& AutonomousNotificationService::GetInstance() {
    static AutonomousNotificationService instance;
    return instance;
}

bool AutonomousNotificationService::Initialize() {
    if (m_initialized) {
        return true;
    }
    
    try {
        // Initialize libnotify
        if (!notify_init("REChain")) {
            std::cerr << "[AutonomousNotificationService] Failed to initialize libnotify" << std::endl;
            return false;
        }
        
        // Check if notification daemon is running
        if (!notify_is_initted()) {
            std::cerr << "[AutonomousNotificationService] Notification daemon not available" << std::endl;
            return false;
        }
        
        // Initialize D-Bus
        if (!InitializeDBus()) {
            std::cerr << "[AutonomousNotificationService] Failed to initialize D-Bus" << std::endl;
            // Continue without D-Bus, it's not critical
        }
        
        m_initialized = true;
        
        std::cout << "[AutonomousNotificationService] Initialized successfully" << std::endl;
        std::cout << "[AutonomousNotificationService] Server: " << notify_get_server_info(nullptr, nullptr, nullptr, nullptr) << std::endl;
        
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[AutonomousNotificationService] Failed to initialize: " << e.what() << std::endl;
        return false;
    }
}

void AutonomousNotificationService::Shutdown() {
    if (!m_initialized) {
        return;
    }
    
    try {
        // Cancel all active notifications
        CancelAllNotifications();
        
        // Shutdown D-Bus
        ShutdownDBus();
        
        // Uninitialize libnotify
        if (notify_is_initted()) {
            notify_uninit();
        }
        
        m_initialized = false;
        
        std::cout << "[AutonomousNotificationService] Shutdown completed" << std::endl;
    }
    catch (const std::exception& e) {
        std::cerr << "[AutonomousNotificationService] Error during shutdown: " << e.what() << std::endl;
    }
}

void AutonomousNotificationService::ShowMessageNotification(const std::string& sender, const std::string& message, const std::string& roomId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "New Message from " + sender;
    std::string tag = GenerateNotificationId("message", roomId);
    
    std::vector<std::string> actions = {"reply", "Reply", "open", "Open"};
    
    ShowNotification("message", title, message, tag, NOTIFY_URGENCY_NORMAL, actions);
    LogNotification("message", title, message);
}

void AutonomousNotificationService::ShowCallNotification(const std::string& caller, const std::string& callId, bool isVideo) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = isVideo ? "Incoming Video Call" : "Incoming Call";
    std::string content = "From: " + caller;
    std::string tag = GenerateNotificationId("call", callId);
    
    std::vector<std::string> actions = {"accept", "Accept", "decline", "Decline"};
    
    ShowNotification("call", title, content, tag, NOTIFY_URGENCY_CRITICAL, actions);
    LogNotification("call", title, content);
}

void AutonomousNotificationService::ShowMissedCallNotification(const std::string& caller, const std::string& callId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "Missed Call";
    std::string content = "From: " + caller;
    std::string tag = GenerateNotificationId("missed_call", callId);
    
    std::vector<std::string> actions = {"callback", "Call Back"};
    
    ShowNotification("missed_call", title, content, tag, NOTIFY_URGENCY_NORMAL, actions);
    LogNotification("missed_call", title, content);
}

void AutonomousNotificationService::ShowUserJoinedNotification(const std::string& username, const std::string& roomName, const std::string& roomId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "User Joined";
    std::string content = username + " joined " + roomName;
    std::string tag = GenerateNotificationId("user_joined", roomId);
    
    ShowNotification("user_joined", title, content, tag, NOTIFY_URGENCY_LOW);
    LogNotification("user_joined", title, content);
}

void AutonomousNotificationService::ShowUserLeftNotification(const std::string& username, const std::string& roomName, const std::string& roomId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "User Left";
    std::string content = username + " left " + roomName;
    std::string tag = GenerateNotificationId("user_left", roomId);
    
    ShowNotification("user_left", title, content, tag, NOTIFY_URGENCY_LOW);
    LogNotification("user_left", title, content);
}

void AutonomousNotificationService::ShowFileUploadNotification(const std::string& filename, const std::string& roomName, const std::string& roomId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "File Uploaded";
    std::string content = filename + " uploaded to " + roomName;
    std::string tag = GenerateNotificationId("file_upload", roomId);
    
    std::vector<std::string> actions = {"open", "Open", "save", "Save"};
    
    ShowNotification("file_upload", title, content, tag, NOTIFY_URGENCY_NORMAL, actions);
    LogNotification("file_upload", title, content);
}

void AutonomousNotificationService::ShowSyncErrorNotification(const std::string& error) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "Sync Error";
    std::string tag = GenerateNotificationId("sync_error");
    
    std::vector<std::string> actions = {"retry", "Retry"};
    
    ShowNotification("sync_error", title, error, tag, NOTIFY_URGENCY_CRITICAL, actions);
    LogNotification("sync_error", title, error);
}

void AutonomousNotificationService::ShowLoginSuccessNotification(const std::string& username) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "Login Successful";
    std::string content = "Welcome back, " + username + "!";
    std::string tag = GenerateNotificationId("login_success");
    
    ShowNotification("login_success", title, content, tag, NOTIFY_URGENCY_LOW);
    LogNotification("login_success", title, content);
}

void AutonomousNotificationService::ShowDeviceVerificationNotification(const std::string& deviceName) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "Device Verification";
    std::string content = "New device verified: " + deviceName;
    std::string tag = GenerateNotificationId("device_verification");
    
    ShowNotification("device_verification", title, content, tag, NOTIFY_URGENCY_NORMAL);
    LogNotification("device_verification", title, content);
}

void AutonomousNotificationService::ShowBackupNotification(const std::string& status) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "Backup Status";
    std::string tag = GenerateNotificationId("backup");
    
    ShowNotification("backup", title, status, tag, NOTIFY_URGENCY_LOW);
    LogNotification("backup", title, status);
}

void AutonomousNotificationService::ShowSpaceJoinedNotification(const std::string& spaceName, const std::string& spaceId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::string title = "Space Joined";
    std::string content = "You joined " + spaceName;
    std::string tag = GenerateNotificationId("space_joined", spaceId);
    
    std::vector<std::string> actions = {"open", "Open Space"};
    
    ShowNotification("space_joined", title, content, tag, NOTIFY_URGENCY_LOW, actions);
    LogNotification("space_joined", title, content);
}

void AutonomousNotificationService::ShowNotification(const std::string& type, const std::string& title, 
                                                   const std::string& content, const std::string& tag,
                                                   NotifyUrgency urgency, const std::vector<std::string>& actions) {
    if (!m_initialized) return;
    
    try {
        // Cancel existing notification with same tag
        auto it = m_activeNotifications.find(tag);
        if (it != m_activeNotifications.end()) {
            notify_notification_close(it->second, nullptr);
            g_object_unref(it->second);
            m_activeNotifications.erase(it);
        }
        
        // Create new notification
        NotifyNotification* notification = notify_notification_new(
            title.c_str(),
            content.c_str(),
            GetNotificationIcon(type).c_str()
        );
        
        if (!notification) {
            std::cerr << "[AutonomousNotificationService] Failed to create notification" << std::endl;
            return;
        }
        
        // Set properties
        notify_notification_set_urgency(notification, urgency);
        notify_notification_set_timeout(notification, NOTIFY_EXPIRES_DEFAULT);
        notify_notification_set_category(notification, type.c_str());
        notify_notification_set_hint_string(notification, "desktop-entry", m_desktopEntry.c_str());
        
        // Add actions
        for (size_t i = 0; i < actions.size(); i += 2) {
            if (i + 1 < actions.size()) {
                notify_notification_add_action(
                    notification,
                    actions[i].c_str(),
                    actions[i + 1].c_str(),
                    OnActionInvoked,
                    this,
                    nullptr
                );
            }
        }
        
        // Set callbacks
        g_signal_connect(notification, "closed", G_CALLBACK(OnNotificationClosed), this);
        
        // Show notification
        GError* error = nullptr;
        if (!notify_notification_show(notification, &error)) {
            std::cerr << "[AutonomousNotificationService] Failed to show notification: " 
                      << (error ? error->message : "Unknown error") << std::endl;
            if (error) g_error_free(error);
            g_object_unref(notification);
            return;
        }
        
        // Store notification
        m_activeNotifications[tag] = notification;
        
        // Update notification count
        m_notificationCounts[type]++;
        
        // Play sound if enabled
        if (m_soundEnabled) {
            std::string soundPath = GetNotificationSound(type);
            if (!soundPath.empty()) {
                PlayNotificationSound(soundPath);
            }
        }
        
    }
    catch (const std::exception& e) {
        std::cerr << "[AutonomousNotificationService] Failed to show notification: " << e.what() << std::endl;
    }
}

std::string AutonomousNotificationService::GetNotificationIcon(const std::string& type) {
    if (type == "call" || type == "missed_call") {
        return "call-start";
    } else if (type == "message") {
        return "mail-message-new";
    } else if (type == "sync_error") {
        return "dialog-error";
    } else if (type == "login_success") {
        return "dialog-information";
    } else if (type == "file_upload") {
        return "document-save";
    } else if (type == "user_joined" || type == "user_left") {
        return "system-users";
    }
    
    return m_applicationIcon;
}

std::string AutonomousNotificationService::GetNotificationSound(const std::string& type) {
    if (type == "call") {
        return "/usr/share/sounds/alsa/Front_Left.wav";
    } else if (type == "message") {
        return "/usr/share/sounds/alsa/Side_Left.wav";
    } else if (type == "sync_error") {
        return "/usr/share/sounds/alsa/Rear_Left.wav";
    }
    
    return "/usr/share/sounds/alsa/Front_Center.wav";
}

std::string AutonomousNotificationService::GenerateNotificationId(const std::string& type, const std::string& identifier) {
    auto now = std::chrono::system_clock::now();
    auto timestamp = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count();
    
    std::stringstream id;
    id << type << "_" << timestamp;
    
    if (!identifier.empty()) {
        id << "_" << identifier;
    }
    
    return id.str();
}

void AutonomousNotificationService::LogNotification(const std::string& type, const std::string& title, const std::string& content) {
    auto now = std::chrono::system_clock::now();
    auto time_t = std::chrono::system_clock::to_time_t(now);
    
    std::cout << "[" << std::put_time(std::localtime(&time_t), "%Y-%m-%d %H:%M:%S") << "] "
              << "[AutonomousNotificationService] Showing " << type << " notification: " 
              << title << " - " << content << std::endl;
}

void AutonomousNotificationService::PlayNotificationSound(const std::string& soundPath) {
    // Use paplay (PulseAudio) to play sound
    std::string command = "paplay " + soundPath + " 2>/dev/null &";
    std::system(command.c_str());
}

void AutonomousNotificationService::CancelNotification(const std::string& notificationId) {
    auto it = m_activeNotifications.find(notificationId);
    if (it != m_activeNotifications.end()) {
        notify_notification_close(it->second, nullptr);
        g_object_unref(it->second);
        m_activeNotifications.erase(it);
        
        std::cout << "[AutonomousNotificationService] Cancelled notification: " << notificationId << std::endl;
    }
}

void AutonomousNotificationService::CancelAllNotifications() {
    for (auto& pair : m_activeNotifications) {
        notify_notification_close(pair.second, nullptr);
        g_object_unref(pair.second);
    }
    
    m_activeNotifications.clear();
    m_notificationCounts.clear();
    
    std::cout << "[AutonomousNotificationService] Cancelled all notifications" << std::endl;
}

void AutonomousNotificationService::CancelNotificationsByType(const std::string& type) {
    auto it = m_activeNotifications.begin();
    while (it != m_activeNotifications.end()) {
        if (it->first.find(type) == 0) {
            notify_notification_close(it->second, nullptr);
            g_object_unref(it->second);
            it = m_activeNotifications.erase(it);
        } else {
            ++it;
        }
    }
    
    m_notificationCounts[type] = 0;
    
    std::cout << "[AutonomousNotificationService] Cancelled notifications of type: " << type << std::endl;
}

void AutonomousNotificationService::SetNotificationsEnabled(bool enabled) {
    m_notificationsEnabled = enabled;
    std::cout << "[AutonomousNotificationService] Notifications " 
              << (enabled ? "enabled" : "disabled") << std::endl;
}

bool AutonomousNotificationService::AreNotificationsEnabled() const {
    return m_notificationsEnabled;
}

void AutonomousNotificationService::SetSoundEnabled(bool enabled) {
    m_soundEnabled = enabled;
    std::cout << "[AutonomousNotificationService] Sound " 
              << (enabled ? "enabled" : "disabled") << std::endl;
}

bool AutonomousNotificationService::IsSoundEnabled() const {
    return m_soundEnabled;
}

void AutonomousNotificationService::SetUrgencyLevel(NotifyUrgency urgency) {
    m_defaultUrgency = urgency;
}

NotifyUrgency AutonomousNotificationService::GetUrgencyLevel() const {
    return m_defaultUrgency;
}

void AutonomousNotificationService::SetDesktopEntry(const std::string& desktopEntry) {
    m_desktopEntry = desktopEntry;
}

void AutonomousNotificationService::SetApplicationName(const std::string& appName) {
    m_applicationName = appName;
}

void AutonomousNotificationService::SetApplicationIcon(const std::string& iconPath) {
    m_applicationIcon = iconPath;
}

void AutonomousNotificationService::SetNotificationActionHandler(std::function<void(const std::string&, const std::string&)> handler) {
    m_actionHandler = handler;
}

void AutonomousNotificationService::SetNotificationClosedHandler(std::function<void(const std::string&)> handler) {
    m_closedHandler = handler;
}

// Static callback functions
void AutonomousNotificationService::OnActionInvoked(NotifyNotification* notification, char* action, gpointer user_data) {
    AutonomousNotificationService* service = static_cast<AutonomousNotificationService*>(user_data);
    
    if (service && service->m_actionHandler) {
        // Find notification tag
        std::string tag;
        for (const auto& pair : service->m_activeNotifications) {
            if (pair.second == notification) {
                tag = pair.first;
                break;
            }
        }
        
        service->m_actionHandler(tag, std::string(action));
    }
}

void AutonomousNotificationService::OnNotificationClosed(NotifyNotification* notification, gpointer user_data) {
    AutonomousNotificationService* service = static_cast<AutonomousNotificationService*>(user_data);
    
    if (service) {
        // Find and remove notification
        std::string tag;
        for (auto it = service->m_activeNotifications.begin(); it != service->m_activeNotifications.end(); ++it) {
            if (it->second == notification) {
                tag = it->first;
                g_object_unref(it->second);
                service->m_activeNotifications.erase(it);
                break;
            }
        }
        
        if (service->m_closedHandler && !tag.empty()) {
            service->m_closedHandler(tag);
        }
    }
}

// D-Bus implementation
bool AutonomousNotificationService::InitializeDBus() {
    try {
        GError* error = nullptr;
        
        m_dbusConnection = g_bus_get_sync(G_BUS_TYPE_SESSION, nullptr, &error);
        if (!m_dbusConnection) {
            std::cerr << "[AutonomousNotificationService] Failed to get D-Bus connection: " 
                      << (error ? error->message : "Unknown error") << std::endl;
            if (error) g_error_free(error);
            return false;
        }
        
        RegisterDBusService();
        
        m_dbusInitialized = true;
        std::cout << "[AutonomousNotificationService] D-Bus initialized successfully" << std::endl;
        
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[AutonomousNotificationService] Failed to initialize D-Bus: " << e.what() << std::endl;
        return false;
    }
}

void AutonomousNotificationService::ShutdownDBus() {
    if (m_dbusInitialized) {
        UnregisterDBusService();
        
        if (m_dbusConnection) {
            g_object_unref(m_dbusConnection);
            m_dbusConnection = nullptr;
        }
        
        m_dbusInitialized = false;
        std::cout << "[AutonomousNotificationService] D-Bus shutdown completed" << std::endl;
    }
}

void AutonomousNotificationService::RegisterDBusService() {
    if (!m_dbusConnection) return;
    
    GError* error = nullptr;
    
    m_dbusRegistrationId = g_dbus_connection_register_object(
        m_dbusConnection,
        "/com/rechain/dapp/Notifications",
        g_dbus_node_info_new_for_xml(DBUS_INTERFACE_XML, nullptr)->interfaces[0],
        &DBUS_INTERFACE_VTABLE,
        this,
        nullptr,
        &error
    );
    
    if (m_dbusRegistrationId == 0) {
        std::cerr << "[AutonomousNotificationService] Failed to register D-Bus object: " 
                  << (error ? error->message : "Unknown error") << std::endl;
        if (error) g_error_free(error);
    } else {
        std::cout << "[AutonomousNotificationService] D-Bus service registered" << std::endl;
    }
}

void AutonomousNotificationService::UnregisterDBusService() {
    if (m_dbusConnection && m_dbusRegistrationId > 0) {
        g_dbus_connection_unregister_object(m_dbusConnection, m_dbusRegistrationId);
        m_dbusRegistrationId = 0;
        std::cout << "[AutonomousNotificationService] D-Bus service unregistered" << std::endl;
    }
}

void AutonomousNotificationService::HandleDBusMethodCall(GDBusConnection* connection,
                                                       const gchar* sender,
                                                       const gchar* object_path,
                                                       const gchar* interface_name,
                                                       const gchar* method_name,
                                                       GVariant* parameters,
                                                       GDBusMethodInvocation* invocation,
                                                       gpointer user_data) {
    AutonomousNotificationService* service = static_cast<AutonomousNotificationService*>(user_data);
    
    if (g_strcmp0(method_name, "ShowNotification") == 0) {
        const gchar* type;
        const gchar* title;
        const gchar* message;
        const gchar* tag;
        
        g_variant_get(parameters, "(&s&s&s&s)", &type, &title, &message, &tag);
        
        service->ShowNotification(type, title, message, tag);
        g_dbus_method_invocation_return_value(invocation, nullptr);
        
    } else if (g_strcmp0(method_name, "CancelNotification") == 0) {
        const gchar* tag;
        g_variant_get(parameters, "(&s)", &tag);
        
        service->CancelNotification(tag);
        g_dbus_method_invocation_return_value(invocation, nullptr);
        
    } else if (g_strcmp0(method_name, "CancelAllNotifications") == 0) {
        service->CancelAllNotifications();
        g_dbus_method_invocation_return_value(invocation, nullptr);
        
    } else {
        g_dbus_method_invocation_return_error(invocation,
                                            G_DBUS_ERROR,
                                            G_DBUS_ERROR_UNKNOWN_METHOD,
                                            "Unknown method: %s",
                                            method_name);
    }
}
