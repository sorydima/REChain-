import Cocoa
import FlutterMacOS
import UserNotifications
import os.log

@main
class AppDelegate: FlutterAppDelegate {
  private var autonomousNotificationService: AutonomousNotificationService?
  private let logger = OSLog(subsystem: "com.rechain.dapp", category: "AppDelegate")
  
  override func applicationDidFinishLaunching(_ notification: Notification) {
    super.applicationDidFinishLaunching(notification)
    
    // Initialize logging
    os_log("REChain macOS App launching...", log: logger, type: .info)
    
    // Initialize autonomous notification service
    autonomousNotificationService = AutonomousNotificationService()
    
    // Initialize crash reporting
    CrashReportingManager.shared.initialize(enableInDebug: false)
    
    // Log build info
    BuildConfigHelper.logBuildInfo()
    
    // Set crash reporting context
    let versionInfo = BuildConfigHelper.getVersionInfo()
    let deviceInfo = BuildConfigHelper.getDeviceInfo()
    
    CrashReportingManager.shared.setCustomKeys([
      "version_name": versionInfo.versionName,
      "version_code": versionInfo.versionCode,
      "build_type": versionInfo.buildType,
      "device_model": deviceInfo.model,
      "system_version": deviceInfo.systemVersion,
      "bundle_id": versionInfo.bundleIdentifier
    ])
    
    // Setup notifications
    setupNotifications()
    
    // Setup Flutter method channels
    setupFlutterChannels()
  }
  
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
  
  private func setupNotifications() {
    UNUserNotificationCenter.current().delegate = self
    
    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound, .criticalAlert, .providesAppNotificationSettings]
    UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
      if let error = error {
        os_log("Notification authorization error: %@", log: self.logger, type: .error, error.localizedDescription)
      } else {
        os_log("Notification authorization granted: %@", log: self.logger, type: .info, String(granted))
      }
    }
  }
  
  private func setupFlutterChannels() {
    guard let window = NSApplication.shared.windows.first,
          let flutterViewController = window.contentViewController as? FlutterViewController else {
      os_log("Could not find FlutterViewController", log: logger, type: .error)
      return
    }
    
    let autonomousChannel = FlutterMethodChannel(name: "com.rechain.dapp/autonomous_notifications", binaryMessenger: flutterViewController.engine.binaryMessenger)
    
    autonomousChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      self?.handleAutonomousNotificationCall(call: call, result: result)
    }
  }
  
  private func handleAutonomousNotificationCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let service = autonomousNotificationService else {
      result(FlutterError(code: "SERVICE_NOT_INITIALIZED", message: "Autonomous notification service not initialized", details: nil))
      return
    }
    
    switch call.method {
    case "showNotification":
      if let args = call.arguments as? [String: Any],
         let type = args["type"] as? String,
         let title = args["title"] as? String,
         let message = args["message"] as? String {
        let payload = args["payload"] as? [String: Any] ?? [:]
        service.showNotification(type: type, title: title, message: message, payload: payload)
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments for showNotification", details: nil))
      }
    case "cancelNotification":
      if let args = call.arguments as? [String: Any],
         let identifier = args["identifier"] as? String {
        service.cancelNotification(identifier: identifier)
        result(nil)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments for cancelNotification", details: nil))
      }
    case "cancelAllNotifications":
      service.cancelAllNotifications()
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    if #available(macOS 11.0, *) {
      completionHandler([.banner, .sound, .badge])
    } else {
      completionHandler([.alert, .sound, .badge])
    }
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    os_log("Notification tapped: %@", log: logger, type: .info, String(describing: userInfo))
    
    // Handle notification tap
    if let roomId = userInfo["roomId"] as? String {
      // Navigate to specific room
      os_log("Navigating to room: %@", log: logger, type: .info, roomId)
    }
    
    completionHandler()
  }
}
