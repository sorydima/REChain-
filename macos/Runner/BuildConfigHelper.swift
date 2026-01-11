import Foundation
import Cocoa
import os.log

class BuildConfigHelper {
    private static let logger = OSLog(subsystem: "com.rechain.online", category: "BuildConfig")
    
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
        let processInfo = ProcessInfo.processInfo
        
        // Get system info
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value))!)
        }
        
        return DeviceInfo(
            model: identifier,
            systemName: "macOS",
            systemVersion: processInfo.operatingSystemVersionString,
            name: Host.current().localizedName ?? "Unknown Mac",
            identifierForVendor: getSystemUUID(),
            processorCount: processInfo.processorCount,
            physicalMemory: processInfo.physicalMemory,
            thermalState: processInfo.thermalState.description
        )
    }
    
    private static func getSystemUUID() -> String {
        let dev = IOServiceMatching("IOPlatformExpertDevice")
        let platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault, dev)
        let serialNumberAsCFString = IORegistryEntryCreateCFProperty(platformExpert, kIOPlatformUUIDKey, kCFAllocatorDefault, 0)
        IOObjectRelease(platformExpert)
        return serialNumberAsCFString?.takeUnretainedValue() as? String ?? "Unknown"
    }
    
    static func logBuildInfo() {
        let versionInfo = getVersionInfo()
        let deviceInfo = getDeviceInfo()
        
        os_log("=== REChain macOS Build Info ===", log: logger, type: .info)
        os_log("Version: %@ (%@)", log: logger, type: .info, versionInfo.versionName, versionInfo.versionCode)
        os_log("Bundle ID: %@", log: logger, type: .info, versionInfo.bundleIdentifier)
        os_log("Build Type: %@", log: logger, type: .info, versionInfo.buildType)
        os_log("Debug: %@", log: logger, type: .info, String(versionInfo.isDebug))
        
        os_log("=== Device Info ===", log: logger, type: .info)
        os_log("Device: %@ (%@)", log: logger, type: .info, deviceInfo.model, deviceInfo.name)
        os_log("System: %@ %@", log: logger, type: .info, deviceInfo.systemName, deviceInfo.systemVersion)
        os_log("UUID: %@", log: logger, type: .info, deviceInfo.identifierForVendor)
        os_log("Processors: %d", log: logger, type: .info, deviceInfo.processorCount)
        os_log("Memory: %.2f GB", log: logger, type: .info, Double(deviceInfo.physicalMemory) / 1024.0 / 1024.0 / 1024.0)
        os_log("Thermal State: %@", log: logger, type: .info, deviceInfo.thermalState)
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
    let processorCount: Int
    let physicalMemory: UInt64
    let thermalState: String
}

extension ProcessInfo.ThermalState {
    var description: String {
        switch self {
        case .nominal: return "Nominal"
        case .fair: return "Fair"
        case .serious: return "Serious"
        case .critical: return "Critical"
        @unknown default: return "Unknown"
        }
    }
}
