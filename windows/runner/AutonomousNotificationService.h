#pragma once

#include <windows.h>
#include <winrt/base.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Data.Xml.Dom.h>
#include <winrt/Windows.UI.Notifications.h>
#include <winrt/Windows.ApplicationModel.h>
#include <winrt/Windows.Storage.h>
#include <string>
#include <map>
#include <memory>
#include <functional>

using namespace winrt;
using namespace Windows::Foundation;
using namespace Windows::Data::Xml::Dom;
using namespace Windows::UI::Notifications;
using namespace Windows::ApplicationModel;
using namespace Windows::Storage;

class AutonomousNotificationService {
public:
    static AutonomousNotificationService& GetInstance();
    
    // Initialization and cleanup
    bool Initialize();
    void Shutdown();
    
    // Notification methods
    void ShowMessageNotification(const std::wstring& sender, const std::wstring& message, const std::wstring& roomId);
    void ShowCallNotification(const std::wstring& caller, const std::wstring& callId, bool isVideo = false);
    void ShowMissedCallNotification(const std::wstring& caller, const std::wstring& callId);
    void ShowUserJoinedNotification(const std::wstring& username, const std::wstring& roomName, const std::wstring& roomId);
    void ShowUserLeftNotification(const std::wstring& username, const std::wstring& roomName, const std::wstring& roomId);
    void ShowFileUploadNotification(const std::wstring& filename, const std::wstring& roomName, const std::wstring& roomId);
    void ShowRoomCreatedNotification(const std::wstring& roomName, const std::wstring& creator, const std::wstring& roomId);
    void ShowSyncErrorNotification(const std::wstring& error);
    void ShowLoginSuccessNotification(const std::wstring& username);
    void ShowDeviceVerificationNotification(const std::wstring& deviceName);
    void ShowBackupNotification(const std::wstring& status);
    void ShowSpaceJoinedNotification(const std::wstring& spaceName, const std::wstring& spaceId);
    
    // Notification management
    void CancelNotification(const std::wstring& notificationId);
    void CancelAllNotifications();
    void CancelNotificationsByType(const std::wstring& type);
    
    // Settings
    void SetNotificationsEnabled(bool enabled);
    bool AreNotificationsEnabled() const;
    void SetSoundEnabled(bool enabled);
    bool IsSoundEnabled() const;
    
    // Event handlers
    void SetNotificationActivatedHandler(std::function<void(const std::wstring&, const std::wstring&)> handler);
    void SetNotificationDismissedHandler(std::function<void(const std::wstring&)> handler);

private:
    AutonomousNotificationService() = default;
    ~AutonomousNotificationService() = default;
    
    // Prevent copying
    AutonomousNotificationService(const AutonomousNotificationService&) = delete;
    AutonomousNotificationService& operator=(const AutonomousNotificationService&) = delete;
    
    // Internal methods
    void ShowNotification(const std::wstring& type, const std::wstring& title, 
                         const std::wstring& content, const std::wstring& tag,
                         const std::map<std::wstring, std::wstring>& data = {});
    
    std::wstring CreateToastXml(const std::wstring& title, const std::wstring& content,
                               const std::wstring& type, const std::map<std::wstring, std::wstring>& data);
    
    std::wstring GetNotificationIcon(const std::wstring& type);
    std::wstring GetNotificationSound(const std::wstring& type);
    std::wstring GenerateNotificationId(const std::wstring& type, const std::wstring& identifier = L"");
    
    void LogNotification(const std::wstring& type, const std::wstring& title, const std::wstring& content);
    
    // Member variables
    bool m_initialized = false;
    bool m_notificationsEnabled = true;
    bool m_soundEnabled = true;
    
    ToastNotifier m_toastNotifier = nullptr;
    
    std::function<void(const std::wstring&, const std::wstring&)> m_activatedHandler;
    std::function<void(const std::wstring&)> m_dismissedHandler;
    
    // Notification counters for badges
    std::map<std::wstring, int> m_notificationCounts;
};
