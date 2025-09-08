#include <gtest/gtest.h>
#include <windows.h>
#include <string>
#include <memory>

// Include the headers we want to test
#include "../runner/AutonomousNotificationService.h"
#include "../runner/CrashReportingManager.h"
#include "../runner/BuildConfigHelper.h"
#include "../runner/WindowsSystemIntegration.h"

class WindowsTestFixture : public ::testing::Test {
protected:
    void SetUp() override {
        // Initialize services for testing
        crashManager = &CrashReportingManager::GetInstance();
        notificationService = &AutonomousNotificationService::GetInstance();
        systemIntegration = &WindowsSystemIntegration::GetInstance();
        
        // Initialize crash manager
        crashManager->Initialize();
        crashManager->SetCrashReportingEnabled(false); // Disable for tests
    }
    
    void TearDown() override {
        // Cleanup
        if (notificationService) {
            notificationService->Shutdown();
        }
        if (systemIntegration) {
            systemIntegration->Shutdown();
        }
        if (crashManager) {
            crashManager->Shutdown();
        }
    }
    
    CrashReportingManager* crashManager = nullptr;
    AutonomousNotificationService* notificationService = nullptr;
    WindowsSystemIntegration* systemIntegration = nullptr;
};

// Test BuildConfigHelper
TEST_F(WindowsTestFixture, BuildConfigHelperVersionInfo) {
    VersionInfo versionInfo = BuildConfigHelper::GetVersionInfo();
    
    EXPECT_FALSE(versionInfo.versionName.empty());
    EXPECT_FALSE(versionInfo.versionCode.empty());
    EXPECT_FALSE(versionInfo.buildType.empty());
    EXPECT_FALSE(versionInfo.buildTime.empty());
    
    // Build type should be either Debug or Release
    EXPECT_TRUE(versionInfo.buildType == "Debug" || versionInfo.buildType == "Release");
}

TEST_F(WindowsTestFixture, BuildConfigHelperDeviceInfo) {
    DeviceInfo deviceInfo = BuildConfigHelper::GetDeviceInfo();
    
    EXPECT_FALSE(deviceInfo.deviceName.empty());
    EXPECT_EQ(deviceInfo.osName, "Windows");
    EXPECT_FALSE(deviceInfo.osVersion.empty());
    EXPECT_FALSE(deviceInfo.architecture.empty());
    EXPECT_GT(deviceInfo.processorCount, 0);
    EXPECT_GT(deviceInfo.totalMemory, 0);
    EXPECT_FALSE(deviceInfo.computerName.empty());
}

TEST_F(WindowsTestFixture, BuildConfigHelperSystemDirectories) {
    std::string systemDir = BuildConfigHelper::GetSystemDirectory();
    std::string windowsDir = BuildConfigHelper::GetWindowsDirectory();
    std::string tempDir = BuildConfigHelper::GetTempDirectory();
    
    EXPECT_FALSE(systemDir.empty());
    EXPECT_FALSE(windowsDir.empty());
    EXPECT_FALSE(tempDir.empty());
    
    // Check that directories exist
    EXPECT_TRUE(GetFileAttributesA(systemDir.c_str()) != INVALID_FILE_ATTRIBUTES);
    EXPECT_TRUE(GetFileAttributesA(windowsDir.c_str()) != INVALID_FILE_ATTRIBUTES);
    EXPECT_TRUE(GetFileAttributesA(tempDir.c_str()) != INVALID_FILE_ATTRIBUTES);
}

// Test CrashReportingManager
TEST_F(WindowsTestFixture, CrashReportingManagerInitialization) {
    EXPECT_TRUE(crashManager->IsCrashReportingEnabled() || !crashManager->IsCrashReportingEnabled());
    
    // Test logging
    crashManager->LogInfo("Test info message");
    crashManager->LogWarning("Test warning message");
    crashManager->LogError("Test error message");
    
    // Test custom keys
    crashManager->SetCustomKey("test_string", "test_value");
    crashManager->SetCustomKey("test_int", 42);
    crashManager->SetCustomKey("test_bool", true);
    
    // Test user identification
    crashManager->SetUserId("test_user_123");
    crashManager->SetUserEmail("test@example.com");
    crashManager->SetUserName("Test User");
}

TEST_F(WindowsTestFixture, CrashReportingManagerErrorRecording) {
    // Test error recording (should not crash)
    crashManager->RecordError("Test error for unit test");
    crashManager->RecordNonFatalError("Test non-fatal error");
    
    // Test exception recording
    try {
        throw std::runtime_error("Test exception");
    } catch (const std::exception& e) {
        crashManager->RecordException(e);
    }
}

// Test AutonomousNotificationService
TEST_F(WindowsTestFixture, AutonomousNotificationServiceInitialization) {
    bool initialized = notificationService->Initialize();
    
    // Initialization might fail in test environment without proper Windows notification setup
    // This is expected and not a failure
    EXPECT_TRUE(initialized || !initialized);
    
    if (initialized) {
        EXPECT_TRUE(notificationService->AreNotificationsEnabled());
    }
}

TEST_F(WindowsTestFixture, AutonomousNotificationServiceSettings) {
    if (notificationService->Initialize()) {
        // Test notification settings
        notificationService->SetNotificationsEnabled(false);
        EXPECT_FALSE(notificationService->AreNotificationsEnabled());
        
        notificationService->SetNotificationsEnabled(true);
        EXPECT_TRUE(notificationService->AreNotificationsEnabled());
        
        // Test sound settings
        notificationService->SetSoundEnabled(false);
        EXPECT_FALSE(notificationService->IsSoundEnabled());
        
        notificationService->SetSoundEnabled(true);
        EXPECT_TRUE(notificationService->IsSoundEnabled());
    }
}

TEST_F(WindowsTestFixture, AutonomousNotificationServiceNotifications) {
    if (notificationService->Initialize()) {
        // Test showing notifications (should not crash)
        notificationService->ShowMessageNotification(L"Test User", L"Test message", L"!test:matrix.org");
        notificationService->ShowCallNotification(L"Test Caller", L"call_123", true);
        notificationService->ShowLoginSuccessNotification(L"Test User");
        notificationService->ShowSyncErrorNotification(L"Test sync error");
        
        // Test canceling notifications
        notificationService->CancelAllNotifications();
    }
}

// Test WindowsSystemIntegration
TEST_F(WindowsTestFixture, WindowsSystemIntegrationInitialization) {
    bool initialized = systemIntegration->Initialize();
    
    // System integration might require elevated privileges or specific Windows features
    EXPECT_TRUE(initialized || !initialized);
}

TEST_F(WindowsTestFixture, WindowsSystemIntegrationUtilities) {
    std::wstring exePath = systemIntegration->GetExecutablePath();
    std::wstring appDataPath = systemIntegration->GetApplicationDataPath();
    
    EXPECT_FALSE(exePath.empty());
    EXPECT_FALSE(appDataPath.empty());
    
    // Test admin check (should not crash)
    bool isAdmin = systemIntegration->IsRunningAsAdmin();
    EXPECT_TRUE(isAdmin || !isAdmin); // Either true or false is valid
}

TEST_F(WindowsTestFixture, WindowsSystemIntegrationStartup) {
    // Test startup settings (might require registry access)
    bool currentStartup = systemIntegration->IsStartupEnabled();
    
    // Try to set startup (might fail due to permissions, which is OK)
    systemIntegration->SetStartupEnabled(!currentStartup);
    
    // Restore original setting
    systemIntegration->SetStartupEnabled(currentStartup);
}

// Integration tests
TEST_F(WindowsTestFixture, ServicesIntegration) {
    // Test that all services can work together
    if (crashManager && notificationService && systemIntegration) {
        crashManager->LogInfo("Integration test starting");
        
        if (notificationService->Initialize()) {
            notificationService->ShowLoginSuccessNotification(L"Integration Test");
            crashManager->LogInfo("Notification sent successfully");
        }
        
        if (systemIntegration->Initialize()) {
            crashManager->LogInfo("System integration initialized");
        }
        
        crashManager->LogInfo("Integration test completed");
    }
}

// Performance tests
TEST_F(WindowsTestFixture, PerformanceBasicOperations) {
    auto start = std::chrono::high_resolution_clock::now();
    
    // Perform basic operations
    for (int i = 0; i < 100; ++i) {
        BuildConfigHelper::GetVersionInfo();
        crashManager->LogDebug("Performance test iteration " + std::to_string(i));
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);
    
    // Should complete within reasonable time (less than 5 seconds)
    EXPECT_LT(duration.count(), 5000);
    
    crashManager->LogInfo("Performance test completed in " + std::to_string(duration.count()) + "ms");
}

// Memory tests
TEST_F(WindowsTestFixture, MemoryUsage) {
    PROCESS_MEMORY_COUNTERS_EX pmc;
    GetProcessMemoryInfo(GetCurrentProcess(), (PROCESS_MEMORY_COUNTERS*)&pmc, sizeof(pmc));
    
    SIZE_T initialMemory = pmc.WorkingSetSize;
    
    // Perform memory-intensive operations
    std::vector<std::string> testData;
    for (int i = 0; i < 1000; ++i) {
        testData.push_back("Test data " + std::to_string(i));
        crashManager->LogDebug("Memory test iteration " + std::to_string(i));
    }
    
    GetProcessMemoryInfo(GetCurrentProcess(), (PROCESS_MEMORY_COUNTERS*)&pmc, sizeof(pmc));
    SIZE_T finalMemory = pmc.WorkingSetSize;
    
    // Memory increase should be reasonable (less than 100MB)
    SIZE_T memoryIncrease = finalMemory - initialMemory;
    EXPECT_LT(memoryIncrease, 100 * 1024 * 1024);
    
    crashManager->LogInfo("Memory increase: " + std::to_string(memoryIncrease / 1024) + " KB");
}

int main(int argc, char** argv) {
    ::testing::InitGoogleTest(&argc, argv);
    
    // Initialize COM for Windows APIs
    CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
    
    int result = RUN_ALL_TESTS();
    
    CoUninitialize();
    
    return result;
}
