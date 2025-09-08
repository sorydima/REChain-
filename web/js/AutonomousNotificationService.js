/**
 * REChain Web Autonomous Notification Service
 * Handles web notifications, push notifications, and service worker integration
 */

class AutonomousNotificationService {
    constructor() {
        this.isInitialized = false;
        this.notificationsEnabled = true;
        this.soundEnabled = true;
        this.serviceWorkerRegistration = null;
        this.pushSubscription = null;
        this.activeNotifications = new Map();
        this.notificationCounts = new Map();
        this.eventHandlers = {
            action: null,
            click: null,
            close: null,
            error: null
        };
        
        // Configuration
        this.config = {
            applicationName: 'REChain',
            applicationIcon: '/icons/Icon-192.png',
            badgeIcon: '/icons/Icon-192.png',
            soundPath: '/sounds/',
            vapidPublicKey: null, // Will be set during initialization
            notificationTimeout: 5000,
            maxNotifications: 10
        };
    }

    /**
     * Initialize the notification service
     */
    async initialize() {
        if (this.isInitialized) {
            return true;
        }

        try {
            console.log('[AutonomousNotificationService] Initializing...');

            // Check browser support
            if (!this.checkBrowserSupport()) {
                throw new Error('Browser does not support required features');
            }

            // Register service worker
            await this.registerServiceWorker();

            // Request notification permission
            await this.requestNotificationPermission();

            // Initialize push notifications
            await this.initializePushNotifications();

            // Setup event listeners
            this.setupEventListeners();

            this.isInitialized = true;
            console.log('[AutonomousNotificationService] Initialized successfully');
            
            return true;
        } catch (error) {
            console.error('[AutonomousNotificationService] Initialization failed:', error);
            return false;
        }
    }

    /**
     * Check browser support for required features
     */
    checkBrowserSupport() {
        const features = {
            'Service Workers': 'serviceWorker' in navigator,
            'Notifications': 'Notification' in window,
            'Push API': 'PushManager' in window,
            'Background Sync': 'serviceWorker' in navigator && 'sync' in window.ServiceWorkerRegistration.prototype
        };

        console.log('[AutonomousNotificationService] Browser support:', features);

        return features['Service Workers'] && features['Notifications'];
    }

    /**
     * Register service worker
     */
    async registerServiceWorker() {
        if (!('serviceWorker' in navigator)) {
            throw new Error('Service Workers not supported');
        }

        try {
            this.serviceWorkerRegistration = await navigator.serviceWorker.register('/sw.js', {
                scope: '/'
            });

            console.log('[AutonomousNotificationService] Service Worker registered:', this.serviceWorkerRegistration.scope);

            // Wait for service worker to be ready
            await navigator.serviceWorker.ready;

        } catch (error) {
            console.error('[AutonomousNotificationService] Service Worker registration failed:', error);
            throw error;
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

        if (permission !== 'granted') {
            console.warn('[AutonomousNotificationService] Notification permission denied');
            this.notificationsEnabled = false;
        }

        console.log('[AutonomousNotificationService] Notification permission:', permission);
        return permission === 'granted';
    }

    /**
     * Initialize push notifications
     */
    async initializePushNotifications() {
        if (!this.serviceWorkerRegistration || !('PushManager' in window)) {
            console.warn('[AutonomousNotificationService] Push notifications not available');
            return;
        }

        try {
            // Check if already subscribed
            this.pushSubscription = await this.serviceWorkerRegistration.pushManager.getSubscription();

            if (!this.pushSubscription && this.config.vapidPublicKey) {
                // Subscribe to push notifications
                this.pushSubscription = await this.serviceWorkerRegistration.pushManager.subscribe({
                    userVisibleOnly: true,
                    applicationServerKey: this.urlBase64ToUint8Array(this.config.vapidPublicKey)
                });

                console.log('[AutonomousNotificationService] Push subscription created');
            }

        } catch (error) {
            console.error('[AutonomousNotificationService] Push notification setup failed:', error);
        }
    }

    /**
     * Setup event listeners
     */
    setupEventListeners() {
        // Listen for messages from service worker
        navigator.serviceWorker.addEventListener('message', (event) => {
            this.handleServiceWorkerMessage(event.data);
        });

        // Listen for visibility changes
        document.addEventListener('visibilitychange', () => {
            if (document.visibilityState === 'visible') {
                this.clearBadge();
            }
        });

        // Listen for focus/blur events
        window.addEventListener('focus', () => {
            this.clearBadge();
        });
    }

    /**
     * Show message notification
     */
    async showMessageNotification(sender, message, roomId, options = {}) {
        if (!this.canShowNotification()) return;

        const notificationData = {
            type: 'message',
            title: `New message from ${sender}`,
            body: message,
            icon: this.config.applicationIcon,
            badge: this.config.badgeIcon,
            tag: `message_${roomId}`,
            data: {
                type: 'message',
                sender,
                roomId,
                timestamp: Date.now()
            },
            actions: [
                { action: 'reply', title: 'Reply', icon: '/icons/reply.png' },
                { action: 'open', title: 'Open', icon: '/icons/open.png' }
            ],
            ...options
        };

        return this.showNotification(notificationData);
    }

    /**
     * Show call notification
     */
    async showCallNotification(caller, callId, isVideo = false, options = {}) {
        if (!this.canShowNotification()) return;

        const notificationData = {
            type: 'call',
            title: isVideo ? 'Incoming Video Call' : 'Incoming Call',
            body: `From: ${caller}`,
            icon: this.config.applicationIcon,
            badge: this.config.badgeIcon,
            tag: `call_${callId}`,
            requireInteraction: true,
            data: {
                type: 'call',
                caller,
                callId,
                isVideo,
                timestamp: Date.now()
            },
            actions: [
                { action: 'accept', title: 'Accept', icon: '/icons/accept.png' },
                { action: 'decline', title: 'Decline', icon: '/icons/decline.png' }
            ],
            ...options
        };

        return this.showNotification(notificationData);
    }

    /**
     * Show missed call notification
     */
    async showMissedCallNotification(caller, callId, options = {}) {
        if (!this.canShowNotification()) return;

        const notificationData = {
            type: 'missed_call',
            title: 'Missed Call',
            body: `From: ${caller}`,
            icon: this.config.applicationIcon,
            badge: this.config.badgeIcon,
            tag: `missed_call_${callId}`,
            data: {
                type: 'missed_call',
                caller,
                callId,
                timestamp: Date.now()
            },
            actions: [
                { action: 'callback', title: 'Call Back', icon: '/icons/callback.png' }
            ],
            ...options
        };

        return this.showNotification(notificationData);
    }

    /**
     * Show user joined notification
     */
    async showUserJoinedNotification(username, roomName, roomId, options = {}) {
        if (!this.canShowNotification()) return;

        const notificationData = {
            type: 'user_joined',
            title: 'User Joined',
            body: `${username} joined ${roomName}`,
            icon: this.config.applicationIcon,
            badge: this.config.badgeIcon,
            tag: `user_joined_${roomId}`,
            data: {
                type: 'user_joined',
                username,
                roomName,
                roomId,
                timestamp: Date.now()
            },
            ...options
        };

        return this.showNotification(notificationData);
    }

    /**
     * Show file upload notification
     */
    async showFileUploadNotification(filename, roomName, roomId, options = {}) {
        if (!this.canShowNotification()) return;

        const notificationData = {
            type: 'file_upload',
            title: 'File Uploaded',
            body: `${filename} uploaded to ${roomName}`,
            icon: this.config.applicationIcon,
            badge: this.config.badgeIcon,
            tag: `file_upload_${roomId}`,
            data: {
                type: 'file_upload',
                filename,
                roomName,
                roomId,
                timestamp: Date.now()
            },
            actions: [
                { action: 'open', title: 'Open', icon: '/icons/open.png' },
                { action: 'download', title: 'Download', icon: '/icons/download.png' }
            ],
            ...options
        };

        return this.showNotification(notificationData);
    }

    /**
     * Show sync error notification
     */
    async showSyncErrorNotification(error, options = {}) {
        if (!this.canShowNotification()) return;

        const notificationData = {
            type: 'sync_error',
            title: 'Sync Error',
            body: error,
            icon: this.config.applicationIcon,
            badge: this.config.badgeIcon,
            tag: 'sync_error',
            data: {
                type: 'sync_error',
                error,
                timestamp: Date.now()
            },
            actions: [
                { action: 'retry', title: 'Retry', icon: '/icons/retry.png' }
            ],
            ...options
        };

        return this.showNotification(notificationData);
    }

    /**
     * Show login success notification
     */
    async showLoginSuccessNotification(username, options = {}) {
        if (!this.canShowNotification()) return;

        const notificationData = {
            type: 'login_success',
            title: 'Login Successful',
            body: `Welcome back, ${username}!`,
            icon: this.config.applicationIcon,
            badge: this.config.badgeIcon,
            tag: 'login_success',
            data: {
                type: 'login_success',
                username,
                timestamp: Date.now()
            },
            ...options
        };

        return this.showNotification(notificationData);
    }

    /**
     * Show generic notification
     */
    async showNotification(notificationData) {
        try {
            if (document.visibilityState === 'visible' && document.hasFocus()) {
                // Show in-app notification if app is visible
                this.showInAppNotification(notificationData);
                return;
            }

            // Show system notification
            if (this.serviceWorkerRegistration) {
                await this.serviceWorkerRegistration.showNotification(notificationData.title, notificationData);
            } else {
                const notification = new Notification(notificationData.title, notificationData);
                this.setupNotificationEvents(notification, notificationData);
            }

            // Track notification
            this.activeNotifications.set(notificationData.tag, notificationData);
            this.updateNotificationCount(notificationData.type, 1);

            // Play sound
            if (this.soundEnabled) {
                this.playNotificationSound(notificationData.type);
            }

            // Update badge
            this.updateBadge();

            console.log('[AutonomousNotificationService] Notification shown:', notificationData.title);

        } catch (error) {
            console.error('[AutonomousNotificationService] Failed to show notification:', error);
            this.handleNotificationError(error, notificationData);
        }
    }

    /**
     * Show in-app notification
     */
    showInAppNotification(notificationData) {
        // Create in-app notification element
        const notification = document.createElement('div');
        notification.className = 'in-app-notification';
        notification.innerHTML = `
            <div class="notification-icon">
                <img src="${notificationData.icon}" alt="Icon">
            </div>
            <div class="notification-content">
                <div class="notification-title">${notificationData.title}</div>
                <div class="notification-body">${notificationData.body}</div>
            </div>
            <div class="notification-actions">
                ${notificationData.actions ? notificationData.actions.map(action => 
                    `<button data-action="${action.action}">${action.title}</button>`
                ).join('') : ''}
                <button class="close-btn" data-action="close">×</button>
            </div>
        `;

        // Add event listeners
        notification.addEventListener('click', (event) => {
            const action = event.target.dataset.action;
            if (action) {
                this.handleNotificationAction(notificationData.tag, action);
            }
            if (action === 'close' || !action) {
                notification.remove();
            }
        });

        // Add to page
        document.body.appendChild(notification);

        // Auto-remove after timeout
        setTimeout(() => {
            if (notification.parentNode) {
                notification.remove();
            }
        }, this.config.notificationTimeout);
    }

    /**
     * Setup notification event handlers
     */
    setupNotificationEvents(notification, notificationData) {
        notification.addEventListener('click', () => {
            this.handleNotificationClick(notificationData.tag);
            notification.close();
        });

        notification.addEventListener('close', () => {
            this.handleNotificationClose(notificationData.tag);
        });

        notification.addEventListener('error', (error) => {
            this.handleNotificationError(error, notificationData);
        });
    }

    /**
     * Handle service worker messages
     */
    handleServiceWorkerMessage(data) {
        switch (data.type) {
            case 'notification-click':
                this.handleNotificationClick(data.tag);
                break;
            case 'notification-action':
                this.handleNotificationAction(data.tag, data.action);
                break;
            case 'notification-close':
                this.handleNotificationClose(data.tag);
                break;
            case 'push-received':
                this.handlePushMessage(data.payload);
                break;
        }
    }

    /**
     * Handle notification click
     */
    handleNotificationClick(tag) {
        console.log('[AutonomousNotificationService] Notification clicked:', tag);
        
        if (this.eventHandlers.click) {
            this.eventHandlers.click(tag);
        }

        // Focus window
        if (window.focus) {
            window.focus();
        }

        // Remove notification from tracking
        this.activeNotifications.delete(tag);
        this.updateBadge();
    }

    /**
     * Handle notification action
     */
    handleNotificationAction(tag, action) {
        console.log('[AutonomousNotificationService] Notification action:', tag, action);
        
        if (this.eventHandlers.action) {
            this.eventHandlers.action(tag, action);
        }

        // Remove notification from tracking
        this.activeNotifications.delete(tag);
        this.updateBadge();
    }

    /**
     * Handle notification close
     */
    handleNotificationClose(tag) {
        console.log('[AutonomousNotificationService] Notification closed:', tag);
        
        if (this.eventHandlers.close) {
            this.eventHandlers.close(tag);
        }

        // Remove notification from tracking
        this.activeNotifications.delete(tag);
        this.updateBadge();
    }

    /**
     * Handle notification error
     */
    handleNotificationError(error, notificationData) {
        console.error('[AutonomousNotificationService] Notification error:', error);
        
        if (this.eventHandlers.error) {
            this.eventHandlers.error(error, notificationData);
        }
    }

    /**
     * Handle push message
     */
    async handlePushMessage(payload) {
        try {
            const data = JSON.parse(payload);
            
            switch (data.type) {
                case 'message':
                    await this.showMessageNotification(data.sender, data.message, data.roomId);
                    break;
                case 'call':
                    await this.showCallNotification(data.caller, data.callId, data.isVideo);
                    break;
                default:
                    console.warn('[AutonomousNotificationService] Unknown push message type:', data.type);
            }
        } catch (error) {
            console.error('[AutonomousNotificationService] Failed to handle push message:', error);
        }
    }

    /**
     * Cancel notification
     */
    async cancelNotification(tag) {
        try {
            if (this.serviceWorkerRegistration) {
                const notifications = await this.serviceWorkerRegistration.getNotifications({ tag });
                notifications.forEach(notification => notification.close());
            }

            this.activeNotifications.delete(tag);
            this.updateBadge();

            console.log('[AutonomousNotificationService] Notification cancelled:', tag);
        } catch (error) {
            console.error('[AutonomousNotificationService] Failed to cancel notification:', error);
        }
    }

    /**
     * Cancel all notifications
     */
    async cancelAllNotifications() {
        try {
            if (this.serviceWorkerRegistration) {
                const notifications = await this.serviceWorkerRegistration.getNotifications();
                notifications.forEach(notification => notification.close());
            }

            this.activeNotifications.clear();
            this.notificationCounts.clear();
            this.clearBadge();

            console.log('[AutonomousNotificationService] All notifications cancelled');
        } catch (error) {
            console.error('[AutonomousNotificationService] Failed to cancel all notifications:', error);
        }
    }

    /**
     * Cancel notifications by type
     */
    async cancelNotificationsByType(type) {
        try {
            const tagsToRemove = [];
            
            for (const [tag, data] of this.activeNotifications) {
                if (data.data.type === type) {
                    await this.cancelNotification(tag);
                    tagsToRemove.push(tag);
                }
            }

            this.notificationCounts.set(type, 0);
            this.updateBadge();

            console.log('[AutonomousNotificationService] Notifications cancelled by type:', type);
        } catch (error) {
            console.error('[AutonomousNotificationService] Failed to cancel notifications by type:', error);
        }
    }

    /**
     * Play notification sound
     */
    playNotificationSound(type) {
        if (!this.soundEnabled) return;

        try {
            const soundMap = {
                'message': 'message.mp3',
                'call': 'call.mp3',
                'missed_call': 'missed_call.mp3',
                'sync_error': 'error.mp3',
                'default': 'notification.mp3'
            };

            const soundFile = soundMap[type] || soundMap.default;
            const audio = new Audio(`${this.config.soundPath}${soundFile}`);
            audio.volume = 0.5;
            audio.play().catch(error => {
                console.warn('[AutonomousNotificationService] Failed to play sound:', error);
            });
        } catch (error) {
            console.error('[AutonomousNotificationService] Sound playback error:', error);
        }
    }

    /**
     * Update notification badge
     */
    updateBadge() {
        const totalCount = Array.from(this.notificationCounts.values()).reduce((sum, count) => sum + count, 0);
        
        if ('setAppBadge' in navigator) {
            navigator.setAppBadge(totalCount).catch(error => {
                console.warn('[AutonomousNotificationService] Failed to set app badge:', error);
            });
        }

        // Update favicon badge
        this.updateFaviconBadge(totalCount);
    }

    /**
     * Update favicon with badge
     */
    updateFaviconBadge(count) {
        try {
            const canvas = document.createElement('canvas');
            canvas.width = 32;
            canvas.height = 32;
            const ctx = canvas.getContext('2d');

            // Draw base favicon
            const favicon = new Image();
            favicon.onload = () => {
                ctx.drawImage(favicon, 0, 0, 32, 32);

                if (count > 0) {
                    // Draw badge
                    ctx.fillStyle = '#ff4444';
                    ctx.beginPath();
                    ctx.arc(24, 8, 8, 0, 2 * Math.PI);
                    ctx.fill();

                    // Draw count
                    ctx.fillStyle = 'white';
                    ctx.font = 'bold 10px Arial';
                    ctx.textAlign = 'center';
                    ctx.fillText(count > 99 ? '99+' : count.toString(), 24, 12);
                }

                // Update favicon
                const link = document.querySelector('link[rel="icon"]') || document.createElement('link');
                link.rel = 'icon';
                link.href = canvas.toDataURL();
                if (!link.parentNode) {
                    document.head.appendChild(link);
                }
            };
            favicon.src = '/favicon.png';
        } catch (error) {
            console.error('[AutonomousNotificationService] Failed to update favicon badge:', error);
        }
    }

    /**
     * Clear badge
     */
    clearBadge() {
        this.notificationCounts.clear();
        
        if ('clearAppBadge' in navigator) {
            navigator.clearAppBadge().catch(error => {
                console.warn('[AutonomousNotificationService] Failed to clear app badge:', error);
            });
        }

        this.updateFaviconBadge(0);
    }

    /**
     * Update notification count
     */
    updateNotificationCount(type, delta) {
        const current = this.notificationCounts.get(type) || 0;
        this.notificationCounts.set(type, Math.max(0, current + delta));
    }

    /**
     * Check if notification can be shown
     */
    canShowNotification() {
        return this.isInitialized && 
               this.notificationsEnabled && 
               Notification.permission === 'granted';
    }

    /**
     * Utility: Convert VAPID key
     */
    urlBase64ToUint8Array(base64String) {
        const padding = '='.repeat((4 - base64String.length % 4) % 4);
        const base64 = (base64String + padding)
            .replace(/\-/g, '+')
            .replace(/_/g, '/');

        const rawData = window.atob(base64);
        const outputArray = new Uint8Array(rawData.length);

        for (let i = 0; i < rawData.length; ++i) {
            outputArray[i] = rawData.charCodeAt(i);
        }
        return outputArray;
    }

    /**
     * Set event handlers
     */
    setEventHandlers(handlers) {
        this.eventHandlers = { ...this.eventHandlers, ...handlers };
    }

    /**
     * Configuration methods
     */
    setNotificationsEnabled(enabled) {
        this.notificationsEnabled = enabled;
        console.log('[AutonomousNotificationService] Notifications', enabled ? 'enabled' : 'disabled');
    }

    setSoundEnabled(enabled) {
        this.soundEnabled = enabled;
        console.log('[AutonomousNotificationService] Sound', enabled ? 'enabled' : 'disabled');
    }

    setVapidPublicKey(key) {
        this.config.vapidPublicKey = key;
    }

    /**
     * Getters
     */
    isNotificationsEnabled() {
        return this.notificationsEnabled;
    }

    isSoundEnabled() {
        return this.soundEnabled;
    }

    getNotificationPermission() {
        return Notification.permission;
    }

    getPushSubscription() {
        return this.pushSubscription;
    }

    getActiveNotifications() {
        return Array.from(this.activeNotifications.values());
    }

    /**
     * Shutdown
     */
    shutdown() {
        this.cancelAllNotifications();
        this.clearBadge();
        this.isInitialized = false;
        console.log('[AutonomousNotificationService] Shutdown completed');
    }
}

// Export for use
window.AutonomousNotificationService = AutonomousNotificationService;
