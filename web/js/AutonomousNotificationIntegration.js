/**
 * REChain Web Autonomous Notification Integration
 * Integrates notification service with Matrix events and Flutter web
 */

class AutonomousNotificationIntegration {
    constructor() {
        this.isInitialized = false;
        this.notificationService = null;
        this.crashReportingManager = null;
        this.webSystemIntegration = null;
        
        // Matrix client integration
        this.matrixClient = null;
        this.flutterChannel = null;
        
        // Event listeners
        this.eventListeners = new Map();
        
        // Configuration
        this.config = {
            enableNotifications: true,
            enableSound: true,
            enableBadge: true,
            notificationTimeout: 5000,
            maxNotifications: 10,
            quietHours: {
                enabled: false,
                start: '22:00',
                end: '08:00'
            }
        };
        
        // Notification rules
        this.notificationRules = {
            messages: {
                enabled: true,
                showInActiveRoom: false,
                keywords: [],
                mentionsOnly: false
            },
            calls: {
                enabled: true,
                alwaysShow: true
            },
            invites: {
                enabled: true,
                autoAccept: false
            },
            roomEvents: {
                enabled: true,
                userJoined: true,
                userLeft: false,
                nameChanged: true,
                topicChanged: true
            }
        };
    }

    /**
     * Initialize the notification integration
     */
    async initialize(services = {}) {
        if (this.isInitialized) {
            return true;
        }

        try {
            console.log('[AutonomousNotificationIntegration] Initializing...');

            // Initialize services
            this.notificationService = services.notificationService || new AutonomousNotificationService();
            this.crashReportingManager = services.crashReportingManager || new CrashReportingManager();
            this.webSystemIntegration = services.webSystemIntegration || new WebSystemIntegration();

            // Initialize services if not already done
            if (!this.notificationService.isInitialized) {
                await this.notificationService.initialize();
            }
            
            if (!this.crashReportingManager.isInitialized) {
                await this.crashReportingManager.initialize();
            }
            
            if (!this.webSystemIntegration.isInitialized) {
                await this.webSystemIntegration.initialize();
            }

            // Setup Flutter integration
            this.setupFlutterIntegration();

            // Setup notification event handlers
            this.setupNotificationEventHandlers();

            // Setup Matrix event handlers
            this.setupMatrixEventHandlers();

            // Setup system event handlers
            this.setupSystemEventHandlers();

            // Load configuration
            this.loadConfiguration();

            this.isInitialized = true;
            this.crashReportingManager.logInfo('AutonomousNotificationIntegration initialized successfully');
            
            return true;
        } catch (error) {
            console.error('[AutonomousNotificationIntegration] Initialization failed:', error);
            this.crashReportingManager?.recordError('Notification integration initialization failed', { error: error.message });
            return false;
        }
    }

    /**
     * Setup Flutter integration
     */
    setupFlutterIntegration() {
        // Setup Flutter method channel
        if (window.flutter_inappwebview) {
            this.flutterChannel = window.flutter_inappwebview;
            
            // Register methods
            this.flutterChannel.callHandler = this.flutterChannel.callHandler || function() {};
            
            // Setup message handlers
            window.addEventListener('flutterInAppWebViewPlatformReady', () => {
                this.setupFlutterMethodHandlers();
            });
        }

        // Setup postMessage communication for web
        window.addEventListener('message', (event) => {
            if (event.data && event.data.type === 'flutter_notification') {
                this.handleFlutterNotificationRequest(event.data);
            }
        });
    }

    /**
     * Setup Flutter method handlers
     */
    setupFlutterMethodHandlers() {
        const methodHandlers = {
            'showNotification': this.handleShowNotification.bind(this),
            'cancelNotification': this.handleCancelNotification.bind(this),
            'cancelAllNotifications': this.handleCancelAllNotifications.bind(this),
            'setNotificationSettings': this.handleSetNotificationSettings.bind(this),
            'getNotificationPermission': this.handleGetNotificationPermission.bind(this),
            'requestNotificationPermission': this.handleRequestNotificationPermission.bind(this)
        };

        for (const [method, handler] of Object.entries(methodHandlers)) {
            if (this.flutterChannel) {
                this.flutterChannel.addJavaScriptHandler(method, handler);
            }
        }
    }

    /**
     * Setup notification event handlers
     */
    setupNotificationEventHandlers() {
        this.notificationService.setEventHandlers({
            click: (tag) => this.handleNotificationClick(tag),
            action: (tag, action) => this.handleNotificationAction(tag, action),
            close: (tag) => this.handleNotificationClose(tag),
            error: (error, data) => this.handleNotificationError(error, data)
        });
    }

    /**
     * Setup Matrix event handlers
     */
    setupMatrixEventHandlers() {
        // Listen for Matrix events from Flutter
        document.addEventListener('matrixEvent', (event) => {
            this.handleMatrixEvent(event.detail);
        });

        // Setup specific Matrix event types
        const matrixEventTypes = {
            'm.room.message': this.handleRoomMessage.bind(this),
            'm.call.invite': this.handleCallInvite.bind(this),
            'm.call.hangup': this.handleCallHangup.bind(this),
            'm.room.member': this.handleRoomMember.bind(this),
            'm.room.create': this.handleRoomCreate.bind(this),
            'm.room.name': this.handleRoomName.bind(this),
            'm.room.topic': this.handleRoomTopic.bind(this),
            'm.room.encrypted': this.handleEncryptedMessage.bind(this),
            'm.login': this.handleLogin.bind(this),
            'm.sync.error': this.handleSyncError.bind(this),
            'm.device.verification': this.handleDeviceVerification.bind(this),
            'm.space.join': this.handleSpaceJoin.bind(this)
        };

        for (const [eventType, handler] of Object.entries(matrixEventTypes)) {
            this.addEventListener(eventType, handler);
        }
    }

    /**
     * Setup system event handlers
     */
    setupSystemEventHandlers() {
        // Visibility change
        this.webSystemIntegration.setEventHandlers({
            visibilityChange: (isVisible) => {
                if (isVisible) {
                    // Clear notifications when app becomes visible
                    this.clearActiveRoomNotifications();
                }
            },
            
            online: () => {
                this.crashReportingManager.logInfo('Connection restored');
            },
            
            offline: () => {
                this.crashReportingManager.logWarning('Connection lost');
                this.showOfflineNotification();
            }
        });
    }

    /**
     * Handle Matrix events
     */
    async handleMatrixEvent(eventData) {
        try {
            const { type, content, sender, roomId, timestamp } = eventData;
            
            // Log event
            this.crashReportingManager.addBreadcrumb({
                type: 'matrix',
                category: 'event',
                message: `Matrix event: ${type}`,
                data: { type, sender, roomId }
            });

            // Check if notifications are enabled
            if (!this.config.enableNotifications) {
                return;
            }

            // Check quiet hours
            if (this.isQuietHours()) {
                return;
            }

            // Dispatch to specific handler
            const handler = this.eventListeners.get(type);
            if (handler) {
                await handler(eventData);
            }

        } catch (error) {
            console.error('[AutonomousNotificationIntegration] Failed to handle Matrix event:', error);
            this.crashReportingManager.recordError('Matrix event handling failed', { 
                error: error.message, 
                eventType: eventData.type 
            });
        }
    }

    /**
     * Matrix event handlers
     */
    async handleRoomMessage(eventData) {
        const { content, sender, roomId, roomName } = eventData;
        
        if (!this.notificationRules.messages.enabled) {
            return;
        }

        // Check if message is in currently active room
        if (!this.notificationRules.messages.showInActiveRoom && this.isActiveRoom(roomId)) {
            return;
        }

        // Check for mentions or keywords
        const shouldNotify = this.shouldNotifyForMessage(content, sender);
        if (!shouldNotify) {
            return;
        }

        await this.notificationService.showMessageNotification(
            sender,
            content.body || 'New message',
            roomId,
            { 
                data: { roomName, timestamp: Date.now() },
                tag: `message_${roomId}` 
            }
        );
    }

    async handleCallInvite(eventData) {
        const { sender, callId, content } = eventData;
        
        if (!this.notificationRules.calls.enabled) {
            return;
        }

        const isVideo = content.offer?.type === 'video' || content.version === '1';
        
        await this.notificationService.showCallNotification(
            sender,
            callId,
            isVideo,
            { 
                requireInteraction: true,
                tag: `call_${callId}` 
            }
        );
    }

    async handleCallHangup(eventData) {
        const { sender, callId } = eventData;
        
        // Cancel call notification
        await this.notificationService.cancelNotification(`call_${callId}`);
        
        // Show missed call notification
        await this.notificationService.showMissedCallNotification(
            sender,
            callId,
            { tag: `missed_call_${callId}` }
        );
    }

    async handleRoomMember(eventData) {
        const { content, sender, roomId, roomName } = eventData;
        
        if (!this.notificationRules.roomEvents.enabled) {
            return;
        }

        if (content.membership === 'join' && this.notificationRules.roomEvents.userJoined) {
            await this.notificationService.showUserJoinedNotification(
                sender,
                roomName || 'Room',
                roomId,
                { tag: `user_joined_${roomId}` }
            );
        } else if (content.membership === 'leave' && this.notificationRules.roomEvents.userLeft) {
            await this.notificationService.showUserLeftNotification(
                sender,
                roomName || 'Room',
                roomId,
                { tag: `user_left_${roomId}` }
            );
        }
    }

    async handleRoomCreate(eventData) {
        const { sender, roomId, roomName } = eventData;
        
        await this.notificationService.showRoomCreatedNotification(
            roomName || 'New Room',
            sender,
            roomId,
            { tag: `room_created_${roomId}` }
        );
    }

    async handleLogin(eventData) {
        const { userId } = eventData;
        
        await this.notificationService.showLoginSuccessNotification(
            userId,
            { tag: 'login_success' }
        );
    }

    async handleSyncError(eventData) {
        const { error } = eventData;
        
        await this.notificationService.showSyncErrorNotification(
            error || 'Synchronization failed',
            { tag: 'sync_error' }
        );
    }

    async handleDeviceVerification(eventData) {
        const { deviceName } = eventData;
        
        await this.notificationService.showDeviceVerificationNotification(
            deviceName || 'Unknown Device',
            { tag: 'device_verification' }
        );
    }

    async handleSpaceJoin(eventData) {
        const { spaceName, spaceId } = eventData;
        
        await this.notificationService.showSpaceJoinedNotification(
            spaceName || 'Space',
            spaceId,
            { tag: `space_joined_${spaceId}` }
        );
    }

    /**
     * Flutter method handlers
     */
    async handleShowNotification(args) {
        try {
            const { type, data } = args;
            
            switch (type) {
                case 'message':
                    return await this.notificationService.showMessageNotification(
                        data.sender, data.message, data.roomId, data.options
                    );
                case 'call':
                    return await this.notificationService.showCallNotification(
                        data.caller, data.callId, data.isVideo, data.options
                    );
                case 'sync_error':
                    return await this.notificationService.showSyncErrorNotification(
                        data.error, data.options
                    );
                default:
                    console.warn('[AutonomousNotificationIntegration] Unknown notification type:', type);
                    return false;
            }
        } catch (error) {
            this.crashReportingManager.recordError('Show notification failed', { error: error.message });
            return false;
        }
    }

    async handleCancelNotification(args) {
        try {
            const { tag } = args;
            await this.notificationService.cancelNotification(tag);
            return true;
        } catch (error) {
            this.crashReportingManager.recordError('Cancel notification failed', { error: error.message });
            return false;
        }
    }

    async handleCancelAllNotifications() {
        try {
            await this.notificationService.cancelAllNotifications();
            return true;
        } catch (error) {
            this.crashReportingManager.recordError('Cancel all notifications failed', { error: error.message });
            return false;
        }
    }

    async handleSetNotificationSettings(args) {
        try {
            const { settings } = args;
            this.updateConfiguration(settings);
            this.saveConfiguration();
            return true;
        } catch (error) {
            this.crashReportingManager.recordError('Set notification settings failed', { error: error.message });
            return false;
        }
    }

    async handleGetNotificationPermission() {
        return this.notificationService.getNotificationPermission();
    }

    async handleRequestNotificationPermission() {
        return await this.notificationService.requestNotificationPermission();
    }

    /**
     * Notification event handlers
     */
    handleNotificationClick(tag) {
        console.log('[AutonomousNotificationIntegration] Notification clicked:', tag);
        
        // Parse tag to determine action
        const [type, id] = tag.split('_');
        
        switch (type) {
            case 'message':
                this.openRoom(id);
                break;
            case 'call':
                this.acceptCall(id);
                break;
            case 'missed':
                this.openCallHistory();
                break;
            default:
                this.openApp();
        }
        
        // Notify Flutter
        this.notifyFlutter('notificationClick', { tag, type, id });
    }

    handleNotificationAction(tag, action) {
        console.log('[AutonomousNotificationIntegration] Notification action:', tag, action);
        
        const [type, id] = tag.split('_');
        
        switch (action) {
            case 'reply':
                this.openReply(id);
                break;
            case 'accept':
                this.acceptCall(id);
                break;
            case 'decline':
                this.declineCall(id);
                break;
            case 'callback':
                this.initiateCall(id);
                break;
            case 'open':
                this.openRoom(id);
                break;
            case 'retry':
                this.retrySync();
                break;
        }
        
        // Notify Flutter
        this.notifyFlutter('notificationAction', { tag, action, type, id });
    }

    handleNotificationClose(tag) {
        console.log('[AutonomousNotificationIntegration] Notification closed:', tag);
        
        // Notify Flutter
        this.notifyFlutter('notificationClose', { tag });
    }

    handleNotificationError(error, data) {
        console.error('[AutonomousNotificationIntegration] Notification error:', error);
        this.crashReportingManager.recordError('Notification error', { 
            error: error.message, 
            notificationData: data 
        });
    }

    /**
     * Action handlers
     */
    openRoom(roomId) {
        this.notifyFlutter('openRoom', { roomId });
    }

    openReply(roomId) {
        this.notifyFlutter('openReply', { roomId });
    }

    acceptCall(callId) {
        this.notifyFlutter('acceptCall', { callId });
    }

    declineCall(callId) {
        this.notifyFlutter('declineCall', { callId });
    }

    initiateCall(userId) {
        this.notifyFlutter('initiateCall', { userId });
    }

    openCallHistory() {
        this.notifyFlutter('openCallHistory', {});
    }

    openApp() {
        this.notifyFlutter('openApp', {});
    }

    retrySync() {
        this.notifyFlutter('retrySync', {});
    }

    /**
     * Utility methods
     */
    shouldNotifyForMessage(content, sender) {
        // Check mentions only mode
        if (this.notificationRules.messages.mentionsOnly) {
            return this.containsMention(content.body);
        }

        // Check keywords
        if (this.notificationRules.messages.keywords.length > 0) {
            return this.containsKeywords(content.body, this.notificationRules.messages.keywords);
        }

        return true;
    }

    containsMention(text) {
        // Simple mention detection (can be enhanced)
        return text && (text.includes('@') || text.includes('everyone') || text.includes('here'));
    }

    containsKeywords(text, keywords) {
        if (!text) return false;
        
        const lowerText = text.toLowerCase();
        return keywords.some(keyword => lowerText.includes(keyword.toLowerCase()));
    }

    isActiveRoom(roomId) {
        // Check if room is currently active (implementation depends on app state)
        return false; // Placeholder
    }

    isQuietHours() {
        if (!this.config.quietHours.enabled) {
            return false;
        }

        const now = new Date();
        const currentTime = now.getHours() * 60 + now.getMinutes();
        
        const [startHour, startMin] = this.config.quietHours.start.split(':').map(Number);
        const [endHour, endMin] = this.config.quietHours.end.split(':').map(Number);
        
        const startTime = startHour * 60 + startMin;
        const endTime = endHour * 60 + endMin;
        
        if (startTime <= endTime) {
            return currentTime >= startTime && currentTime <= endTime;
        } else {
            return currentTime >= startTime || currentTime <= endTime;
        }
    }

    clearActiveRoomNotifications() {
        // Implementation to clear notifications for active room
        this.notificationService.cancelNotificationsByType('message');
    }

    async showOfflineNotification() {
        await this.notificationService.showSyncErrorNotification(
            'Connection lost. Some features may not work.',
            { tag: 'offline_status' }
        );
    }

    /**
     * Flutter communication
     */
    notifyFlutter(method, data) {
        try {
            if (this.flutterChannel && this.flutterChannel.callHandler) {
                this.flutterChannel.callHandler(method, data);
            } else {
                // Fallback to postMessage
                window.parent.postMessage({
                    type: 'notification_integration',
                    method: method,
                    data: data
                }, '*');
            }
        } catch (error) {
            console.error('[AutonomousNotificationIntegration] Failed to notify Flutter:', error);
        }
    }

    handleFlutterNotificationRequest(data) {
        const { method, args } = data;
        
        switch (method) {
            case 'matrixEvent':
                this.handleMatrixEvent(args);
                break;
            case 'updateSettings':
                this.updateConfiguration(args);
                break;
            default:
                console.warn('[AutonomousNotificationIntegration] Unknown Flutter method:', method);
        }
    }

    /**
     * Configuration management
     */
    updateConfiguration(newConfig) {
        this.config = { ...this.config, ...newConfig };
        
        // Update notification service settings
        if (newConfig.enableNotifications !== undefined) {
            this.notificationService.setNotificationsEnabled(newConfig.enableNotifications);
        }
        
        if (newConfig.enableSound !== undefined) {
            this.notificationService.setSoundEnabled(newConfig.enableSound);
        }
    }

    loadConfiguration() {
        try {
            const stored = localStorage.getItem('rechain_notification_config');
            if (stored) {
                const config = JSON.parse(stored);
                this.updateConfiguration(config);
            }
        } catch (error) {
            console.error('[AutonomousNotificationIntegration] Failed to load configuration:', error);
        }
    }

    saveConfiguration() {
        try {
            localStorage.setItem('rechain_notification_config', JSON.stringify(this.config));
        } catch (error) {
            console.error('[AutonomousNotificationIntegration] Failed to save configuration:', error);
        }
    }

    /**
     * Event listener management
     */
    addEventListener(eventType, handler) {
        this.eventListeners.set(eventType, handler);
    }

    removeEventListener(eventType) {
        this.eventListeners.delete(eventType);
    }

    /**
     * Getters
     */
    getConfiguration() {
        return { ...this.config };
    }

    getNotificationRules() {
        return { ...this.notificationRules };
    }

    /**
     * Shutdown
     */
    shutdown() {
        // Clear event listeners
        this.eventListeners.clear();
        
        // Save configuration
        this.saveConfiguration();
        
        // Shutdown services
        if (this.notificationService) {
            this.notificationService.shutdown();
        }
        
        this.isInitialized = false;
        console.log('[AutonomousNotificationIntegration] Shutdown completed');
    }
}

// Export for use
window.AutonomousNotificationIntegration = AutonomousNotificationIntegration;
