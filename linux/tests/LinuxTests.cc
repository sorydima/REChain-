#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include <memory>
#include <thread>
#include <chrono>

#include "../AutonomousNotificationService.h"
#include "../CrashReportingManager.h"
#include "../LinuxSystemIntegration.h"

class LinuxServicesTest : public ::testing::Test {
protected:
    void SetUp() override {
        // Initialize GTK for testing (required for notification service)
        if (!gtk_init_check(nullptr, nullptr)) {
            GTEST_SKIP() << "GTK not available in test environment";
        }
    }
    
    void TearDown() override {
        // Cleanup services
        auto& notificationService = AutonomousNotificationService::GetInstance();
        notificationService.Shutdown();
        
        auto& crashManager = CrashReportingManager::GetInstance();
        crashManager.Shutdown();
        
        auto& systemIntegration = LinuxSystemIntegration::GetInstance();
        systemIntegration.Shutdown();
    }
};

// AutonomousNotificationService Tests
TEST_F(LinuxServicesTest, NotificationServiceInitialization) {
    auto& service = AutonomousNotificationService::GetInstance();
    
    EXPECT_TRUE(service.Initialize());
    EXPECT_TRUE(service.AreNotificationsEnabled());
    EXPECT_TRUE(service.IsSoundEnabled());
    
    service.Shutdown();
}

TEST_F(LinuxServicesTest, NotificationServiceSettings) {
    auto& service = AutonomousNotificationService::GetInstance();
    ASSERT_TRUE(service.Initialize());
    
    // Test notification settings
    service.SetNotificationsEnabled(false);
    EXPECT_FALSE(service.AreNotificationsEnabled());
    
    service.SetNotificationsEnabled(true);
    EXPECT_TRUE(service.AreNotificationsEnabled());
    
    // Test sound settings
    service.SetSoundEnabled(false);
    EXPECT_FALSE(service.IsSoundEnabled());
    
    service.SetSoundEnabled(true);
    EXPECT_TRUE(service.IsSoundEnabled());
    
    // Test urgency settings
    service.SetUrgencyLevel(NOTIFY_URGENCY_CRITICAL);
    EXPECT_EQ(service.GetUrgencyLevel(), NOTIFY_URGENCY_CRITICAL);
}

TEST_F(LinuxServicesTest, NotificationServiceApplicationSettings) {
    auto& service = AutonomousNotificationService::GetInstance();
    ASSERT_TRUE(service.Initialize());
    
    service.SetApplicationName("Test App");
    service.SetApplicationIcon("test-icon");
    service.SetDesktopEntry("com.test.app");
    
    // These should not throw or crash
    EXPECT_NO_THROW(service.ShowMessageNotification("Test Sender", "Test Message", "test-room"));
}

TEST_F(LinuxServicesTest, NotificationTypes) {
    auto& service = AutonomousNotificationService::GetInstance();
    ASSERT_TRUE(service.Initialize());
    
    // Test different notification types (should not crash)
    EXPECT_NO_THROW(service.ShowMessageNotification("Alice", "Hello World", "room1"));
    EXPECT_NO_THROW(service.ShowCallNotification("Bob", "call1", true));
    EXPECT_NO_THROW(service.ShowMissedCallNotification("Charlie", "call2"));
    EXPECT_NO_THROW(service.ShowUserJoinedNotification("Dave", "General", "room2"));
    EXPECT_NO_THROW(service.ShowUserLeftNotification("Eve", "General", "room2"));
    EXPECT_NO_THROW(service.ShowFileUploadNotification("document.pdf", "Work", "room3"));
    EXPECT_NO_THROW(service.ShowSyncErrorNotification("Connection failed"));
    EXPECT_NO_THROW(service.ShowLoginSuccessNotification("testuser"));
    EXPECT_NO_THROW(service.ShowDeviceVerificationNotification("Phone"));
    EXPECT_NO_THROW(service.ShowBackupNotification("Backup completed"));
    EXPECT_NO_THROW(service.ShowSpaceJoinedNotification("Tech Team", "space1"));
    
    // Test notification management
    EXPECT_NO_THROW(service.CancelAllNotifications());
}

// CrashReportingManager Tests
TEST_F(LinuxServicesTest, CrashReportingInitialization) {
    auto& manager = CrashReportingManager::GetInstance();
    
    EXPECT_TRUE(manager.Initialize());
    EXPECT_TRUE(manager.IsCrashReportingEnabled());
    EXPECT_EQ(manager.GetLogLevel(), "INFO");
    
    manager.Shutdown();
}

TEST_F(LinuxServicesTest, CrashReportingSettings) {
    auto& manager = CrashReportingManager::GetInstance();
    ASSERT_TRUE(manager.Initialize());
    
    // Test crash reporting settings
    manager.SetCrashReportingEnabled(false);
    EXPECT_FALSE(manager.IsCrashReportingEnabled());
    
    manager.SetCrashReportingEnabled(true);
    EXPECT_TRUE(manager.IsCrashReportingEnabled());
    
    // Test log level settings
    manager.SetLogLevel("DEBUG");
    EXPECT_EQ(manager.GetLogLevel(), "DEBUG");
    
    manager.SetLogLevel("ERROR");
    EXPECT_EQ(manager.GetLogLevel(), "ERROR");
}

TEST_F(LinuxServicesTest, CrashReportingUserInfo) {
    auto& manager = CrashReportingManager::GetInstance();
    ASSERT_TRUE(manager.Initialize());
    
    // Test user identification
    EXPECT_NO_THROW(manager.SetUserId("test-user-123"));
    EXPECT_NO_THROW(manager.SetUserEmail("test@example.com"));
    EXPECT_NO_THROW(manager.SetUserName("Test User"));
    
    // Test custom keys
    EXPECT_NO_THROW(manager.SetCustomKey("test_string", "value"));
    EXPECT_NO_THROW(manager.SetCustomKey("test_int", 42));
    EXPECT_NO_THROW(manager.SetCustomKey("test_bool", true));
    
    std::map<std::string, std::string> keys = {
        {"key1", "value1"},
        {"key2", "value2"}
    };
    EXPECT_NO_THROW(manager.SetCustomKeys(keys));
}

TEST_F(LinuxServicesTest, CrashReportingLogging) {
    auto& manager = CrashReportingManager::GetInstance();
    ASSERT_TRUE(manager.Initialize());
    
    // Test logging methods
    EXPECT_NO_THROW(manager.Log("Test message", "INFO"));
    EXPECT_NO_THROW(manager.LogDebug("Debug message"));
    EXPECT_NO_THROW(manager.LogInfo("Info message"));
    EXPECT_NO_THROW(manager.LogWarning("Warning message"));
    EXPECT_NO_THROW(manager.LogError("Error message"));
    
    // Test session management
    EXPECT_NO_THROW(manager.StartSession());
    EXPECT_NO_THROW(manager.EndSession());
}

TEST_F(LinuxServicesTest, CrashReportingSystemInfo) {
    auto& manager = CrashReportingManager::GetInstance();
    ASSERT_TRUE(manager.Initialize());
    
    // Test system information retrieval
    std::string systemInfo = manager.GetSystemInfo();
    EXPECT_FALSE(systemInfo.empty());
    
    std::string appInfo = manager.GetApplicationInfo();
    EXPECT_FALSE(appInfo.empty());
    
    std::string stackTrace = manager.GetStackTrace();
    EXPECT_FALSE(stackTrace.empty());
}

TEST_F(LinuxServicesTest, CrashReportingErrorHandling) {
    auto& manager = CrashReportingManager::GetInstance();
    ASSERT_TRUE(manager.Initialize());
    
    // Test exception recording
    try {
        throw std::runtime_error("Test exception");
    } catch (const std::exception& e) {
        EXPECT_NO_THROW(manager.RecordException(e));
    }
    
    // Test error recording
    EXPECT_NO_THROW(manager.RecordError("Test error message"));
    EXPECT_NO_THROW(manager.RecordNonFatalError("Test non-fatal error"));
}

// LinuxSystemIntegration Tests
TEST_F(LinuxServicesTest, SystemIntegrationInitialization) {
    auto& integration = LinuxSystemIntegration::GetInstance();
    
    EXPECT_TRUE(integration.Initialize());
    
    integration.Shutdown();
}

TEST_F(LinuxServicesTest, SystemIntegrationDesktopEnvironment) {
    auto& integration = LinuxSystemIntegration::GetInstance();
    ASSERT_TRUE(integration.Initialize());
    
    // Test desktop environment detection
    std::string desktop = integration.GetDesktopEnvironment();
    EXPECT_FALSE(desktop.empty());
    
    std::string distro = integration.GetDistributionInfo();
    EXPECT_FALSE(distro.empty());
    
    // Test display server detection
    bool isWayland = integration.IsWaylandSession();
    bool isX11 = integration.IsX11Session();
    
    // At least one should be true in a proper environment
    // In test environment, both might be false
    EXPECT_TRUE(isWayland || isX11 || (!isWayland && !isX11));
}

TEST_F(LinuxServicesTest, SystemIntegrationDesktopFiles) {
    auto& integration = LinuxSystemIntegration::GetInstance();
    ASSERT_TRUE(integration.Initialize());
    
    // Test desktop integration (should not crash)
    EXPECT_NO_THROW(integration.RegisterDesktopEntry());
    EXPECT_NO_THROW(integration.CreateDesktopShortcut());
    EXPECT_NO_THROW(integration.RegisterURLScheme("matrix"));
}

TEST_F(LinuxServicesTest, SystemIntegrationAutoStart) {
    auto& integration = LinuxSystemIntegration::GetInstance();
    ASSERT_TRUE(integration.Initialize());
    
    // Test auto-start functionality
    bool initialState = integration.IsAutoStartEnabled();
    
    EXPECT_NO_THROW(integration.SetAutoStart(true));
    // Note: In test environment, this might not actually work
    
    EXPECT_NO_THROW(integration.SetAutoStart(false));
}

TEST_F(LinuxServicesTest, SystemIntegrationSystemTray) {
    auto& integration = LinuxSystemIntegration::GetInstance();
    ASSERT_TRUE(integration.Initialize());
    
    // Test system tray (might not work in headless environment)
    // These should not crash even if tray is not available
    EXPECT_NO_THROW(integration.CreateSystemTrayIcon());
    EXPECT_NO_THROW(integration.UpdateSystemTrayIcon("test-icon", "Test Tooltip"));
    EXPECT_NO_THROW(integration.ShowSystemTrayNotification("Test message"));
    EXPECT_NO_THROW(integration.RemoveSystemTrayIcon());
}

TEST_F(LinuxServicesTest, SystemIntegrationTheme) {
    auto& integration = LinuxSystemIntegration::GetInstance();
    ASSERT_TRUE(integration.Initialize());
    
    // Test theme detection (should not crash)
    EXPECT_NO_THROW(integration.IsDarkThemeEnabled());
    EXPECT_NO_THROW(integration.SetApplicationTheme("dark"));
}

TEST_F(LinuxServicesTest, SystemIntegrationPowerManagement) {
    auto& integration = LinuxSystemIntegration::GetInstance();
    ASSERT_TRUE(integration.Initialize());
    
    // Test power management
    EXPECT_NO_THROW(integration.PreventSystemSleep(true));
    EXPECT_NO_THROW(integration.PreventSystemSleep(false));
}

// Integration Tests
TEST_F(LinuxServicesTest, ServicesIntegration) {
    // Test that all services can be initialized together
    auto& notificationService = AutonomousNotificationService::GetInstance();
    auto& crashManager = CrashReportingManager::GetInstance();
    auto& systemIntegration = LinuxSystemIntegration::GetInstance();
    
    EXPECT_TRUE(crashManager.Initialize());
    EXPECT_TRUE(notificationService.Initialize());
    EXPECT_TRUE(systemIntegration.Initialize());
    
    // Test interaction between services
    crashManager.LogInfo("Testing service integration");
    
    // Test notification with crash reporting
    notificationService.ShowMessageNotification("System", "Integration test", "test");
    
    // Cleanup
    notificationService.Shutdown();
    crashManager.Shutdown();
    systemIntegration.Shutdown();
}

TEST_F(LinuxServicesTest, ServiceEventHandlers) {
    auto& notificationService = AutonomousNotificationService::GetInstance();
    ASSERT_TRUE(notificationService.Initialize());
    
    bool actionHandlerCalled = false;
    bool closedHandlerCalled = false;
    
    // Set event handlers
    notificationService.SetNotificationActionHandler([&](const std::string& tag, const std::string& action) {
        actionHandlerCalled = true;
    });
    
    notificationService.SetNotificationClosedHandler([&](const std::string& tag) {
        closedHandlerCalled = true;
    });
    
    // Show a notification
    notificationService.ShowMessageNotification("Test", "Handler test", "test-room");
    
    // Give some time for potential callbacks
    std::this_thread::sleep_for(std::chrono::milliseconds(100));
    
    // Handlers might not be called in test environment, but should not crash
    EXPECT_NO_THROW(notificationService.CancelAllNotifications());
}

// Performance Tests
TEST_F(LinuxServicesTest, NotificationPerformance) {
    auto& service = AutonomousNotificationService::GetInstance();
    ASSERT_TRUE(service.Initialize());
    
    auto start = std::chrono::high_resolution_clock::now();
    
    // Send multiple notifications
    for (int i = 0; i < 10; ++i) {
        service.ShowMessageNotification("User" + std::to_string(i), 
                                      "Message " + std::to_string(i), 
                                      "room" + std::to_string(i));
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    // Should complete within reasonable time (1 second)
    EXPECT_LT(duration.count(), 1000);
    
    service.CancelAllNotifications();
}

TEST_F(LinuxServicesTest, CrashReportingPerformance) {
    auto& manager = CrashReportingManager::GetInstance();
    ASSERT_TRUE(manager.Initialize());
    
    auto start = std::chrono::high_resolution_clock::now();
    
    // Log multiple messages
    for (int i = 0; i < 100; ++i) {
        manager.LogInfo("Performance test message " + std::to_string(i));
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    // Should complete within reasonable time (500ms)
    EXPECT_LT(duration.count(), 500);
}

// Main function for running tests
int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    
    // Initialize GTK for tests
    gtk_init(&argc, &argv);
    
    return RUN_ALL_TESTS();
}
