#include "BuildConfigHelper.h"
#include <iostream>
#include <sstream>
#include <iomanip>
#include <chrono>
#include <filesystem>
#include <psapi.h>
#include <intrin.h>

#pragma comment(lib, "psapi.lib")
#pragma comment(lib, "version.lib")

VersionInfo BuildConfigHelper::GetVersionInfo() {
    VersionInfo info;
    
    // Get version from preprocessor definitions or default values
    #ifdef FLUTTER_VERSION
    info.versionName = FLUTTER_VERSION;
    #else
    info.versionName = "1.0.0";
    #endif
    
    #ifdef FLUTTER_VERSION_BUILD
    info.versionCode = std::to_string(FLUTTER_VERSION_BUILD);
    #else
    info.versionCode = "1";
    #endif
    
    #ifdef _DEBUG
    info.buildType = "Debug";
    #else
    info.buildType = "Release";
    #endif
    
    // Get build time
    info.buildTime = std::string(__DATE__) + " " + std::string(__TIME__);
    
    // Git information (would be set by build system)
    info.gitCommit = GetEnvironmentVariable("GIT_COMMIT");
    if (info.gitCommit.empty()) {
        info.gitCommit = "unknown";
    }
    
    info.gitBranch = GetEnvironmentVariable("GIT_BRANCH");
    if (info.gitBranch.empty()) {
        info.gitBranch = "main";
    }
    
    return info;
}

DeviceInfo BuildConfigHelper::GetDeviceInfo() {
    DeviceInfo info;
    
    info.deviceName = GetComputerName();
    info.osName = "Windows";
    info.osVersion = GetOSVersion();
    info.osBuild = GetOSBuild();
    info.architecture = GetArchitecture();
    info.processorName = GetProcessorName();
    info.processorCount = GetProcessorCount();
    info.totalMemory = GetTotalMemory();
    info.availableMemory = GetAvailableMemory();
    info.computerName = GetComputerName();
    info.userName = GetUserName();
    info.systemDirectory = GetSystemDirectory();
    info.windowsDirectory = GetWindowsDirectory();
    
    return info;
}

std::string BuildConfigHelper::GetVersionName() {
    return GetVersionInfo().versionName;
}

std::string BuildConfigHelper::GetVersionCode() {
    return GetVersionInfo().versionCode;
}

std::string BuildConfigHelper::GetBuildType() {
    return GetVersionInfo().buildType;
}

std::string BuildConfigHelper::GetBuildTime() {
    return GetVersionInfo().buildTime;
}

std::string BuildConfigHelper::GetGitCommit() {
    return GetVersionInfo().gitCommit;
}

std::string BuildConfigHelper::GetGitBranch() {
    return GetVersionInfo().gitBranch;
}

std::string BuildConfigHelper::GetDeviceName() {
    return GetComputerName();
}

std::string BuildConfigHelper::GetOSName() {
    return "Windows";
}

std::string BuildConfigHelper::GetOSVersion() {
    OSVERSIONINFOEX osvi;
    ZeroMemory(&osvi, sizeof(OSVERSIONINFOEX));
    osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFOEX);
    
    if (GetVersionEx((OSVERSIONINFO*)&osvi)) {
        std::stringstream ss;
        ss << osvi.dwMajorVersion << "." << osvi.dwMinorVersion;
        return ss.str();
    }
    
    return "Unknown";
}

std::string BuildConfigHelper::GetOSBuild() {
    OSVERSIONINFOEX osvi;
    ZeroMemory(&osvi, sizeof(OSVERSIONINFOEX));
    osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFOEX);
    
    if (GetVersionEx((OSVERSIONINFO*)&osvi)) {
        return std::to_string(osvi.dwBuildNumber);
    }
    
    return "Unknown";
}

std::string BuildConfigHelper::GetArchitecture() {
    SYSTEM_INFO sysInfo;
    GetSystemInfo(&sysInfo);
    
    switch (sysInfo.wProcessorArchitecture) {
        case PROCESSOR_ARCHITECTURE_AMD64:
            return "x64";
        case PROCESSOR_ARCHITECTURE_ARM:
            return "ARM";
        case PROCESSOR_ARCHITECTURE_ARM64:
            return "ARM64";
        case PROCESSOR_ARCHITECTURE_INTEL:
            return "x86";
        default:
            return "Unknown";
    }
}

std::string BuildConfigHelper::GetProcessorName() {
    std::string processorName;
    
    // Try to get processor name from registry
    processorName = GetRegistryValue(HKEY_LOCAL_MACHINE, 
        "HARDWARE\\DESCRIPTION\\System\\CentralProcessor\\0", 
        "ProcessorNameString");
    
    if (!processorName.empty()) {
        return processorName;
    }
    
    // Fallback to CPUID
    int cpuInfo[4] = {0};
    char brand[49] = {0};
    
    __cpuid(cpuInfo, 0x80000000);
    if (cpuInfo[0] >= 0x80000004) {
        __cpuid((int*)(brand + 0), 0x80000002);
        __cpuid((int*)(brand + 16), 0x80000003);
        __cpuid((int*)(brand + 32), 0x80000004);
        
        return std::string(brand);
    }
    
    return "Unknown Processor";
}

int BuildConfigHelper::GetProcessorCount() {
    SYSTEM_INFO sysInfo;
    GetSystemInfo(&sysInfo);
    return sysInfo.dwNumberOfProcessors;
}

unsigned long long BuildConfigHelper::GetTotalMemory() {
    MEMORYSTATUSEX memInfo;
    memInfo.dwLength = sizeof(MEMORYSTATUSEX);
    
    if (GlobalMemoryStatusEx(&memInfo)) {
        return memInfo.ullTotalPhys;
    }
    
    return 0;
}

unsigned long long BuildConfigHelper::GetAvailableMemory() {
    MEMORYSTATUSEX memInfo;
    memInfo.dwLength = sizeof(MEMORYSTATUSEX);
    
    if (GlobalMemoryStatusEx(&memInfo)) {
        return memInfo.ullAvailPhys;
    }
    
    return 0;
}

std::string BuildConfigHelper::GetComputerName() {
    wchar_t computerName[MAX_COMPUTERNAME_LENGTH + 1];
    DWORD size = sizeof(computerName) / sizeof(computerName[0]);
    
    if (GetComputerNameW(computerName, &size)) {
        return WStringToString(std::wstring(computerName));
    }
    
    return "Unknown";
}

std::string BuildConfigHelper::GetUserName() {
    wchar_t userName[UNLEN + 1];
    DWORD size = sizeof(userName) / sizeof(userName[0]);
    
    if (GetUserNameW(userName, &size)) {
        return WStringToString(std::wstring(userName));
    }
    
    return "Unknown";
}

std::string BuildConfigHelper::GetSystemDirectory() {
    wchar_t systemDir[MAX_PATH];
    
    if (GetSystemDirectoryW(systemDir, MAX_PATH)) {
        return WStringToString(std::wstring(systemDir));
    }
    
    return "Unknown";
}

std::string BuildConfigHelper::GetWindowsDirectory() {
    wchar_t windowsDir[MAX_PATH];
    
    if (GetWindowsDirectoryW(windowsDir, MAX_PATH)) {
        return WStringToString(std::wstring(windowsDir));
    }
    
    return "Unknown";
}

std::string BuildConfigHelper::GetTempDirectory() {
    return std::filesystem::temp_directory_path().string();
}

std::string BuildConfigHelper::GetAppDataDirectory() {
    wchar_t* appDataPath = nullptr;
    
    if (SUCCEEDED(SHGetKnownFolderPath(FOLDERID_RoamingAppData, 0, NULL, &appDataPath))) {
        std::string result = WStringToString(std::wstring(appDataPath));
        CoTaskMemFree(appDataPath);
        return result;
    }
    
    return GetEnvironmentVariable("APPDATA");
}

void BuildConfigHelper::LogVersionInfo() {
    VersionInfo info = GetVersionInfo();
    
    std::cout << "[BuildConfigHelper] Version Information:" << std::endl;
    std::cout << "  Version Name: " << info.versionName << std::endl;
    std::cout << "  Version Code: " << info.versionCode << std::endl;
    std::cout << "  Build Type: " << info.buildType << std::endl;
    std::cout << "  Build Time: " << info.buildTime << std::endl;
    std::cout << "  Git Commit: " << info.gitCommit << std::endl;
    std::cout << "  Git Branch: " << info.gitBranch << std::endl;
}

void BuildConfigHelper::LogDeviceInfo() {
    DeviceInfo info = GetDeviceInfo();
    
    std::cout << "[BuildConfigHelper] Device Information:" << std::endl;
    std::cout << "  Device Name: " << info.deviceName << std::endl;
    std::cout << "  OS: " << info.osName << " " << info.osVersion << " (Build " << info.osBuild << ")" << std::endl;
    std::cout << "  Architecture: " << info.architecture << std::endl;
    std::cout << "  Processor: " << info.processorName << " (" << info.processorCount << " cores)" << std::endl;
    std::cout << "  Memory: " << FormatBytes(info.totalMemory) << " total, " 
              << FormatBytes(info.availableMemory) << " available" << std::endl;
    std::cout << "  Computer Name: " << info.computerName << std::endl;
    std::cout << "  User Name: " << info.userName << std::endl;
}

void BuildConfigHelper::LogSystemInfo() {
    std::cout << "[BuildConfigHelper] System Information:" << std::endl;
    std::cout << "  System Directory: " << GetSystemDirectory() << std::endl;
    std::cout << "  Windows Directory: " << GetWindowsDirectory() << std::endl;
    std::cout << "  Temp Directory: " << GetTempDirectory() << std::endl;
    std::cout << "  AppData Directory: " << GetAppDataDirectory() << std::endl;
    std::cout << "  Windows Product: " << GetWindowsProductName() << std::endl;
    std::cout << "  Windows Version: " << GetWindowsDisplayVersion() << std::endl;
}

std::map<std::string, std::string> BuildConfigHelper::GetAllInfoAsMap() {
    std::map<std::string, std::string> infoMap;
    
    VersionInfo versionInfo = GetVersionInfo();
    DeviceInfo deviceInfo = GetDeviceInfo();
    
    // Version info
    infoMap["version_name"] = versionInfo.versionName;
    infoMap["version_code"] = versionInfo.versionCode;
    infoMap["build_type"] = versionInfo.buildType;
    infoMap["build_time"] = versionInfo.buildTime;
    infoMap["git_commit"] = versionInfo.gitCommit;
    infoMap["git_branch"] = versionInfo.gitBranch;
    
    // Device info
    infoMap["device_name"] = deviceInfo.deviceName;
    infoMap["os_name"] = deviceInfo.osName;
    infoMap["os_version"] = deviceInfo.osVersion;
    infoMap["os_build"] = deviceInfo.osBuild;
    infoMap["architecture"] = deviceInfo.architecture;
    infoMap["processor_name"] = deviceInfo.processorName;
    infoMap["processor_count"] = std::to_string(deviceInfo.processorCount);
    infoMap["total_memory"] = std::to_string(deviceInfo.totalMemory);
    infoMap["available_memory"] = std::to_string(deviceInfo.availableMemory);
    infoMap["computer_name"] = deviceInfo.computerName;
    infoMap["user_name"] = deviceInfo.userName;
    
    // System directories
    infoMap["system_directory"] = GetSystemDirectory();
    infoMap["windows_directory"] = GetWindowsDirectory();
    infoMap["temp_directory"] = GetTempDirectory();
    infoMap["appdata_directory"] = GetAppDataDirectory();
    
    return infoMap;
}

std::string BuildConfigHelper::GetRegistryValue(HKEY hKey, const std::string& subKey, const std::string& valueName) {
    HKEY hSubKey;
    std::wstring wSubKey = StringToWString(subKey);
    std::wstring wValueName = StringToWString(valueName);
    
    if (RegOpenKeyExW(hKey, wSubKey.c_str(), 0, KEY_READ, &hSubKey) != ERROR_SUCCESS) {
        return "";
    }
    
    wchar_t data[1024];
    DWORD dataSize = sizeof(data);
    DWORD type;
    
    if (RegQueryValueExW(hSubKey, wValueName.c_str(), NULL, &type, (LPBYTE)data, &dataSize) == ERROR_SUCCESS) {
        RegCloseKey(hSubKey);
        if (type == REG_SZ || type == REG_EXPAND_SZ) {
            return WStringToString(std::wstring(data));
        }
    }
    
    RegCloseKey(hSubKey);
    return "";
}

std::string BuildConfigHelper::GetWindowsProductName() {
    return GetRegistryValue(HKEY_LOCAL_MACHINE, 
        "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion", 
        "ProductName");
}

std::string BuildConfigHelper::GetWindowsDisplayVersion() {
    std::string displayVersion = GetRegistryValue(HKEY_LOCAL_MACHINE, 
        "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion", 
        "DisplayVersion");
    
    if (displayVersion.empty()) {
        displayVersion = GetRegistryValue(HKEY_LOCAL_MACHINE, 
            "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion", 
            "ReleaseId");
    }
    
    return displayVersion;
}

std::string BuildConfigHelper::GetWindowsReleaseId() {
    return GetRegistryValue(HKEY_LOCAL_MACHINE, 
        "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion", 
        "ReleaseId");
}

std::string BuildConfigHelper::WStringToString(const std::wstring& wstr) {
    if (wstr.empty()) return "";
    
    int size = WideCharToMultiByte(CP_UTF8, 0, wstr.c_str(), -1, nullptr, 0, nullptr, nullptr);
    std::string result(size - 1, 0);
    WideCharToMultiByte(CP_UTF8, 0, wstr.c_str(), -1, &result[0], size, nullptr, nullptr);
    
    return result;
}

std::wstring BuildConfigHelper::StringToWString(const std::string& str) {
    if (str.empty()) return L"";
    
    int size = MultiByteToWideChar(CP_UTF8, 0, str.c_str(), -1, nullptr, 0);
    std::wstring result(size - 1, 0);
    MultiByteToWideChar(CP_UTF8, 0, str.c_str(), -1, &result[0], size);
    
    return result;
}

std::string BuildConfigHelper::GetEnvironmentVariable(const std::string& name) {
    wchar_t* value = nullptr;
    size_t size = 0;
    
    std::wstring wName = StringToWString(name);
    
    if (_wdupenv_s(&value, &size, wName.c_str()) == 0 && value != nullptr) {
        std::string result = WStringToString(std::wstring(value));
        free(value);
        return result;
    }
    
    return "";
}

std::string BuildConfigHelper::FormatBytes(unsigned long long bytes) {
    const char* units[] = {"B", "KB", "MB", "GB", "TB"};
    int unitIndex = 0;
    double size = static_cast<double>(bytes);
    
    while (size >= 1024 && unitIndex < 4) {
        size /= 1024;
        unitIndex++;
    }
    
    std::stringstream ss;
    ss << std::fixed << std::setprecision(2) << size << " " << units[unitIndex];
    
    return ss.str();
}
