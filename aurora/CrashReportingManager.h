#ifndef CRASH_REPORTING_MANAGER_H
#define CRASH_REPORTING_MANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QTimer>
#include <QQueue>
#include <QVariant>
#include <QDateTime>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonArray>
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QTextStream>
#include <QMutex>
#include <QThread>
#include <QDebug>
#include <QCoreApplication>
#include <QSystemInfo>
#include <functional>

/**
 * REChain Aurora OS Crash Reporting Manager
 * Comprehensive crash reporting, logging, and error tracking system for Aurora OS
 * Integrates with Aurora OS system services and provides structured error reporting
 */

class CrashReportingManager : public QObject
{
    Q_OBJECT

public:
    // Log levels
    enum LogLevel {
        TRACE = 0,
        DEBUG = 1,
        INFO = 2,
        WARNING = 3,
        ERROR = 4,
        FATAL = 5
    };
    Q_ENUM(LogLevel)

    // Error categories
    enum ErrorCategory {
        NETWORK_ERROR = 0,
        DATABASE_ERROR = 1,
        UI_ERROR = 2,
        MATRIX_ERROR = 3,
        SYSTEM_ERROR = 4,
        PERMISSION_ERROR = 5,
        STORAGE_ERROR = 6,
        NOTIFICATION_ERROR = 7,
        UNKNOWN_ERROR = 8
    };
    Q_ENUM(ErrorCategory)

    // Crash report status
    enum ReportStatus {
        PENDING = 0,
        SENDING = 1,
        SENT = 2,
        FAILED = 3
    };
    Q_ENUM(ReportStatus)

    // Callback types
    using ErrorCallback = std::function<void(const QString&, const QVariantMap&)>;
    using CrashCallback = std::function<void(const QVariantMap&)>;

    explicit CrashReportingManager(QObject *parent = nullptr);
    ~CrashReportingManager();

    // Initialization and configuration
    Q_INVOKABLE bool initialize(const QVariantMap &config = QVariantMap());
    Q_INVOKABLE void shutdown();
    Q_INVOKABLE bool isInitialized() const { return m_initialized; }

    // Error reporting methods
    Q_INVOKABLE void recordError(const QString &message, const QVariantMap &context = QVariantMap());
    Q_INVOKABLE void recordCrash(const QString &crashInfo, const QVariantMap &context = QVariantMap());
    Q_INVOKABLE void recordException(const QString &exception, const QString &stackTrace, 
                                   const QVariantMap &context = QVariantMap());

    // Logging methods
    Q_INVOKABLE void logTrace(const QString &message, const QVariantMap &data = QVariantMap());
    Q_INVOKABLE void logDebug(const QString &message, const QVariantMap &data = QVariantMap());
    Q_INVOKABLE void logInfo(const QString &message, const QVariantMap &data = QVariantMap());
    Q_INVOKABLE void logWarning(const QString &message, const QVariantMap &data = QVariantMap());
    Q_INVOKABLE void logError(const QString &message, const QVariantMap &data = QVariantMap());
    Q_INVOKABLE void logFatal(const QString &message, const QVariantMap &data = QVariantMap());

    // Breadcrumb management
    Q_INVOKABLE void addBreadcrumb(const QString &message, const QString &category = QString(), 
                                 const QVariantMap &data = QVariantMap());
    Q_INVOKABLE void clearBreadcrumbs();
    Q_INVOKABLE QVariantList getBreadcrumbs() const;

    // User identification
    Q_INVOKABLE void setUserIdentification(const QString &userId, const QString &email = QString(), 
                                         const QString &username = QString());
    Q_INVOKABLE void clearUserIdentification();
    Q_INVOKABLE QVariantMap getUserIdentification() const;

    // Custom keys and context
    Q_INVOKABLE void setCustomKey(const QString &key, const QVariant &value);
    Q_INVOKABLE void removeCustomKey(const QString &key);
    Q_INVOKABLE void clearCustomKeys();
    Q_INVOKABLE QVariantMap getCustomKeys() const;

    // Session management
    Q_INVOKABLE void startSession();
    Q_INVOKABLE void endSession();
    Q_INVOKABLE QString getSessionId() const { return m_sessionId; }
    Q_INVOKABLE QDateTime getSessionStartTime() const { return m_sessionStartTime; }

    // Performance monitoring
    Q_INVOKABLE void recordPerformanceMetric(const QString &name, double value, const QString &unit = QString());
    Q_INVOKABLE void startPerformanceTimer(const QString &name);
    Q_INVOKABLE void stopPerformanceTimer(const QString &name);

    // Configuration
    Q_INVOKABLE void setLogLevel(LogLevel level);
    Q_INVOKABLE LogLevel getLogLevel() const { return m_logLevel; }
    Q_INVOKABLE void setMaxLogFileSize(qint64 size);
    Q_INVOKABLE void setMaxBreadcrumbs(int count);
    Q_INVOKABLE void setAutoSubmitCrashes(bool enabled);
    Q_INVOKABLE void setSubmissionEndpoint(const QString &url);

    // Report management
    Q_INVOKABLE void submitPendingReports();
    Q_INVOKABLE int getPendingReportsCount() const;
    Q_INVOKABLE void clearPendingReports();
    Q_INVOKABLE QVariantList getReportHistory() const;

    // Statistics and debugging
    Q_INVOKABLE QVariantMap getStatistics() const;
    Q_INVOKABLE void enableDebugMode(bool enabled) { m_debugMode = enabled; }
    Q_INVOKABLE bool isDebugMode() const { return m_debugMode; }

    // File management
    Q_INVOKABLE QString getLogFilePath() const;
    Q_INVOKABLE void rotateLogs();
    Q_INVOKABLE void exportLogs(const QString &filePath);

    // Event callbacks
    void setErrorCallback(ErrorCallback callback);
    void setCrashCallback(CrashCallback callback);

signals:
    void errorRecorded(const QString &message, LogLevel level);
    void crashRecorded(const QVariantMap &crashData);
    void reportSubmitted(const QString &reportId, bool success);
    void logFileRotated(const QString &newFilePath);
    void sessionStarted(const QString &sessionId);
    void sessionEnded(const QString &sessionId, qint64 duration);

private slots:
    void handleNetworkReply();
    void submitNextReport();
    void rotateLogs();
    void cleanupOldLogs();

private:
    struct LogEntry {
        QDateTime timestamp;
        LogLevel level;
        QString message;
        QVariantMap data;
        QString category;
        QString sessionId;
    };

    struct Breadcrumb {
        QDateTime timestamp;
        QString message;
        QString category;
        QVariantMap data;
    };

    struct CrashReport {
        QString reportId;
        QDateTime timestamp;
        QString crashInfo;
        QVariantMap context;
        QVariantList breadcrumbs;
        QVariantMap userInfo;
        QVariantMap customKeys;
        QVariantMap systemInfo;
        QString sessionId;
        ReportStatus status;
    };

    struct PerformanceTimer {
        QDateTime startTime;
        QString name;
    };

    // Core functionality
    void writeLogEntry(const LogEntry &entry);
    void writeCrashReport(const CrashReport &report);
    void loadPendingReports();
    void savePendingReports();
    QString generateReportId() const;
    QVariantMap collectSystemInfo() const;
    QVariantMap collectAuroraSystemInfo() const;
    void setupLogRotation();
    void initializeLogFile();
    void debugLog(const QString &message) const;

    // Aurora OS specific methods
    void setupAuroraLogging();
    void registerAuroraSignalHandlers();
    void handleAuroraSystemSignal(int signal);
    QVariantMap getAuroraDeviceInfo() const;
    void submitToAuroraReporting(const CrashReport &report);

    // Network operations
    void submitReport(const CrashReport &report);
    QNetworkRequest createSubmissionRequest() const;
    QJsonObject reportToJson(const CrashReport &report) const;

    // File operations
    void ensureLogDirectory();
    QString getLogDirectory() const;
    QString getCrashReportsDirectory() const;
    void cleanupDirectory(const QString &directory, int maxFiles);

    // Member variables
    bool m_initialized;
    bool m_debugMode;
    bool m_autoSubmitCrashes;
    LogLevel m_logLevel;
    
    QString m_appName;
    QString m_appVersion;
    QString m_environment;
    QString m_submissionEndpoint;
    QString m_sessionId;
    QDateTime m_sessionStartTime;

    // File management
    QString m_logFilePath;
    QFile *m_logFile;
    QTextStream *m_logStream;
    QMutex m_logMutex;
    qint64 m_maxLogFileSize;
    int m_maxLogFiles;

    // Breadcrumbs and context
    QQueue<Breadcrumb> m_breadcrumbs;
    int m_maxBreadcrumbs;
    QVariantMap m_userInfo;
    QVariantMap m_customKeys;

    // Crash reports
    QQueue<CrashReport> m_pendingReports;
    QTimer *m_submissionTimer;
    QNetworkAccessManager *m_networkManager;
    int m_maxPendingReports;

    // Performance monitoring
    QHash<QString, PerformanceTimer> m_performanceTimers;
    QVariantList m_performanceMetrics;

    // Statistics
    mutable QVariantMap m_statistics;
    int m_totalErrors;
    int m_totalCrashes;
    int m_totalReportsSubmitted;
    QDateTime m_lastErrorTime;
    QDateTime m_lastCrashTime;

    // Event callbacks
    ErrorCallback m_errorCallback;
    CrashCallback m_crashCallback;

    // Timers
    QTimer *m_logRotationTimer;
    QTimer *m_cleanupTimer;
};

#endif // CRASH_REPORTING_MANAGER_H
