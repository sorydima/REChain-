/**
 * REChain Web Error Handler
 * Centralized error handling and logging system for web platform
 */

class ErrorHandler {
    constructor() {
        this.isInitialized = false;
        this.crashReportingManager = null;
        this.errorQueue = [];
        this.maxQueueSize = 100;
        
        // Error categories
        this.errorCategories = {
            NETWORK: 'network',
            PERMISSION: 'permission',
            STORAGE: 'storage',
            NOTIFICATION: 'notification',
            SERVICE_WORKER: 'service_worker',
            FLUTTER: 'flutter',
            JAVASCRIPT: 'javascript',
            MATRIX: 'matrix',
            UNKNOWN: 'unknown'
        };
        
        // Error severity levels
        this.severityLevels = {
            LOW: 'low',
            MEDIUM: 'medium',
            HIGH: 'high',
            CRITICAL: 'critical'
        };
        
        // Configuration
        this.config = {
            enableConsoleLogging: true,
            enableRemoteLogging: true,
            enableUserNotification: true,
            maxRetries: 3,
            retryDelay: 1000,
            userFriendlyMessages: true
        };
        
        // User-friendly error messages
        this.userMessages = {
            [this.errorCategories.NETWORK]: 'Connection problem. Please check your internet connection.',
            [this.errorCategories.PERMISSION]: 'Permission required. Please allow the requested permission.',
            [this.errorCategories.STORAGE]: 'Storage issue. Please clear your browser cache.',
            [this.errorCategories.NOTIFICATION]: 'Notification problem. Please check notification settings.',
            [this.errorCategories.SERVICE_WORKER]: 'App update issue. Please refresh the page.',
            [this.errorCategories.FLUTTER]: 'App loading issue. Please refresh the page.',
            [this.errorCategories.JAVASCRIPT]: 'App error occurred. Please refresh the page.',
            [this.errorCategories.MATRIX]: 'Chat service issue. Please try again later.',
            [this.errorCategories.UNKNOWN]: 'An unexpected error occurred. Please try again.'
        };
    }

    /**
     * Initialize error handler
     */
    async initialize(crashReportingManager) {
        if (this.isInitialized) {
            return true;
        }

        try {
            this.crashReportingManager = crashReportingManager;
            
            // Setup global error handlers
            this.setupGlobalErrorHandlers();
            
            // Setup unhandled promise rejection handler
            this.setupPromiseRejectionHandler();
            
            // Setup service worker error handler
            this.setupServiceWorkerErrorHandler();
            
            // Process queued errors
            this.processErrorQueue();
            
            this.isInitialized = true;
            console.log('[ErrorHandler] Initialized successfully');
            
            return true;
        } catch (error) {
            console.error('[ErrorHandler] Initialization failed:', error);
            return false;
        }
    }

    /**
     * Setup global error handlers
     */
    setupGlobalErrorHandlers() {
        // Global JavaScript error handler
        window.addEventListener('error', (event) => {
            this.handleError({
                message: event.message,
                filename: event.filename,
                lineno: event.lineno,
                colno: event.colno,
                error: event.error,
                category: this.errorCategories.JAVASCRIPT,
                severity: this.severityLevels.MEDIUM,
                context: 'global_error'
            });
        });

        // Resource loading error handler
        window.addEventListener('error', (event) => {
            if (event.target !== window) {
                this.handleError({
                    message: `Failed to load resource: ${event.target.src || event.target.href}`,
                    category: this.errorCategories.NETWORK,
                    severity: this.severityLevels.LOW,
                    context: 'resource_loading',
                    element: event.target.tagName
                });
            }
        }, true);
    }

    /**
     * Setup promise rejection handler
     */
    setupPromiseRejectionHandler() {
        window.addEventListener('unhandledrejection', (event) => {
            this.handleError({
                message: event.reason?.message || 'Unhandled promise rejection',
                error: event.reason,
                category: this.categorizeError(event.reason),
                severity: this.severityLevels.MEDIUM,
                context: 'unhandled_promise'
            });
        });
    }

    /**
     * Setup service worker error handler
     */
    setupServiceWorkerErrorHandler() {
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.addEventListener('error', (event) => {
                this.handleError({
                    message: 'Service worker error',
                    error: event.error,
                    category: this.errorCategories.SERVICE_WORKER,
                    severity: this.severityLevels.HIGH,
                    context: 'service_worker'
                });
            });
        }
    }

    /**
     * Handle error with comprehensive processing
     */
    async handleError(errorData) {
        try {
            // Enrich error data
            const enrichedError = this.enrichErrorData(errorData);
            
            // Log to console if enabled
            if (this.config.enableConsoleLogging) {
                this.logToConsole(enrichedError);
            }
            
            // Report to crash reporting manager
            if (this.crashReportingManager && this.config.enableRemoteLogging) {
                await this.reportToCrashManager(enrichedError);
            }
            
            // Queue error if crash manager not available
            if (!this.crashReportingManager) {
                this.queueError(enrichedError);
            }
            
            // Show user notification if appropriate
            if (this.config.enableUserNotification && this.shouldNotifyUser(enrichedError)) {
                this.notifyUser(enrichedError);
            }
            
            // Attempt recovery if possible
            await this.attemptRecovery(enrichedError);
            
        } catch (handlingError) {
            console.error('[ErrorHandler] Failed to handle error:', handlingError);
            // Fallback: at least log the original error
            console.error('[ErrorHandler] Original error:', errorData);
        }
    }

    /**
     * Enrich error data with additional context
     */
    enrichErrorData(errorData) {
        const enriched = {
            ...errorData,
            timestamp: new Date().toISOString(),
            userAgent: navigator.userAgent,
            url: window.location.href,
            viewport: {
                width: window.innerWidth,
                height: window.innerHeight
            },
            online: navigator.onLine,
            language: navigator.language
        };

        // Add stack trace if available
        if (errorData.error && errorData.error.stack) {
            enriched.stack = errorData.error.stack;
        }

        // Categorize if not already categorized
        if (!enriched.category) {
            enriched.category = this.categorizeError(errorData);
        }

        // Set severity if not already set
        if (!enriched.severity) {
            enriched.severity = this.determineSeverity(enriched);
        }

        return enriched;
    }

    /**
     * Categorize error based on content
     */
    categorizeError(errorData) {
        const message = errorData.message || errorData.toString();
        const lowerMessage = message.toLowerCase();

        if (lowerMessage.includes('network') || lowerMessage.includes('fetch') || lowerMessage.includes('connection')) {
            return this.errorCategories.NETWORK;
        }
        
        if (lowerMessage.includes('permission') || lowerMessage.includes('denied')) {
            return this.errorCategories.PERMISSION;
        }
        
        if (lowerMessage.includes('storage') || lowerMessage.includes('quota') || lowerMessage.includes('localstorage')) {
            return this.errorCategories.STORAGE;
        }
        
        if (lowerMessage.includes('notification')) {
            return this.errorCategories.NOTIFICATION;
        }
        
        if (lowerMessage.includes('service worker') || lowerMessage.includes('sw.js')) {
            return this.errorCategories.SERVICE_WORKER;
        }
        
        if (lowerMessage.includes('flutter') || lowerMessage.includes('dart')) {
            return this.errorCategories.FLUTTER;
        }
        
        if (lowerMessage.includes('matrix') || lowerMessage.includes('sync')) {
            return this.errorCategories.MATRIX;
        }

        return this.errorCategories.UNKNOWN;
    }

    /**
     * Determine error severity
     */
    determineSeverity(errorData) {
        // Critical errors
        if (errorData.category === this.errorCategories.FLUTTER ||
            errorData.context === 'global_error' ||
            (errorData.message && errorData.message.includes('critical'))) {
            return this.severityLevels.CRITICAL;
        }

        // High severity errors
        if (errorData.category === this.errorCategories.SERVICE_WORKER ||
            errorData.category === this.errorCategories.MATRIX ||
            errorData.context === 'unhandled_promise') {
            return this.severityLevels.HIGH;
        }

        // Medium severity errors
        if (errorData.category === this.errorCategories.PERMISSION ||
            errorData.category === this.errorCategories.NOTIFICATION ||
            errorData.category === this.errorCategories.STORAGE) {
            return this.severityLevels.MEDIUM;
        }

        // Low severity by default
        return this.severityLevels.LOW;
    }

    /**
     * Log error to console
     */
    logToConsole(errorData) {
        const prefix = `[ErrorHandler][${errorData.category}][${errorData.severity}]`;
        
        switch (errorData.severity) {
            case this.severityLevels.CRITICAL:
            case this.severityLevels.HIGH:
                console.error(prefix, errorData);
                break;
            case this.severityLevels.MEDIUM:
                console.warn(prefix, errorData);
                break;
            default:
                console.log(prefix, errorData);
        }
    }

    /**
     * Report error to crash reporting manager
     */
    async reportToCrashManager(errorData) {
        try {
            if (this.crashReportingManager) {
                await this.crashReportingManager.recordError(
                    errorData.message,
                    {
                        category: errorData.category,
                        severity: errorData.severity,
                        context: errorData.context,
                        stack: errorData.stack,
                        userAgent: errorData.userAgent,
                        url: errorData.url,
                        timestamp: errorData.timestamp
                    }
                );
            }
        } catch (reportingError) {
            console.error('[ErrorHandler] Failed to report to crash manager:', reportingError);
        }
    }

    /**
     * Queue error for later processing
     */
    queueError(errorData) {
        if (this.errorQueue.length >= this.maxQueueSize) {
            this.errorQueue.shift(); // Remove oldest error
        }
        
        this.errorQueue.push(errorData);
    }

    /**
     * Process queued errors
     */
    async processErrorQueue() {
        if (this.errorQueue.length === 0 || !this.crashReportingManager) {
            return;
        }

        console.log(`[ErrorHandler] Processing ${this.errorQueue.length} queued errors`);
        
        const errors = [...this.errorQueue];
        this.errorQueue = [];
        
        for (const error of errors) {
            await this.reportToCrashManager(error);
        }
    }

    /**
     * Determine if user should be notified
     */
    shouldNotifyUser(errorData) {
        // Don't notify for low severity errors
        if (errorData.severity === this.severityLevels.LOW) {
            return false;
        }
        
        // Don't notify for resource loading errors
        if (errorData.context === 'resource_loading') {
            return false;
        }
        
        // Notify for critical and high severity errors
        return errorData.severity === this.severityLevels.CRITICAL || 
               errorData.severity === this.severityLevels.HIGH;
    }

    /**
     * Notify user about error
     */
    notifyUser(errorData) {
        if (!this.config.userFriendlyMessages) {
            return;
        }

        const userMessage = this.userMessages[errorData.category] || this.userMessages[this.errorCategories.UNKNOWN];
        
        // Try to show user-friendly notification
        if (window.REChainServices?.notificationService) {
            window.REChainServices.notificationService.showErrorNotification(
                'Error Occurred',
                userMessage,
                { tag: `error_${errorData.category}` }
            );
        } else {
            // Fallback to browser notification
            this.showBrowserNotification('REChain Error', userMessage);
        }
    }

    /**
     * Show browser notification
     */
    showBrowserNotification(title, message) {
        if ('Notification' in window && Notification.permission === 'granted') {
            new Notification(title, {
                body: message,
                icon: '/icons/Icon-192.png',
                tag: 'rechain_error'
            });
        }
    }

    /**
     * Attempt error recovery
     */
    async attemptRecovery(errorData) {
        switch (errorData.category) {
            case this.errorCategories.NETWORK:
                await this.attemptNetworkRecovery(errorData);
                break;
                
            case this.errorCategories.SERVICE_WORKER:
                await this.attemptServiceWorkerRecovery(errorData);
                break;
                
            case this.errorCategories.STORAGE:
                await this.attemptStorageRecovery(errorData);
                break;
                
            default:
                // No specific recovery for other categories
                break;
        }
    }

    /**
     * Attempt network error recovery
     */
    async attemptNetworkRecovery(errorData) {
        if (!navigator.onLine) {
            // Wait for connection to be restored
            return new Promise((resolve) => {
                const onlineHandler = () => {
                    window.removeEventListener('online', onlineHandler);
                    console.log('[ErrorHandler] Network connection restored');
                    resolve();
                };
                window.addEventListener('online', onlineHandler);
            });
        }
    }

    /**
     * Attempt service worker recovery
     */
    async attemptServiceWorkerRecovery(errorData) {
        if ('serviceWorker' in navigator) {
            try {
                // Try to update service worker
                const registration = await navigator.serviceWorker.getRegistration();
                if (registration) {
                    await registration.update();
                    console.log('[ErrorHandler] Service worker updated');
                }
            } catch (error) {
                console.error('[ErrorHandler] Service worker recovery failed:', error);
            }
        }
    }

    /**
     * Attempt storage recovery
     */
    async attemptStorageRecovery(errorData) {
        try {
            // Clear some storage if quota exceeded
            if (errorData.message.includes('quota')) {
                // Clear old cache entries
                if ('caches' in window) {
                    const cacheNames = await caches.keys();
                    for (const cacheName of cacheNames) {
                        if (cacheName.includes('old') || cacheName.includes('temp')) {
                            await caches.delete(cacheName);
                            console.log(`[ErrorHandler] Cleared cache: ${cacheName}`);
                        }
                    }
                }
            }
        } catch (error) {
            console.error('[ErrorHandler] Storage recovery failed:', error);
        }
    }

    /**
     * Handle specific error types
     */
    handleNetworkError(error, context = {}) {
        this.handleError({
            message: error.message || 'Network error occurred',
            error: error,
            category: this.errorCategories.NETWORK,
            severity: this.severityLevels.MEDIUM,
            context: context.context || 'network_request',
            ...context
        });
    }

    handlePermissionError(error, context = {}) {
        this.handleError({
            message: error.message || 'Permission denied',
            error: error,
            category: this.errorCategories.PERMISSION,
            severity: this.severityLevels.MEDIUM,
            context: context.context || 'permission_request',
            ...context
        });
    }

    handleNotificationError(error, context = {}) {
        this.handleError({
            message: error.message || 'Notification error',
            error: error,
            category: this.errorCategories.NOTIFICATION,
            severity: this.severityLevels.LOW,
            context: context.context || 'notification',
            ...context
        });
    }

    handleMatrixError(error, context = {}) {
        this.handleError({
            message: error.message || 'Matrix service error',
            error: error,
            category: this.errorCategories.MATRIX,
            severity: this.severityLevels.HIGH,
            context: context.context || 'matrix_operation',
            ...context
        });
    }

    /**
     * Update configuration
     */
    updateConfig(newConfig) {
        this.config = { ...this.config, ...newConfig };
    }

    /**
     * Get error statistics
     */
    getErrorStats() {
        return {
            queuedErrors: this.errorQueue.length,
            isInitialized: this.isInitialized,
            config: { ...this.config }
        };
    }

    /**
     * Clear error queue
     */
    clearErrorQueue() {
        this.errorQueue = [];
    }

    /**
     * Shutdown error handler
     */
    shutdown() {
        // Process remaining errors
        if (this.crashReportingManager) {
            this.processErrorQueue();
        }
        
        this.isInitialized = false;
        console.log('[ErrorHandler] Shutdown completed');
    }
}

// Export for use
window.ErrorHandler = ErrorHandler;
