#pragma once

#include <string>
#include <map>
#include <memory>
#include <functional>
#include <fstream>
#include <mutex>
#include <signal.h>
#include <execinfo.h>
#include <sys/utsname.h>

class CrashReportingManager {
public:
    static CrashReportingManager& GetInstance();
    
    // Initialization and cleanup
    bool Initialize();
    void Shutdown();
    
    // Crash reporting methods
    void RecordException(const std::exception& exception, const std::map<std::string, std::string>& context = {});
    void RecordError(const std::string& error, const std::map<std::string, std::string>& context = {});
    void RecordNonFatalError(const std::string& error, const std::map<std::string, std::string>& context = {});
    
    // Logging methods
    void Log(const std::string& message, const std::string& level = "INFO");
    void LogDebug(const std::string& message);
    void LogInfo(const std::string& message);
    void LogWarning(const std::string& message);
    void LogError(const std::string& message);
    
    // User identification
    void SetUserId(const std::string& userId);
    void SetUserEmail(const std::string& email);
    void SetUserName(const std::string& name);
    
    // Custom keys and context
    void SetCustomKey(const std::string& key, const std::string& value);
    void SetCustomKey(const std::string& key, int value);
    void SetCustomKey(const std::string& key, bool value);
    void SetCustomKeys(const std::map<std::string, std::string>& keys);
    
    // Session management
    void StartSession();
    void EndSession();
    
    // Settings
    void SetCrashReportingEnabled(bool enabled);
    bool IsCrashReportingEnabled() const;
    void SetLogLevel(const std::string& level);
    std::string GetLogLevel() const;
    
    // System information
    std::string GetSystemInfo();
    std::string GetApplicationInfo();
    std::string GetStackTrace();

private:
    CrashReportingManager() = default;
    ~CrashReportingManager() = default;
    
    // Prevent copying
    CrashReportingManager(const CrashReportingManager&) = delete;
    CrashReportingManager& operator=(const CrashReportingManager&) = delete;
    
    // Internal methods
    void WriteToLogFile(const std::string& message, const std::string& level);
    void WriteCrashReport(const std::string& type, const std::string& message, 
                         const std::map<std::string, std::string>& context);
    
    std::string GetTimestamp();
    std::string GenerateCrashId();
    
    void SetupSignalHandlers();
    void CleanupSignalHandlers();
    
    static void SignalHandler(int signal, siginfo_t* info, void* context);
    static void HandleCrash(int signal, siginfo_t* info, void* context);
    
    // Member variables
    bool m_initialized = false;
    bool m_crashReportingEnabled = true;
    std::string m_logLevel = "INFO";
    
    std::string m_userId;
    std::string m_userEmail;
    std::string m_userName;
    
    std::map<std::string, std::string> m_customKeys;
    
    std::string m_logFilePath;
    std::string m_crashReportPath;
    
    std::mutex m_logMutex;
    std::ofstream m_logFile;
    
    // Signal handling
    struct sigaction m_oldSigactionSEGV;
    struct sigaction m_oldSigactionABRT;
    struct sigaction m_oldSigactionFPE;
    struct sigaction m_oldSigactionILL;
    struct sigaction m_oldSigactionBUS;
    
    static CrashReportingManager* s_instance;
};
