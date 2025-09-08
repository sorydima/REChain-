#ifndef AURORA_SYSTEM_INTEGRATION_H
#define AURORA_SYSTEM_INTEGRATION_H

#include <QObject>
#include <QDBusInterface>
#include <QDBusConnection>
#include <QDBusMessage>
#include <QDBusReply>
#include <QTimer>
#include <QVariant>
#include <QDateTime>
#include <QFileSystemWatcher>
#include <QSettings>
#include <QNetworkConfigurationManager>
#include <QBatteryInfo>
#include <QDeviceInfo>
#include <QSystemInfo>
#include <QCompass>
#include <QAccelerometer>
#include <QAmbientLightSensor>
#include <QProximitySensor>
#include <functional>

/**
 * REChain Aurora OS System Integration
 * Provides deep integration with Aurora OS system services and hardware
 * Handles device management, system events, and platform-specific features
 */

class AuroraSystemIntegration : public QObject
{
    Q_OBJECT

public:
    // System event types
    enum SystemEvent {
        DEVICE_LOCKED = 0,
        DEVICE_UNLOCKED = 1,
        BATTERY_LOW = 2,
        BATTERY_CRITICAL = 3,
        NETWORK_CONNECTED = 4,
        NETWORK_DISCONNECTED = 5,
        ORIENTATION_CHANGED = 6,
        THEME_CHANGED = 7,
        LOCALE_CHANGED = 8,
        MEMORY_WARNING = 9,
        STORAGE_LOW = 10,
        INCOMING_CALL = 11,
        CALL_ENDED = 12
    };
    Q_ENUM(SystemEvent)

    // Device orientation
    enum DeviceOrientation {
        PORTRAIT = 0,
        LANDSCAPE = 1,
        PORTRAIT_INVERTED = 2,
        LANDSCAPE_INVERTED = 3,
        FACE_UP = 4,
        FACE_DOWN = 5
    };
    Q_ENUM(DeviceOrientation)

    // Network type
    enum NetworkType {
        UNKNOWN_NETWORK = 0,
        ETHERNET = 1,
        WIFI = 2,
        MOBILE_2G = 3,
        MOBILE_3G = 4,
        MOBILE_4G = 5,
        MOBILE_5G = 6,
        BLUETOOTH = 7
    };
    Q_ENUM(NetworkType)

    // Battery status
    enum BatteryStatus {
        UNKNOWN_BATTERY = 0,
        CHARGING = 1,
        DISCHARGING = 2,
        NOT_CHARGING = 3,
        FULL = 4
    };
    Q_ENUM(BatteryStatus)

    // Callback types
    using SystemEventCallback = std::function<void(SystemEvent, const QVariantMap&)>;
    using DeviceEventCallback = std::function<void(const QString&, const QVariantMap&)>;

    explicit AuroraSystemIntegration(QObject *parent = nullptr);
    ~AuroraSystemIntegration();

    // Initialization and configuration
    Q_INVOKABLE bool initialize(const QVariantMap &config = QVariantMap());
    Q_INVOKABLE void shutdown();
    Q_INVOKABLE bool isInitialized() const { return m_initialized; }

    // Device information
    Q_INVOKABLE QVariantMap getDeviceInfo() const;
    Q_INVOKABLE QString getDeviceModel() const;
    Q_INVOKABLE QString getDeviceManufacturer() const;
    Q_INVOKABLE QString getOSVersion() const;
    Q_INVOKABLE QString getKernelVersion() const;
    Q_INVOKABLE QString getDeviceId() const;
    Q_INVOKABLE QString getIMEI() const;

    // System status
    Q_INVOKABLE QVariantMap getSystemStatus() const;
    Q_INVOKABLE bool isDeviceLocked() const;
    Q_INVOKABLE DeviceOrientation getDeviceOrientation() const;
    Q_INVOKABLE int getBatteryLevel() const;
    Q_INVOKABLE BatteryStatus getBatteryStatus() const;
    Q_INVOKABLE bool isCharging() const;
    Q_INVOKABLE qint64 getAvailableMemory() const;
    Q_INVOKABLE qint64 getTotalMemory() const;
    Q_INVOKABLE qint64 getAvailableStorage() const;
    Q_INVOKABLE qint64 getTotalStorage() const;

    // Network information
    Q_INVOKABLE QVariantMap getNetworkInfo() const;
    Q_INVOKABLE bool isNetworkConnected() const;
    Q_INVOKABLE NetworkType getNetworkType() const;
    Q_INVOKABLE QString getNetworkOperator() const;
    Q_INVOKABLE int getSignalStrength() const;
    Q_INVOKABLE QString getWifiSSID() const;
    Q_INVOKABLE QString getIPAddress() const;

    // Display and UI
    Q_INVOKABLE QVariantMap getDisplayInfo() const;
    Q_INVOKABLE QSize getScreenSize() const;
    Q_INVOKABLE qreal getScreenDensity() const;
    Q_INVOKABLE bool isDarkTheme() const;
    Q_INVOKABLE QString getCurrentLocale() const;
    Q_INVOKABLE void setScreenBrightness(int brightness);
    Q_INVOKABLE int getScreenBrightness() const;

    // System controls
    Q_INVOKABLE void lockDevice();
    Q_INVOKABLE void unlockDevice();
    Q_INVOKABLE void setDeviceOrientation(DeviceOrientation orientation);
    Q_INVOKABLE void enableAutoRotation(bool enabled);
    Q_INVOKABLE bool isAutoRotationEnabled() const;
    Q_INVOKABLE void setKeepScreenOn(bool keepOn);
    Q_INVOKABLE bool isKeepScreenOn() const;

    // Vibration and haptics
    Q_INVOKABLE void vibrate(int duration = 200);
    Q_INVOKABLE void vibratePattern(const QList<int> &pattern);
    Q_INVOKABLE void playHapticFeedback(const QString &type = "impact");
    Q_INVOKABLE bool isVibrationSupported() const;

    // Audio controls
    Q_INVOKABLE void setSystemVolume(int volume, const QString &stream = "media");
    Q_INVOKABLE int getSystemVolume(const QString &stream = "media") const;
    Q_INVOKABLE void muteSystem(bool mute);
    Q_INVOKABLE bool isSystemMuted() const;
    Q_INVOKABLE void setRingerMode(const QString &mode); // silent, vibrate, normal

    // Sensors
    Q_INVOKABLE void enableSensors(bool enabled);
    Q_INVOKABLE bool areSensorsEnabled() const;
    Q_INVOKABLE QVariantMap getSensorData() const;
    Q_INVOKABLE void startSensorMonitoring();
    Q_INVOKABLE void stopSensorMonitoring();

    // File system integration
    Q_INVOKABLE void registerFileAssociation(const QString &mimeType, const QString &description);
    Q_INVOKABLE void unregisterFileAssociation(const QString &mimeType);
    Q_INVOKABLE QStringList getSupportedMimeTypes() const;
    Q_INVOKABLE void openFile(const QString &filePath);
    Q_INVOKABLE void shareFile(const QString &filePath, const QString &mimeType = QString());

    // Application lifecycle
    Q_INVOKABLE void registerForSystemEvents();
    Q_INVOKABLE void unregisterFromSystemEvents();
    Q_INVOKABLE void setApplicationVisible(bool visible);
    Q_INVOKABLE bool isApplicationVisible() const;
    Q_INVOKABLE void bringToForeground();
    Q_INVOKABLE void sendToBackground();

    // System integration
    Q_INVOKABLE void addToLauncher(const QString &name, const QString &icon, const QString &command);
    Q_INVOKABLE void removeFromLauncher(const QString &name);
    Q_INVOKABLE void createDesktopShortcut(const QString &name, const QString &icon, const QString &command);
    Q_INVOKABLE void setDefaultApplication(const QString &mimeType);

    // Privacy and permissions
    Q_INVOKABLE QStringList getRequiredPermissions() const;
    Q_INVOKABLE bool hasPermission(const QString &permission) const;
    Q_INVOKABLE void requestPermission(const QString &permission);
    Q_INVOKABLE QVariantMap getPermissionStatus() const;

    // System notifications integration
    Q_INVOKABLE void registerNotificationCategory(const QString &category, const QString &description);
    Q_INVOKABLE void setNotificationSound(const QString &category, const QString &soundPath);
    Q_INVOKABLE void enableNotificationLED(bool enabled);
    Q_INVOKABLE void setNotificationLEDColor(const QString &color);

    // Event callbacks
    void setSystemEventCallback(SystemEventCallback callback);
    void setDeviceEventCallback(DeviceEventCallback callback);

    // Statistics and monitoring
    Q_INVOKABLE QVariantMap getSystemStatistics() const;
    Q_INVOKABLE void enableSystemMonitoring(bool enabled);
    Q_INVOKABLE bool isSystemMonitoringEnabled() const;

signals:
    void systemEventOccurred(SystemEvent event, const QVariantMap &data);
    void deviceEventOccurred(const QString &event, const QVariantMap &data);
    void batteryLevelChanged(int level);
    void batteryStatusChanged(BatteryStatus status);
    void networkStatusChanged(bool connected, NetworkType type);
    void orientationChanged(DeviceOrientation orientation);
    void themeChanged(bool isDark);
    void localeChanged(const QString &locale);
    void memoryWarning(qint64 availableMemory);
    void storageWarning(qint64 availableStorage);
    void permissionGranted(const QString &permission);
    void permissionDenied(const QString &permission);

private slots:
    void handleDBusSignal(const QDBusMessage &message);
    void handleBatteryLevelChanged(int level);
    void handleNetworkConfigurationChanged();
    void handleOrientationChanged();
    void handleSystemThemeChanged();
    void monitorSystemResources();
    void handleSensorReading();

private:
    // Core functionality
    void setupDBusConnections();
    void setupSystemMonitoring();
    void setupSensorMonitoring();
    void registerSystemServices();
    void initializeDeviceInfo();
    void loadSystemConfiguration();
    void saveSystemConfiguration();

    // Aurora OS specific methods
    void setupAuroraIntegration();
    void registerAuroraServices();
    void handleAuroraSystemEvents();
    QVariantMap getAuroraDeviceInfo() const;
    void configureAuroraPermissions();
    void setupAuroraNotifications();

    // D-Bus interfaces
    void initializeDBusInterfaces();
    void connectToSystemServices();
    void handleSystemServiceSignals();

    // Sensor management
    void initializeSensors();
    void configureSensorSettings();
    QVariantMap collectSensorData() const;

    // System monitoring
    void startResourceMonitoring();
    void stopResourceMonitoring();
    void checkSystemHealth();

    // Utility methods
    void debugLog(const QString &message) const;
    QString getSystemProperty(const QString &property) const;
    void setSystemProperty(const QString &property, const QVariant &value);

    // Member variables
    bool m_initialized;
    bool m_debugMode;
    bool m_systemMonitoringEnabled;
    bool m_sensorsEnabled;
    bool m_autoRotationEnabled;
    bool m_keepScreenOn;

    QString m_deviceId;
    QString m_deviceModel;
    QString m_deviceManufacturer;
    QString m_osVersion;
    QString m_kernelVersion;

    // D-Bus interfaces
    QDBusInterface *m_systemInterface;
    QDBusInterface *m_batteryInterface;
    QDBusInterface *m_networkInterface;
    QDBusInterface *m_displayInterface;
    QDBusInterface *m_audioInterface;
    QDBusInterface *m_vibrationInterface;
    QDBusInterface *m_orientationInterface;
    QDBusInterface *m_notificationInterface;

    // System monitoring
    QTimer *m_monitoringTimer;
    QNetworkConfigurationManager *m_networkManager;
    QBatteryInfo *m_batteryInfo;
    QDeviceInfo *m_deviceInfo;

    // Sensors
    QCompass *m_compass;
    QAccelerometer *m_accelerometer;
    QAmbientLightSensor *m_lightSensor;
    QProximitySensor *m_proximitySensor;

    // File system
    QFileSystemWatcher *m_fileWatcher;

    // Event callbacks
    SystemEventCallback m_systemEventCallback;
    DeviceEventCallback m_deviceEventCallback;

    // Cached data
    mutable QVariantMap m_cachedDeviceInfo;
    mutable QVariantMap m_cachedSystemStatus;
    mutable QVariantMap m_cachedNetworkInfo;
    DeviceOrientation m_currentOrientation;
    int m_batteryLevel;
    BatteryStatus m_batteryStatus;
    bool m_networkConnected;
    NetworkType m_networkType;

    // Statistics
    mutable QVariantMap m_systemStatistics;
    QDateTime m_lastSystemCheck;
    int m_systemEventCount;
    int m_deviceEventCount;
};

#endif // AURORA_SYSTEM_INTEGRATION_H
