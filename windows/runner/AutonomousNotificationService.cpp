#include "AutonomousNotificationService.h"
#include <iostream>
#include <sstream>
#include <iomanip>
#include <chrono>
#include <winrt/Windows.Foundation.Collections.h>

using namespace winrt::Windows::Foundation::Collections;

AutonomousNotificationService& AutonomousNotificationService::GetInstance() {
    static AutonomousNotificationService instance;
    return instance;
}

bool AutonomousNotificationService::Initialize() {
    if (m_initialized) {
        return true;
    }
    
    try {
        // Initialize WinRT
        winrt::init_apartment();
        
        // Create toast notifier
        m_toastNotifier = ToastNotificationManager::CreateToastNotifier(L"REChain.Online");
        
        m_initialized = true;
        
        std::wcout << L"[AutonomousNotificationService] Initialized successfully" << std::endl;
        return true;
    }
    catch (const std::exception& e) {
        std::wcerr << L"[AutonomousNotificationService] Failed to initialize: " 
                   << std::wstring(e.what(), e.what() + strlen(e.what())).c_str() << std::endl;
        return false;
    }
}

void AutonomousNotificationService::Shutdown() {
    if (!m_initialized) {
        return;
    }
    
    try {
        CancelAllNotifications();
        m_toastNotifier = nullptr;
        m_initialized = false;
        
        std::wcout << L"[AutonomousNotificationService] Shutdown completed" << std::endl;
    }
    catch (const std::exception& e) {
        std::wcerr << L"[AutonomousNotificationService] Error during shutdown: " 
                   << std::wstring(e.what(), e.what() + strlen(e.what())).c_str() << std::endl;
    }
}

void AutonomousNotificationService::ShowMessageNotification(const std::wstring& sender, const std::wstring& message, const std::wstring& roomId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"message";
    data[L"roomId"] = roomId;
    data[L"sender"] = sender;
    
    std::wstring title = L"New Message from " + sender;
    std::wstring tag = GenerateNotificationId(L"message", roomId);
    
    ShowNotification(L"message", title, message, tag, data);
    LogNotification(L"message", title, message);
}

void AutonomousNotificationService::ShowCallNotification(const std::wstring& caller, const std::wstring& callId, bool isVideo) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"call";
    data[L"callId"] = callId;
    data[L"caller"] = caller;
    data[L"isVideo"] = isVideo ? L"true" : L"false";
    
    std::wstring title = isVideo ? L"Incoming Video Call" : L"Incoming Call";
    std::wstring content = L"From: " + caller;
    std::wstring tag = GenerateNotificationId(L"call", callId);
    
    ShowNotification(L"call", title, content, tag, data);
    LogNotification(L"call", title, content);
}

void AutonomousNotificationService::ShowMissedCallNotification(const std::wstring& caller, const std::wstring& callId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"missed_call";
    data[L"callId"] = callId;
    data[L"caller"] = caller;
    
    std::wstring title = L"Missed Call";
    std::wstring content = L"From: " + caller;
    std::wstring tag = GenerateNotificationId(L"missed_call", callId);
    
    ShowNotification(L"missed_call", title, content, tag, data);
    LogNotification(L"missed_call", title, content);
}

void AutonomousNotificationService::ShowUserJoinedNotification(const std::wstring& username, const std::wstring& roomName, const std::wstring& roomId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"user_joined";
    data[L"roomId"] = roomId;
    data[L"username"] = username;
    
    std::wstring title = L"User Joined";
    std::wstring content = username + L" joined " + roomName;
    std::wstring tag = GenerateNotificationId(L"user_joined", roomId);
    
    ShowNotification(L"user_joined", title, content, tag, data);
    LogNotification(L"user_joined", title, content);
}

void AutonomousNotificationService::ShowUserLeftNotification(const std::wstring& username, const std::wstring& roomName, const std::wstring& roomId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"user_left";
    data[L"roomId"] = roomId;
    data[L"username"] = username;
    
    std::wstring title = L"User Left";
    std::wstring content = username + L" left " + roomName;
    std::wstring tag = GenerateNotificationId(L"user_left", roomId);
    
    ShowNotification(L"user_left", title, content, tag, data);
    LogNotification(L"user_left", title, content);
}

void AutonomousNotificationService::ShowFileUploadNotification(const std::wstring& filename, const std::wstring& roomName, const std::wstring& roomId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"file_upload";
    data[L"roomId"] = roomId;
    data[L"filename"] = filename;
    
    std::wstring title = L"File Uploaded";
    std::wstring content = filename + L" uploaded to " + roomName;
    std::wstring tag = GenerateNotificationId(L"file_upload", roomId);
    
    ShowNotification(L"file_upload", title, content, tag, data);
    LogNotification(L"file_upload", title, content);
}

void AutonomousNotificationService::ShowSyncErrorNotification(const std::wstring& error) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"sync_error";
    data[L"error"] = error;
    
    std::wstring title = L"Sync Error";
    std::wstring tag = GenerateNotificationId(L"sync_error");
    
    ShowNotification(L"sync_error", title, error, tag, data);
    LogNotification(L"sync_error", title, error);
}

void AutonomousNotificationService::ShowLoginSuccessNotification(const std::wstring& username) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"login_success";
    data[L"username"] = username;
    
    std::wstring title = L"Login Successful";
    std::wstring content = L"Welcome back, " + username + L"!";
    std::wstring tag = GenerateNotificationId(L"login_success");
    
    ShowNotification(L"login_success", title, content, tag, data);
    LogNotification(L"login_success", title, content);
}

void AutonomousNotificationService::ShowDeviceVerificationNotification(const std::wstring& deviceName) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"device_verification";
    data[L"deviceName"] = deviceName;
    
    std::wstring title = L"Device Verification";
    std::wstring content = L"New device verified: " + deviceName;
    std::wstring tag = GenerateNotificationId(L"device_verification");
    
    ShowNotification(L"device_verification", title, content, tag, data);
    LogNotification(L"device_verification", title, content);
}

void AutonomousNotificationService::ShowBackupNotification(const std::wstring& status) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"backup";
    data[L"status"] = status;
    
    std::wstring title = L"Backup Status";
    std::wstring tag = GenerateNotificationId(L"backup");
    
    ShowNotification(L"backup", title, status, tag, data);
    LogNotification(L"backup", title, status);
}

void AutonomousNotificationService::ShowSpaceJoinedNotification(const std::wstring& spaceName, const std::wstring& spaceId) {
    if (!m_initialized || !m_notificationsEnabled) return;
    
    std::map<std::wstring, std::wstring> data;
    data[L"type"] = L"space_joined";
    data[L"spaceId"] = spaceId;
    data[L"spaceName"] = spaceName;
    
    std::wstring title = L"Space Joined";
    std::wstring content = L"You joined " + spaceName;
    std::wstring tag = GenerateNotificationId(L"space_joined", spaceId);
    
    ShowNotification(L"space_joined", title, content, tag, data);
    LogNotification(L"space_joined", title, content);
}

void AutonomousNotificationService::ShowNotification(const std::wstring& type, const std::wstring& title, 
                                                   const std::wstring& content, const std::wstring& tag,
                                                   const std::map<std::wstring, std::wstring>& data) {
    if (!m_initialized || !m_toastNotifier) return;
    
    try {
        std::wstring toastXml = CreateToastXml(title, content, type, data);
        
        XmlDocument doc;
        doc.LoadXml(toastXml);
        
        ToastNotification toast(doc);
        toast.Tag(tag);
        toast.Group(type);
        
        // Set expiration time (1 hour)
        auto expirationTime = winrt::clock::now() + std::chrono::hours(1);
        toast.ExpirationTime(expirationTime);
        
        // Add event handlers
        if (m_activatedHandler) {
            toast.Activated([this, tag, type](ToastNotification const&, IInspectable const& args) {
                m_activatedHandler(tag, type);
            });
        }
        
        if (m_dismissedHandler) {
            toast.Dismissed([this, tag](ToastNotification const&, ToastDismissedEventArgs const&) {
                m_dismissedHandler(tag);
            });
        }
        
        m_toastNotifier.Show(toast);
        
        // Update notification count
        m_notificationCounts[type]++;
        
    }
    catch (const std::exception& e) {
        std::wcerr << L"[AutonomousNotificationService] Failed to show notification: " 
                   << std::wstring(e.what(), e.what() + strlen(e.what())).c_str() << std::endl;
    }
}

std::wstring AutonomousNotificationService::CreateToastXml(const std::wstring& title, const std::wstring& content,
                                                          const std::wstring& type, const std::map<std::wstring, std::wstring>& data) {
    std::wstringstream xml;
    
    xml << L"<toast scenario=\"default\">";
    xml << L"<visual>";
    xml << L"<binding template=\"ToastGeneric\">";
    xml << L"<text>" << title << L"</text>";
    xml << L"<text>" << content << L"</text>";
    
    // Add app logo
    xml << L"<image placement=\"appLogoOverride\" src=\"" << GetNotificationIcon(type) << L"\"/>";
    
    xml << L"</binding>";
    xml << L"</visual>";
    
    // Add audio if enabled
    if (m_soundEnabled) {
        xml << L"<audio src=\"" << GetNotificationSound(type) << L"\"/>";
    } else {
        xml << L"<audio silent=\"true\"/>";
    }
    
    // Add actions for interactive notifications
    if (type == L"call") {
        xml << L"<actions>";
        xml << L"<action content=\"Accept\" arguments=\"action=accept&amp;callId=" << data.at(L"callId") << L"\" activationType=\"foreground\"/>";
        xml << L"<action content=\"Decline\" arguments=\"action=decline&amp;callId=" << data.at(L"callId") << L"\" activationType=\"background\"/>";
        xml << L"</actions>";
    } else if (type == L"message") {
        xml << L"<actions>";
        xml << L"<input id=\"textBox\" type=\"text\" placeHolderContent=\"Type a reply...\"/>";
        xml << L"<action content=\"Reply\" arguments=\"action=reply&amp;roomId=" << data.at(L"roomId") << L"\" activationType=\"background\" hint-inputId=\"textBox\"/>";
        xml << L"</actions>";
    }
    
    xml << L"</toast>";
    
    return xml.str();
}

std::wstring AutonomousNotificationService::GetNotificationIcon(const std::wstring& type) {
    // Return appropriate icon path based on notification type
    if (type == L"call" || type == L"missed_call") {
        return L"ms-appx:///assets/icons/call.png";
    } else if (type == L"message") {
        return L"ms-appx:///assets/icons/message.png";
    } else if (type == L"sync_error") {
        return L"ms-appx:///assets/icons/error.png";
    } else if (type == L"login_success") {
        return L"ms-appx:///assets/icons/success.png";
    }
    
    return L"ms-appx:///assets/icons/default.png";
}

std::wstring AutonomousNotificationService::GetNotificationSound(const std::wstring& type) {
    if (type == L"call") {
        return L"ms-winsoundevent:Notification.Looping.Call";
    } else if (type == L"message") {
        return L"ms-winsoundevent:Notification.IM";
    } else if (type == L"sync_error") {
        return L"ms-winsoundevent:Notification.Default";
    }
    
    return L"ms-winsoundevent:Notification.Default";
}

std::wstring AutonomousNotificationService::GenerateNotificationId(const std::wstring& type, const std::wstring& identifier) {
    auto now = std::chrono::system_clock::now();
    auto timestamp = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count();
    
    std::wstringstream id;
    id << type << L"_" << timestamp;
    
    if (!identifier.empty()) {
        id << L"_" << identifier;
    }
    
    return id.str();
}

void AutonomousNotificationService::LogNotification(const std::wstring& type, const std::wstring& title, const std::wstring& content) {
    auto now = std::chrono::system_clock::now();
    auto time_t = std::chrono::system_clock::to_time_t(now);
    
    std::wcout << L"[" << std::put_time(std::localtime(&time_t), L"%Y-%m-%d %H:%M:%S") << L"] "
               << L"[AutonomousNotificationService] Showing " << type << L" notification: " 
               << title << L" - " << content << std::endl;
}

void AutonomousNotificationService::CancelNotification(const std::wstring& notificationId) {
    if (!m_initialized || !m_toastNotifier) return;
    
    try {
        ToastNotificationHistory history = ToastNotificationManager::History();
        history.Remove(notificationId);
        
        std::wcout << L"[AutonomousNotificationService] Cancelled notification: " << notificationId << std::endl;
    }
    catch (const std::exception& e) {
        std::wcerr << L"[AutonomousNotificationService] Failed to cancel notification: " 
                   << std::wstring(e.what(), e.what() + strlen(e.what())).c_str() << std::endl;
    }
}

void AutonomousNotificationService::CancelAllNotifications() {
    if (!m_initialized) return;
    
    try {
        ToastNotificationHistory history = ToastNotificationManager::History();
        history.Clear();
        
        m_notificationCounts.clear();
        
        std::wcout << L"[AutonomousNotificationService] Cancelled all notifications" << std::endl;
    }
    catch (const std::exception& e) {
        std::wcerr << L"[AutonomousNotificationService] Failed to cancel all notifications: " 
                   << std::wstring(e.what(), e.what() + strlen(e.what())).c_str() << std::endl;
    }
}

void AutonomousNotificationService::CancelNotificationsByType(const std::wstring& type) {
    if (!m_initialized) return;
    
    try {
        ToastNotificationHistory history = ToastNotificationManager::History();
        history.RemoveGroup(type);
        
        m_notificationCounts[type] = 0;
        
        std::wcout << L"[AutonomousNotificationService] Cancelled notifications of type: " << type << std::endl;
    }
    catch (const std::exception& e) {
        std::wcerr << L"[AutonomousNotificationService] Failed to cancel notifications by type: " 
                   << std::wstring(e.what(), e.what() + strlen(e.what())).c_str() << std::endl;
    }
}

void AutonomousNotificationService::SetNotificationsEnabled(bool enabled) {
    m_notificationsEnabled = enabled;
    std::wcout << L"[AutonomousNotificationService] Notifications " 
               << (enabled ? L"enabled" : L"disabled") << std::endl;
}

bool AutonomousNotificationService::AreNotificationsEnabled() const {
    return m_notificationsEnabled;
}

void AutonomousNotificationService::SetSoundEnabled(bool enabled) {
    m_soundEnabled = enabled;
    std::wcout << L"[AutonomousNotificationService] Sound " 
               << (enabled ? L"enabled" : L"disabled") << std::endl;
}

bool AutonomousNotificationService::IsSoundEnabled() const {
    return m_soundEnabled;
}

void AutonomousNotificationService::SetNotificationActivatedHandler(std::function<void(const std::wstring&, const std::wstring&)> handler) {
    m_activatedHandler = handler;
}

void AutonomousNotificationService::SetNotificationDismissedHandler(std::function<void(const std::wstring&)> handler) {
    m_dismissedHandler = handler;
}
