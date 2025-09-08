import notificationManager from '@ohos.notificationManager';
import wantAgent from '@ohos.app.ability.wantAgent';
import hilog from '@ohos.hilog';
import vibrator from '@ohos.vibrator';
import audio from '@ohos.multimedia.audio';
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';

/**
 * REChain HarmonyOS Notification Manager
 * Comprehensive notification system for HarmonyOS with native integration
 */

export interface NotificationConfig {
  appName: string;
  enableSound: boolean;
  enableVibration: boolean;
  enableBadge: boolean;
  maxNotifications: number;
  notificationTimeout: number;
  enableDebugLogging: boolean;
}

export interface REChainNotification {
  id?: string;
  title: string;
  body: string;
  type: NotificationType;
  priority: NotificationPriority;
  sound?: string;
  vibrationPattern?: number[];
  actions?: NotificationAction[];
  data?: Record<string, any>;
  persistent?: boolean;
  autoCancel?: boolean;
}

export interface NotificationAction {
  id: string;
  title: string;
  icon?: string;
}

export enum NotificationType {
  MESSAGE = 0,
  CALL = 1,
  MISSED_CALL = 2,
  USER_JOIN = 3,
  USER_LEAVE = 4,
  FILE_UPLOAD = 5,
  ROOM_CREATION = 6,
  SYNC_ERROR = 7,
  LOGIN_SUCCESS = 8,
  DEVICE_VERIFICATION = 9,
  SPACE_JOIN = 10,
  SYSTEM_NOTIFICATION = 11
}

export enum NotificationPriority {
  LOW = 0,
  NORMAL = 1,
  HIGH = 2,
  URGENT = 3
}

export class REChainNotificationManager {
  private initialized: boolean = false;
  private config: NotificationConfig | null = null;
  private activeNotifications: Map<string, REChainNotification> = new Map();
  private notificationCount: number = 0;
  private badgeCount: number = 0;
  private audioRenderer: audio.AudioRenderer | null = null;

  constructor() {
    hilog.info(0x0000, 'REChainNotification', 'REChainNotificationManager created');
  }

  public async initialize(config: NotificationConfig): Promise<boolean> {
    try {
      hilog.info(0x0000, 'REChainNotification', 'Initializing notification manager...');
      
      this.config = config;
      
      // Request notification permissions
      await this.requestNotificationPermissions();
      
      // Initialize audio renderer for custom sounds
      await this.initializeAudioRenderer();
      
      // Setup notification slot (channel)
      await this.setupNotificationSlots();
      
      // Clear any existing notifications
      await this.clearAllNotifications();
      
      this.initialized = true;
      
      hilog.info(0x0000, 'REChainNotification', 'Notification manager initialized successfully');
      return true;
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to initialize: %{public}s', JSON.stringify(error));
      return false;
    }
  }

  public shutdown(): void {
    if (!this.initialized) {
      return;
    }

    try {
      hilog.info(0x0000, 'REChainNotification', 'Shutting down notification manager...');
      
      // Clear all active notifications
      this.clearAllNotifications();
      
      // Release audio renderer
      if (this.audioRenderer) {
        this.audioRenderer.release();
        this.audioRenderer = null;
      }
      
      // Clear internal state
      this.activeNotifications.clear();
      this.notificationCount = 0;
      this.badgeCount = 0;
      
      this.initialized = false;
      
      hilog.info(0x0000, 'REChainNotification', 'Notification manager shut down successfully');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Error during shutdown: %{public}s', JSON.stringify(error));
    }
  }

  public async displayNotification(notification: REChainNotification): Promise<string> {
    if (!this.initialized || !this.config) {
      throw new Error('Notification manager not initialized');
    }

    try {
      // Generate unique ID if not provided
      const notificationId = notification.id || this.generateNotificationId();
      
      // Check notification limits
      if (this.activeNotifications.size >= this.config.maxNotifications) {
        this.removeOldestNotification();
      }
      
      // Create HarmonyOS notification request
      const notificationRequest = await this.createNotificationRequest(notification, notificationId);
      
      // Publish notification
      await notificationManager.publish(notificationRequest);
      
      // Store notification reference
      notification.id = notificationId;
      this.activeNotifications.set(notificationId, notification);
      this.notificationCount++;
      
      // Handle sound and vibration
      await this.handleNotificationEffects(notification);
      
      // Update badge count
      if (this.config.enableBadge) {
        this.badgeCount++;
        await this.updateBadgeCount(this.badgeCount);
      }
      
      hilog.info(0x0000, 'REChainNotification', 'Notification displayed: %{public}s', notificationId);
      
      return notificationId;
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to display notification: %{public}s', JSON.stringify(error));
      throw error;
    }
  }

  public async cancelNotification(notificationId: string): Promise<boolean> {
    if (!this.initialized) {
      return false;
    }

    try {
      // Cancel the notification
      await notificationManager.cancel(parseInt(notificationId));
      
      // Remove from active notifications
      if (this.activeNotifications.has(notificationId)) {
        this.activeNotifications.delete(notificationId);
        
        // Update badge count
        if (this.config?.enableBadge && this.badgeCount > 0) {
          this.badgeCount--;
          await this.updateBadgeCount(this.badgeCount);
        }
      }
      
      hilog.info(0x0000, 'REChainNotification', 'Notification cancelled: %{public}s', notificationId);
      return true;
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to cancel notification: %{public}s', JSON.stringify(error));
      return false;
    }
  }

  public async clearAllNotifications(): Promise<void> {
    if (!this.initialized) {
      return;
    }

    try {
      // Cancel all notifications
      await notificationManager.cancelAll();
      
      // Clear internal state
      this.activeNotifications.clear();
      this.badgeCount = 0;
      
      // Update badge count
      if (this.config?.enableBadge) {
        await this.updateBadgeCount(0);
      }
      
      hilog.info(0x0000, 'REChainNotification', 'All notifications cleared');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to clear notifications: %{public}s', JSON.stringify(error));
    }
  }

  public async updateBadgeCount(count: number): Promise<void> {
    if (!this.initialized || !this.config?.enableBadge) {
      return;
    }

    try {
      await bundleManager.setBadgeNumber(count);
      this.badgeCount = count;
      
      hilog.info(0x0000, 'REChainNotification', 'Badge count updated: %{public}d', count);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to update badge count: %{public}s', JSON.stringify(error));
    }
  }

  public onApplicationForeground(): void {
    hilog.info(0x0000, 'REChainNotification', 'Application moved to foreground');
    
    // Clear badge when app comes to foreground
    if (this.config?.enableBadge) {
      this.updateBadgeCount(0);
    }
  }

  public onApplicationBackground(): void {
    hilog.info(0x0000, 'REChainNotification', 'Application moved to background');
  }

  private async requestNotificationPermissions(): Promise<void> {
    try {
      await notificationManager.requestEnableNotification();
      hilog.info(0x0000, 'REChainNotification', 'Notification permissions granted');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to request permissions: %{public}s', JSON.stringify(error));
      throw error;
    }
  }

  private async setupNotificationSlots(): Promise<void> {
    try {
      const slots: notificationManager.NotificationSlot[] = [
        {
          type: notificationManager.SlotType.CONTENT_INFORMATION,
          level: notificationManager.SlotLevel.LEVEL_DEFAULT,
          desc: 'REChain Messages',
          badgeFlag: true,
          bypassDnd: false,
          lockscreenVisibility: notificationManager.VisiblenessType.PUBLIC,
          vibrationEnabled: this.config?.enableVibration || false,
          sound: this.config?.enableSound ? 'file://system/etc/audio/alarms/default.ogg' : '',
          lightEnabled: true,
          lightColor: 0xFF0000FF
        },
        {
          type: notificationManager.SlotType.SERVICE_INFORMATION,
          level: notificationManager.SlotLevel.LEVEL_HIGH,
          desc: 'REChain System',
          badgeFlag: true,
          bypassDnd: true,
          lockscreenVisibility: notificationManager.VisiblenessType.PUBLIC,
          vibrationEnabled: this.config?.enableVibration || false,
          sound: this.config?.enableSound ? 'file://system/etc/audio/notifications/default.ogg' : '',
          lightEnabled: true,
          lightColor: 0xFF00FF00
        }
      ];

      for (const slot of slots) {
        await notificationManager.addSlot(slot);
      }
      
      hilog.info(0x0000, 'REChainNotification', 'Notification slots configured');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to setup slots: %{public}s', JSON.stringify(error));
      throw error;
    }
  }

  private async initializeAudioRenderer(): Promise<void> {
    try {
      const audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      const audioRendererInfo: audio.AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      };

      const audioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      };

      this.audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
      
      hilog.info(0x0000, 'REChainNotification', 'Audio renderer initialized');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to initialize audio: %{public}s', JSON.stringify(error));
    }
  }

  private async createNotificationRequest(notification: REChainNotification, notificationId: string): Promise<notificationManager.NotificationRequest> {
    const wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: 'com.rechain.harmonyos',
          abilityName: 'EntryAbility',
          parameters: {
            notificationId: notificationId,
            notificationData: JSON.stringify(notification.data || {})
          }
        }
      ],
      operationType: wantAgent.OperationType.START_ABILITY,
      requestCode: parseInt(notificationId),
      wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
    };

    const wantAgentObj = await wantAgent.getWantAgent(wantAgentInfo);

    const notificationRequest: notificationManager.NotificationRequest = {
      id: parseInt(notificationId),
      content: {
        contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: {
          title: notification.title,
          text: notification.body,
          additionalText: this.getNotificationTypeText(notification.type)
        }
      },
      wantAgent: wantAgentObj,
      slotType: this.getSlotType(notification.type),
      isOngoing: notification.persistent || false,
      isUnremovable: false,
      deliveryTime: new Date().getTime(),
      tapDismissed: notification.autoCancel !== false,
      autoDeletedTime: notification.persistent ? 0 : (this.config?.notificationTimeout || 5000),
      color: this.getNotificationColor(notification.type),
      colorEnabled: true,
      isAlertOnce: false,
      isStopwatch: false,
      isCountDown: false,
      showDeliveryTime: true
    };

    // Add action buttons if provided
    if (notification.actions && notification.actions.length > 0) {
      notificationRequest.actionButtons = notification.actions.map((action, index) => ({
        title: action.title,
        wantAgent: wantAgentObj,
        extras: { actionId: action.id },
        userInput: undefined
      }));
    }

    return notificationRequest;
  }

  private async handleNotificationEffects(notification: REChainNotification): Promise<void> {
    try {
      // Handle vibration
      if (this.config?.enableVibration && notification.vibrationPattern) {
        await this.triggerVibration(notification.vibrationPattern);
      } else if (this.config?.enableVibration) {
        await this.triggerVibration([200]);
      }

      // Handle custom sound
      if (this.config?.enableSound && notification.sound && this.audioRenderer) {
        await this.playNotificationSound(notification.sound);
      }

    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Failed to handle effects: %{public}s', JSON.stringify(error));
    }
  }

  private async triggerVibration(pattern: number[]): Promise<void> {
    try {
      await vibrator.startVibration({
        type: 'time',
        duration: pattern[0] || 200
      }, {
        id: 0,
        usage: 'notification'
      });
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Vibration failed: %{public}s', JSON.stringify(error));
    }
  }

  private async playNotificationSound(soundPath: string): Promise<void> {
    try {
      if (!this.audioRenderer) {
        return;
      }

      // This is a simplified implementation
      // In a real app, you would load and play the actual sound file
      hilog.info(0x0000, 'REChainNotification', 'Playing sound: %{public}s', soundPath);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainNotification', 'Sound playback failed: %{public}s', JSON.stringify(error));
    }
  }

  private getSlotType(type: NotificationType): notificationManager.SlotType {
    switch (type) {
      case NotificationType.CALL:
      case NotificationType.MISSED_CALL:
      case NotificationType.SYNC_ERROR:
        return notificationManager.SlotType.SERVICE_INFORMATION;
      default:
        return notificationManager.SlotType.CONTENT_INFORMATION;
    }
  }

  private getNotificationColor(type: NotificationType): number {
    switch (type) {
      case NotificationType.CALL:
      case NotificationType.MISSED_CALL:
        return 0xFF00FF00; // Green
      case NotificationType.SYNC_ERROR:
        return 0xFFFF0000; // Red
      case NotificationType.MESSAGE:
        return 0xFF0000FF; // Blue
      default:
        return 0xFF666666; // Gray
    }
  }

  private getNotificationTypeText(type: NotificationType): string {
    switch (type) {
      case NotificationType.MESSAGE:
        return 'Message';
      case NotificationType.CALL:
        return 'Incoming Call';
      case NotificationType.MISSED_CALL:
        return 'Missed Call';
      case NotificationType.USER_JOIN:
        return 'User Joined';
      case NotificationType.USER_LEAVE:
        return 'User Left';
      case NotificationType.FILE_UPLOAD:
        return 'File Uploaded';
      case NotificationType.ROOM_CREATION:
        return 'Room Created';
      case NotificationType.SYNC_ERROR:
        return 'Sync Error';
      case NotificationType.LOGIN_SUCCESS:
        return 'Login Success';
      case NotificationType.DEVICE_VERIFICATION:
        return 'Device Verification';
      case NotificationType.SPACE_JOIN:
        return 'Space Joined';
      case NotificationType.SYSTEM_NOTIFICATION:
        return 'System';
      default:
        return 'REChain';
    }
  }

  private generateNotificationId(): string {
    return Date.now().toString() + Math.random().toString(36).substr(2, 9);
  }

  private removeOldestNotification(): void {
    const oldestId = this.activeNotifications.keys().next().value;
    if (oldestId) {
      this.cancelNotification(oldestId);
    }
  }

  // Getters
  public isInitialized(): boolean {
    return this.initialized;
  }

  public getActiveNotificationCount(): number {
    return this.activeNotifications.size;
  }

  public getBadgeCount(): number {
    return this.badgeCount;
  }

  public getNotificationById(id: string): REChainNotification | undefined {
    return this.activeNotifications.get(id);
  }

  public getAllActiveNotifications(): REChainNotification[] {
    return Array.from(this.activeNotifications.values());
  }
}
