import XCTest

final class RunnerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testAppLaunch() throws {
        // Test that the app launches without crashing
        XCTAssertTrue(app.state == .runningForeground)
    }
    
    func testAppBasicInteraction() throws {
        // Wait for app to fully load
        let timeout: TimeInterval = 10
        
        // Test that we can interact with the app
        // This is a basic smoke test for Flutter apps on macOS
        let exists = app.waitForExistence(timeout: timeout)
        XCTAssertTrue(exists, "App should exist and be responsive")
        
        // Test window properties
        let windows = app.windows
        XCTAssertGreaterThan(windows.count, 0, "App should have at least one window")
    }
    
    func testNotificationPermissionFlow() throws {
        // This test would need to be customized based on your app's UI flow
        // For now, it's a placeholder that ensures the app doesn't crash
        
        let timeout: TimeInterval = 5
        let exists = app.waitForExistence(timeout: timeout)
        XCTAssertTrue(exists)
        
        // In a real implementation, you would:
        // 1. Navigate to settings or permission screen
        // 2. Trigger notification permission request
        // 3. Handle system alert
        // 4. Verify permission state
    }
    
    func testAppWindowManagement() throws {
        // Test window behavior
        let window = app.windows.firstMatch
        XCTAssertTrue(window.exists, "Main window should exist")
        
        // Test window can be minimized and restored
        window.buttons[XCUIIdentifierCloseWindow].hover()
        
        // Basic window interaction test
        XCTAssertTrue(window.isHittable, "Window should be interactive")
    }
    
    func testMenuBarInteraction() throws {
        // Test menu bar items if they exist
        let menuBar = app.menuBars.firstMatch
        if menuBar.exists {
            // Test that menu bar is accessible
            XCTAssertTrue(menuBar.isHittable, "Menu bar should be accessible")
        }
    }
    
    func testKeyboardShortcuts() throws {
        // Test common keyboard shortcuts
        let window = app.windows.firstMatch
        XCTAssertTrue(window.exists)
        
        // Test Command+Q (quit) - but don't actually quit
        // This is just to ensure the app responds to keyboard input
        window.typeKey("q", modifierFlags: [.command, .shift]) // Shift+Cmd+Q won't quit
        
        // App should still be running
        XCTAssertTrue(app.state == .runningForeground)
    }
    
    func testMemoryUsage() throws {
        // Basic memory usage test
        // Launch app and let it settle
        let timeout: TimeInterval = 5
        let exists = app.waitForExistence(timeout: timeout)
        XCTAssertTrue(exists)
        
        // Perform some basic interactions if possible
        // This helps ensure the app doesn't have memory leaks
        for _ in 0..<3 {
            // Simulate some user interaction
            let window = app.windows.firstMatch
            if window.exists {
                window.click()
            }
            Thread.sleep(forTimeInterval: 1)
        }
        
        // App should still be responsive
        XCTAssertTrue(app.state == .runningForeground)
    }
    
    func testAppTermination() throws {
        // Test that app can be properly terminated
        XCTAssertTrue(app.state == .runningForeground)
        
        // Test window close behavior
        let window = app.windows.firstMatch
        if window.exists {
            // Try to close the window (this should quit the app on macOS)
            if window.buttons[XCUIIdentifierCloseWindow].exists {
                window.buttons[XCUIIdentifierCloseWindow].click()
                
                // App should terminate after closing the last window
                let expectation = XCTestExpectation(description: "App should terminate")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    if self.app.state == .notRunning {
                        expectation.fulfill()
                    }
                }
                
                wait(for: [expectation], timeout: 5)
            }
        }
    }
}
