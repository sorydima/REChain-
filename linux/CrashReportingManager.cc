#include "CrashReportingManager.h"
#include <iostream>
#include <sstream>
#include <iomanip>
#include <chrono>
#include <filesystem>
#include <fstream>
#include <thread>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <pwd.h>

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
        std::filesystem::path homeDir = getenv("HOME") ? getenv("HOME") : "/tmp";
        std::filesystem::path logDir = homeDir / ".local" / "share" / "REChain" / "logs";
        std::filesystem::create_directories(logDir);
        
        m_logFilePath = (logDir / "rechain.log").string();
        m_crashReportPath = (logDir / "crashes").string();
        
        std::filesystem::create_directories(m_crashReportPath);
        
        // Open log file
        m_logFile.open(m_logFilePath, std::ios::app);
        if (!m_logFile.is_open()) {
            std::cerr << "[CrashReportingManager] Failed to open log file: " << m_logFilePath << std::endl;
            return false;
        }
        
        // Setup signal handlers
        SetupSignalHandlers();
        
        // Set default custom keys
        SetCustomKey("app_name", "REChain");
        SetCustomKey("platform", "Linux");
        SetCustomKey("architecture", sizeof(void*) == 8 ? "x64" : "x86");
        
        // Get system info
        struct utsname unameData;
        if (uname(&unameData) == 0) {
            SetCustomKey("kernel_name", unameData.sysname);
            SetCustomKey("kernel_release", unameData.release);
            SetCustomKey("kernel_version", unameData.version);
            SetCustomKey("machine", unameData.machine);
        }
        
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
        
        CleanupSignalHandlers();
        
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
    fullContext["stack_trace"] = GetStackTrace();
    
    WriteCrashReport("Exception", exception.what(), fullContext);
    LogError("Exception recorded: " + std::string(exception.what()));
}

void CrashReportingManager::RecordError(const std::string& error, const std::map<std::string, std::string>& context) {
    if (!m_initialized || !m_crashReportingEnabled) return;
    
    std::map<std::string, std::string> fullContext = context;
    fullContext["stack_trace"] = GetStackTrace();
    
    WriteCrashReport("Error", error, fullContext);
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
    #ifdef DEBUG
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
        
        file << "=== REChain Linux Crash Report ===" << std::endl;
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
    
    // System information
    struct utsname unameData;
    if (uname(&unameData) == 0) {
        info << "System: " << unameData.sysname << std::endl;
        info << "Node: " << unameData.nodename << std::endl;
        info << "Release: " << unameData.release << std::endl;
        info << "Version: " << unameData.version << std::endl;
        info << "Machine: " << unameData.machine << std::endl;
    }
    
    // Memory information
    std::ifstream meminfo("/proc/meminfo");
    if (meminfo.is_open()) {
        std::string line;
        while (std::getline(meminfo, line)) {
            if (line.find("MemTotal:") == 0 || line.find("MemAvailable:") == 0 || line.find("MemFree:") == 0) {
                info << line << std::endl;
            }
        }
    }
    
    // CPU information
    std::ifstream cpuinfo("/proc/cpuinfo");
    if (cpuinfo.is_open()) {
        std::string line;
        while (std::getline(cpuinfo, line)) {
            if (line.find("model name") == 0) {
                info << line << std::endl;
                break;
            }
        }
    }
    
    // Distribution information
    std::ifstream osrelease("/etc/os-release");
    if (osrelease.is_open()) {
        std::string line;
        while (std::getline(osrelease, line)) {
            if (line.find("PRETTY_NAME=") == 0) {
                info << "Distribution: " << line.substr(12) << std::endl;
                break;
            }
        }
    }
    
    return info.str();
}

std::string CrashReportingManager::GetApplicationInfo() {
    std::stringstream info;
    
    // Process information
    info << "Process ID: " << getpid() << std::endl;
    info << "Parent Process ID: " << getppid() << std::endl;
    info << "User ID: " << getuid() << std::endl;
    info << "Group ID: " << getgid() << std::endl;
    
    // Working directory
    char cwd[PATH_MAX];
    if (getcwd(cwd, sizeof(cwd)) != nullptr) {
        info << "Working Directory: " << cwd << std::endl;
    }
    
    // Executable path
    char exePath[PATH_MAX];
    ssize_t len = readlink("/proc/self/exe", exePath, sizeof(exePath) - 1);
    if (len != -1) {
        exePath[len] = '\0';
        info << "Executable Path: " << exePath << std::endl;
    }
    
    // Memory usage
    std::ifstream status("/proc/self/status");
    if (status.is_open()) {
        std::string line;
        while (std::getline(status, line)) {
            if (line.find("VmRSS:") == 0 || line.find("VmSize:") == 0) {
                info << line << std::endl;
            }
        }
    }
    
    return info.str();
}

std::string CrashReportingManager::GetStackTrace() {
    std::stringstream trace;
    
    void* array[256];
    size_t size = backtrace(array, 256);
    char** strings = backtrace_symbols(array, size);
    
    if (strings != nullptr) {
        trace << "Stack trace (" << size << " frames):" << std::endl;
        for (size_t i = 0; i < size; i++) {
            trace << "  " << i << ": " << strings[i] << std::endl;
        }
        free(strings);
    } else {
        trace << "Stack trace not available" << std::endl;
    }
    
    return trace.str();
}

std::string CrashReportingManager::GenerateCrashId() {
    auto now = std::chrono::system_clock::now();
    auto timestamp = std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch()).count();
    
    std::stringstream id;
    id << "crash_" << timestamp << "_" << getpid();
    
    return id.str();
}

void CrashReportingManager::SetupSignalHandlers() {
    struct sigaction sa;
    sa.sa_sigaction = SignalHandler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = SA_SIGINFO | SA_RESTART;
    
    sigaction(SIGSEGV, &sa, &m_oldSigactionSEGV);
    sigaction(SIGABRT, &sa, &m_oldSigactionABRT);
    sigaction(SIGFPE, &sa, &m_oldSigactionFPE);
    sigaction(SIGILL, &sa, &m_oldSigactionILL);
    sigaction(SIGBUS, &sa, &m_oldSigactionBUS);
    
    LogDebug("Signal handlers setup completed");
}

void CrashReportingManager::CleanupSignalHandlers() {
    sigaction(SIGSEGV, &m_oldSigactionSEGV, nullptr);
    sigaction(SIGABRT, &m_oldSigactionABRT, nullptr);
    sigaction(SIGFPE, &m_oldSigactionFPE, nullptr);
    sigaction(SIGILL, &m_oldSigactionILL, nullptr);
    sigaction(SIGBUS, &m_oldSigactionBUS, nullptr);
    
    LogDebug("Signal handlers cleanup completed");
}

void CrashReportingManager::SignalHandler(int signal, siginfo_t* info, void* context) {
    if (s_instance && s_instance->m_initialized) {
        HandleCrash(signal, info, context);
    }
    
    // Re-raise the signal with default handler
    struct sigaction sa;
    sa.sa_handler = SIG_DFL;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;
    sigaction(signal, &sa, nullptr);
    raise(signal);
}

void CrashReportingManager::HandleCrash(int signal, siginfo_t* info, void* context) {
    if (!s_instance || !s_instance->m_initialized) {
        return;
    }
    
    try {
        std::map<std::string, std::string> crashContext;
        crashContext["signal"] = std::to_string(signal);
        crashContext["signal_name"] = strsignal(signal);
        crashContext["signal_code"] = std::to_string(info->si_code);
        crashContext["fault_address"] = std::to_string(reinterpret_cast<uintptr_t>(info->si_addr));
        crashContext["stack_trace"] = s_instance->GetStackTrace();
        
        s_instance->WriteCrashReport("Signal", "Fatal signal received", crashContext);
        s_instance->LogError("Fatal signal " + std::to_string(signal) + " caught by crash handler");
        
        // Flush log file
        if (s_instance->m_logFile.is_open()) {
            s_instance->m_logFile.flush();
        }
        
    }
    catch (...) {
        // Don't throw exceptions in signal handler
    }
}
