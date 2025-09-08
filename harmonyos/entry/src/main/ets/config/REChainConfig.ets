import hilog from '@ohos.hilog';
import preferences from '@ohos.data.preferences';
import { BusinessError } from '@ohos.base';

/**
 * REChain HarmonyOS Configuration Manager
 * Centralized configuration management for the application
 */

export interface AppConfig {
  // Application settings
  appName: string;
  appVersion: string;
  environment: string;
  debugMode: boolean;

  // Server settings
  defaultHomeserver: string;
  syncTimeout: number;
  retryAttempts: number;
  retryDelay: number;

  // Notification settings
  notificationsEnabled: boolean;
  soundEnabled: boolean;
  vibrationEnabled: boolean;
  badgeEnabled: boolean;
  maxNotifications: number;
  notificationTimeout: number;

  // System integration settings
  systemMonitoringEnabled: boolean;
  sensorMonitoringEnabled: boolean;
  batteryMonitoringEnabled: boolean;
  networkMonitoringEnabled: boolean;
  performanceMonitoringEnabled: boolean;

  // Crash reporting settings
  crashReportingEnabled: boolean;
  autoSubmitCrashes: boolean;
  maxBreadcrumbs: number;
  maxPendingReports: number;
  submissionEndpoint: string;

  // Security settings
  encryptionEnabled: boolean;
  deviceVerificationRequired: boolean;
  crossSigningEnabled: boolean;
  keyBackupEnabled: boolean;

  // UI settings
  theme: string;
  fontSize: string;
  animationsEnabled: boolean;
  hapticFeedbackEnabled: boolean;

  // Performance settings
  maxCacheSize: number;
  imageCompressionQuality: number;
  preloadMessages: boolean;
  backgroundSyncEnabled: boolean;
}

export class REChainConfig {
  private static instance: REChainConfig | null = null;
  private preferences: preferences.Preferences | null = null;
  private config: AppConfig | null = null;
  private initialized: boolean = false;

  private constructor() {
    hilog.info(0x0000, 'REChainConfig', 'REChainConfig instance created');
  }

  public static getInstance(): REChainConfig {
    if (!REChainConfig.instance) {
      REChainConfig.instance = new REChainConfig();
    }
    return REChainConfig.instance;
  }

  public async initialize(): Promise<boolean> {
    try {
      hilog.info(0x0000, 'REChainConfig', 'Initializing configuration manager...');

      // Initialize preferences
      const context = getContext();
      this.preferences = await preferences.getPreferences(context, 'rechain_config');

      // Load configuration
      await this.loadConfiguration();

      this.initialized = true;

      hilog.info(0x0000, 'REChainConfig', 'Configuration manager initialized successfully');
      return true;

    } catch (error) {
      hilog.error(0x0000, 'REChainConfig', 'Failed to initialize: %{public}s', JSON.stringify(error));
      return false;
    }
  }

  public async loadConfiguration(): Promise<void> {
    if (!this.preferences) {
      throw new Error('Preferences not initialized');
    }

    try {
      // Load configuration with defaults
      this.config = {
        // Application settings
        appName: await this.getString('appName', 'REChain'),
        appVersion: await this.getString('appVersion', '4.1.4'),
        environment: await this.getString('environment', 'production'),
        debugMode: await this.getBoolean('debugMode', false),

        // Server settings
        defaultHomeserver: await this.getString('defaultHomeserver', 'matrix.org'),
        syncTimeout: await this.getNumber('syncTimeout', 30000),
        retryAttempts: await this.getNumber('retryAttempts', 3),
        retryDelay: await this.getNumber('retryDelay', 1000),

        // Notification settings
        notificationsEnabled: await this.getBoolean('notificationsEnabled', true),
        soundEnabled: await this.getBoolean('soundEnabled', true),
        vibrationEnabled: await this.getBoolean('vibrationEnabled', true),
        badgeEnabled: await this.getBoolean('badgeEnabled', true),
        maxNotifications: await this.getNumber('maxNotifications', 50),
        notificationTimeout: await this.getNumber('notificationTimeout', 5000),

        // System integration settings
        systemMonitoringEnabled: await this.getBoolean('systemMonitoringEnabled', true),
        sensorMonitoringEnabled: await this.getBoolean('sensorMonitoringEnabled', true),
        batteryMonitoringEnabled: await this.getBoolean('batteryMonitoringEnabled', true),
        networkMonitoringEnabled: await this.getBoolean('networkMonitoringEnabled', true),
        performanceMonitoringEnabled: await this.getBoolean('performanceMonitoringEnabled', true),

        // Crash reporting settings
        crashReportingEnabled: await this.getBoolean('crashReportingEnabled', true),
        autoSubmitCrashes: await this.getBoolean('autoSubmitCrashes', true),
        maxBreadcrumbs: await this.getNumber('maxBreadcrumbs', 50),
        maxPendingReports: await this.getNumber('maxPendingReports', 100),
        submissionEndpoint: await this.getString('submissionEndpoint', 'https://api.rechain.com/crash-reports'),

        // Security settings
        encryptionEnabled: await this.getBoolean('encryptionEnabled', true),
        deviceVerificationRequired: await this.getBoolean('deviceVerificationRequired', true),
        crossSigningEnabled: await this.getBoolean('crossSigningEnabled', true),
        keyBackupEnabled: await this.getBoolean('keyBackupEnabled', true),

        // UI settings
        theme: await this.getString('theme', 'auto'),
        fontSize: await this.getString('fontSize', 'medium'),
        animationsEnabled: await this.getBoolean('animationsEnabled', true),
        hapticFeedbackEnabled: await this.getBoolean('hapticFeedbackEnabled', true),

        // Performance settings
        maxCacheSize: await this.getNumber('maxCacheSize', 100 * 1024 * 1024), // 100MB
        imageCompressionQuality: await this.getNumber('imageCompressionQuality', 80),
        preloadMessages: await this.getBoolean('preloadMessages', true),
        backgroundSyncEnabled: await this.getBoolean('backgroundSyncEnabled', true)
      };

      hilog.info(0x0000, 'REChainConfig', 'Configuration loaded successfully');

    } catch (error) {
      hilog.error(0x0000, 'REChainConfig', 'Failed to load configuration: %{public}s', JSON.stringify(error));
      throw error;
    }
  }

  public async saveConfiguration(): Promise<void> {
    if (!this.preferences || !this.config) {
      throw new Error('Configuration not initialized');
    }

    try {
      // Save all configuration values
      const configEntries = Object.entries(this.config);
      
      for (const [key, value] of configEntries) {
        if (typeof value === 'string') {
          await this.preferences.put(key, value);
        } else if (typeof value === 'number') {
          await this.preferences.put(key, value);
        } else if (typeof value === 'boolean') {
          await this.preferences.put(key, value);
        }
      }

      // Flush changes to storage
      await this.preferences.flush();

      hilog.info(0x0000, 'REChainConfig', 'Configuration saved successfully');

    } catch (error) {
      hilog.error(0x0000, 'REChainConfig', 'Failed to save configuration: %{public}s', JSON.stringify(error));
      throw error;
    }
  }

  public getConfig(): AppConfig | null {
    return this.config;
  }

  public async updateConfig(updates: Partial<AppConfig>): Promise<void> {
    if (!this.config) {
      throw new Error('Configuration not loaded');
    }

    try {
      // Update configuration object
      this.config = { ...this.config, ...updates };

      // Save to storage
      await this.saveConfiguration();

      hilog.info(0x0000, 'REChainConfig', 'Configuration updated successfully');

    } catch (error) {
      hilog.error(0x0000, 'REChainConfig', 'Failed to update configuration: %{public}s', JSON.stringify(error));
      throw error;
    }
  }

  public async resetToDefaults(): Promise<void> {
    if (!this.preferences) {
      throw new Error('Preferences not initialized');
    }

    try {
      // Clear all preferences
      await this.preferences.clear();
      await this.preferences.flush();

      // Reload with defaults
      await this.loadConfiguration();

      hilog.info(0x0000, 'REChainConfig', 'Configuration reset to defaults');

    } catch (error) {
      hilog.error(0x0000, 'REChainConfig', 'Failed to reset configuration: %{public}s', JSON.stringify(error));
      throw error;
    }
  }

  // Convenience methods for specific config sections
  public getNotificationConfig() {
    if (!this.config) return null;
    
    return {
      appName: this.config.appName,
      enableSound: this.config.soundEnabled,
      enableVibration: this.config.vibrationEnabled,
      enableBadge: this.config.badgeEnabled,
      maxNotifications: this.config.maxNotifications,
      notificationTimeout: this.config.notificationTimeout,
      enableDebugLogging: this.config.debugMode
    };
  }

  public getCrashReporterConfig() {
    if (!this.config) return null;
    
    return {
      appName: this.config.appName,
      appVersion: this.config.appVersion,
      environment: this.config.environment,
      autoSubmitCrashes: this.config.autoSubmitCrashes,
      enableDebugLogging: this.config.debugMode,
      maxBreadcrumbs: this.config.maxBreadcrumbs,
      maxPendingReports: this.config.maxPendingReports,
      submissionEndpoint: this.config.submissionEndpoint
    };
  }

  public getSystemIntegrationConfig() {
    if (!this.config) return null;
    
    return {
      enableSystemMonitoring: this.config.systemMonitoringEnabled,
      enableSensorMonitoring: this.config.sensorMonitoringEnabled,
      enableBatteryMonitoring: this.config.batteryMonitoringEnabled,
      enableNetworkMonitoring: this.config.networkMonitoringEnabled,
      enablePerformanceMonitoring: this.config.performanceMonitoringEnabled
    };
  }

  // Private helper methods
  private async getString(key: string, defaultValue: string): Promise<string> {
    if (!this.preferences) return defaultValue;
    
    try {
      return await this.preferences.get(key, defaultValue) as string;
    } catch (error) {
      return defaultValue;
    }
  }

  private async getNumber(key: string, defaultValue: number): Promise<number> {
    if (!this.preferences) return defaultValue;
    
    try {
      return await this.preferences.get(key, defaultValue) as number;
    } catch (error) {
      return defaultValue;
    }
  }

  private async getBoolean(key: string, defaultValue: boolean): Promise<boolean> {
    if (!this.preferences) return defaultValue;
    
    try {
      return await this.preferences.get(key, defaultValue) as boolean;
    } catch (error) {
      return defaultValue;
    }
  }

  // Getters
  public isInitialized(): boolean {
    return this.initialized;
  }

  public isDebugMode(): boolean {
    return this.config?.debugMode || false;
  }

  public getAppName(): string {
    return this.config?.appName || 'REChain';
  }

  public getAppVersion(): string {
    return this.config?.appVersion || '4.1.4';
  }

  public getEnvironment(): string {
    return this.config?.environment || 'production';
  }
}
