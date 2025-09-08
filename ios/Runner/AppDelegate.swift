import UIKit
import Flutter
import UserNotifications
import BackgroundTasks
import os.log

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var autonomousNotificationService: AutonomousNotificationService?
  private let logger = OSLog(subsystem: "com.rechain.dapp", category: "AppDelegate")
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // Initialize logging
    os_log("REChain iOS App launching...", log: logger, type: .info)
    
    // Register Flutter plugins
    GeneratedPluginRegistrant.register(with: self)
    
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
    setupNotifications(application)
    
    // Setup background tasks
    setupBackgroundTasks()
    
    // Setup Flutter method channels
    setupFlutterChannels()
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func setupNotifications(_ application: UIApplication) {
    if #available(iOS 10.0, *) {
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
    
    application.registerForRemoteNotifications()
  }
  
  private func setupBackgroundTasks() {
    if #available(iOS 13.0, *) {
      BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.rechain.dapp.refresh", using: nil) { task in
        self.handleAppRefresh(task: task as! BGAppRefreshTask)
      }
      
      BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.rechain.dapp.processing", using: nil) { task in
        self.handleBackgroundProcessing(task: task as! BGProcessingTask)
      }
    }
  }
  
  private func setupFlutterChannels() {
    guard let controller = window?.rootViewController as? FlutterViewController else {
      return
    }
    
    let autonomousChannel = FlutterMethodChannel(name: "com.rechain.dapp/autonomous_notifications", binaryMessenger: controller.binaryMessenger)
    
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
  
  @available(iOS 13.0, *)
  private func handleAppRefresh(task: BGAppRefreshTask) {
    os_log("Handling background app refresh", log: logger, type: .info)
    
    task.expirationHandler = {
      task.setTaskCompleted(success: false)
    }
    
    // Perform background refresh work
    DispatchQueue.global(qos: .background).async {
      // Simulate background work
      Thread.sleep(forTimeInterval: 2)
      
      DispatchQueue.main.async {
        task.setTaskCompleted(success: true)
        self.scheduleBackgroundAppRefresh()
      }
    }
  }
  
  @available(iOS 13.0, *)
  private func handleBackgroundProcessing(task: BGProcessingTask) {
    os_log("Handling background processing", log: logger, type: .info)
    
    task.expirationHandler = {
      task.setTaskCompleted(success: false)
    }
    
    // Perform background processing work
    DispatchQueue.global(qos: .background).async {
      // Simulate processing work
      Thread.sleep(forTimeInterval: 5)
      
      DispatchQueue.main.async {
        task.setTaskCompleted(success: true)
      }
    }
  }
  
  override func applicationDidEnterBackground(_ application: UIApplication) {
    super.applicationDidEnterBackground(application)
    scheduleBackgroundAppRefresh()
  }
  
  private func scheduleBackgroundAppRefresh() {
    if #available(iOS 13.0, *) {
      let request = BGAppRefreshTaskRequest(identifier: "com.rechain.dapp.refresh")
      request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60) // 15 minutes
      
      do {
        try BGTaskScheduler.shared.submit(request)
        os_log("Background app refresh scheduled", log: logger, type: .info)
      } catch {
        os_log("Could not schedule app refresh: %@", log: logger, type: .error, error.localizedDescription)
      }
    }
  }
  
  // MARK: - Remote Notifications
  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    
    let tokenString = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
    os_log("Device token: %@", log: logger, type: .info, tokenString)
  }
  
  override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    super.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    os_log("Failed to register for remote notifications: %@", log: logger, type: .error, error.localizedDescription)
  }
}

// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    if #available(iOS 14.0, *) {
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