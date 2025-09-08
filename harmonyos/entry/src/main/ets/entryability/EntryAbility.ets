import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { REChainNotificationManager } from '../services/REChainNotificationManager';
import { REChainCrashReporter } from '../services/REChainCrashReporter';
import { REChainSystemIntegration } from '../services/REChainSystemIntegration';

/**
 * REChain HarmonyOS Entry Ability
 * Main application entry point with native service integration
 */
export default class EntryAbility extends UIAbility {
  private notificationManager: REChainNotificationManager | null = null;
  private crashReporter: REChainCrashReporter | null = null;
  private systemIntegration: REChainSystemIntegration | null = null;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'REChain HarmonyOS Application Starting...');
    
    try {
      // Initialize crash reporting first
      this.initializeCrashReporting();
      
      // Initialize system integration
      this.initializeSystemIntegration();
      
      // Initialize notification system
      this.initializeNotificationSystem();
      
      hilog.info(0x0000, 'REChain', '%{public}s', 'All native services initialized successfully');
      
    } catch (error) {
      hilog.error(0x0000, 'REChain', 'Failed to initialize services: %{public}s', JSON.stringify(error));
      if (this.crashReporter) {
        this.crashReporter.recordError('Service initialization failed', { error: error.toString() });
      }
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'REChain Application Destroying...');
    
    try {
      // Shutdown services in reverse order
      if (this.notificationManager) {
        this.notificationManager.shutdown();
        this.notificationManager = null;
      }
      
      if (this.systemIntegration) {
        this.systemIntegration.shutdown();
        this.systemIntegration = null;
      }
      
      if (this.crashReporter) {
        this.crashReporter.shutdown();
        this.crashReporter = null;
      }
      
      hilog.info(0x0000, 'REChain', '%{public}s', 'All services shut down successfully');
      
    } catch (error) {
      hilog.error(0x0000, 'REChain', 'Error during shutdown: %{public}s', JSON.stringify(error));
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'onWindowStageCreate');
    
    try {
      // Configure main window
      windowStage.loadContent('pages/Index', (err, data) => {
        if (err.code) {
          hilog.error(0x0000, 'REChain', 'Failed to load content: %{public}s', JSON.stringify(err));
          if (this.crashReporter) {
            this.crashReporter.recordError('Failed to load main content', { error: err });
          }
          return;
        }
        
        hilog.info(0x0000, 'REChain', '%{public}s', 'Main content loaded successfully');
        
        // Configure window properties
        this.configureMainWindow(windowStage);
      });
      
    } catch (error) {
      hilog.error(0x0000, 'REChain', 'Window stage creation error: %{public}s', JSON.stringify(error));
      if (this.crashReporter) {
        this.crashReporter.recordError('Window stage creation failed', { error: error.toString() });
      }
    }
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'Application moved to foreground');
    
    try {
      // Notify services about foreground state
      if (this.systemIntegration) {
        this.systemIntegration.onApplicationForeground();
      }
      
      if (this.notificationManager) {
        this.notificationManager.onApplicationForeground();
      }
      
    } catch (error) {
      hilog.error(0x0000, 'REChain', 'Foreground transition error: %{public}s', JSON.stringify(error));
    }
  }

  onBackground(): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'Application moved to background');
    
    try {
      // Notify services about background state
      if (this.systemIntegration) {
        this.systemIntegration.onApplicationBackground();
      }
      
      if (this.notificationManager) {
        this.notificationManager.onApplicationBackground();
      }
      
    } catch (error) {
      hilog.error(0x0000, 'REChain', 'Background transition error: %{public}s', JSON.stringify(error));
    }
  }

  private initializeCrashReporting(): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'Initializing crash reporting...');
    
    this.crashReporter = new REChainCrashReporter();
    const crashConfig = {
      appName: 'REChain',
      appVersion: '4.1.4',
      environment: 'production',
      autoSubmitCrashes: true,
      enableDebugLogging: false
    };
    
    if (!this.crashReporter.initialize(crashConfig)) {
      hilog.error(0x0000, 'REChain', '%{public}s', 'Failed to initialize crash reporting');
    } else {
      hilog.info(0x0000, 'REChain', '%{public}s', 'Crash reporting initialized successfully');
    }
  }

  private initializeSystemIntegration(): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'Initializing system integration...');
    
    this.systemIntegration = new REChainSystemIntegration();
    const systemConfig = {
      enableSystemMonitoring: true,
      enableSensorMonitoring: true,
      enableBatteryMonitoring: true,
      enableNetworkMonitoring: true,
      enablePerformanceMonitoring: true
    };
    
    if (!this.systemIntegration.initialize(systemConfig)) {
      hilog.error(0x0000, 'REChain', '%{public}s', 'Failed to initialize system integration');
    } else {
      hilog.info(0x0000, 'REChain', '%{public}s', 'System integration initialized successfully');
    }
  }

  private initializeNotificationSystem(): void {
    hilog.info(0x0000, 'REChain', '%{public}s', 'Initializing notification system...');
    
    this.notificationManager = new REChainNotificationManager();
    const notificationConfig = {
      appName: 'REChain',
      enableSound: true,
      enableVibration: true,
      enableBadge: true,
      maxNotifications: 50,
      notificationTimeout: 5000,
      enableDebugLogging: false
    };
    
    if (!this.notificationManager.initialize(notificationConfig)) {
      hilog.error(0x0000, 'REChain', '%{public}s', 'Failed to initialize notification system');
    } else {
      hilog.info(0x0000, 'REChain', '%{public}s', 'Notification system initialized successfully');
    }
  }

  private configureMainWindow(windowStage: window.WindowStage): void {
    try {
      windowStage.getMainWindow((err, windowClass) => {
        if (err.code) {
          hilog.error(0x0000, 'REChain', 'Failed to get main window: %{public}s', JSON.stringify(err));
          return;
        }
        
        // Set window properties
        windowClass.setUIContent('pages/Index');
        windowClass.setWindowSystemBarEnable(['status', 'navigation']);
        windowClass.setWindowLayoutFullScreen(false);
        
        // Set window background
        windowClass.setWindowBackgroundColor('#FFFFFF');
        
        hilog.info(0x0000, 'REChain', '%{public}s', 'Main window configured successfully');
      });
      
    } catch (error) {
      hilog.error(0x0000, 'REChain', 'Window configuration error: %{public}s', JSON.stringify(error));
    }
  }

  // Public methods for service access
  public getNotificationManager(): REChainNotificationManager | null {
    return this.notificationManager;
  }

  public getCrashReporter(): REChainCrashReporter | null {
    return this.crashReporter;
  }

  public getSystemIntegration(): REChainSystemIntegration | null {
    return this.systemIntegration;
  }
}
