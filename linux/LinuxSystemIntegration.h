#pragma once

#include <string>
#include <vector>
#include <map>
#include <functional>
#include <memory>
#include <gtk/gtk.h>
#include <gio/gio.h>

class LinuxSystemIntegration {
public:
    static LinuxSystemIntegration& GetInstance();
    
    // Initialization and cleanup
    bool Initialize();
    void Shutdown();
    
    // System tray integration
    bool CreateSystemTrayIcon();
    void UpdateSystemTrayIcon(const std::string& iconPath, const std::string& tooltip = "");
    void ShowSystemTrayNotification(const std::string& message);
    void SetSystemTrayMenu(const std::vector<std::pair<std::string, std::function<void()>>>& menuItems);
    void RemoveSystemTrayIcon();
    
    // Desktop integration
    bool RegisterDesktopEntry();
    bool CreateDesktopShortcut();
    bool SetAsDefaultApplication(const std::vector<std::string>& mimeTypes);
    bool RegisterURLScheme(const std::string& scheme);
    
    // Startup integration
    bool SetAutoStart(bool enabled);
    bool IsAutoStartEnabled();
    
    // File associations
    bool RegisterFileAssociation(const std::string& extension, const std::string& mimeType);
    bool UnregisterFileAssociation(const std::string& extension);
    
    // Window management
    void SetWindowIcon(GtkWindow* window, const std::string& iconPath);
    void SetWindowTitle(GtkWindow* window, const std::string& title);
    void MinimizeToTray(GtkWindow* window);
    void RestoreFromTray(GtkWindow* window);
    void SetWindowAlwaysOnTop(GtkWindow* window, bool onTop);
    
    // System information
    std::string GetDesktopEnvironment();
    std::string GetDistributionInfo();
    bool IsWaylandSession();
    bool IsX11Session();
    
    // Theme integration
    bool IsDarkThemeEnabled();
    void SetApplicationTheme(const std::string& theme);
    
    // Power management
    void PreventSystemSleep(bool prevent);
    void RegisterPowerEventHandler(std::function<void(const std::string&)> handler);
    
    // D-Bus integration
    bool InitializeDBusServices();
    void ShutdownDBusServices();
    void RegisterDBusService(const std::string& serviceName);
    
    // Event handlers
    void SetTrayIconClickHandler(std::function<void()> handler);
    void SetTrayIconRightClickHandler(std::function<void()> handler);

private:
    LinuxSystemIntegration() = default;
    ~LinuxSystemIntegration() = default;
    
    // Prevent copying
    LinuxSystemIntegration(const LinuxSystemIntegration&) = delete;
    LinuxSystemIntegration& operator=(const LinuxSystemIntegration&) = delete;
    
    // Internal methods
    std::string GetConfigDirectory();
    std::string GetDataDirectory();
    std::string GetDesktopDirectory();
    std::string GetAutostartDirectory();
    
    bool WriteDesktopFile(const std::string& filePath, const std::map<std::string, std::string>& entries);
    bool CreateDirectoryIfNotExists(const std::string& path);
    
    // GTK callbacks
    static void OnTrayIconActivate(GtkStatusIcon* statusIcon, gpointer userData);
    static void OnTrayIconPopupMenu(GtkStatusIcon* statusIcon, guint button, guint activateTime, gpointer userData);
    static gboolean OnTrayIconButtonPress(GtkWidget* widget, GdkEventButton* event, gpointer userData);
    
    // D-Bus callbacks
    static void OnDBusMethodCall(GDBusConnection* connection,
                               const gchar* sender,
                               const gchar* objectPath,
                               const gchar* interfaceName,
                               const gchar* methodName,
                               GVariant* parameters,
                               GDBusMethodInvocation* invocation,
                               gpointer userData);
    
    // Member variables
    bool m_initialized = false;
    
    // System tray
    GtkStatusIcon* m_trayIcon = nullptr;
    GtkWidget* m_trayMenu = nullptr;
    bool m_trayIconVisible = false;
    
    // Application info
    std::string m_applicationName = "REChain";
    std::string m_applicationId = "com.rechain.online";
    std::string m_applicationIcon = "rechain";
    std::string m_executablePath;
    
    // Event handlers
    std::function<void()> m_trayClickHandler;
    std::function<void()> m_trayRightClickHandler;
    std::function<void(const std::string&)> m_powerEventHandler;
    
    // D-Bus
    GDBusConnection* m_dbusConnection = nullptr;
    std::vector<guint> m_dbusRegistrationIds;
    
    // Window tracking
    std::map<GtkWindow*, bool> m_windowStates;
    
    // Power management
    bool m_sleepPrevented = false;
    guint32 m_sleepInhibitCookie = 0;
};
