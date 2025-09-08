#pragma once

#include <windows.h>
#include <shellapi.h>
#include <shlobj.h>
#include <string>
#include <vector>
#include <functional>

class WindowsSystemIntegration {
public:
    static WindowsSystemIntegration& GetInstance();
    
    // Initialization and cleanup
    bool Initialize();
    void Shutdown();
    
    // System tray integration
    bool CreateSystemTrayIcon();
    void RemoveSystemTrayIcon();
    void UpdateSystemTrayIcon(const std::wstring& tooltip = L"");
    void ShowSystemTrayMenu(POINT pt);
    
    // Jump list integration
    bool CreateJumpList();
    void UpdateJumpList();
    void AddRecentDocument(const std::wstring& path);
    
    // File associations
    bool RegisterFileAssociations();
    void UnregisterFileAssociations();
    
    // Protocol handlers
    bool RegisterProtocolHandler(const std::wstring& protocol);
    void UnregisterProtocolHandler(const std::wstring& protocol);
    
    // Startup integration
    bool SetStartupEnabled(bool enabled);
    bool IsStartupEnabled() const;
    
    // Window management
    void SetWindowIcon(HWND hwnd);
    void SetWindowTaskbarProgress(HWND hwnd, ULONGLONG completed, ULONGLONG total);
    void SetWindowTaskbarState(HWND hwnd, int state);
    
    // System notifications
    void ShowBalloonTip(const std::wstring& title, const std::wstring& message, DWORD icon = NIIF_INFO);
    
    // Event handlers
    void SetSystemTrayClickHandler(std::function<void()> handler);
    void SetSystemTrayMenuHandler(std::function<void(UINT)> handler);
    
    // Utility methods
    std::wstring GetExecutablePath();
    std::wstring GetApplicationDataPath();
    bool IsRunningAsAdmin();
    bool RequestAdminPrivileges();

private:
    WindowsSystemIntegration() = default;
    ~WindowsSystemIntegration() = default;
    
    // Prevent copying
    WindowsSystemIntegration(const WindowsSystemIntegration&) = delete;
    WindowsSystemIntegration& operator=(const WindowsSystemIntegration&) = delete;
    
    // Internal methods
    static LRESULT CALLBACK SystemTrayWndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam);
    void HandleSystemTrayMessage(WPARAM wParam, LPARAM lParam);
    
    // Member variables
    bool m_initialized = false;
    HWND m_hiddenWindow = nullptr;
    NOTIFYICONDATA m_notifyIconData = {};
    bool m_systemTrayCreated = false;
    
    std::function<void()> m_systemTrayClickHandler;
    std::function<void(UINT)> m_systemTrayMenuHandler;
    
    static WindowsSystemIntegration* s_instance;
    static const UINT WM_SYSTEM_TRAY = WM_USER + 1;
    static const UINT TRAY_ICON_ID = 1001;
};
