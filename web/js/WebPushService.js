/**
 * REChain Web Push Notification Service
 * Handles push notification subscriptions and message delivery
 */

class WebPushService {
    constructor() {
        this.isInitialized = false;
        this.subscription = null;
        this.vapidPublicKey = null;
        this.serviceWorkerRegistration = null;
        this.errorHandler = null;
        
        // Configuration
        this.config = {
            vapidPublicKey: 'BEl62iUYgUivxIkv69yViEuiBIa40HI0DLLuxazjqAKVXTJtkTXaXDiDNjRUjzgyw9FNeBHUHIHu6j3V0VdNULI', // Replace with actual key
            serverEndpoint: '/api/push/subscribe',
            retryAttempts: 3,
            retryDelay: 1000,
            enableDebugLogging: true
        };
        
        // Push message types
        this.messageTypes = {
            MESSAGE: 'message',
            CALL: 'call',
            INVITE: 'invite',
            SYNC: 'sync',
            SYSTEM: 'system'
        };
        
        // Subscription status
        this.subscriptionStatus = {
            UNKNOWN: 'unknown',
            SUBSCRIBED: 'subscribed',
            UNSUBSCRIBED: 'unsubscribed',
            PERMISSION_DENIED: 'permission_denied',
            NOT_SUPPORTED: 'not_supported'
        };
        
        this.currentStatus = this.subscriptionStatus.UNKNOWN;
    }

    /**
     * Initialize push service
     */
    async initialize(config = {}) {
        if (this.isInitialized) {
            return true;
        }

        try {
            // Update configuration
            this.config = { ...this.config, ...config };
            this.errorHandler = config.errorHandler;
            
            this.log('Initializing WebPushService...');
            
            // Check push notification support
            if (!this.isPushSupported()) {
                this.currentStatus = this.subscriptionStatus.NOT_SUPPORTED;
                this.log('Push notifications not supported');
                return false;
            }
            
            // Get service worker registration
            await this.getServiceWorkerRegistration();
            
            // Check existing subscription
            await this.checkExistingSubscription();
            
            // Setup message handlers
            this.setupMessageHandlers();
            
            this.isInitialized = true;
            this.log('WebPushService initialized successfully');
            
            return true;
        } catch (error) {
            this.handleError('Push service initialization failed', error);
            return false;
        }
    }

    /**
     * Check if push notifications are supported
     */
    isPushSupported() {
        return 'serviceWorker' in navigator && 
               'PushManager' in window && 
               'Notification' in window;
    }

    /**
     * Get service worker registration
     */
    async getServiceWorkerRegistration() {
        if (!('serviceWorker' in navigator)) {
            throw new Error('Service Worker not supported');
        }

        try {
            this.serviceWorkerRegistration = await navigator.serviceWorker.ready;
            this.log('Service worker registration obtained');
        } catch (error) {
            throw new Error(`Failed to get service worker registration: ${error.message}`);
        }
    }

    /**
     * Check for existing subscription
     */
    async checkExistingSubscription() {
        try {
            this.subscription = await this.serviceWorkerRegistration.pushManager.getSubscription();
            
            if (this.subscription) {
                this.currentStatus = this.subscriptionStatus.SUBSCRIBED;
                this.log('Existing push subscription found');
                
                // Validate subscription with server
                await this.validateSubscriptionWithServer();
            } else {
                this.currentStatus = this.subscriptionStatus.UNSUBSCRIBED;
                this.log('No existing push subscription');
            }
        } catch (error) {
            this.handleError('Failed to check existing subscription', error);
        }
    }

    /**
     * Subscribe to push notifications
     */
    async subscribe() {
        try {
            this.log('Requesting push notification subscription...');
            
            // Check notification permission
            const permission = await this.requestNotificationPermission();
            if (permission !== 'granted') {
                this.currentStatus = this.subscriptionStatus.PERMISSION_DENIED;
                throw new Error('Notification permission denied');
            }
            
            // Create push subscription
            const subscriptionOptions = {
                userVisibleOnly: true,
                applicationServerKey: this.urlBase64ToUint8Array(this.config.vapidPublicKey)
            };
            
            this.subscription = await this.serviceWorkerRegistration.pushManager.subscribe(subscriptionOptions);
            this.currentStatus = this.subscriptionStatus.SUBSCRIBED;
            
            this.log('Push subscription created successfully');
            
            // Send subscription to server
            await this.sendSubscriptionToServer();
            
            return this.subscription;
        } catch (error) {
            this.handleError('Push subscription failed', error);
            throw error;
        }
    }

    /**
     * Unsubscribe from push notifications
     */
    async unsubscribe() {
        try {
            if (!this.subscription) {
                this.log('No active subscription to unsubscribe from');
                return true;
            }
            
            this.log('Unsubscribing from push notifications...');
            
            // Unsubscribe from push manager
            const success = await this.subscription.unsubscribe();
            
            if (success) {
                // Remove subscription from server
                await this.removeSubscriptionFromServer();
                
                this.subscription = null;
                this.currentStatus = this.subscriptionStatus.UNSUBSCRIBED;
                
                this.log('Successfully unsubscribed from push notifications');
            }
            
            return success;
        } catch (error) {
            this.handleError('Push unsubscription failed', error);
            return false;
        }
    }

    /**
     * Request notification permission
     */
    async requestNotificationPermission() {
        if (!('Notification' in window)) {
            throw new Error('Notifications not supported');
        }

        let permission = Notification.permission;
        
        if (permission === 'default') {
            permission = await Notification.requestPermission();
        }
        
        this.log(`Notification permission: ${permission}`);
        return permission;
    }

    /**
     * Send subscription to server
     */
    async sendSubscriptionToServer() {
        try {
            const subscriptionData = {
                endpoint: this.subscription.endpoint,
                keys: {
                    p256dh: this.arrayBufferToBase64(this.subscription.getKey('p256dh')),
                    auth: this.arrayBufferToBase64(this.subscription.getKey('auth'))
                },
                userAgent: navigator.userAgent,
                timestamp: new Date().toISOString()
            };
            
            const response = await fetch(this.config.serverEndpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(subscriptionData)
            });
            
            if (!response.ok) {
                throw new Error(`Server responded with ${response.status}: ${response.statusText}`);
            }
            
            const result = await response.json();
            this.log('Subscription sent to server successfully', result);
            
            return result;
        } catch (error) {
            this.handleError('Failed to send subscription to server', error);
            throw error;
        }
    }

    /**
     * Remove subscription from server
     */
    async removeSubscriptionFromServer() {
        try {
            const response = await fetch(`${this.config.serverEndpoint}/${this.getSubscriptionId()}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                }
            });
            
            if (!response.ok) {
                throw new Error(`Server responded with ${response.status}: ${response.statusText}`);
            }
            
            this.log('Subscription removed from server successfully');
        } catch (error) {
            this.handleError('Failed to remove subscription from server', error);
            // Don't throw - unsubscription should still succeed locally
        }
    }

    /**
     * Validate subscription with server
     */
    async validateSubscriptionWithServer() {
        try {
            const response = await fetch(`${this.config.serverEndpoint}/${this.getSubscriptionId()}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                }
            });
            
            if (response.status === 404) {
                // Subscription not found on server, re-register
                this.log('Subscription not found on server, re-registering...');
                await this.sendSubscriptionToServer();
            } else if (!response.ok) {
                throw new Error(`Server responded with ${response.status}: ${response.statusText}`);
            } else {
                this.log('Subscription validated with server');
            }
        } catch (error) {
            this.handleError('Failed to validate subscription with server', error);
        }
    }

    /**
     * Setup message handlers for service worker communication
     */
    setupMessageHandlers() {
        if (!('serviceWorker' in navigator)) {
            return;
        }

        navigator.serviceWorker.addEventListener('message', (event) => {
            this.handleServiceWorkerMessage(event.data);
        });
    }

    /**
     * Handle messages from service worker
     */
    handleServiceWorkerMessage(data) {
        this.log('Received message from service worker:', data);
        
        switch (data.type) {
            case 'PUSH_RECEIVED':
                this.handlePushReceived(data.payload);
                break;
                
            case 'NOTIFICATION_CLICKED':
                this.handleNotificationClicked(data.notification);
                break;
                
            case 'NOTIFICATION_CLOSED':
                this.handleNotificationClosed(data.notification);
                break;
                
            default:
                this.log('Unknown service worker message type:', data.type);
        }
    }

    /**
     * Handle push message received
     */
    handlePushReceived(payload) {
        this.log('Push message received:', payload);
        
        // Notify main application
        if (window.REChainServices?.notificationIntegration) {
            window.REChainServices.notificationIntegration.handleMatrixEvent({
                type: 'm.push.received',
                content: payload,
                timestamp: Date.now()
            });
        }
    }

    /**
     * Handle notification clicked
     */
    handleNotificationClicked(notification) {
        this.log('Push notification clicked:', notification);
        
        // Focus window if available
        if (window.focus) {
            window.focus();
        }
        
        // Handle notification action
        if (window.REChainServices?.notificationIntegration) {
            window.REChainServices.notificationIntegration.handleNotificationClick(notification.tag);
        }
    }

    /**
     * Handle notification closed
     */
    handleNotificationClosed(notification) {
        this.log('Push notification closed:', notification);
        
        if (window.REChainServices?.notificationIntegration) {
            window.REChainServices.notificationIntegration.handleNotificationClose(notification.tag);
        }
    }

    /**
     * Send test push notification
     */
    async sendTestNotification() {
        try {
            if (!this.subscription) {
                throw new Error('No active subscription');
            }
            
            const testPayload = {
                type: this.messageTypes.SYSTEM,
                title: 'REChain Test Notification',
                body: 'Push notifications are working correctly!',
                icon: '/icons/Icon-192.png',
                timestamp: Date.now()
            };
            
            const response = await fetch('/api/push/test', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    subscription: this.getSubscriptionId(),
                    payload: testPayload
                })
            });
            
            if (!response.ok) {
                throw new Error(`Test notification failed: ${response.statusText}`);
            }
            
            this.log('Test notification sent successfully');
            return true;
        } catch (error) {
            this.handleError('Failed to send test notification', error);
            return false;
        }
    }

    /**
     * Get subscription ID (hash of endpoint)
     */
    getSubscriptionId() {
        if (!this.subscription) {
            return null;
        }
        
        // Simple hash of endpoint for ID
        return btoa(this.subscription.endpoint).replace(/[^a-zA-Z0-9]/g, '').substring(0, 16);
    }

    /**
     * Utility functions
     */
    urlBase64ToUint8Array(base64String) {
        const padding = '='.repeat((4 - base64String.length % 4) % 4);
        const base64 = (base64String + padding)
            .replace(/-/g, '+')
            .replace(/_/g, '/');

        const rawData = window.atob(base64);
        const outputArray = new Uint8Array(rawData.length);

        for (let i = 0; i < rawData.length; ++i) {
            outputArray[i] = rawData.charCodeAt(i);
        }
        return outputArray;
    }

    arrayBufferToBase64(buffer) {
        const bytes = new Uint8Array(buffer);
        let binary = '';
        for (let i = 0; i < bytes.byteLength; i++) {
            binary += String.fromCharCode(bytes[i]);
        }
        return window.btoa(binary);
    }

    /**
     * Get current subscription status
     */
    getSubscriptionStatus() {
        return {
            status: this.currentStatus,
            hasSubscription: !!this.subscription,
            isSupported: this.isPushSupported(),
            permission: 'Notification' in window ? Notification.permission : 'not-supported'
        };
    }

    /**
     * Get subscription details
     */
    getSubscriptionDetails() {
        if (!this.subscription) {
            return null;
        }
        
        return {
            endpoint: this.subscription.endpoint,
            expirationTime: this.subscription.expirationTime,
            options: this.subscription.options
        };
    }

    /**
     * Update VAPID key
     */
    updateVapidKey(newKey) {
        this.config.vapidPublicKey = newKey;
        this.log('VAPID key updated');
    }

    /**
     * Update server endpoint
     */
    updateServerEndpoint(newEndpoint) {
        this.config.serverEndpoint = newEndpoint;
        this.log('Server endpoint updated');
    }

    /**
     * Logging
     */
    log(message, data = null) {
        if (this.config.enableDebugLogging) {
            if (data) {
                console.log(`[WebPushService] ${message}`, data);
            } else {
                console.log(`[WebPushService] ${message}`);
            }
        }
    }

    /**
     * Error handling
     */
    handleError(message, error) {
        console.error(`[WebPushService] ${message}:`, error);
        
        if (this.errorHandler) {
            this.errorHandler.handleError({
                message: `WebPushService: ${message}`,
                error: error,
                category: 'push_notification',
                context: 'web_push_service'
            });
        }
    }

    /**
     * Shutdown
     */
    shutdown() {
        this.log('Shutting down WebPushService...');
        this.isInitialized = false;
    }
}

// Export for use
window.WebPushService = WebPushService;
