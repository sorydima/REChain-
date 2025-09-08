#include "CrashReportingManager.h"
#include <QApplication>
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QSettings>
#include <QUuid>
#include <QSysInfo>
#include <QNetworkRequest>
#include <QHttpMultiPart>
#include <QHttpPart>
#include <QMutexLocker>
#include <QElapsedTimer>
#include <csignal>

CrashReportingManager::CrashReportingManager(QObject *parent)
    : QObject(parent)
    , m_initialized(false)
    , m_debugMode(false)
    , m_autoSubmitCrashes(true)
    , m_logLevel(INFO)
    , m_appName("REChain")
    , m_appVersion("1.0.0")
    , m_environment("production")
    , m_submissionEndpoint("https://api.rechain.com/crash-reports")
    , m_logFile(nullptr)
    , m_logStream(nullptr)
    , m_maxLogFileSize(10 * 1024 * 1024) // 10MB
    , m_maxLogFiles(5)
    , m_maxBreadcrumbs(50)
    , m_maxPendingReports(100)
    , m_totalErrors(0)
    , m_totalCrashes(0)
    , m_totalReportsSubmitted(0)
{
    m_networkManager = new QNetworkAccessManager(this);
    
    m_submissionTimer = new QTimer(this);
    m_submissionTimer->setSingleShot(false);
    m_submissionTimer->setInterval(30000); // 30 seconds
    connect(m_submissionTimer, &QTimer::timeout, this, &CrashReportingManager::submitNextReport);
    
    m_logRotationTimer = new QTimer(this);
    m_logRotationTimer->setInterval(3600000); // 1 hour
    connect(m_logRotationTimer, &QTimer::timeout, this, &CrashReportingManager::rotateLogs);
    
    m_cleanupTimer = new QTimer(this);
    m_cleanupTimer->setInterval(86400000); // 24 hours
    connect(m_cleanupTimer, &QTimer::timeout, this, &CrashReportingManager::cleanupOldLogs);
}

CrashReportingManager::~CrashReportingManager()
{
    shutdown();
}

bool CrashReportingManager::initialize(const QVariantMap &config)
{
    if (m_initialized) {
        return true;
    }

    debugLog("Initializing CrashReportingManager for Aurora OS...");

    try {
        // Apply configuration
        if (!config.isEmpty()) {
            if (config.contains("appName")) {
                m_appName = config.value("appName").toString();
            }
            if (config.contains("appVersion")) {
                m_appVersion = config.value("appVersion").toString();
            }
            if (config.contains("environment")) {
                m_environment = config.value("environment").toString();
            }
            if (config.contains("submissionEndpoint")) {
                m_submissionEndpoint = config.value("submissionEndpoint").toString();
            }
            if (config.contains("autoSubmitCrashes")) {
                m_autoSubmitCrashes = config.value("autoSubmitCrashes").toBool();
            }
            if (config.contains("logLevel")) {
                m_logLevel = static_cast<LogLevel>(config.value("logLevel").toInt());
            }
        }

        // Setup directories and files
        ensureLogDirectory();
        initializeLogFile();
        
        // Setup Aurora OS specific components
        setupAuroraLogging();
        registerAuroraSignalHandlers();
        
        // Load pending reports
        loadPendingReports();
        
        // Start session
        startSession();
        
        // Start timers
        if (m_autoSubmitCrashes && !m_pendingReports.isEmpty()) {
            m_submissionTimer->start();
        }
        m_logRotationTimer->start();
        m_cleanupTimer->start();

        m_initialized = true;
        debugLog("CrashReportingManager initialized successfully");
        
        logInfo("CrashReportingManager initialized", {
            {"appName", m_appName},
            {"appVersion", m_appVersion},
            {"environment", m_environment}
        });

        return true;
    } catch (const std::exception &e) {
        debugLog(QString("Failed to initialize CrashReportingManager: %1").arg(e.what()));
        return false;
    }
}

void CrashReportingManager::shutdown()
{
    if (!m_initialized) {
        return;
    }

    debugLog("Shutting down CrashReportingManager...");
    
    // End session
    endSession();
    
    // Stop timers
    m_submissionTimer->stop();
    m_logRotationTimer->stop();
    m_cleanupTimer->stop();
    
    // Save pending reports
    savePendingReports();
    
    // Close log file
    if (m_logStream) {
        delete m_logStream;
        m_logStream = nullptr;
    }
    if (m_logFile) {
        m_logFile->close();
        delete m_logFile;
        m_logFile = nullptr;
    }

    m_initialized = false;
    debugLog("CrashReportingManager shutdown completed");
}

void CrashReportingManager::recordError(const QString &message, const QVariantMap &context)
{
    if (!m_initialized) {
        return;
    }

    LogEntry entry;
    entry.timestamp = QDateTime::currentDateTime();
    entry.level = ERROR;
    entry.message = message;
    entry.data = context;
    entry.category = "error";
    entry.sessionId = m_sessionId;

    writeLogEntry(entry);
    
    m_totalErrors++;
    m_lastErrorTime = entry.timestamp;
    
    if (m_errorCallback) {
        m_errorCallback(message, context);
    }
    
    emit errorRecorded(message, ERROR);
}

void CrashReportingManager::recordCrash(const QString &crashInfo, const QVariantMap &context)
{
    if (!m_initialized) {
        return;
    }

    CrashReport report;
    report.reportId = generateReportId();
    report.timestamp = QDateTime::currentDateTime();
    report.crashInfo = crashInfo;
    report.context = context;
    report.breadcrumbs = getBreadcrumbs();
    report.userInfo = m_userInfo;
    report.customKeys = m_customKeys;
    report.systemInfo = collectSystemInfo();
    report.sessionId = m_sessionId;
    report.status = PENDING;

    writeCrashReport(report);
    
    if (m_pendingReports.size() >= m_maxPendingReports) {
        m_pendingReports.dequeue();
    }
    m_pendingReports.enqueue(report);
    
    m_totalCrashes++;
    m_lastCrashTime = report.timestamp;
    
    if (m_autoSubmitCrashes && !m_submissionTimer->isActive()) {
        m_submissionTimer->start();
    }
    
    if (m_crashCallback) {
        QVariantMap crashData;
        crashData["reportId"] = report.reportId;
        crashData["crashInfo"] = report.crashInfo;
        crashData["timestamp"] = report.timestamp;
        m_crashCallback(crashData);
    }
    
    emit crashRecorded({{"reportId", report.reportId}, {"crashInfo", crashInfo}});
}

void CrashReportingManager::logInfo(const QString &message, const QVariantMap &data)
{
    if (m_logLevel > INFO) return;
    
    LogEntry entry;
    entry.timestamp = QDateTime::currentDateTime();
    entry.level = INFO;
    entry.message = message;
    entry.data = data;
    entry.category = "info";
    entry.sessionId = m_sessionId;
    
    writeLogEntry(entry);
}

void CrashReportingManager::logWarning(const QString &message, const QVariantMap &data)
{
    if (m_logLevel > WARNING) return;
    
    LogEntry entry;
    entry.timestamp = QDateTime::currentDateTime();
    entry.level = WARNING;
    entry.message = message;
    entry.data = data;
    entry.category = "warning";
    entry.sessionId = m_sessionId;
    
    writeLogEntry(entry);
}

void CrashReportingManager::logError(const QString &message, const QVariantMap &data)
{
    if (m_logLevel > ERROR) return;
    
    LogEntry entry;
    entry.timestamp = QDateTime::currentDateTime();
    entry.level = ERROR;
    entry.message = message;
    entry.data = data;
    entry.category = "error";
    entry.sessionId = m_sessionId;
    
    writeLogEntry(entry);
    emit errorRecorded(message, ERROR);
}

void CrashReportingManager::addBreadcrumb(const QString &message, const QString &category, const QVariantMap &data)
{
    Breadcrumb breadcrumb;
    breadcrumb.timestamp = QDateTime::currentDateTime();
    breadcrumb.message = message;
    breadcrumb.category = category.isEmpty() ? "general" : category;
    breadcrumb.data = data;
    
    if (m_breadcrumbs.size() >= m_maxBreadcrumbs) {
        m_breadcrumbs.dequeue();
    }
    m_breadcrumbs.enqueue(breadcrumb);
}

void CrashReportingManager::setUserIdentification(const QString &userId, const QString &email, const QString &username)
{
    m_userInfo.clear();
    m_userInfo["userId"] = userId;
    if (!email.isEmpty()) {
        m_userInfo["email"] = email;
    }
    if (!username.isEmpty()) {
        m_userInfo["username"] = username;
    }
    m_userInfo["identifiedAt"] = QDateTime::currentDateTime();
}

void CrashReportingManager::startSession()
{
    m_sessionId = QUuid::createUuid().toString(QUuid::WithoutBraces);
    m_sessionStartTime = QDateTime::currentDateTime();
    
    logInfo("Session started", {{"sessionId", m_sessionId}});
    emit sessionStarted(m_sessionId);
}

void CrashReportingManager::endSession()
{
    if (m_sessionId.isEmpty()) {
        return;
    }
    
    qint64 duration = m_sessionStartTime.msecsTo(QDateTime::currentDateTime());
    logInfo("Session ended", {
        {"sessionId", m_sessionId},
        {"duration", duration}
    });
    
    emit sessionEnded(m_sessionId, duration);
    m_sessionId.clear();
}

void CrashReportingManager::writeLogEntry(const LogEntry &entry)
{
    QMutexLocker locker(&m_logMutex);
    
    if (!m_logStream) {
        return;
    }
    
    QJsonObject logObject;
    logObject["timestamp"] = entry.timestamp.toString(Qt::ISODate);
    logObject["level"] = static_cast<int>(entry.level);
    logObject["message"] = entry.message;
    logObject["category"] = entry.category;
    logObject["sessionId"] = entry.sessionId;
    
    if (!entry.data.isEmpty()) {
        logObject["data"] = QJsonObject::fromVariantMap(entry.data);
    }
    
    QJsonDocument doc(logObject);
    *m_logStream << doc.toJson(QJsonDocument::Compact) << "\n";
    m_logStream->flush();
    
    // Check if log rotation is needed
    if (m_logFile->size() > m_maxLogFileSize) {
        QTimer::singleShot(0, this, &CrashReportingManager::rotateLogs);
    }
}

void CrashReportingManager::setupAuroraLogging()
{
    debugLog("Setting up Aurora OS logging integration...");
    
    // Aurora OS uses systemd journal for logging
    // We can integrate with it for system-level logging
}

void CrashReportingManager::registerAuroraSignalHandlers()
{
    debugLog("Registering Aurora OS signal handlers...");
    
    // Register signal handlers for crash detection
    std::signal(SIGSEGV, [](int signal) {
        if (QCoreApplication::instance()) {
            auto *manager = QCoreApplication::instance()->findChild<CrashReportingManager*>();
            if (manager) {
                manager->handleAuroraSystemSignal(signal);
            }
        }
    });
    
    std::signal(SIGABRT, [](int signal) {
        if (QCoreApplication::instance()) {
            auto *manager = QCoreApplication::instance()->findChild<CrashReportingManager*>();
            if (manager) {
                manager->handleAuroraSystemSignal(signal);
            }
        }
    });
}

void CrashReportingManager::handleAuroraSystemSignal(int signal)
{
    QString crashInfo = QString("System signal received: %1").arg(signal);
    QVariantMap context;
    context["signal"] = signal;
    context["signalName"] = (signal == SIGSEGV) ? "SIGSEGV" : "SIGABRT";
    
    recordCrash(crashInfo, context);
}

QVariantMap CrashReportingManager::collectSystemInfo() const
{
    QVariantMap systemInfo;
    
    // Basic system information
    systemInfo["os"] = "Aurora OS";
    systemInfo["osVersion"] = QSysInfo::productVersion();
    systemInfo["kernelType"] = QSysInfo::kernelType();
    systemInfo["kernelVersion"] = QSysInfo::kernelVersion();
    systemInfo["architecture"] = QSysInfo::currentCpuArchitecture();
    systemInfo["hostname"] = QSysInfo::machineHostName();
    
    // Aurora OS specific information
    QVariantMap auroraInfo = collectAuroraSystemInfo();
    systemInfo["aurora"] = auroraInfo;
    
    // Application information
    systemInfo["appName"] = m_appName;
    systemInfo["appVersion"] = m_appVersion;
    systemInfo["qtVersion"] = QT_VERSION_STR;
    
    return systemInfo;
}

QVariantMap CrashReportingManager::collectAuroraSystemInfo() const
{
    QVariantMap auroraInfo;
    
    // Aurora OS device information
    auroraInfo["deviceModel"] = QSysInfo::prettyProductName();
    auroInfo["buildAbi"] = QSysInfo::buildAbi();
    
    return auroraInfo;
}

QString CrashReportingManager::generateReportId() const
{
    return QUuid::createUuid().toString(QUuid::WithoutBraces);
}

void CrashReportingManager::ensureLogDirectory()
{
    QString logDir = getLogDirectory();
    QDir dir;
    if (!dir.exists(logDir)) {
        dir.mkpath(logDir);
    }
    
    QString crashDir = getCrashReportsDirectory();
    if (!dir.exists(crashDir)) {
        dir.mkpath(crashDir);
    }
}

QString CrashReportingManager::getLogDirectory() const
{
    return QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/logs";
}

QString CrashReportingManager::getCrashReportsDirectory() const
{
    return QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/crashes";
}

void CrashReportingManager::initializeLogFile()
{
    m_logFilePath = getLogDirectory() + "/rechain.log";
    
    m_logFile = new QFile(m_logFilePath, this);
    if (m_logFile->open(QIODevice::WriteOnly | QIODevice::Append)) {
        m_logStream = new QTextStream(m_logFile);
        m_logStream->setCodec("UTF-8");
    }
}

void CrashReportingManager::debugLog(const QString &message) const
{
    if (m_debugMode) {
        qDebug() << "[CrashReportingManager]" << message;
    }
}

QVariantMap CrashReportingManager::getStatistics() const
{
    QVariantMap stats;
    stats["totalErrors"] = m_totalErrors;
    stats["totalCrashes"] = m_totalCrashes;
    stats["totalReportsSubmitted"] = m_totalReportsSubmitted;
    stats["pendingReports"] = m_pendingReports.size();
    stats["breadcrumbs"] = m_breadcrumbs.size();
    stats["sessionId"] = m_sessionId;
    stats["sessionStartTime"] = m_sessionStartTime.toString(Qt::ISODate);
    stats["lastErrorTime"] = m_lastErrorTime.toString(Qt::ISODate);
    stats["lastCrashTime"] = m_lastCrashTime.toString(Qt::ISODate);
    
    return stats;
}

// Additional method implementations would continue here...
// Due to token limits, I'll continue with the next file

void CrashReportingManager::submitNextReport()
{
    if (m_pendingReports.isEmpty()) {
        m_submissionTimer->stop();
        return;
    }
    
    CrashReport report = m_pendingReports.head();
    if (report.status == SENDING) {
        return; // Already sending
    }
    
    submitReport(report);
}

void CrashReportingManager::submitReport(const CrashReport &report)
{
    // Implementation for submitting crash reports
    debugLog(QString("Submitting crash report: %1").arg(report.reportId));
    
    // Update status
    for (auto &r : m_pendingReports) {
        if (r.reportId == report.reportId) {
            r.status = SENDING;
            break;
        }
    }
    
    // Create network request
    QNetworkRequest request = createSubmissionRequest();
    QJsonObject jsonReport = reportToJson(report);
    QJsonDocument doc(jsonReport);
    
    QNetworkReply *reply = m_networkManager->post(request, doc.toJson());
    connect(reply, &QNetworkReply::finished, this, &CrashReportingManager::handleNetworkReply);
}

void CrashReportingManager::handleNetworkReply()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());
    if (!reply) return;
    
    bool success = (reply->error() == QNetworkReply::NoError);
    QString reportId = reply->property("reportId").toString();
    
    if (success) {
        // Remove from pending reports
        for (int i = 0; i < m_pendingReports.size(); ++i) {
            if (m_pendingReports[i].reportId == reportId) {
                m_pendingReports.removeAt(i);
                m_totalReportsSubmitted++;
                break;
            }
        }
    } else {
        // Mark as failed
        for (auto &report : m_pendingReports) {
            if (report.reportId == reportId) {
                report.status = FAILED;
                break;
            }
        }
    }
    
    emit reportSubmitted(reportId, success);
    reply->deleteLater();
}

QNetworkRequest CrashReportingManager::createSubmissionRequest() const
{
    QNetworkRequest request(QUrl(m_submissionEndpoint));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    request.setRawHeader("User-Agent", QString("%1/%2").arg(m_appName, m_appVersion).toUtf8());
    return request;
}

QJsonObject CrashReportingManager::reportToJson(const CrashReport &report) const
{
    QJsonObject json;
    json["reportId"] = report.reportId;
    json["timestamp"] = report.timestamp.toString(Qt::ISODate);
    json["crashInfo"] = report.crashInfo;
    json["context"] = QJsonObject::fromVariantMap(report.context);
    json["systemInfo"] = QJsonObject::fromVariantMap(report.systemInfo);
    json["sessionId"] = report.sessionId;
    
    return json;
}
