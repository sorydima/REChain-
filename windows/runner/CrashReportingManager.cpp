#include "CrashReportingManager.h"
#include <iostream>
#include <sstream>
#include <iomanip>
#include <chrono>
#include <filesystem>
#include <fstream>
#include <thread>
#include <psapi.h>
#include <dbghelp.h>

#pragma comment(lib, "dbghelp.lib")
#pragma comment(lib, "psapi.lib")

CrashReportingManager* CrashReportingManager::s_instance = nullptr;

CrashReportingManager& CrashReportingManager::GetInstance() {
    static CrashReportingManager instance;
    return instance;
}

bool CrashReportingManager::Initialize() {
    if (m_initialized) {
        return true;
    }
    
    try {
        s_instance = this;
        
        // Create logs directory
        std::filesystem::path appDataPath = std::filesystem::temp_directory_path() / "REChain" / "logs";
        std::filesystem::create_directories(appDataPath);
        
        m_logFilePath = (appDataPath / "rechain.log").string();
        m_crashReportPath = (appDataPath / "crashes").string();
        
        std::filesystem::create_directories(m_crashReportPath);
        
        // Open log file
        m_logFile.open(m_logFilePath, std::ios::app);
        if (!m_logFile.is_open()) {
            std::cerr << "[CrashReportingManager] Failed to open log file: " << m_logFilePath << std::endl;
            return false;
        }
        
        // Setup exception handler
        SetupExceptionHandler();
        
        // Set default custom keys
        SetCustomKey("app_name", "REChain");
        SetCustomKey("platform", "Windows");
        SetCustomKey("architecture", sizeof(void*) == 8 ? "x64" : "x86");
        
        m_initialized = true;
        
        Log("CrashReportingManager initialized successfully", "INFO");
        return true;
    }
    catch (const std::exception& e) {
        std::cerr << "[CrashReportingManager] Failed to initialize: " << e.what() << std::endl;
        return false;
    }
}

void CrashReportingManager::Shutdown() {
    if (!m_initialized) {
        return;
    }
    
    try {
        Log("CrashReportingManager shutting down", "INFO");
        
        CleanupExceptionHandler();
        
        if (m_logFile.is_open()) {
            m_logFile.close();
        }
        
        m_initialized = false;
        s_instance = nullptr;
        
    }
    catch (const std::exception& e) {
        std::cerr << "[CrashReportingManager] Error during shutdown: " << e.what() << std::endl;
    }
}

void CrashReportingManager::RecordException(const std::exception& exception, const std::map<std::string, std::string>& context) {
    if (!m_initialized || !m_crashReportingEnabled) return;
    
    std::map<std::string, std::string> fullContext = context;
    fullContext["exception_type"] = typeid(exception).name();
    fullContext["exception_what"] = exception.what();
    
    WriteCrashReport("Exception", exception.what(), fullContext);
    LogError("Exception recorded: " + std::string(exception.what()));
}

void CrashReportingManager::RecordError(const std::string& error, const std::map<std::string, std::string>& context) {
    if (!m_initialized || !m_crashReportingEnabled) return;
    
    WriteCrashReport("Error", error, context);
    LogError("Error recorded: " + error);
}

void CrashReportingManager::RecordNonFatalError(const std::string& error, const std::map<std::string, std::string>& context) {
    if (!m_initialized || !m_crashReportingEnabled) return;
    
    WriteCrashReport("NonFatalError", error, context);
    LogWarning("Non-fatal error recorded: " + error);
}

void CrashReportingManager::Log(const std::string& message, const std::string& level) {
    if (!m_initialized) return;
    
    // Check log level
    if (level == "DEBUG" && m_logLevel != "DEBUG") return;
    if (level == "INFO" && (m_logLevel == "WARNING" || m_logLevel == "ERROR")) return;
    if (level == "WARNING" && m_logLevel == "ERROR") return;
    
    WriteToLogFile(message, level);
}

void CrashReportingManager::LogDebug(const std::string& message) {
    Log(message, "DEBUG");
}

void CrashReportingManager::LogInfo(const std::string& message) {
    Log(message, "INFO");
}

void CrashReportingManager::LogWarning(const std::string& message) {
    Log(message, "WARNING");
}

void CrashReportingManager::LogError(const std::string& message) {
    Log(message, "ERROR");
}

void CrashReportingManager::SetUserId(const std::string& userId) {
    m_userId = userId;
    SetCustomKey("user_id", userId);
    LogInfo("User ID set: " + userId);
}

void CrashReportingManager::SetUserEmail(const std::string& email) {
    m_userEmail = email;
    SetCustomKey("user_email", email);
    LogInfo("User email set");
}

void CrashReportingManager::SetUserName(const std::string& name) {
    m_userName = name;
    SetCustomKey("user_name", name);
    LogInfo("User name set: " + name);
}

void CrashReportingManager::SetCustomKey(const std::string& key, const std::string& value) {
    m_customKeys[key] = value;
    LogDebug("Custom key set: " + key + " = " + value);
}

void CrashReportingManager::SetCustomKey(const std::string& key, int value) {
    SetCustomKey(key, std::to_string(value));
}

void CrashReportingManager::SetCustomKey(const std::string& key, bool value) {
    SetCustomKey(key, value ? "true" : "false");
}

void CrashReportingManager::SetCustomKeys(const std::map<std::string, std::string>& keys) {
    for (const auto& pair : keys) {
        m_customKeys[pair.first] = pair.second;
    }
    LogDebug("Multiple custom keys set");
}

void CrashReportingManager::StartSession() {
    LogInfo("Session started");
    SetCustomKey("session_start", GetTimestamp());
}

void CrashReportingManager::EndSession() {
    LogInfo("Session ended");
    SetCustomKey("session_end", GetTimestamp());
}

void CrashReportingManager::SetCrashReportingEnabled(bool enabled) {
    m_crashReportingEnabled = enabled;
    LogInfo("Crash reporting " + std::string(enabled ? "enabled" : "disabled"));
}

bool CrashReportingManager::IsCrashReportingEnabled() const {
    return m_crashReportingEnabled;
}

void CrashReportingManager::SetLogLevel(const std::string& level) {
    m_logLevel = level;
    LogInfo("Log level set to: " + level);
}

std::string CrashReportingManager::GetLogLevel() const {
    return m_logLevel;
}

void CrashReportingManager::WriteToLogFile(const std::string& message, const std::string& level) {
    std::lock_guard<std::mutex> lock(m_logMutex);
    
    if (!m_logFile.is_open()) return;
    
    std::string timestamp = GetTimestamp();
    std::string threadId = std::to_string(std::hash<std::thread::id>{}(std::this_thread::get_id()));
    
    m_logFile << "[" << timestamp << "] [" << level << "] [Thread:" << threadId << "] " << message << std::endl;
    m_logFile.flush();
    
    // Also output to console in debug builds
    #ifdef _DEBUG
    std::cout << "[" << timestamp << "] [" << level << "] " << message << std::endl;
    #endif
}

void CrashReportingManager::WriteCrashReport(const std::string& type, const std::string& message, 
                                           const std::map<std::string, std::string>& context) {
    try {
        std::string crashId = GenerateCrashId();
        std::string crashFile = m_crashReportPath + "/" + crashId + ".txt";
        
        std::ofstream file(crashFile);
        if (!file.is_open()) {
            LogError("Failed to create crash report file: " + crashFile);
            return;
        }
        
        file << "=== REChain Crash Report ===" << std::endl;
        file << "Crash ID: " << crashId << std::endl;
        file << "Timestamp: " << GetTimestamp() << std::endl;
        file << "Type: " << type << std::endl;
        file << "Message: " << message << std::endl;
        file << std::endl;
        
        file << "=== System Information ===" << std::endl;
        file << GetSystemInfo() << std::endl;
        
        file << "=== Application Information ===" << std::endl;
        file << GetApplicationInfo() << std::endl;
        
        file << "=== Custom Keys ===" << std::endl;
        for (const auto& pair : m_customKeys) {
            file << pair.first << ": " << pair.second << std::endl;
        }
        file << std::endl;
        
        file << "=== Context ===" << std::endl;
        for (const auto& pair : context) {
            file << pair.first << ": " << pair.second << std::endl;
        }
        file << std::endl;
        
        file.close();
        
        LogInfo("Crash report written: " + crashFile);
        
    }
    catch (const std::exception& e) {
        LogError("Failed to write crash report: " + std::string(e.what()));
    }
}

std::string CrashReportingManager::GetTimestamp() {
    auto now = std::chrono::system_clock::now();
    auto time_t = std::chrono::system_clock::to_time_t(now);
    auto ms = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()) % 1000;
    
    std::stringstream ss;
    ss << std::put_time(std::localtime(&time_t), "%Y-%m-%d %H:%M:%S");
    ss << "." << std::setfill('0') << std::setw(3) << ms.count();
    
    return ss.str();
}

std::string CrashReportingManager::GetSystemInfo() {
    std::stringstream info;
    
    // Windows version
    OSVERSIONINFOEX osvi;
    ZeroMemory(&osvi, sizeof(OSVERSIONINFOEX));
    osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFOEX);
    
    if (GetVersionEx((OSVERSIONINFO*)&osvi)) {
        info << "OS Version: " << osvi.dwMajorVersion << "." << osvi.dwMinorVersion 
             << " Build " << osvi.dwBuildNumber << std::endl;
    }
    
    // System info
    SYSTEM_INFO sysInfo;
    GetSystemInfo(&sysInfo);
    info << "Processor Architecture: " << sysInfo.wProcessorArchitecture << std::endl;
    info << "Number of Processors: " << sysInfo.dwNumberOfProcessors << std::endl;
    info << "Page Size: " << sysInfo.dwPageSize << std::endl;
    
    // Memory info
    MEMORYSTATUSEX memInfo;
    memInfo.dwLength = sizeof(MEMORYSTATUSEX);
    if (GlobalMemoryStatusEx(&memInfo)) {
        info << "Total Physical Memory: " << (memInfo.ullTotalPhys / 1024 / 1024) << " MB" << std::endl;
        info << "Available Physical Memory: " << (memInfo.ullAvailPhys / 1024 / 1024) << " MB" << std::endl;
        info << "Memory Load: " << memInfo.dwMemoryLoad << "%" << std::endl;
    }
    
    return info.str();
}

std::string CrashReportingManager::GetApplicationInfo() {
    std::stringstream info;
    
    // Process info
    HANDLE process = GetCurrentProcess();
    PROCESS_MEMORY_COUNTERS_EX pmc;
    if (GetProcessMemoryInfo(process, (PROCESS_MEMORY_COUNTERS*)&pmc, sizeof(pmc))) {
        info << "Working Set Size: " << (pmc.WorkingSetSize / 1024 / 1024) << " MB" << std::endl;
        info << "Private Usage: " << (pmc.PrivateUsage / 1024 / 1024) << " MB" << std::endl;
    }
    
    // Module info
    wchar_t modulePath[MAX_PATH];
    if (GetModuleFileNameW(NULL, modulePath, MAX_PATH)) {
        std::wstring wpath(modulePath);
        std::string path(wpath.begin(), wpath.end());
        info << "Module Path: " << path << std::endl;
    }
    
    // Process ID and thread ID
    info << "Process ID: " << GetCurrentProcessId() << std::endl;
    info << "Thread ID: " << GetCurrentThreadId() << std::endl;
    
    return info.str();
}

std::string CrashReportingManager::GenerateCrashId() {
    auto now = std::chrono::system_clock::now();
    auto timestamp = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count();
    
    std::stringstream id;
    id << "crash_" << timestamp << "_" << GetCurrentProcessId();
    
    return id.str();
}

void CrashReportingManager::SetupExceptionHandler() {
    m_previousExceptionFilter = SetUnhandledExceptionFilter(UnhandledExceptionFilter);
    LogDebug("Exception handler setup completed");
}

void CrashReportingManager::CleanupExceptionHandler() {
    if (m_previousExceptionFilter) {
        SetUnhandledExceptionFilter(m_previousExceptionFilter);
        m_previousExceptionFilter = nullptr;
    }
    LogDebug("Exception handler cleanup completed");
}

LONG WINAPI CrashReportingManager::UnhandledExceptionFilter(PEXCEPTION_POINTERS exceptionInfo) {
    if (!s_instance || !s_instance->m_initialized) {
        return EXCEPTION_CONTINUE_SEARCH;
    }
    
    try {
        std::map<std::string, std::string> context;
        context["exception_code"] = std::to_string(exceptionInfo->ExceptionRecord->ExceptionCode);
        context["exception_address"] = std::to_string(reinterpret_cast<uintptr_t>(exceptionInfo->ExceptionRecord->ExceptionAddress));
        context["exception_flags"] = std::to_string(exceptionInfo->ExceptionRecord->ExceptionFlags);
        
        s_instance->WriteCrashReport("UnhandledException", "Unhandled system exception", context);
        s_instance->LogError("Unhandled exception caught by crash handler");
        
        // Create minidump if possible
        std::string dumpPath = s_instance->m_crashReportPath + "/" + s_instance->GenerateCrashId() + ".dmp";
        HANDLE hFile = CreateFileA(dumpPath.c_str(), GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
        
        if (hFile != INVALID_HANDLE_VALUE) {
            MINIDUMP_EXCEPTION_INFORMATION mdei;
            mdei.ThreadId = GetCurrentThreadId();
            mdei.ExceptionPointers = exceptionInfo;
            mdei.ClientPointers = FALSE;
            
            MiniDumpWriteDump(GetCurrentProcess(), GetCurrentProcessId(), hFile, MiniDumpNormal, &mdei, NULL, NULL);
            CloseHandle(hFile);
            
            s_instance->LogInfo("Minidump created: " + dumpPath);
        }
        
    }
    catch (...) {
        // Don't throw exceptions in exception handler
    }
    
    return EXCEPTION_CONTINUE_SEARCH;
}
