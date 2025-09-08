import Foundation
import UIKit
import os.log

class BuildConfigHelper {
    private static let logger = OSLog(subsystem: "com.rechain.dapp", category: "BuildConfig")
    
    static func getVersionInfo() -> VersionInfo {
        guard let infoPlist = Bundle.main.infoDictionary else {
            os_log("Failed to get info dictionary", log: logger, type: .error)
            return VersionInfo(
                versionName: "Unknown",
                versionCode: "0",
                bundleIdentifier: Bundle.main.bundleIdentifier ?? "unknown",
                isDebug: isDebugBuild(),
                buildType: isDebugBuild() ? "debug" : "release"
            )
        }
        
        let versionName = infoPlist["CFBundleShortVersionString"] as? String ?? "Unknown"
        let versionCode = infoPlist["CFBundleVersion"] as? String ?? "0"
        let bundleIdentifier = infoPlist["CFBundleIdentifier"] as? String ?? "unknown"
        
        return VersionInfo(
            versionName: versionName,
            versionCode: versionCode,
            bundleIdentifier: bundleIdentifier,
            isDebug: isDebugBuild(),
            buildType: isDebugBuild() ? "debug" : "release"
        )
    }
    
    static func getDeviceInfo() -> DeviceInfo {
        let device = UIDevice.current
        
        return DeviceInfo(
            model: device.model,
            systemName: device.systemName,
            systemVersion: device.systemVersion,
            name: device.name,
            identifierForVendor: device.identifierForVendor?.uuidString ?? "unknown",
            userInterfaceIdiom: device.userInterfaceIdiom.description,
            batteryLevel: device.batteryLevel,
            batteryState: device.batteryState.description
        )
    }
    
    static func logBuildInfo() {
        let versionInfo = getVersionInfo()
        let deviceInfo = getDeviceInfo()
        
        os_log("=== REChain iOS Build Info ===", log: logger, type: .info)
        os_log("Version: %@ (%@)", log: logger, type: .info, versionInfo.versionName, versionInfo.versionCode)
        os_log("Bundle ID: %@", log: logger, type: .info, versionInfo.bundleIdentifier)
        os_log("Build Type: %@", log: logger, type: .info, versionInfo.buildType)
        os_log("Debug: %@", log: logger, type: .info, String(versionInfo.isDebug))
        
        os_log("=== Device Info ===", log: logger, type: .info)
        os_log("Device: %@ %@", log: logger, type: .info, deviceInfo.model, deviceInfo.name)
        os_log("iOS: %@ %@", log: logger, type: .info, deviceInfo.systemName, deviceInfo.systemVersion)
        os_log("Vendor ID: %@", log: logger, type: .info, deviceInfo.identifierForVendor)
        os_log("Interface: %@", log: logger, type: .info, deviceInfo.userInterfaceIdiom)
        
        if deviceInfo.batteryLevel >= 0 {
            os_log("Battery: %.0f%% (%@)", log: logger, type: .info, deviceInfo.batteryLevel * 100, deviceInfo.batteryState)
        }
    }
    
    private static func isDebugBuild() -> Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}

struct VersionInfo {
    let versionName: String
    let versionCode: String
    let bundleIdentifier: String
    let isDebug: Bool
    let buildType: String
}

struct DeviceInfo {
    let model: String
    let systemName: String
    let systemVersion: String
    let name: String
    let identifierForVendor: String
    let userInterfaceIdiom: String
    let batteryLevel: Float
    let batteryState: String
}

extension UIUserInterfaceIdiom {
    var description: String {
        switch self {
        case .phone: return "iPhone"
        case .pad: return "iPad"
        case .tv: return "Apple TV"
        case .carPlay: return "CarPlay"
        case .mac: return "Mac"
        case .vision: return "Vision Pro"
        default: return "Unknown"
        }
    }
}

extension UIDevice.BatteryState {
    var description: String {
        switch self {
        case .unknown: return "Unknown"
        case .unplugged: return "Unplugged"
        case .charging: return "Charging"
        case .full: return "Full"
        @unknown default: return "Unknown"
        }
    }
}
