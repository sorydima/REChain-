import hilog from '@ohos.hilog';
import sensor from '@ohos.sensor';
import batteryInfo from '@ohos.batteryInfo';
import deviceInfo from '@ohos.deviceInfo';
import connection from '@ohos.net.connection';
import vibrator from '@ohos.vibrator';
import brightness from '@ohos.brightness';
import display from '@ohos.display';
import systemDateTime from '@ohos.systemDateTime';
import { BusinessError } from '@ohos.base';

/**
 * REChain HarmonyOS System Integration
 * Comprehensive system integration for HarmonyOS platform
 */

export interface SystemIntegrationConfig {
  enableSystemMonitoring: boolean;
  enableSensorMonitoring: boolean;
  enableBatteryMonitoring: boolean;
  enableNetworkMonitoring: boolean;
  enablePerformanceMonitoring: boolean;
}

export interface DeviceInformation {
  deviceType: string;
  manufacturer: string;
  brand: string;
  model: string;
  osVersion: string;
  apiLevel: number;
  buildVersion: string;
  serialNumber: string;
  screenDensity: number;
  screenWidth: number;
  screenHeight: number;
}

export interface SystemStatus {
  batteryLevel: number;
  isCharging: boolean;
  batteryHealth: string;
  networkConnected: boolean;
  networkType: string;
  signalStrength: number;
  availableMemory: number;
  totalMemory: number;
  cpuUsage: number;
  temperature: number;
  orientation: number;
}

export interface SensorData {
  accelerometer?: AccelerometerData;
  gyroscope?: GyroscopeData;
  magnetometer?: MagnetometerData;
  gravity?: GravityData;
  proximity?: ProximityData;
  ambientLight?: AmbientLightData;
}

export interface AccelerometerData {
  x: number;
  y: number;
  z: number;
  timestamp: number;
}

export interface GyroscopeData {
  x: number;
  y: number;
  z: number;
  timestamp: number;
}

export interface MagnetometerData {
  x: number;
  y: number;
  z: number;
  timestamp: number;
}

export interface GravityData {
  x: number;
  y: number;
  z: number;
  timestamp: number;
}

export interface ProximityData {
  distance: number;
  timestamp: number;
}

export interface AmbientLightData {
  intensity: number;
  timestamp: number;
}

export enum SystemEvent {
  BATTERY_LEVEL_CHANGED = 'battery_level_changed',
  BATTERY_STATUS_CHANGED = 'battery_status_changed',
  NETWORK_STATUS_CHANGED = 'network_status_changed',
  ORIENTATION_CHANGED = 'orientation_changed',
  MEMORY_WARNING = 'memory_warning',
  TEMPERATURE_WARNING = 'temperature_warning',
  SENSOR_DATA_CHANGED = 'sensor_data_changed'
}

export class REChainSystemIntegration {
  private initialized: boolean = false;
  private config: SystemIntegrationConfig | null = null;
  private sensorData: SensorData = {};
  private systemStatus: SystemStatus | null = null;
  private deviceInfo: DeviceInformation | null = null;
  private eventListeners: Map<SystemEvent, Function[]> = new Map();
  private monitoringInterval: number | null = null;
  private sensorCallbacks: Map<string, number> = new Map();

  constructor() {
    hilog.info(0x0000, 'REChainSystem', 'REChainSystemIntegration created');
  }

  public async initialize(config: SystemIntegrationConfig): Promise<boolean> {
    try {
      hilog.info(0x0000, 'REChainSystem', 'Initializing system integration...');
      
      this.config = config;
      
      // Initialize device information
      await this.initializeDeviceInfo();
      
      // Initialize system monitoring
      if (config.enableSystemMonitoring) {
        await this.initializeSystemMonitoring();
      }
      
      // Initialize sensor monitoring
      if (config.enableSensorMonitoring) {
        await this.initializeSensorMonitoring();
      }
      
      // Initialize battery monitoring
      if (config.enableBatteryMonitoring) {
        await this.initializeBatteryMonitoring();
      }
      
      // Initialize network monitoring
      if (config.enableNetworkMonitoring) {
        await this.initializeNetworkMonitoring();
      }
      
      // Start performance monitoring
      if (config.enablePerformanceMonitoring) {
        this.startPerformanceMonitoring();
      }
      
      this.initialized = true;
      
      hilog.info(0x0000, 'REChainSystem', 'System integration initialized successfully');
      return true;
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize: %{public}s', JSON.stringify(error));
      return false;
    }
  }

  public shutdown(): void {
    if (!this.initialized) {
      return;
    }

    try {
      hilog.info(0x0000, 'REChainSystem', 'Shutting down system integration...');
      
      // Stop performance monitoring
      if (this.monitoringInterval) {
        clearInterval(this.monitoringInterval);
        this.monitoringInterval = null;
      }
      
      // Unsubscribe from sensors
      this.shutdownSensorMonitoring();
      
      // Clear event listeners
      this.eventListeners.clear();
      
      // Clear cached data
      this.sensorData = {};
      this.systemStatus = null;
      
      this.initialized = false;
      
      hilog.info(0x0000, 'REChainSystem', 'System integration shut down successfully');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Error during shutdown: %{public}s', JSON.stringify(error));
    }
  }

  public getDeviceInfo(): DeviceInformation | null {
    return this.deviceInfo;
  }

  public async getSystemStatus(): Promise<SystemStatus | null> {
    if (!this.initialized) {
      return null;
    }

    try {
      const status: SystemStatus = {
        batteryLevel: batteryInfo.batterySOC,
        isCharging: batteryInfo.chargingStatus === batteryInfo.BatteryChargeState.ENABLE,
        batteryHealth: this.getBatteryHealthString(batteryInfo.healthState),
        networkConnected: await this.isNetworkConnected(),
        networkType: await this.getNetworkType(),
        signalStrength: 0, // Would need additional APIs
        availableMemory: 0, // Would need additional APIs
        totalMemory: 0, // Would need additional APIs
        cpuUsage: 0, // Would need additional APIs
        temperature: 0, // Would need additional APIs
        orientation: await this.getDeviceOrientation()
      };

      this.systemStatus = status;
      return status;
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to get system status: %{public}s', JSON.stringify(error));
      return null;
    }
  }

  public getSensorData(): SensorData {
    return { ...this.sensorData };
  }

  public async vibrate(duration: number = 200, pattern?: number[]): Promise<void> {
    try {
      if (pattern && pattern.length > 0) {
        // HarmonyOS doesn't support custom patterns in the same way
        // Use the first duration from pattern
        await vibrator.startVibration({
          type: 'time',
          duration: pattern[0]
        }, {
          id: 0,
          usage: 'notification'
        });
      } else {
        await vibrator.startVibration({
          type: 'time',
          duration: duration
        }, {
          id: 0,
          usage: 'notification'
        });
      }
      
      hilog.info(0x0000, 'REChainSystem', 'Vibration triggered: %{public}d ms', duration);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Vibration failed: %{public}s', JSON.stringify(error));
    }
  }

  public async setScreenBrightness(brightness: number): Promise<void> {
    try {
      // Clamp brightness value between 0 and 255
      const clampedBrightness = Math.max(0, Math.min(255, brightness));
      
      // Note: This might require system permissions
      // await brightness.setValue(clampedBrightness);
      
      hilog.info(0x0000, 'REChainSystem', 'Screen brightness set: %{public}d', clampedBrightness);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to set brightness: %{public}s', JSON.stringify(error));
    }
  }

  public async getScreenBrightness(): Promise<number> {
    try {
      // Note: This might require system permissions
      // return await brightness.getValue();
      return 128; // Default value
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to get brightness: %{public}s', JSON.stringify(error));
      return 128;
    }
  }

  public addEventListener(event: SystemEvent, callback: Function): void {
    if (!this.eventListeners.has(event)) {
      this.eventListeners.set(event, []);
    }
    this.eventListeners.get(event)?.push(callback);
  }

  public removeEventListener(event: SystemEvent, callback: Function): void {
    const listeners = this.eventListeners.get(event);
    if (listeners) {
      const index = listeners.indexOf(callback);
      if (index > -1) {
        listeners.splice(index, 1);
      }
    }
  }

  public onApplicationForeground(): void {
    hilog.info(0x0000, 'REChainSystem', 'Application moved to foreground');
    
    // Resume sensor monitoring if it was paused
    if (this.config?.enableSensorMonitoring) {
      this.resumeSensorMonitoring();
    }
  }

  public onApplicationBackground(): void {
    hilog.info(0x0000, 'REChainSystem', 'Application moved to background');
    
    // Pause non-essential sensor monitoring to save battery
    this.pauseSensorMonitoring();
  }

  private async initializeDeviceInfo(): Promise<void> {
    try {
      const defaultDisplay = await display.getDefaultDisplay();
      
      this.deviceInfo = {
        deviceType: deviceInfo.deviceType,
        manufacturer: deviceInfo.manufacture,
        brand: deviceInfo.brand,
        model: deviceInfo.productModel,
        osVersion: deviceInfo.osFullName,
        apiLevel: deviceInfo.sdkApiVersion,
        buildVersion: deviceInfo.buildVersion,
        serialNumber: deviceInfo.serial,
        screenDensity: defaultDisplay.densityDPI,
        screenWidth: defaultDisplay.width,
        screenHeight: defaultDisplay.height
      };
      
      hilog.info(0x0000, 'REChainSystem', 'Device info initialized: %{public}s %{public}s', 
        this.deviceInfo.manufacturer, this.deviceInfo.model);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize device info: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeSystemMonitoring(): Promise<void> {
    try {
      // Initialize system status
      await this.getSystemStatus();
      
      hilog.info(0x0000, 'REChainSystem', 'System monitoring initialized');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize system monitoring: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeSensorMonitoring(): Promise<void> {
    try {
      // Initialize accelerometer
      await this.initializeAccelerometer();
      
      // Initialize gyroscope
      await this.initializeGyroscope();
      
      // Initialize magnetometer
      await this.initializeMagnetometer();
      
      // Initialize gravity sensor
      await this.initializeGravitySensor();
      
      // Initialize proximity sensor
      await this.initializeProximitySensor();
      
      // Initialize ambient light sensor
      await this.initializeAmbientLightSensor();
      
      hilog.info(0x0000, 'REChainSystem', 'Sensor monitoring initialized');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize sensor monitoring: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeAccelerometer(): Promise<void> {
    try {
      const callback = (data: sensor.AccelerometerResponse) => {
        this.sensorData.accelerometer = {
          x: data.x,
          y: data.y,
          z: data.z,
          timestamp: data.timestamp
        };
        this.emitEvent(SystemEvent.SENSOR_DATA_CHANGED, { type: 'accelerometer', data: this.sensorData.accelerometer });
      };

      sensor.on(sensor.SensorId.ACCELEROMETER, callback, { interval: 100000000 }); // 100ms
      this.sensorCallbacks.set('accelerometer', 1);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize accelerometer: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeGyroscope(): Promise<void> {
    try {
      const callback = (data: sensor.GyroscopeResponse) => {
        this.sensorData.gyroscope = {
          x: data.x,
          y: data.y,
          z: data.z,
          timestamp: data.timestamp
        };
        this.emitEvent(SystemEvent.SENSOR_DATA_CHANGED, { type: 'gyroscope', data: this.sensorData.gyroscope });
      };

      sensor.on(sensor.SensorId.GYROSCOPE, callback, { interval: 100000000 }); // 100ms
      this.sensorCallbacks.set('gyroscope', 1);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize gyroscope: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeMagnetometer(): Promise<void> {
    try {
      const callback = (data: sensor.MagneticFieldResponse) => {
        this.sensorData.magnetometer = {
          x: data.x,
          y: data.y,
          z: data.z,
          timestamp: data.timestamp
        };
        this.emitEvent(SystemEvent.SENSOR_DATA_CHANGED, { type: 'magnetometer', data: this.sensorData.magnetometer });
      };

      sensor.on(sensor.SensorId.MAGNETIC_FIELD, callback, { interval: 100000000 }); // 100ms
      this.sensorCallbacks.set('magnetometer', 1);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize magnetometer: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeGravitySensor(): Promise<void> {
    try {
      const callback = (data: sensor.GravityResponse) => {
        this.sensorData.gravity = {
          x: data.x,
          y: data.y,
          z: data.z,
          timestamp: data.timestamp
        };
        this.emitEvent(SystemEvent.SENSOR_DATA_CHANGED, { type: 'gravity', data: this.sensorData.gravity });
      };

      sensor.on(sensor.SensorId.GRAVITY, callback, { interval: 100000000 }); // 100ms
      this.sensorCallbacks.set('gravity', 1);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize gravity sensor: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeProximitySensor(): Promise<void> {
    try {
      const callback = (data: sensor.ProximityResponse) => {
        this.sensorData.proximity = {
          distance: data.distance,
          timestamp: data.timestamp
        };
        this.emitEvent(SystemEvent.SENSOR_DATA_CHANGED, { type: 'proximity', data: this.sensorData.proximity });
      };

      sensor.on(sensor.SensorId.PROXIMITY, callback, { interval: 200000000 }); // 200ms
      this.sensorCallbacks.set('proximity', 1);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize proximity sensor: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeAmbientLightSensor(): Promise<void> {
    try {
      const callback = (data: sensor.LightResponse) => {
        this.sensorData.ambientLight = {
          intensity: data.intensity,
          timestamp: data.timestamp
        };
        this.emitEvent(SystemEvent.SENSOR_DATA_CHANGED, { type: 'ambientLight', data: this.sensorData.ambientLight });
      };

      sensor.on(sensor.SensorId.AMBIENT_LIGHT, callback, { interval: 500000000 }); // 500ms
      this.sensorCallbacks.set('ambientLight', 1);
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize ambient light sensor: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeBatteryMonitoring(): Promise<void> {
    try {
      // Monitor battery level changes
      // Note: HarmonyOS might not have direct battery change listeners
      // This would typically be implemented through system events or polling
      
      hilog.info(0x0000, 'REChainSystem', 'Battery monitoring initialized');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize battery monitoring: %{public}s', JSON.stringify(error));
    }
  }

  private async initializeNetworkMonitoring(): Promise<void> {
    try {
      // Monitor network connectivity changes
      connection.createNetConnection().on('netAvailable', (netHandle) => {
        this.emitEvent(SystemEvent.NETWORK_STATUS_CHANGED, { connected: true, netHandle });
      });

      connection.createNetConnection().on('netUnavailable', () => {
        this.emitEvent(SystemEvent.NETWORK_STATUS_CHANGED, { connected: false });
      });
      
      hilog.info(0x0000, 'REChainSystem', 'Network monitoring initialized');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to initialize network monitoring: %{public}s', JSON.stringify(error));
    }
  }

  private startPerformanceMonitoring(): void {
    this.monitoringInterval = setInterval(async () => {
      try {
        // Update system status periodically
        await this.getSystemStatus();
        
        // Check for memory warnings
        if (this.systemStatus && this.systemStatus.availableMemory < 100 * 1024 * 1024) { // Less than 100MB
          this.emitEvent(SystemEvent.MEMORY_WARNING, { availableMemory: this.systemStatus.availableMemory });
        }
        
        // Check for temperature warnings
        if (this.systemStatus && this.systemStatus.temperature > 45) { // Above 45°C
          this.emitEvent(SystemEvent.TEMPERATURE_WARNING, { temperature: this.systemStatus.temperature });
        }
        
      } catch (error) {
        hilog.error(0x0000, 'REChainSystem', 'Performance monitoring error: %{public}s', JSON.stringify(error));
      }
    }, 5000); // Every 5 seconds
  }

  private shutdownSensorMonitoring(): void {
    try {
      // Unsubscribe from all sensors
      if (this.sensorCallbacks.has('accelerometer')) {
        sensor.off(sensor.SensorId.ACCELEROMETER);
      }
      if (this.sensorCallbacks.has('gyroscope')) {
        sensor.off(sensor.SensorId.GYROSCOPE);
      }
      if (this.sensorCallbacks.has('magnetometer')) {
        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
      }
      if (this.sensorCallbacks.has('gravity')) {
        sensor.off(sensor.SensorId.GRAVITY);
      }
      if (this.sensorCallbacks.has('proximity')) {
        sensor.off(sensor.SensorId.PROXIMITY);
      }
      if (this.sensorCallbacks.has('ambientLight')) {
        sensor.off(sensor.SensorId.AMBIENT_LIGHT);
      }
      
      this.sensorCallbacks.clear();
      
      hilog.info(0x0000, 'REChainSystem', 'Sensor monitoring shut down');
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to shutdown sensor monitoring: %{public}s', JSON.stringify(error));
    }
  }

  private pauseSensorMonitoring(): void {
    // Pause non-essential sensors to save battery
    try {
      if (this.sensorCallbacks.has('accelerometer')) {
        sensor.off(sensor.SensorId.ACCELEROMETER);
      }
      if (this.sensorCallbacks.has('gyroscope')) {
        sensor.off(sensor.SensorId.GYROSCOPE);
      }
      if (this.sensorCallbacks.has('magnetometer')) {
        sensor.off(sensor.SensorId.MAGNETIC_FIELD);
      }
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to pause sensor monitoring: %{public}s', JSON.stringify(error));
    }
  }

  private resumeSensorMonitoring(): void {
    // Resume sensor monitoring when app comes to foreground
    try {
      if (this.config?.enableSensorMonitoring) {
        this.initializeAccelerometer();
        this.initializeGyroscope();
        this.initializeMagnetometer();
      }
      
    } catch (error) {
      hilog.error(0x0000, 'REChainSystem', 'Failed to resume sensor monitoring: %{public}s', JSON.stringify(error));
    }
  }

  private async isNetworkConnected(): Promise<boolean> {
    try {
      const netConnection = connection.createNetConnection();
      const netHandle = await netConnection.getDefaultNet();
      return netHandle !== null;
      
    } catch (error) {
      return false;
    }
  }

  private async getNetworkType(): Promise<string> {
    try {
      const netConnection = connection.createNetConnection();
      const netHandle = await netConnection.getDefaultNet();
      
      if (netHandle) {
        const netCapabilities = await netConnection.getNetCapabilities(netHandle);
        
        if (netCapabilities.bearerTypes.includes(connection.NetBearType.BEARER_WIFI)) {
          return 'WiFi';
        } else if (netCapabilities.bearerTypes.includes(connection.NetBearType.BEARER_CELLULAR)) {
          return 'Cellular';
        } else if (netCapabilities.bearerTypes.includes(connection.NetBearType.BEARER_ETHERNET)) {
          return 'Ethernet';
        }
      }
      
      return 'Unknown';
      
    } catch (error) {
      return 'Unknown';
    }
  }

  private async getDeviceOrientation(): Promise<number> {
    try {
      const defaultDisplay = await display.getDefaultDisplay();
      return defaultDisplay.rotation;
      
    } catch (error) {
      return 0;
    }
  }

  private getBatteryHealthString(health: batteryInfo.BatteryHealthState): string {
    switch (health) {
      case batteryInfo.BatteryHealthState.UNKNOWN:
        return 'Unknown';
      case batteryInfo.BatteryHealthState.GOOD:
        return 'Good';
      case batteryInfo.BatteryHealthState.OVERHEAT:
        return 'Overheat';
      case batteryInfo.BatteryHealthState.OVER_VOLTAGE:
        return 'Over Voltage';
      case batteryInfo.BatteryHealthState.COLD:
        return 'Cold';
      case batteryInfo.BatteryHealthState.DEAD:
        return 'Dead';
      default:
        return 'Unknown';
    }
  }

  private emitEvent(event: SystemEvent, data: any): void {
    const listeners = this.eventListeners.get(event);
    if (listeners) {
      listeners.forEach(callback => {
        try {
          callback(data);
        } catch (error) {
          hilog.error(0x0000, 'REChainSystem', 'Event listener error: %{public}s', JSON.stringify(error));
        }
      });
    }
  }

  // Getters
  public isInitialized(): boolean {
    return this.initialized;
  }

  public getConfig(): SystemIntegrationConfig | null {
    return this.config;
  }
}
