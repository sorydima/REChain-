import Foundation
import FirebaseCrashlytics
import os.log

class CrashReportingManager {
    static let shared = CrashReportingManager()
    private let logger = OSLog(subsystem: "com.rechain.online", category: "CrashReporting")
    private var isInitialized = false
    
    private init() {}
    
    func initialize(enableInDebug: Bool = false) {
        #if DEBUG
        guard enableInDebug else {
            os_log("Crash reporting disabled in debug mode", log: logger, type: .info)
            return
        }
        #endif
        
        guard !isInitialized else {
            os_log("Crash reporting already initialized", log: logger, type: .warning)
            return
        }
        
        // Firebase Crashlytics is automatically initialized with Firebase
        isInitialized = true
        os_log("Crash reporting initialized", log: logger, type: .info)
        
        // Set up custom crash handler
        setupCustomCrashHandler()
    }
    
    private func setupCustomCrashHandler() {
        NSSetUncaughtExceptionHandler { exception in
            CrashReportingManager.shared.recordException(exception)
        }
    }
    
    func recordError(_ error: Error, userInfo: [String: Any]? = nil) {
        guard isInitialized else { return }
        
        let nsError = error as NSError
        Crashlytics.crashlytics().record(error: nsError, userInfo: userInfo)
        
        os_log("Error recorded: %@ - %@", log: logger, type: .error, 
               nsError.domain, nsError.localizedDescription)
    }
    
    func recordException(_ exception: NSException) {
        guard isInitialized else { return }
        
        Crashlytics.crashlytics().record(exceptionModel: ExceptionModel(
            name: exception.name.rawValue,
            reason: exception.reason ?? "Unknown reason"
        ))
        
        os_log("Exception recorded: %@ - %@", log: logger, type: .error,
               exception.name.rawValue, exception.reason ?? "Unknown")
    }
    
    func log(_ message: String, level: OSLogType = .info) {
        guard isInitialized else { return }
        
        Crashlytics.crashlytics().log(message)
        os_log("%@", log: logger, type: level, message)
    }
    
    func setUserId(_ userId: String) {
        guard isInitialized else { return }
        
        Crashlytics.crashlytics().setUserID(userId)
        os_log("User ID set: %@", log: logger, type: .info, userId)
    }
    
    func setCustomKey(_ key: String, value: Any) {
        guard isInitialized else { return }
        
        Crashlytics.crashlytics().setCustomValue(value, forKey: key)
        os_log("Custom key set: %@ = %@", log: logger, type: .debug, key, String(describing: value))
    }
    
    func setCustomKeys(_ keys: [String: Any]) {
        guard isInitialized else { return }
        
        for (key, value) in keys {
            setCustomKey(key, value: value)
        }
    }
    
    func recordNonFatalError(_ error: Error, context: [String: Any]? = nil) {
        guard isInitialized else { return }
        
        var userInfo: [String: Any] = [:]
        if let context = context {
            userInfo.merge(context) { _, new in new }
        }
        
        let nsError = error as NSError
        Crashlytics.crashlytics().record(error: nsError, userInfo: userInfo)
        
        os_log("Non-fatal error recorded: %@", log: logger, type: .error, nsError.localizedDescription)
    }
    
    func sendUnsentReports() {
        guard isInitialized else { return }
        
        Crashlytics.crashlytics().sendUnsentReports()
        os_log("Unsent reports sent", log: logger, type: .info)
    }
    
    func deleteUnsentReports() {
        guard isInitialized else { return }
        
        Crashlytics.crashlytics().deleteUnsentReports()
        os_log("Unsent reports deleted", log: logger, type: .info)
    }
    
    func didCrashOnPreviousExecution() -> Bool {
        guard isInitialized else { return false }
        
        return Crashlytics.crashlytics().didCrashDuringPreviousExecution()
    }
}
