#pragma once

#include <windows.h>
#include <string>
#include <map>

struct VersionInfo {
    std::string versionName;
    std::string versionCode;
    std::string buildType;
    std::string buildTime;
    std::string gitCommit;
    std::string gitBranch;
};

struct DeviceInfo {
    std::string deviceName;
    std::string osName;
    std::string osVersion;
    std::string osBuild;
    std::string architecture;
    std::string processorName;
    int processorCount;
    unsigned long long totalMemory;
    unsigned long long availableMemory;
    std::string computerName;
    std::string userName;
    std::string systemDirectory;
    std::string windowsDirectory;
};

class BuildConfigHelper {
public:
    // Version information
    static VersionInfo GetVersionInfo();
    static std::string GetVersionName();
    static std::string GetVersionCode();
    static std::string GetBuildType();
    static std::string GetBuildTime();
    static std::string GetGitCommit();
    static std::string GetGitBranch();
    
    // Device information
    static DeviceInfo GetDeviceInfo();
    static std::string GetDeviceName();
    static std::string GetOSName();
    static std::string GetOSVersion();
    static std::string GetOSBuild();
    static std::string GetArchitecture();
    static std::string GetProcessorName();
    static int GetProcessorCount();
    static unsigned long long GetTotalMemory();
    static unsigned long long GetAvailableMemory();
    static std::string GetComputerName();
    static std::string GetUserName();
    
    // System directories
    static std::string GetSystemDirectory();
    static std::string GetWindowsDirectory();
    static std::string GetTempDirectory();
    static std::string GetAppDataDirectory();
    
    // Utility methods
    static void LogVersionInfo();
    static void LogDeviceInfo();
    static void LogSystemInfo();
    static std::map<std::string, std::string> GetAllInfoAsMap();
    
    // Registry helpers
    static std::string GetRegistryValue(HKEY hKey, const std::string& subKey, const std::string& valueName);
    static std::string GetWindowsProductName();
    static std::string GetWindowsDisplayVersion();
    static std::string GetWindowsReleaseId();
    
private:
    BuildConfigHelper() = default;
    ~BuildConfigHelper() = default;
    
    // Prevent copying
    BuildConfigHelper(const BuildConfigHelper&) = delete;
    BuildConfigHelper& operator=(const BuildConfigHelper&) = delete;
    
    // Internal helper methods
    static std::string WStringToString(const std::wstring& wstr);
    static std::wstring StringToWString(const std::string& str);
    static std::string GetEnvironmentVariable(const std::string& name);
    static std::string FormatBytes(unsigned long long bytes);
};
