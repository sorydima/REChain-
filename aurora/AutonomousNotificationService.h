#ifndef AUTONOMOUS_NOTIFICATION_SERVICE_H
#define AUTONOMOUS_NOTIFICATION_SERVICE_H

#include <QObject>
#include <QDBusInterface>
#include <QDBusReply>
#include <QTimer>
#include <QHash>
#include <QVariant>
#include <QDateTime>
#include <QMediaPlayer>
#include <QUrl>
#include <QStandardPaths>
#include <QDir>
#include <QDebug>
#include <functional>

/**
 * REChain Aurora OS Autonomous Notification Service
 * Provides comprehensive notification management for Aurora OS platform
 * Integrates with Aurora OS notification system and D-Bus services
 */

class AutonomousNotificationService : public QObject
{
    Q_OBJECT

public:
    // Notification types
    enum NotificationType {
        MESSAGE = 0,
        CALL = 1,
        MISSED_CALL = 2,
        USER_JOINED = 3,
        USER_LEFT = 4,
        FILE_UPLOAD = 5,
        ROOM_CREATED = 6,
        SYNC_ERROR = 7,
        LOGIN_SUCCESS = 8,
        DEVICE_VERIFICATION = 9,
        SPACE_JOINED = 10,
        SYSTEM = 11
    };
    Q_ENUM(NotificationType)

    // Notification priority levels
    enum Priority {
        LOW = 0,
        NORMAL = 1,
        HIGH = 2,
        CRITICAL = 3
    };
    Q_ENUM(Priority)

    // Event callback types
    using NotificationClickCallback = std::function<void(const QString&)>;
    using NotificationActionCallback = std::function<void(const QString&, const QString&)>;
    using NotificationCloseCallback = std::function<void(const QString&)>;
    using NotificationErrorCallback = std::function<void(const QString&, const QVariantMap&)>;

    explicit AutonomousNotificationService(QObject *parent = nullptr);
    ~AutonomousNotificationService();

    // Initialization and configuration
    Q_INVOKABLE bool initialize(const QVariantMap &config = QVariantMap());
    Q_INVOKABLE void shutdown();
    Q_INVOKABLE bool isInitialized() const { return m_initialized; }

    // Notification display methods
    Q_INVOKABLE void showMessageNotification(const QString &sender, const QString &message, 
                                           const QString &roomId, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showCallNotification(const QString &caller, const QString &callId, 
                                        bool isVideo, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showMissedCallNotification(const QString &caller, const QString &callId, 
                                              const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showUserJoinedNotification(const QString &user, const QString &roomName, 
                                              const QString &roomId, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showUserLeftNotification(const QString &user, const QString &roomName, 
                                            const QString &roomId, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showFileUploadNotification(const QString &fileName, const QString &sender, 
                                              const QString &roomId, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showRoomCreatedNotification(const QString &roomName, const QString &creator, 
                                               const QString &roomId, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showSyncErrorNotification(const QString &error, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showLoginSuccessNotification(const QString &userId, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showDeviceVerificationNotification(const QString &deviceName, const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showSpaceJoinedNotification(const QString &spaceName, const QString &spaceId, 
                                               const QVariantMap &options = QVariantMap());
    Q_INVOKABLE void showSystemNotification(const QString &title, const QString &message, 
                                          const QVariantMap &options = QVariantMap());

    // Notification management
    Q_INVOKABLE void cancelNotification(const QString &tag);
    Q_INVOKABLE void cancelAllNotifications();
    Q_INVOKABLE void cancelNotificationsByType(NotificationType type);
    Q_INVOKABLE QStringList getActiveNotifications() const;
    Q_INVOKABLE int getNotificationCount() const { return m_activeNotifications.size(); }

    // Configuration and settings
    Q_INVOKABLE void setNotificationsEnabled(bool enabled);
    Q_INVOKABLE bool areNotificationsEnabled() const { return m_notificationsEnabled; }
    Q_INVOKABLE void setSoundEnabled(bool enabled);
    Q_INVOKABLE bool isSoundEnabled() const { return m_soundEnabled; }
    Q_INVOKABLE void setVibrationEnabled(bool enabled);
    Q_INVOKABLE bool isVibrationEnabled() const { return m_vibrationEnabled; }
    Q_INVOKABLE void setBadgeEnabled(bool enabled);
    Q_INVOKABLE bool isBadgeEnabled() const { return m_badgeEnabled; }

    // Badge management
    Q_INVOKABLE void updateBadgeCount(int count);
    Q_INVOKABLE void clearBadge();
    Q_INVOKABLE int getBadgeCount() const { return m_badgeCount; }

    // Sound management
    Q_INVOKABLE void setSoundPath(const QString &path);
    Q_INVOKABLE QString getSoundPath() const { return m_soundPath; }
    Q_INVOKABLE void playNotificationSound(NotificationType type = MESSAGE);

    // Event handlers
    void setNotificationClickCallback(NotificationClickCallback callback);
    void setNotificationActionCallback(NotificationActionCallback callback);
    void setNotificationCloseCallback(NotificationCloseCallback callback);
    void setNotificationErrorCallback(NotificationErrorCallback callback);

    // Statistics and debugging
    Q_INVOKABLE QVariantMap getStatistics() const;
    Q_INVOKABLE void enableDebugLogging(bool enabled) { m_debugLogging = enabled; }

signals:
    void notificationClicked(const QString &tag);
    void notificationActionTriggered(const QString &tag, const QString &action);
    void notificationClosed(const QString &tag);
    void notificationError(const QString &error, const QVariantMap &data);
    void badgeCountChanged(int count);
    void notificationDisplayed(const QString &tag, NotificationType type);

private slots:
    void handleNotificationClicked(const QString &tag);
    void handleNotificationActionTriggered(const QString &tag, const QString &action);
    void handleNotificationClosed(const QString &tag);
    void handleDBusError(const QString &error);
    void cleanupExpiredNotifications();

private:
    struct NotificationData {
        QString tag;
        NotificationType type;
        QString title;
        QString body;
        QDateTime timestamp;
        QVariantMap options;
        bool persistent;
        Priority priority;
    };

    // Core functionality
    void displayNotification(const NotificationData &notification);
    QString generateNotificationTag(NotificationType type, const QString &identifier = QString());
    void setupDBusConnections();
    void registerDBusService();
    void updateSystemBadge();
    void triggerVibration();
    void logDebug(const QString &message) const;

    // Aurora OS specific methods
    void setupAuroraNotifications();
    void sendAuroraNotification(const NotificationData &notification);
    void updateAuroraLauncher();
    void handleAuroraSystemEvents();

    // Sound management
    void initializeSoundSystem();
    void loadNotificationSounds();
    QString getSoundFileForType(NotificationType type) const;

    // Configuration management
    void loadConfiguration();
    void saveConfiguration();
    QVariantMap getDefaultConfiguration() const;

    // Member variables
    bool m_initialized;
    bool m_notificationsEnabled;
    bool m_soundEnabled;
    bool m_vibrationEnabled;
    bool m_badgeEnabled;
    bool m_debugLogging;

    QString m_appName;
    QString m_iconPath;
    QString m_soundPath;
    int m_badgeCount;
    int m_maxNotifications;
    int m_notificationTimeout;

    // Aurora OS specific
    QDBusInterface *m_notificationInterface;
    QDBusInterface *m_launcherInterface;
    QDBusInterface *m_systemInterface;

    // Notification management
    QHash<QString, NotificationData> m_activeNotifications;
    QTimer *m_cleanupTimer;

    // Sound system
    QMediaPlayer *m_mediaPlayer;
    QHash<NotificationType, QString> m_soundFiles;

    // Event callbacks
    NotificationClickCallback m_clickCallback;
    NotificationActionCallback m_actionCallback;
    NotificationCloseCallback m_closeCallback;
    NotificationErrorCallback m_errorCallback;

    // Statistics
    mutable QVariantMap m_statistics;
    int m_totalNotificationsShown;
    int m_totalNotificationsClicked;
    QDateTime m_lastNotificationTime;
};

#endif // AUTONOMOUS_NOTIFICATION_SERVICE_H
