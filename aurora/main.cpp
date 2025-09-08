#include <flutter/flutter_aurora.h>
#include "generated_plugin_registrant.h"
#include "AutonomousNotificationService.h"
#include "CrashReportingManager.h"
#include "AuroraSystemIntegration.h"
#include <QApplication>
#include <QDebug>
#include <QDir>
#include <QStandardPaths>
#include <memory>

// Global service instances
std::unique_ptr<CrashReportingManager> g_crashReporter;
std::unique_ptr<AutonomousNotificationService> g_notificationService;
std::unique_ptr<AuroraSystemIntegration> g_systemIntegration;

void initializeServices() {
    qDebug() << "Initializing REChain Aurora OS services...";
    
    try {
        // Initialize crash reporting first
        g_crashReporter = std::make_unique<CrashReportingManager>();
        QVariantMap crashConfig;
        crashConfig["appName"] = "REChain";
        crashConfig["appVersion"] = RECHAIN_VERSION;
        crashConfig["environment"] = "production";
        crashConfig["autoSubmitCrashes"] = true;
        
        if (!g_crashReporter->initialize(crashConfig)) {
            qWarning() << "Failed to initialize crash reporting manager";
        } else {
            qDebug() << "Crash reporting manager initialized";
        }
        
        // Initialize system integration
        g_systemIntegration = std::make_unique<AuroraSystemIntegration>();
        QVariantMap systemConfig;
        systemConfig["enableSystemMonitoring"] = true;
        systemConfig["enableSensors"] = true;
        
        if (!g_systemIntegration->initialize(systemConfig)) {
            qWarning() << "Failed to initialize system integration";
        } else {
            qDebug() << "System integration initialized";
        }
        
        // Initialize notification service
        g_notificationService = std::make_unique<AutonomousNotificationService>();
        QVariantMap notificationConfig;
        notificationConfig["appName"] = "REChain";
        notificationConfig["appIcon"] = "/usr/share/icons/hicolor/128x128/apps/com.rechain.online.png";
        notificationConfig["soundPath"] = "/usr/share/sounds/rechain/";
        notificationConfig["maxNotifications"] = 50;
        notificationConfig["notificationTimeout"] = 5000;
        notificationConfig["enableDebugLogging"] = false;
        
        if (!g_notificationService->initialize(notificationConfig)) {
            qWarning() << "Failed to initialize notification service";
        } else {
            qDebug() << "Notification service initialized";
        }
        
        qDebug() << "All REChain Aurora OS services initialized successfully";
        
    } catch (const std::exception &e) {
        qCritical() << "Exception during service initialization:" << e.what();
        if (g_crashReporter) {
            g_crashReporter->recordCrash(QString("Service initialization failed: %1").arg(e.what()));
        }
    }
}

void shutdownServices() {
    qDebug() << "Shutting down REChain Aurora OS services...";
    
    if (g_notificationService) {
        g_notificationService->shutdown();
        g_notificationService.reset();
    }
    
    if (g_systemIntegration) {
        g_systemIntegration->shutdown();
        g_systemIntegration.reset();
    }
    
    if (g_crashReporter) {
        g_crashReporter->shutdown();
        g_crashReporter.reset();
    }
    
    qDebug() << "All services shut down";
}

int main(int argc, char *argv[]) {
    // Initialize Qt Application first for our services
    QApplication qtApp(argc, argv);
    qtApp.setApplicationName("REChain");
    qtApp.setApplicationVersion(RECHAIN_VERSION);
    qtApp.setOrganizationName("REChain Team");
    qtApp.setOrganizationDomain("rechain.com");
    
    // Set up application directories
    QDir::setCurrent(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));
    
    qDebug() << "Starting REChain Aurora OS application...";
    qDebug() << "Version:" << RECHAIN_VERSION;
    qDebug() << "Build:" << __DATE__ << __TIME__;
    
    // Initialize our custom services
    initializeServices();
    
    // Initialize Aurora Flutter application
    try {
        aurora::Initialize(argc, argv);
        aurora::RegisterPlugins();
        
        // Set up cleanup on application exit
        QObject::connect(&qtApp, &QApplication::aboutToQuit, []() {
            shutdownServices();
        });
        
        qDebug() << "Launching Flutter application...";
        aurora::Launch();
        
    } catch (const std::exception &e) {
        qCritical() << "Exception during Flutter initialization:" << e.what();
        if (g_crashReporter) {
            g_crashReporter->recordCrash(QString("Flutter initialization failed: %1").arg(e.what()));
        }
        shutdownServices();
        return 1;
    }
    
    // This should not be reached in normal execution
    shutdownServices();
    return 0;
}
