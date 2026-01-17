import hilog from '@ohos.hilog';
import { REChainNotificationManager } from '../services/REChainNotificationManager';
import { REChainCrashReporter } from '../services/REChainCrashReporter';
import { REChainSystemIntegration } from '../services/REChainSystemIntegration';

/**
 * REChain HarmonyOS Main Page
 * Entry point for the REChain application UI
 */

@Entry
@Component
struct Index {
  @State message: string = 'REChain HarmonyOS';
  @State isLoading: boolean = true;
  @State servicesStatus: string = 'Initializing services...';
  @State notificationCount: number = 0;
  @State batteryLevel: number = 0;
  @State networkStatus: string = 'Unknown';

  private notificationManager: REChainNotificationManager | null = null;
  private crashReporter: REChainCrashReporter | null = null;
  private systemIntegration: REChainSystemIntegration | null = null;

  aboutToAppear() {
    hilog.info(0x0000, 'REChainUI', 'Index page about to appear');
    this.initializeServices();
  }

  aboutToDisappear() {
    hilog.info(0x0000, 'REChainUI', 'Index page about to disappear');
  }

  build() {
    Column() {
      // Header
      Row() {
        Text(this.message)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1976D2')
          .margin({ top: 20, bottom: 10 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      // Loading indicator
      if (this.isLoading) {
        LoadingProgress()
          .color('#1976D2')
          .width(50)
          .height(50)
          .margin({ top: 20, bottom: 20 })
      }

      // Services status
      Text(this.servicesStatus)
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 20 })
        .textAlign(TextAlign.Center)

      // Status cards
      if (!this.isLoading) {
        Column({ space: 15 }) {
          // Notification status card
          this.createStatusCard(
            'Notifications',
            `Active: ${this.notificationCount}`,
            '#4CAF50',
            () => this.testNotification()
          )

          // Battery status card
          this.createStatusCard(
            'Battery',
            `Level: ${this.batteryLevel}%`,
            this.batteryLevel > 20 ? '#4CAF50' : '#FF5722',
            () => this.refreshSystemStatus()
          )

          // Network status card
          this.createStatusCard(
            'Network',
            this.networkStatus,
            this.networkStatus === 'Connected' ? '#4CAF50' : '#FF9800',
            () => this.refreshSystemStatus()
          )

          // Test buttons
          Column({ space: 10 }) {
            Button('Test Notification')
              .width('80%')
              .backgroundColor('#1976D2')
              .onClick(() => this.testNotification())

            Button('Test Vibration')
              .width('80%')
              .backgroundColor('#673AB7')
              .onClick(() => this.testVibration())

            Button('Test Error Report')
              .width('80%')
              .backgroundColor('#FF5722')
              .onClick(() => this.testErrorReport())

            Button('Refresh Status')
              .width('80%')
              .backgroundColor('#4CAF50')
              .onClick(() => this.refreshSystemStatus())
          }
          .margin({ top: 30 })
        }
        .width('100%')
        .padding({ left: 20, right: 20 })
      }

      Blank()

      // Footer
      Text('REChain v4.1.10+1160 - HarmonyOS')
        .fontSize(12)
        .fontColor('#999999')
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  createStatusCard(title: string, status: string, color: string, onTap: () => void) {
    Row() {
      Column() {
        Text(title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#333333')
          .margin({ bottom: 5 })

        Text(status)
          .fontSize(14)
          .fontColor(color)
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Circle({ width: 12, height: 12 })
        .fill(color)
    }
    .width('100%')
    .padding(15)
    .backgroundColor('#FFFFFF')
    .borderRadius(8)
    .shadow({
      radius: 4,
      color: '#00000010',
      offsetX: 0,
      offsetY: 2
    })
    .onClick(onTap)
  }

  private async initializeServices() {
    try {
      hilog.info(0x0000, 'REChainUI', 'Initializing UI services...');

      // Get services from global context (they should be initialized in EntryAbility)
      const context = getContext();
      const ability = context as any; // Type assertion for accessing ability

      if (ability && ability.getNotificationManager) {
        this.notificationManager = ability.getNotificationManager();
        this.crashReporter = ability.getCrashReporter();
        this.systemIntegration = ability.getSystemIntegration();
      }

      // Update UI based on service status
      if (this.notificationManager && this.notificationManager.isInitialized()) {
        this.notificationCount = this.notificationManager.getActiveNotificationCount();
      }

      // Get initial system status
      await this.refreshSystemStatus();

      this.servicesStatus = 'All services ready';
      this.isLoading = false;

      hilog.info(0x0000, 'REChainUI', 'UI services initialized successfully');

    } catch (error) {
      hilog.error(0x0000, 'REChainUI', 'Failed to initialize UI services: %{public}s', JSON.stringify(error));
      this.servicesStatus = 'Service initialization failed';
      this.isLoading = false;

      if (this.crashReporter) {
        this.crashReporter.recordError('UI service initialization failed', { error: error.toString() });
      }
    }
  }

  private async testNotification() {
    if (!this.notificationManager) {
      hilog.error(0x0000, 'REChainUI', 'Notification manager not available');
      return;
    }

    try {
      const notification = {
        title: 'Test Notification',
        body: 'This is a test notification from REChain HarmonyOS',
        type: 0, // MESSAGE type
        priority: 1, // NORMAL priority
        autoCancel: true
      };

      const notificationId = await this.notificationManager.displayNotification(notification);
      this.notificationCount = this.notificationManager.getActiveNotificationCount();

      hilog.info(0x0000, 'REChainUI', 'Test notification sent: %{public}s', notificationId);

    } catch (error) {
      hilog.error(0x0000, 'REChainUI', 'Failed to send test notification: %{public}s', JSON.stringify(error));
      
      if (this.crashReporter) {
        this.crashReporter.recordError('Test notification failed', { error: error.toString() });
      }
    }
  }

  private async testVibration() {
    if (!this.systemIntegration) {
      hilog.error(0x0000, 'REChainUI', 'System integration not available');
      return;
    }

    try {
      await this.systemIntegration.vibrate(300);
      hilog.info(0x0000, 'REChainUI', 'Test vibration triggered');

    } catch (error) {
      hilog.error(0x0000, 'REChainUI', 'Failed to trigger vibration: %{public}s', JSON.stringify(error));
      
      if (this.crashReporter) {
        this.crashReporter.recordError('Test vibration failed', { error: error.toString() });
      }
    }
  }

  private testErrorReport() {
    if (!this.crashReporter) {
      hilog.error(0x0000, 'REChainUI', 'Crash reporter not available');
      return;
    }

    try {
      this.crashReporter.recordError('Test error from UI', {
        component: 'Index',
        action: 'testErrorReport',
        timestamp: Date.now()
      });

      hilog.info(0x0000, 'REChainUI', 'Test error report sent');

    } catch (error) {
      hilog.error(0x0000, 'REChainUI', 'Failed to send test error report: %{public}s', JSON.stringify(error));
    }
  }

  private async refreshSystemStatus() {
    if (!this.systemIntegration) {
      return;
    }

    try {
      const systemStatus = await this.systemIntegration.getSystemStatus();
      
      if (systemStatus) {
        this.batteryLevel = systemStatus.batteryLevel;
        this.networkStatus = systemStatus.networkConnected ? 'Connected' : 'Disconnected';
      }

      hilog.info(0x0000, 'REChainUI', 'System status refreshed');

    } catch (error) {
      hilog.error(0x0000, 'REChainUI', 'Failed to refresh system status: %{public}s', JSON.stringify(error));
    }
  }
}
