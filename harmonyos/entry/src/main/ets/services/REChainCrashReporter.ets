import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import http from '@ohos.net.http';
import deviceInfo from '@ohos.deviceInfo';
import batteryInfo from '@ohos.batteryInfo';
import { BusinessError } from '@ohos.base';

/**
 * REChain HarmonyOS Crash Reporter
 * Comprehensive crash reporting and error tracking system
 */

export interface CrashReporterConfig {
  appName: string;
  appVersion: string;
  environment: string;
  autoSubmitCrashes: boolean;
  enableDebugLogging: boolean;
  maxBreadcrumbs?: number;
  maxPendingReports?: number;
  submissionEndpoint?: string;
}

export interface ErrorContext {
  [key: string]: any;
}

export interface CrashReport {
  reportId: string;
  timestamp: number;
  errorMessage: string;
  stackTrace?: string;
  context: ErrorContext;
  breadcrumbs: Breadcrumb[];
  userInfo: UserInfo;
  deviceInfo: DeviceInfo;
  systemInfo: SystemInfo;
  sessionId: string;
}

export interface Breadcrumb {
  timestamp: number;
  message: string;
  category: string;
  level: BreadcrumbLevel;
  data?: Record<string, any>;
}

export interface UserInfo {
  userId?: string;
  email?: string;
  username?: string;
  identifiedAt?: number;
}

export interface DeviceInfo {
  deviceType: string;
  manufacturer: string;
  brand: string;
  marketName: string;
  productSeries: string;
  productModel: string;
  softwareModel: string;
  hardwareModel: string;
  hardwareProfile: string;
  serial: string;
  bootloaderVersion: string;
  abiList: string;
  securityPatchTag: string;
  displayVersion: string;
  incrementalVersion: string;
  osReleaseType: string;
  osVersion: string;
  sdkApiVersion: number;
  firstApiVersion: number;
}

export interface SystemInfo {
  batteryLevel: number;
  isCharging: boolean;
  availableMemory: number;
  totalMemory: number;
  cpuAbi: string;
  osVersion: string;
  buildVersion: string;
}

export enum LogLevel {
  TRACE = 0,
  DEBUG = 1,
  INFO = 2,
  WARNING = 3,
  ERROR = 4,
  FATAL = 5
}

export enum BreadcrumbLevel {
  DEBUG = 0,
  INFO = 1,
  WARNING = 2,
  ERROR = 3
}

export class REChainCrashReporter {
  private initialized: boolean = false;
  private config: CrashReporterConfig | null = null;
  private breadcrumbs: Breadcrumb[] = [];
  private userInfo: UserInfo = {};
  private sessionId: string = '';
  private pendingReports: CrashReport[] = [];
  private logFilePath: string = '';
  private maxBreadcrumbs: number = 50;
  private maxPendingReports: number = 100;

  constructor() {
    this.sessionId = this.generateSessionId();
    hilog.info(0x0000, 'REChainCrash', 'REChainCrashReporter created with session: %{public}s', this.sessionId);
  }

  public async initialize(config: CrashReporterConfig): Promise<boolean> {
    try {
      hilog.info(0x0000, 'REChainCrash', 'Initializing crash reporter...');
      
      this.config = config;
      this.maxBreadcrumbs = config.maxBreadcrumbs || 50;
      this.maxPendingReports = config.maxPendingReports || 100;
      
      // Setup log file
      await this.setupLogFile();
      
      // Setup global error handlers
      this.setupGlobalErrorHandlers();
      
      // Load pending reports
      await this.loadPendingReports();
      
      // Submit pending reports if auto-submit is enabled
      if (config.autoSubmitCrashes && this.pendingReports.length > 0) {
        this.submitPendingReports();
      }
      
      this.initialized = true;
      
      this.logInfo('Crash reporter initialized successfully');
      this.addBreadcrumb('Crash reporter initialized', 'system', BreadcrumbLevel.INFO);
      
      return true;
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to initialize: %{public}s', JSON.stringify(error));
      return false;
    }
  }

  public shutdown(): void {
    if (!this.initialized) {
      return;
    }

    try {
      hilog.info(0x0000, 'REChainCrash', 'Shutting down crash reporter...');
      
      // Save pending reports
      this.savePendingReports();
      
      // Clear breadcrumbs
      this.breadcrumbs = [];
      
      // Clear user info
      this.userInfo = {};
      
      this.initialized = false;
      
      hilog.info(0x0000, 'REChainCrash', 'Crash reporter shut down successfully');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Error during shutdown: %{public}s', JSON.stringify(error));
    }
  }

  public recordError(message: string, context: ErrorContext = {}): void {
    if (!this.initialized) {
      return;
    }

    try {
      this.logError(`Error recorded: ${message}`);
      this.addBreadcrumb(`Error: ${message}`, 'error', BreadcrumbLevel.ERROR, context);
      
      // Create error report
      const report = this.createErrorReport(message, undefined, context);
      this.addPendingReport(report);
      
      // Auto-submit if enabled
      if (this.config?.autoSubmitCrashes) {
        this.submitReport(report);
      }
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to record error: %{public}s', JSON.stringify(error));
    }
  }

  public recordCrash(message: string, stackTrace?: string, context: ErrorContext = {}): void {
    if (!this.initialized) {
      return;
    }

    try {
      this.logFatal(`Crash recorded: ${message}`);
      this.addBreadcrumb(`Crash: ${message}`, 'crash', BreadcrumbLevel.ERROR, context);
      
      // Create crash report
      const report = this.createErrorReport(message, stackTrace, context);
      this.addPendingReport(report);
      
      // Auto-submit if enabled
      if (this.config?.autoSubmitCrashes) {
        this.submitReport(report);
      }
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to record crash: %{public}s', JSON.stringify(error));
    }
  }

  public addBreadcrumb(message: string, category: string = 'general', level: BreadcrumbLevel = BreadcrumbLevel.INFO, data?: Record<string, any>): void {
    try {
      const breadcrumb: Breadcrumb = {
        timestamp: Date.now(),
        message,
        category,
        level,
        data
      };

      this.breadcrumbs.push(breadcrumb);

      // Limit breadcrumbs
      if (this.breadcrumbs.length > this.maxBreadcrumbs) {
        this.breadcrumbs.shift();
      }

      if (this.config?.enableDebugLogging) {
        hilog.debug(0x0000, 'REChainCrash', 'Breadcrumb added: %{public}s [%{public}s]', message, category);
      }
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to add breadcrumb: %{public}s', JSON.stringify(error));
    }
  }

  public setUserInfo(userId?: string, email?: string, username?: string): void {
    try {
      this.userInfo = {
        userId,
        email,
        username,
        identifiedAt: Date.now()
      };

      this.addBreadcrumb('User identified', 'user', BreadcrumbLevel.INFO, { userId, email, username });
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to set user info: %{public}s', JSON.stringify(error));
    }
  }

  public clearUserInfo(): void {
    this.userInfo = {};
    this.addBreadcrumb('User info cleared', 'user', BreadcrumbLevel.INFO);
  }

  public async submitPendingReports(): Promise<void> {
    if (!this.initialized || this.pendingReports.length === 0) {
      return;
    }

    try {
      hilog.info(0x0000, 'REChainCrash', 'Submitting %{public}d pending reports', this.pendingReports.length);
      
      const reports = [...this.pendingReports];
      for (const report of reports) {
        await this.submitReport(report);
      }
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to submit pending reports: %{public}s', JSON.stringify(error));
    }
  }

  private async setupLogFile(): Promise<void> {
    try {
      const context = getContext();
      const filesDir = context.filesDir;
      const logsDir = `${filesDir}/logs`;
      
      // Create logs directory
      try {
        await fs.mkdir(logsDir);
      } catch (error) {
        // Directory might already exist
      }
      
      this.logFilePath = `${logsDir}/crash_reporter.log`;
      
      hilog.info(0x0000, 'REChainCrash', 'Log file path: %{public}s', this.logFilePath);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to setup log file: %{public}s', JSON.stringify(error));
    }
  }

  private setupGlobalErrorHandlers(): void {
    try {
      // Setup global error handler for unhandled exceptions
      globalThis.addEventListener('error', (event: ErrorEvent) => {
        this.recordCrash(
          event.message || 'Unhandled error',
          event.error?.stack,
          {
            filename: event.filename,
            lineno: event.lineno,
            colno: event.colno,
            type: 'unhandled_error'
          }
        );
      });

      // Setup global handler for unhandled promise rejections
      globalThis.addEventListener('unhandledrejection', (event: PromiseRejectionEvent) => {
        this.recordError(
          `Unhandled promise rejection: ${event.reason}`,
          {
            reason: event.reason,
            type: 'unhandled_promise_rejection'
          }
        );
      });

      hilog.info(0x0000, 'REChainCrash', 'Global error handlers configured');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to setup error handlers: %{public}s', JSON.stringify(error));
    }
  }

  private createErrorReport(message: string, stackTrace?: string, context: ErrorContext = {}): CrashReport {
    const reportId = this.generateReportId();
    
    return {
      reportId,
      timestamp: Date.now(),
      errorMessage: message,
      stackTrace,
      context,
      breadcrumbs: [...this.breadcrumbs],
      userInfo: { ...this.userInfo },
      deviceInfo: this.getDeviceInfo(),
      systemInfo: this.getSystemInfo(),
      sessionId: this.sessionId
    };
  }

  private getDeviceInfo(): DeviceInfo {
    return {
      deviceType: deviceInfo.deviceType,
      manufacturer: deviceInfo.manufacture,
      brand: deviceInfo.brand,
      marketName: deviceInfo.marketName,
      productSeries: deviceInfo.productSeries,
      productModel: deviceInfo.productModel,
      softwareModel: deviceInfo.softwareModel,
      hardwareModel: deviceInfo.hardwareModel,
      hardwareProfile: deviceInfo.hardwareProfile,
      serial: deviceInfo.serial,
      bootloaderVersion: deviceInfo.bootloaderVersion,
      abiList: deviceInfo.abiList,
      securityPatchTag: deviceInfo.securityPatchTag,
      displayVersion: deviceInfo.displayVersion,
      incrementalVersion: deviceInfo.incrementalVersion,
      osReleaseType: deviceInfo.osReleaseType,
      osVersion: deviceInfo.osFullName,
      sdkApiVersion: deviceInfo.sdkApiVersion,
      firstApiVersion: deviceInfo.firstApiVersion
    };
  }

  private getSystemInfo(): SystemInfo {
    return {
      batteryLevel: batteryInfo.batterySOC,
      isCharging: batteryInfo.chargingStatus === batteryInfo.BatteryChargeState.ENABLE,
      availableMemory: 0, // Would need additional APIs
      totalMemory: 0, // Would need additional APIs
      cpuAbi: deviceInfo.abiList,
      osVersion: deviceInfo.osFullName,
      buildVersion: deviceInfo.buildVersion
    };
  }

  private async submitReport(report: CrashReport): Promise<void> {
    if (!this.config?.submissionEndpoint) {
      return;
    }

    try {
      const httpRequest = http.createHttp();
      
      const requestOptions: http.HttpRequestOptions = {
        method: http.RequestMethod.POST,
        header: {
          'Content-Type': 'application/json',
          'User-Agent': `${this.config.appName}/${this.config.appVersion} (HarmonyOS)`
        },
        extraData: JSON.stringify(report)
      };

      const response = await httpRequest.request(this.config.submissionEndpoint, requestOptions);
      
      if (response.responseCode === 200) {
        // Remove from pending reports
        this.removePendingReport(report.reportId);
        hilog.info(0x0000, 'REChainCrash', 'Report submitted successfully: %{public}s', report.reportId);
      } else {
        hilog.error(0x0000, 'REChainCrash', 'Failed to submit report: %{public}d', response.responseCode);
      }

      httpRequest.destroy();
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Report submission error: %{public}s', JSON.stringify(error));
    }
  }

  private addPendingReport(report: CrashReport): void {
    this.pendingReports.push(report);
    
    // Limit pending reports
    if (this.pendingReports.length > this.maxPendingReports) {
      this.pendingReports.shift();
    }
    
    // Save to storage
    this.savePendingReports();
  }

  private removePendingReport(reportId: string): void {
    this.pendingReports = this.pendingReports.filter(report => report.reportId !== reportId);
    this.savePendingReports();
  }

  private async loadPendingReports(): Promise<void> {
    try {
      const context = getContext();
      const reportsFile = `${context.filesDir}/pending_reports.json`;
      
      const file = await fs.open(reportsFile, fs.OpenMode.READ_ONLY);
      const buffer = new ArrayBuffer(4096);
      const readResult = await fs.read(file.fd, buffer);
      
      if (readResult.bytesRead > 0) {
        const content = String.fromCharCode(...new Uint8Array(buffer, 0, readResult.bytesRead));
        this.pendingReports = JSON.parse(content) || [];
      }
      
      await fs.close(file);
      
      hilog.info(0x0000, 'REChainCrash', 'Loaded %{public}d pending reports', this.pendingReports.length);
      
    } catch (error) {
      // File might not exist yet
      this.pendingReports = [];
    }
  }

  private async savePendingReports(): Promise<void> {
    try {
      const context = getContext();
      const reportsFile = `${context.filesDir}/pending_reports.json`;
      
      const content = JSON.stringify(this.pendingReports);
      const file = await fs.open(reportsFile, fs.OpenMode.WRITE_ONLY | fs.OpenMode.CREATE);
      await fs.write(file.fd, content);
      await fs.close(file);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainCrash', 'Failed to save pending reports: %{public}s', JSON.stringify(error));
    }
  }

  private generateReportId(): string {
    return `crash_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  }

  private generateSessionId(): string {
    return `session_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
  }

  // Logging methods
  private logTrace(message: string): void {
    if (this.config?.enableDebugLogging) {
      hilog.debug(0x0000, 'REChainCrash', '%{public}s', message);
    }
  }

  private logDebug(message: string): void {
    if (this.config?.enableDebugLogging) {
      hilog.debug(0x0000, 'REChainCrash', '%{public}s', message);
    }
  }

  private logInfo(message: string): void {
    hilog.info(0x0000, 'REChainCrash', '%{public}s', message);
  }

  private logWarning(message: string): void {
    hilog.warn(0x0000, 'REChainCrash', '%{public}s', message);
  }

  private logError(message: string): void {
    hilog.error(0x0000, 'REChainCrash', '%{public}s', message);
  }

  private logFatal(message: string): void {
    hilog.fatal(0x0000, 'REChainCrash', '%{public}s', message);
  }

  // Getters
  public isInitialized(): boolean {
    return this.initialized;
  }

  public getSessionId(): string {
    return this.sessionId;
  }

  public getBreadcrumbs(): Breadcrumb[] {
    return [...this.breadcrumbs];
  }

  public getPendingReportsCount(): number {
    return this.pendingReports.length;
  }

  public getUserInfo(): UserInfo {
    return { ...this.userInfo };
  }
}
