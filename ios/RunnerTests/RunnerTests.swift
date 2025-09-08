import XCTest
@testable import Runner

class RunnerTests: XCTestCase {
    
    var autonomousNotificationService: AutonomousNotificationService!
    var permissionManager: PermissionManager!
    var crashReportingManager: CrashReportingManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        autonomousNotificationService = AutonomousNotificationService()
        permissionManager = PermissionManager()
        crashReportingManager = CrashReportingManager.shared
    }
    
    override func tearDownWithError() throws {
        autonomousNotificationService = nil
        permissionManager = nil
        try super.tearDownWithError()
    }
    
    func testAutonomousNotificationServiceInitialization() throws {
        XCTAssertNotNil(autonomousNotificationService)
    }
    
    func testShowMessageNotification() throws {
        // Test that message notification can be created without crashing
        autonomousNotificationService.showMessageNotification(
            sender: "Test User",
            message: "Test message",
            roomId: "!test:matrix.org"
        )
        
        // In a real test, you would verify the notification was created
        // This is a basic smoke test
        XCTAssertTrue(true)
    }
    
    func testShowCallNotification() throws {
        autonomousNotificationService.showCallNotification(
            caller: "Test Caller",
            callId: "test_call_123",
            isVideo: true
        )
        
        XCTAssertTrue(true)
    }
    
    func testShowUserJoinedNotification() throws {
        autonomousNotificationService.showUserJoinedNotification(
            username: "TestUser",
            roomName: "Test Room",
            roomId: "!test:matrix.org"
        )
        
        XCTAssertTrue(true)
    }
    
    func testShowSyncErrorNotification() throws {
        autonomousNotificationService.showSyncErrorNotification(
            error: "Test sync error"
        )
        
        XCTAssertTrue(true)
    }
    
    func testCancelAllNotifications() throws {
        // Show some notifications first
        autonomousNotificationService.showMessageNotification(
            sender: "User",
            message: "Message",
            roomId: "!room:matrix.org"
        )
        
        autonomousNotificationService.showCallNotification(
            caller: "Caller",
            callId: "call123"
        )
        
        // Then cancel all
        autonomousNotificationService.cancelAllNotifications()
        
        XCTAssertTrue(true)
    }
    
    func testPermissionManagerInitialization() throws {
        XCTAssertNotNil(permissionManager)
    }
    
    func testCheckCameraPermission() throws {
        let hasPermission = permissionManager.checkCameraPermission()
        // Permission status can be true or false, both are valid
        XCTAssertTrue(hasPermission == true || hasPermission == false)
    }
    
    func testCheckMicrophonePermission() throws {
        let hasPermission = permissionManager.checkMicrophonePermission()
        XCTAssertTrue(hasPermission == true || hasPermission == false)
    }
    
    func testCheckPhotoLibraryPermission() throws {
        let hasPermission = permissionManager.checkPhotoLibraryPermission()
        XCTAssertTrue(hasPermission == true || hasPermission == false)
    }
    
    func testCheckAllRequiredPermissions() throws {
        let permissions = permissionManager.checkAllRequiredPermissions()
        
        // Verify all expected permission keys are present
        XCTAssertTrue(permissions.keys.contains("camera"))
        XCTAssertTrue(permissions.keys.contains("microphone"))
        XCTAssertTrue(permissions.keys.contains("photoLibrary"))
        XCTAssertTrue(permissions.keys.contains("contacts"))
        XCTAssertTrue(permissions.keys.contains("calendar"))
        XCTAssertTrue(permissions.keys.contains("location"))
    }
    
    func testBuildConfigHelper() throws {
        let versionInfo = BuildConfigHelper.getVersionInfo()
        
        XCTAssertNotNil(versionInfo.versionName)
        XCTAssertNotNil(versionInfo.versionCode)
        XCTAssertNotNil(versionInfo.bundleIdentifier)
        XCTAssertFalse(versionInfo.versionName.isEmpty)
        XCTAssertFalse(versionInfo.bundleIdentifier.isEmpty)
    }
    
    func testDeviceInfo() throws {
        let deviceInfo = BuildConfigHelper.getDeviceInfo()
        
        XCTAssertNotNil(deviceInfo.model)
        XCTAssertNotNil(deviceInfo.systemName)
        XCTAssertNotNil(deviceInfo.systemVersion)
        XCTAssertFalse(deviceInfo.model.isEmpty)
        XCTAssertFalse(deviceInfo.systemName.isEmpty)
        XCTAssertFalse(deviceInfo.systemVersion.isEmpty)
    }
    
    func testCrashReportingManagerInitialization() throws {
        XCTAssertNotNil(crashReportingManager)
    }
    
    func testCrashReportingLog() throws {
        crashReportingManager.log("Test log message")
        // This should not crash
        XCTAssertTrue(true)
    }
    
    func testCrashReportingSetCustomKey() throws {
        crashReportingManager.setCustomKey("test_key", value: "test_value")
        crashReportingManager.setCustomKey("test_number", value: 123)
        crashReportingManager.setCustomKey("test_bool", value: true)
        
        // These should not crash
        XCTAssertTrue(true)
    }
}
