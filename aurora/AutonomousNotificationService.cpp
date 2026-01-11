#include "AutonomousNotificationService.h"
#include <QApplication>
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QSettings>
#include <QDBusConnection>
#include <QDBusMessage>
#include <QDBusArgument>
#include <QDBusMetaType>
#include <QHapticsFeedback>
#include <QSystemInfo>

AutonomousNotificationService::AutonomousNotificationService(QObject *parent)
    : QObject(parent)
    , m_initialized(false)
    , m_notificationsEnabled(true)
    , m_soundEnabled(true)
    , m_vibrationEnabled(true)
    , m_badgeEnabled(true)
    , m_debugLogging(false)
    , m_appName("REChain")
    , m_iconPath("/usr/share/icons/hicolor/128x128/apps/com.rechain.online.png")
    , m_soundPath("/usr/share/sounds/")
    , m_badgeCount(0)
    , m_maxNotifications(10)
    , m_notificationTimeout(5000)
    , m_notificationInterface(nullptr)
    , m_launcherInterface(nullptr)
    , m_systemInterface(nullptr)
    , m_mediaPlayer(nullptr)
    , m_totalNotificationsShown(0)
    , m_totalNotificationsClicked(0)
{
    // Initialize cleanup timer
    m_cleanupTimer = new QTimer(this);
    m_cleanupTimer->setInterval(60000); // Clean up every minute
    connect(m_cleanupTimer, &QTimer::timeout, this, &AutonomousNotificationService::cleanupExpiredNotifications);
}

AutonomousNotificationService::~AutonomousNotificationService()
{
    shutdown();
}

bool AutonomousNotificationService::initialize(const QVariantMap &config)
{
    if (m_initialized) {
        return true;
    }

    logDebug("Initializing AutonomousNotificationService for Aurora OS...");

    try {
        // Apply configuration
        if (!config.isEmpty()) {
            if (config.contains("appName")) {
                m_appName = config.value("appName").toString();
            }
            if (config.contains("iconPath")) {
                m_iconPath = config.value("iconPath").toString();
            }
            if (config.contains("soundPath")) {
                m_soundPath = config.value("soundPath").toString();
            }
            if (config.contains("maxNotifications")) {
                m_maxNotifications = config.value("maxNotifications").toInt();
            }
            if (config.contains("notificationTimeout")) {
                m_notificationTimeout = config.value("notificationTimeout").toInt();
            }
        }

        // Load saved configuration
        loadConfiguration();

        // Setup Aurora OS specific components
        setupAuroraNotifications();

        // Setup D-Bus connections
        setupDBusConnections();

        // Initialize sound system
        initializeSoundSystem();

        // Start cleanup timer
        m_cleanupTimer->start();

        m_initialized = true;
        logDebug("AutonomousNotificationService initialized successfully");

        return true;
    } catch (const std::exception &e) {
        logDebug(QString("Failed to initialize AutonomousNotificationService: %1").arg(e.what()));
        return false;
    }
}

void AutonomousNotificationService::shutdown()
{
    if (!m_initialized) {
        return;
    }

    logDebug("Shutting down AutonomousNotificationService...");

    // Save configuration
    saveConfiguration();

    // Cancel all active notifications
    cancelAllNotifications();

    // Stop cleanup timer
    if (m_cleanupTimer) {
        m_cleanupTimer->stop();
    }

    // Cleanup D-Bus interfaces
    delete m_notificationInterface;
    delete m_launcherInterface;
    delete m_systemInterface;
    m_notificationInterface = nullptr;
    m_launcherInterface = nullptr;
    m_systemInterface = nullptr;

    // Cleanup media player
    if (m_mediaPlayer) {
        m_mediaPlayer->stop();
        delete m_mediaPlayer;
        m_mediaPlayer = nullptr;
    }

    m_initialized = false;
    logDebug("AutonomousNotificationService shutdown completed");
}

void AutonomousNotificationService::setupAuroraNotifications()
{
    logDebug("Setting up Aurora OS notification system...");

    // Initialize Aurora OS notification interface
    m_notificationInterface = new QDBusInterface(
        "org.freedesktop.Notifications",
        "/org/freedesktop/Notifications",
        "org.freedesktop.Notifications",
        QDBusConnection::sessionBus(),
        this
    );

    if (!m_notificationInterface->isValid()) {
        logDebug("Warning: Could not connect to Aurora OS notification service");
    }

    // Initialize launcher interface for badge updates
    m_launcherInterface = new QDBusInterface(
        "com.jolla.lipstick",
        "/com/jolla/lipstick",
        "com.jolla.lipstick",
        QDBusConnection::sessionBus(),
        this
    );

    // Initialize system interface for vibration and system events
    m_systemInterface = new QDBusInterface(
        "com.nokia.mce",
        "/com/nokia/mce/request",
        "com.nokia.mce.request",
        QDBusConnection::systemBus(),
        this
    );
}

void AutonomousNotificationService::setupDBusConnections()
{
    logDebug("Setting up D-Bus connections...");

    // Register for notification feedback
    QDBusConnection::sessionBus().connect(
        "org.freedesktop.Notifications",
        "/org/freedesktop/Notifications",
        "org.freedesktop.Notifications",
        "ActionInvoked",
        this,
        SLOT(handleNotificationActionTriggered(QString, QString))
    );

    QDBusConnection::sessionBus().connect(
        "org.freedesktop.Notifications",
        "/org/freedesktop/Notifications",
        "org.freedesktop.Notifications",
        "NotificationClosed",
        this,
        SLOT(handleNotificationClosed(QString))
    );
}

void AutonomousNotificationService::initializeSoundSystem()
{
    logDebug("Initializing sound system...");

    m_mediaPlayer = new QMediaPlayer(this);
    m_mediaPlayer->setVolume(70);

    // Load notification sounds
    loadNotificationSounds();
}

void AutonomousNotificationService::loadNotificationSounds()
{
    // Define default sound mappings for Aurora OS
    m_soundFiles[MESSAGE] = m_soundPath + "message.wav";
    m_soundFiles[CALL] = m_soundPath + "ringtone.wav";
    m_soundFiles[MISSED_CALL] = m_soundPath + "missed_call.wav";
    m_soundFiles[USER_JOINED] = m_soundPath + "user_joined.wav";
    m_soundFiles[USER_LEFT] = m_soundPath + "user_left.wav";
    m_soundFiles[FILE_UPLOAD] = m_soundPath + "file_upload.wav";
    m_soundFiles[ROOM_CREATED] = m_soundPath + "room_created.wav";
    m_soundFiles[SYNC_ERROR] = m_soundPath + "error.wav";
    m_soundFiles[LOGIN_SUCCESS] = m_soundPath + "success.wav";
    m_soundFiles[DEVICE_VERIFICATION] = m_soundPath + "verification.wav";
    m_soundFiles[SPACE_JOINED] = m_soundPath + "space_joined.wav";
    m_soundFiles[SYSTEM] = m_soundPath + "system.wav";

    // Check for custom sounds in user directory
    QString userSoundsPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/sounds/";
    QDir userSoundsDir(userSoundsPath);
    
    if (userSoundsDir.exists()) {
        for (auto it = m_soundFiles.begin(); it != m_soundFiles.end(); ++it) {
            QString customSound = userSoundsPath + QFileInfo(it.value()).fileName();
            if (QFile::exists(customSound)) {
                it.value() = customSound;
            }
        }
    }
}

void AutonomousNotificationService::showMessageNotification(const QString &sender, const QString &message, 
                                                          const QString &roomId, const QVariantMap &options)
{
    NotificationData notification;
    notification.tag = generateNotificationTag(MESSAGE, roomId);
    notification.type = MESSAGE;
    notification.title = sender;
    notification.body = message;
    notification.timestamp = QDateTime::currentDateTime();
    notification.options = options;
    notification.persistent = options.value("persistent", false).toBool();
    notification.priority = static_cast<Priority>(options.value("priority", NORMAL).toInt());

    displayNotification(notification);
}

void AutonomousNotificationService::showCallNotification(const QString &caller, const QString &callId, 
                                                        bool isVideo, const QVariantMap &options)
{
    NotificationData notification;
    notification.tag = generateNotificationTag(CALL, callId);
    notification.type = CALL;
    notification.title = isVideo ? tr("Incoming Video Call") : tr("Incoming Call");
    notification.body = tr("From: %1").arg(caller);
    notification.timestamp = QDateTime::currentDateTime();
    notification.options = options;
    notification.persistent = true; // Calls should be persistent
    notification.priority = CRITICAL;

    displayNotification(notification);
}

void AutonomousNotificationService::showMissedCallNotification(const QString &caller, const QString &callId, 
                                                             const QVariantMap &options)
{
    NotificationData notification;
    notification.tag = generateNotificationTag(MISSED_CALL, callId);
    notification.type = MISSED_CALL;
    notification.title = tr("Missed Call");
    notification.body = tr("From: %1").arg(caller);
    notification.timestamp = QDateTime::currentDateTime();
    notification.options = options;
    notification.persistent = options.value("persistent", true).toBool();
    notification.priority = HIGH;

    displayNotification(notification);
}

void AutonomousNotificationService::showUserJoinedNotification(const QString &user, const QString &roomName, 
                                                             const QString &roomId, const QVariantMap &options)
{
    NotificationData notification;
    notification.tag = generateNotificationTag(USER_JOINED, roomId + "_" + user);
    notification.type = USER_JOINED;
    notification.title = tr("User Joined");
    notification.body = tr("%1 joined %2").arg(user, roomName);
    notification.timestamp = QDateTime::currentDateTime();
    notification.options = options;
    notification.persistent = options.value("persistent", false).toBool();
    notification.priority = LOW;

    displayNotification(notification);
}

void AutonomousNotificationService::showUserLeftNotification(const QString &user, const QString &roomName, 
                                                           const QString &roomId, const QVariantMap &options)
{
    NotificationData notification;
    notification.tag = generateNotificationTag(USER_LEFT, roomId + "_" + user);
    notification.type = USER_LEFT;
    notification.title = tr("User Left");
    notification.body = tr("%1 left %2").arg(user, roomName);
    notification.timestamp = QDateTime::currentDateTime();
    notification.options = options;
    notification.persistent = options.value("persistent", false).toBool();
    notification.priority = LOW;

    displayNotification(notification);
}

void AutonomousNotificationService::showFileUploadNotification(const QString &fileName, const QString &sender, 
                                                             const QString &roomId, const QVariantMap &options)
{
    NotificationData notification;
    notification.tag = generateNotificationTag(FILE_UPLOAD, roomId + "_" + fileName);
    notification.type = FILE_UPLOAD;
    notification.title = tr("File Shared");
    notification.body = tr("%1 shared %2").arg(sender, fileName);
    notification.timestamp = QDateTime::currentDateTime();
    notification.options = options;
    notification.persistent = options.value("persistent", false).toBool();
    notification.priority = NORMAL;

    displayNotification(notification);
}

void AutonomousNotificationService::showSyncErrorNotification(const QString &error, const QVariantMap &options)
{
    NotificationData notification;
    notification.tag = generateNotificationTag(SYNC_ERROR, "sync");
    notification.type = SYNC_ERROR;
    notification.title = tr("Sync Error");
    notification.body = error;
    notification.timestamp = QDateTime::currentDateTime();
    notification.options = options;
    notification.persistent = options.value("persistent", true).toBool();
    notification.priority = HIGH;

    displayNotification(notification);
}

void AutonomousNotificationService::showSystemNotification(const QString &title, const QString &message, 
                                                         const QVariantMap &options)
{
    NotificationData notification;
    notification.tag = generateNotificationTag(SYSTEM, QDateTime::currentDateTime().toString());
    notification.type = SYSTEM;
    notification.title = title;
    notification.body = message;
    notification.timestamp = QDateTime::currentDateTime();
    notification.options = options;
    notification.persistent = options.value("persistent", false).toBool();
    notification.priority = static_cast<Priority>(options.value("priority", NORMAL).toInt());

    displayNotification(notification);
}

void AutonomousNotificationService::displayNotification(const NotificationData &notification)
{
    if (!m_initialized || !m_notificationsEnabled) {
        return;
    }

    logDebug(QString("Displaying notification: %1 - %2").arg(notification.title, notification.body));

    // Check notification limit
    if (m_activeNotifications.size() >= m_maxNotifications) {
        // Remove oldest notification
        auto oldest = std::min_element(m_activeNotifications.begin(), m_activeNotifications.end(),
            [](const NotificationData &a, const NotificationData &b) {
                return a.timestamp < b.timestamp;
            });
        if (oldest != m_activeNotifications.end()) {
            cancelNotification(oldest.key());
        }
    }

    // Store notification data
    m_activeNotifications[notification.tag] = notification;

    // Send Aurora OS notification
    sendAuroraNotification(notification);

    // Play sound if enabled
    if (m_soundEnabled) {
        playNotificationSound(notification.type);
    }

    // Trigger vibration if enabled
    if (m_vibrationEnabled && notification.priority >= HIGH) {
        triggerVibration();
    }

    // Update badge count
    if (m_badgeEnabled) {
        updateBadgeCount(m_badgeCount + 1);
    }

    // Update statistics
    m_totalNotificationsShown++;
    m_lastNotificationTime = QDateTime::currentDateTime();

    emit notificationDisplayed(notification.tag, notification.type);
}

void AutonomousNotificationService::sendAuroraNotification(const NotificationData &notification)
{
    if (!m_notificationInterface || !m_notificationInterface->isValid()) {
        logDebug("Aurora notification interface not available");
        return;
    }

    // Prepare notification arguments for Aurora OS
    QVariantList arguments;
    arguments << m_appName; // app_name
    arguments << 0; // replaces_id
    arguments << m_iconPath; // app_icon
    arguments << notification.title; // summary
    arguments << notification.body; // body

    // Actions
    QStringList actions;
    if (notification.type == CALL) {
        actions << "accept" << tr("Accept") << "decline" << tr("Decline");
    } else if (notification.type == MISSED_CALL) {
        actions << "callback" << tr("Call Back");
    }
    arguments << actions;

    // Hints
    QVariantMap hints;
    hints["urgency"] = static_cast<int>(notification.priority);
    hints["category"] = QString("im.received"); // Aurora OS category
    hints["desktop-entry"] = "com.rechain.online";
    
    if (notification.persistent) {
        hints["resident"] = true;
    }
    
    arguments << hints;
    arguments << m_notificationTimeout; // expire_timeout

    // Send D-Bus call
    QDBusReply<uint> reply = m_notificationInterface->callWithArgumentList(
        QDBus::AutoDetect, "Notify", arguments);

    if (reply.isValid()) {
        logDebug(QString("Aurora notification sent with ID: %1").arg(reply.value()));
    } else {
        logDebug(QString("Failed to send Aurora notification: %1").arg(reply.error().message()));
    }
}

void AutonomousNotificationService::cancelNotification(const QString &tag)
{
    if (!m_activeNotifications.contains(tag)) {
        return;
    }

    logDebug(QString("Cancelling notification: %1").arg(tag));

    // Remove from active notifications
    m_activeNotifications.remove(tag);

    // Update badge count
    if (m_badgeEnabled && m_badgeCount > 0) {
        updateBadgeCount(m_badgeCount - 1);
    }

    emit notificationClosed(tag);
}

void AutonomousNotificationService::cancelAllNotifications()
{
    logDebug("Cancelling all notifications");

    QStringList tags = m_activeNotifications.keys();
    for (const QString &tag : tags) {
        cancelNotification(tag);
    }

    // Clear badge
    if (m_badgeEnabled) {
        clearBadge();
    }
}

void AutonomousNotificationService::updateBadgeCount(int count)
{
    if (count < 0) count = 0;
    
    if (m_badgeCount != count) {
        m_badgeCount = count;
        updateSystemBadge();
        emit badgeCountChanged(count);
    }
}

void AutonomousNotificationService::clearBadge()
{
    updateBadgeCount(0);
}

void AutonomousNotificationService::updateSystemBadge()
{
    if (!m_launcherInterface || !m_launcherInterface->isValid()) {
        return;
    }

    // Update Aurora OS launcher badge
    QDBusMessage message = QDBusMessage::createMethodCall(
        "com.jolla.lipstick",
        "/com/jolla/lipstick",
        "com.jolla.lipstick",
        "setBadge"
    );
    
    message << "com.rechain.online" << m_badgeCount;
    
    QDBusConnection::sessionBus().asyncCall(message);
}

void AutonomousNotificationService::playNotificationSound(NotificationType type)
{
    if (!m_mediaPlayer || !m_soundEnabled) {
        return;
    }

    QString soundFile = getSoundFileForType(type);
    if (QFile::exists(soundFile)) {
        m_mediaPlayer->setMedia(QUrl::fromLocalFile(soundFile));
        m_mediaPlayer->play();
        logDebug(QString("Playing notification sound: %1").arg(soundFile));
    }
}

QString AutonomousNotificationService::getSoundFileForType(NotificationType type) const
{
    return m_soundFiles.value(type, m_soundFiles.value(MESSAGE));
}

void AutonomousNotificationService::triggerVibration()
{
    if (!m_systemInterface || !m_systemInterface->isValid()) {
        return;
    }

    // Trigger Aurora OS vibration
    QDBusMessage message = QDBusMessage::createMethodCall(
        "com.nokia.mce",
        "/com/nokia/mce/request",
        "com.nokia.mce.request",
        "req_vibrator_pattern_activate"
    );
    
    message << "PatternIncomingMessage";
    
    QDBusConnection::systemBus().asyncCall(message);
}

QString AutonomousNotificationService::generateNotificationTag(NotificationType type, const QString &identifier)
{
    QString typeStr = QString::number(static_cast<int>(type));
    if (identifier.isEmpty()) {
        return QString("rechain_%1_%2").arg(typeStr).arg(QDateTime::currentMSecsSinceEpoch());
    }
    return QString("rechain_%1_%2").arg(typeStr, identifier);
}

void AutonomousNotificationService::handleNotificationClicked(const QString &tag)
{
    logDebug(QString("Notification clicked: %1").arg(tag));
    
    m_totalNotificationsClicked++;
    
    if (m_clickCallback) {
        m_clickCallback(tag);
    }
    
    emit notificationClicked(tag);
}

void AutonomousNotificationService::handleNotificationActionTriggered(const QString &tag, const QString &action)
{
    logDebug(QString("Notification action triggered: %1 -> %2").arg(tag, action));
    
    if (m_actionCallback) {
        m_actionCallback(tag, action);
    }
    
    emit notificationActionTriggered(tag, action);
}

void AutonomousNotificationService::handleNotificationClosed(const QString &tag)
{
    logDebug(QString("Notification closed: %1").arg(tag));
    
    cancelNotification(tag);
    
    if (m_closeCallback) {
        m_closeCallback(tag);
    }
}

void AutonomousNotificationService::cleanupExpiredNotifications()
{
    QDateTime now = QDateTime::currentDateTime();
    QStringList expiredTags;
    
    for (auto it = m_activeNotifications.begin(); it != m_activeNotifications.end(); ++it) {
        if (!it.value().persistent && 
            it.value().timestamp.secsTo(now) > (m_notificationTimeout / 1000)) {
            expiredTags.append(it.key());
        }
    }
    
    for (const QString &tag : expiredTags) {
        cancelNotification(tag);
    }
}

void AutonomousNotificationService::loadConfiguration()
{
    QSettings settings("REChain", "NotificationService");
    
    m_notificationsEnabled = settings.value("notificationsEnabled", true).toBool();
    m_soundEnabled = settings.value("soundEnabled", true).toBool();
    m_vibrationEnabled = settings.value("vibrationEnabled", true).toBool();
    m_badgeEnabled = settings.value("badgeEnabled", true).toBool();
    m_soundPath = settings.value("soundPath", m_soundPath).toString();
    m_maxNotifications = settings.value("maxNotifications", 10).toInt();
    m_notificationTimeout = settings.value("notificationTimeout", 5000).toInt();
}

void AutonomousNotificationService::saveConfiguration()
{
    QSettings settings("REChain", "NotificationService");
    
    settings.setValue("notificationsEnabled", m_notificationsEnabled);
    settings.setValue("soundEnabled", m_soundEnabled);
    settings.setValue("vibrationEnabled", m_vibrationEnabled);
    settings.setValue("badgeEnabled", m_badgeEnabled);
    settings.setValue("soundPath", m_soundPath);
    settings.setValue("maxNotifications", m_maxNotifications);
    settings.setValue("notificationTimeout", m_notificationTimeout);
}

QVariantMap AutonomousNotificationService::getStatistics() const
{
    QVariantMap stats;
    stats["totalNotificationsShown"] = m_totalNotificationsShown;
    stats["totalNotificationsClicked"] = m_totalNotificationsClicked;
    stats["activeNotifications"] = m_activeNotifications.size();
    stats["badgeCount"] = m_badgeCount;
    stats["lastNotificationTime"] = m_lastNotificationTime.toString(Qt::ISODate);
    stats["notificationsEnabled"] = m_notificationsEnabled;
    stats["soundEnabled"] = m_soundEnabled;
    stats["vibrationEnabled"] = m_vibrationEnabled;
    
    return stats;
}

void AutonomousNotificationService::logDebug(const QString &message) const
{
    if (m_debugLogging) {
        qDebug() << "[AutonomousNotificationService]" << message;
    }
}

// Setter implementations
void AutonomousNotificationService::setNotificationsEnabled(bool enabled)
{
    if (m_notificationsEnabled != enabled) {
        m_notificationsEnabled = enabled;
        if (!enabled) {
            cancelAllNotifications();
        }
    }
}

void AutonomousNotificationService::setSoundEnabled(bool enabled)
{
    m_soundEnabled = enabled;
}

void AutonomousNotificationService::setVibrationEnabled(bool enabled)
{
    m_vibrationEnabled = enabled;
}

void AutonomousNotificationService::setBadgeEnabled(bool enabled)
{
    m_badgeEnabled = enabled;
    if (!enabled) {
        clearBadge();
    }
}

void AutonomousNotificationService::setSoundPath(const QString &path)
{
    m_soundPath = path;
    loadNotificationSounds();
}

// Callback setters
void AutonomousNotificationService::setNotificationClickCallback(NotificationClickCallback callback)
{
    m_clickCallback = callback;
}

void AutonomousNotificationService::setNotificationActionCallback(NotificationActionCallback callback)
{
    m_actionCallback = callback;
}

void AutonomousNotificationService::setNotificationCloseCallback(NotificationCloseCallback callback)
{
    m_closeCallback = callback;
}

void AutonomousNotificationService::setNotificationErrorCallback(NotificationErrorCallback callback)
{
    m_errorCallback = callback;
}

QStringList AutonomousNotificationService::getActiveNotifications() const
{
    return m_activeNotifications.keys();
}

void AutonomousNotificationService::cancelNotificationsByType(NotificationType type)
{
    QStringList tagsToCancel;
    
    for (auto it = m_activeNotifications.begin(); it != m_activeNotifications.end(); ++it) {
        if (it.value().type == type) {
            tagsToCancel.append(it.key());
        }
    }
    
    for (const QString &tag : tagsToCancel) {
        cancelNotification(tag);
    }
}
