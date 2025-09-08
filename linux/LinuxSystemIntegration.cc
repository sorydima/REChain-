#include "LinuxSystemIntegration.h"
#include <iostream>
#include <fstream>
#include <filesystem>
#include <sstream>
#include <unistd.h>
#include <sys/stat.h>
#include <pwd.h>

LinuxSystemIntegration& LinuxSystemIntegration::GetInstance() {
    static LinuxSystemIntegration instance;
    return instance;
}

bool LinuxSystemIntegration::Initialize() {
    if (m_initialized) {
        return true;
    }
    
    try {
        // Get executable path
        char exePath[PATH_MAX];
        ssize_t len = readlink("/proc/self/exe", exePath, sizeof(exePath) - 1);
        if (len != -1) {
            exePath[len] = '\0';
            m_executablePath = exePath;
        }
        
        // Initialize D-Bus services
        if (!InitializeDBusServices()) {
            std::cerr << "[LinuxSystemIntegration] Failed to initialize D-Bus services" << std::endl;
            // Continue without D-Bus, it's not critical
        }
        
        m_initialized = true;
        
        std::cout << "[LinuxSystemIntegration] Initialized successfully" << std::endl;
        std::cout << "[LinuxSystemIntegration] Desktop Environment: " << GetDesktopEnvironment() << std::endl;
        std::cout << "[LinuxSystemIntegration] Display Server: " << (IsWaylandSession() ? "Wayland" : "X11") << std::endl;
        
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to initialize: " << e.what() << std::endl;
        return false;
    }
}

void LinuxSystemIntegration::Shutdown() {
    if (!m_initialized) {
        return;
    }
    
    try {
        // Remove system tray icon
        RemoveSystemTrayIcon();
        
        // Shutdown D-Bus services
        ShutdownDBusServices();
        
        // Restore power management
        PreventSystemSleep(false);
        
        m_initialized = false;
        
        std::cout << "[LinuxSystemIntegration] Shutdown completed" << std::endl;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Error during shutdown: " << e.what() << std::endl;
    }
}

bool LinuxSystemIntegration::CreateSystemTrayIcon() {
    if (!m_initialized) return false;
    
    try {
        // Check if system tray is available
        if (!gtk_status_icon_is_embedded(nullptr)) {
            std::cout << "[LinuxSystemIntegration] System tray not available" << std::endl;
            return false;
        }
        
        // Create status icon
        m_trayIcon = gtk_status_icon_new_from_icon_name(m_applicationIcon.c_str());
        if (!m_trayIcon) {
            std::cerr << "[LinuxSystemIntegration] Failed to create system tray icon" << std::endl;
            return false;
        }
        
        // Set tooltip
        gtk_status_icon_set_tooltip_text(m_trayIcon, m_applicationName.c_str());
        
        // Connect signals
        g_signal_connect(m_trayIcon, "activate", G_CALLBACK(OnTrayIconActivate), this);
        g_signal_connect(m_trayIcon, "popup-menu", G_CALLBACK(OnTrayIconPopupMenu), this);
        
        // Make visible
        gtk_status_icon_set_visible(m_trayIcon, TRUE);
        m_trayIconVisible = true;
        
        std::cout << "[LinuxSystemIntegration] System tray icon created" << std::endl;
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to create system tray icon: " << e.what() << std::endl;
        return false;
    }
}

void LinuxSystemIntegration::UpdateSystemTrayIcon(const std::string& iconPath, const std::string& tooltip) {
    if (!m_trayIcon) return;
    
    if (!iconPath.empty()) {
        if (std::filesystem::exists(iconPath)) {
            gtk_status_icon_set_from_file(m_trayIcon, iconPath.c_str());
        } else {
            gtk_status_icon_set_from_icon_name(m_trayIcon, iconPath.c_str());
        }
    }
    
    if (!tooltip.empty()) {
        gtk_status_icon_set_tooltip_text(m_trayIcon, tooltip.c_str());
    }
}

void LinuxSystemIntegration::ShowSystemTrayNotification(const std::string& message) {
    if (!m_trayIcon) return;
    
    // Use libnotify for notifications (handled by AutonomousNotificationService)
    std::cout << "[LinuxSystemIntegration] Tray notification: " << message << std::endl;
}

void LinuxSystemIntegration::SetSystemTrayMenu(const std::vector<std::pair<std::string, std::function<void()>>>& menuItems) {
    if (!m_trayIcon) return;
    
    // Destroy existing menu
    if (m_trayMenu) {
        gtk_widget_destroy(m_trayMenu);
    }
    
    // Create new menu
    m_trayMenu = gtk_menu_new();
    
    for (const auto& item : menuItems) {
        GtkWidget* menuItem = gtk_menu_item_new_with_label(item.first.c_str());
        
        // Store callback in user data (simplified approach)
        g_object_set_data(G_OBJECT(menuItem), "callback", (gpointer)&item.second);
        
        g_signal_connect(menuItem, "activate", G_CALLBACK([](GtkMenuItem* menuItem, gpointer userData) {
            auto* callback = static_cast<std::function<void()>*>(g_object_get_data(G_OBJECT(menuItem), "callback"));
            if (callback) {
                (*callback)();
            }
        }), nullptr);
        
        gtk_menu_shell_append(GTK_MENU_SHELL(m_trayMenu), menuItem);
    }
    
    gtk_widget_show_all(m_trayMenu);
}

void LinuxSystemIntegration::RemoveSystemTrayIcon() {
    if (m_trayIcon) {
        gtk_status_icon_set_visible(m_trayIcon, FALSE);
        g_object_unref(m_trayIcon);
        m_trayIcon = nullptr;
        m_trayIconVisible = false;
        
        std::cout << "[LinuxSystemIntegration] System tray icon removed" << std::endl;
    }
    
    if (m_trayMenu) {
        gtk_widget_destroy(m_trayMenu);
        m_trayMenu = nullptr;
    }
}

bool LinuxSystemIntegration::RegisterDesktopEntry() {
    try {
        std::string dataDir = GetDataDirectory();
        std::string desktopFile = dataDir + "/applications/" + m_applicationId + ".desktop";
        
        CreateDirectoryIfNotExists(dataDir + "/applications");
        
        std::map<std::string, std::string> entries = {
            {"[Desktop Entry]", ""},
            {"Type", "Application"},
            {"Name", m_applicationName},
            {"Comment", "Secure decentralized communication platform"},
            {"Exec", m_executablePath},
            {"Icon", m_applicationIcon},
            {"Terminal", "false"},
            {"Categories", "Network;InstantMessaging;"},
            {"MimeType", "x-scheme-handler/matrix;"},
            {"StartupWMClass", m_applicationName},
            {"StartupNotify", "true"}
        };
        
        if (WriteDesktopFile(desktopFile, entries)) {
            // Update desktop database
            std::system("update-desktop-database ~/.local/share/applications/ 2>/dev/null");
            
            std::cout << "[LinuxSystemIntegration] Desktop entry registered: " << desktopFile << std::endl;
            return true;
        }
        
        return false;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to register desktop entry: " << e.what() << std::endl;
        return false;
    }
}

bool LinuxSystemIntegration::CreateDesktopShortcut() {
    try {
        std::string desktopDir = GetDesktopDirectory();
        std::string shortcutFile = desktopDir + "/" + m_applicationName + ".desktop";
        
        CreateDirectoryIfNotExists(desktopDir);
        
        std::map<std::string, std::string> entries = {
            {"[Desktop Entry]", ""},
            {"Type", "Application"},
            {"Name", m_applicationName},
            {"Comment", "Secure decentralized communication platform"},
            {"Exec", m_executablePath},
            {"Icon", m_applicationIcon},
            {"Terminal", "false"}
        };
        
        if (WriteDesktopFile(shortcutFile, entries)) {
            // Make executable
            chmod(shortcutFile.c_str(), 0755);
            
            std::cout << "[LinuxSystemIntegration] Desktop shortcut created: " << shortcutFile << std::endl;
            return true;
        }
        
        return false;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to create desktop shortcut: " << e.what() << std::endl;
        return false;
    }
}

bool LinuxSystemIntegration::SetAutoStart(bool enabled) {
    try {
        std::string autostartDir = GetAutostartDirectory();
        std::string autostartFile = autostartDir + "/" + m_applicationId + ".desktop";
        
        if (enabled) {
            CreateDirectoryIfNotExists(autostartDir);
            
            std::map<std::string, std::string> entries = {
                {"[Desktop Entry]", ""},
                {"Type", "Application"},
                {"Name", m_applicationName},
                {"Comment", "Secure decentralized communication platform"},
                {"Exec", m_executablePath + " --minimized"},
                {"Icon", m_applicationIcon},
                {"Terminal", "false"},
                {"Hidden", "false"},
                {"NoDisplay", "false"},
                {"X-GNOME-Autostart-enabled", "true"}
            };
            
            if (WriteDesktopFile(autostartFile, entries)) {
                std::cout << "[LinuxSystemIntegration] Auto-start enabled" << std::endl;
                return true;
            }
        } else {
            if (std::filesystem::exists(autostartFile)) {
                std::filesystem::remove(autostartFile);
                std::cout << "[LinuxSystemIntegration] Auto-start disabled" << std::endl;
                return true;
            }
        }
        
        return false;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to set auto-start: " << e.what() << std::endl;
        return false;
    }
}

bool LinuxSystemIntegration::IsAutoStartEnabled() {
    std::string autostartFile = GetAutostartDirectory() + "/" + m_applicationId + ".desktop";
    return std::filesystem::exists(autostartFile);
}

bool LinuxSystemIntegration::RegisterURLScheme(const std::string& scheme) {
    try {
        // Register via desktop file
        std::string dataDir = GetDataDirectory();
        std::string desktopFile = dataDir + "/applications/" + m_applicationId + "-" + scheme + ".desktop";
        
        CreateDirectoryIfNotExists(dataDir + "/applications");
        
        std::map<std::string, std::string> entries = {
            {"[Desktop Entry]", ""},
            {"Type", "Application"},
            {"Name", m_applicationName + " (" + scheme + " handler)"},
            {"Exec", m_executablePath + " --url %u"},
            {"Icon", m_applicationIcon},
            {"Terminal", "false"},
            {"NoDisplay", "true"},
            {"MimeType", "x-scheme-handler/" + scheme + ";"}
        };
        
        if (WriteDesktopFile(desktopFile, entries)) {
            // Update MIME database
            std::system(("update-desktop-database " + dataDir + "/applications/ 2>/dev/null").c_str());
            
            std::cout << "[LinuxSystemIntegration] URL scheme registered: " << scheme << std::endl;
            return true;
        }
        
        return false;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to register URL scheme: " << e.what() << std::endl;
        return false;
    }
}

std::string LinuxSystemIntegration::GetDesktopEnvironment() {
    const char* desktop = getenv("XDG_CURRENT_DESKTOP");
    if (desktop) return std::string(desktop);
    
    desktop = getenv("DESKTOP_SESSION");
    if (desktop) return std::string(desktop);
    
    // Try to detect based on running processes
    if (std::system("pgrep gnome-session >/dev/null 2>&1") == 0) return "GNOME";
    if (std::system("pgrep kded5 >/dev/null 2>&1") == 0) return "KDE";
    if (std::system("pgrep xfce4-session >/dev/null 2>&1") == 0) return "XFCE";
    
    return "Unknown";
}

std::string LinuxSystemIntegration::GetDistributionInfo() {
    std::ifstream osRelease("/etc/os-release");
    if (osRelease.is_open()) {
        std::string line;
        while (std::getline(osRelease, line)) {
            if (line.find("PRETTY_NAME=") == 0) {
                return line.substr(13, line.length() - 14); // Remove quotes
            }
        }
    }
    
    return "Unknown Linux Distribution";
}

bool LinuxSystemIntegration::IsWaylandSession() {
    const char* waylandDisplay = getenv("WAYLAND_DISPLAY");
    return waylandDisplay && strlen(waylandDisplay) > 0;
}

bool LinuxSystemIntegration::IsX11Session() {
    const char* display = getenv("DISPLAY");
    return display && strlen(display) > 0;
}

bool LinuxSystemIntegration::IsDarkThemeEnabled() {
    // Check GTK theme setting
    GtkSettings* settings = gtk_settings_get_default();
    if (settings) {
        gboolean preferDark = FALSE;
        g_object_get(settings, "gtk-application-prefer-dark-theme", &preferDark, nullptr);
        return preferDark;
    }
    
    return false;
}

void LinuxSystemIntegration::PreventSystemSleep(bool prevent) {
    if (prevent && !m_sleepPrevented) {
        // Use systemd-inhibit or similar
        std::string command = "systemd-inhibit --what=sleep --who='" + m_applicationName + 
                             "' --why='Active communication session' sleep infinity &";
        std::system(command.c_str());
        m_sleepPrevented = true;
        
        std::cout << "[LinuxSystemIntegration] System sleep prevented" << std::endl;
    } else if (!prevent && m_sleepPrevented) {
        std::system("pkill -f 'systemd-inhibit.*sleep infinity'");
        m_sleepPrevented = false;
        
        std::cout << "[LinuxSystemIntegration] System sleep allowed" << std::endl;
    }
}

// Helper methods
std::string LinuxSystemIntegration::GetConfigDirectory() {
    const char* configHome = getenv("XDG_CONFIG_HOME");
    if (configHome) {
        return std::string(configHome);
    }
    
    const char* home = getenv("HOME");
    if (home) {
        return std::string(home) + "/.config";
    }
    
    return "/tmp";
}

std::string LinuxSystemIntegration::GetDataDirectory() {
    const char* dataHome = getenv("XDG_DATA_HOME");
    if (dataHome) {
        return std::string(dataHome);
    }
    
    const char* home = getenv("HOME");
    if (home) {
        return std::string(home) + "/.local/share";
    }
    
    return "/tmp";
}

std::string LinuxSystemIntegration::GetDesktopDirectory() {
    const char* home = getenv("HOME");
    if (home) {
        return std::string(home) + "/Desktop";
    }
    
    return "/tmp";
}

std::string LinuxSystemIntegration::GetAutostartDirectory() {
    return GetConfigDirectory() + "/autostart";
}

bool LinuxSystemIntegration::WriteDesktopFile(const std::string& filePath, const std::map<std::string, std::string>& entries) {
    try {
        std::ofstream file(filePath);
        if (!file.is_open()) {
            return false;
        }
        
        for (const auto& entry : entries) {
            if (entry.first == "[Desktop Entry]") {
                file << entry.first << std::endl;
            } else {
                file << entry.first << "=" << entry.second << std::endl;
            }
        }
        
        file.close();
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to write desktop file: " << e.what() << std::endl;
        return false;
    }
}

bool LinuxSystemIntegration::CreateDirectoryIfNotExists(const std::string& path) {
    try {
        return std::filesystem::create_directories(path);
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to create directory: " << e.what() << std::endl;
        return false;
    }
}

bool LinuxSystemIntegration::InitializeDBusServices() {
    try {
        GError* error = nullptr;
        
        m_dbusConnection = g_bus_get_sync(G_BUS_TYPE_SESSION, nullptr, &error);
        if (!m_dbusConnection) {
            std::cerr << "[LinuxSystemIntegration] Failed to get D-Bus connection: " 
                      << (error ? error->message : "Unknown error") << std::endl;
            if (error) g_error_free(error);
            return false;
        }
        
        std::cout << "[LinuxSystemIntegration] D-Bus services initialized" << std::endl;
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[LinuxSystemIntegration] Failed to initialize D-Bus services: " << e.what() << std::endl;
        return false;
    }
}

void LinuxSystemIntegration::ShutdownDBusServices() {
    for (guint id : m_dbusRegistrationIds) {
        if (m_dbusConnection) {
            g_dbus_connection_unregister_object(m_dbusConnection, id);
        }
    }
    m_dbusRegistrationIds.clear();
    
    if (m_dbusConnection) {
        g_object_unref(m_dbusConnection);
        m_dbusConnection = nullptr;
    }
    
    std::cout << "[LinuxSystemIntegration] D-Bus services shutdown" << std::endl;
}

void LinuxSystemIntegration::SetTrayIconClickHandler(std::function<void()> handler) {
    m_trayClickHandler = handler;
}

void LinuxSystemIntegration::SetTrayIconRightClickHandler(std::function<void()> handler) {
    m_trayRightClickHandler = handler;
}

// GTK Callbacks
void LinuxSystemIntegration::OnTrayIconActivate(GtkStatusIcon* statusIcon, gpointer userData) {
    LinuxSystemIntegration* integration = static_cast<LinuxSystemIntegration*>(userData);
    if (integration && integration->m_trayClickHandler) {
        integration->m_trayClickHandler();
    }
}

void LinuxSystemIntegration::OnTrayIconPopupMenu(GtkStatusIcon* statusIcon, guint button, guint activateTime, gpointer userData) {
    LinuxSystemIntegration* integration = static_cast<LinuxSystemIntegration*>(userData);
    if (integration) {
        if (integration->m_trayMenu) {
            gtk_menu_popup(GTK_MENU(integration->m_trayMenu), nullptr, nullptr, 
                          gtk_status_icon_position_menu, statusIcon, button, activateTime);
        }
        
        if (integration->m_trayRightClickHandler) {
            integration->m_trayRightClickHandler();
        }
    }
}
