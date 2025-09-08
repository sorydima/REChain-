/**
 * REChain Web Crash Reporting Manager
 * Handles error tracking, logging, and crash reporting for web applications
 */

class CrashReportingManager {
    constructor() {
        this.isInitialized = false;
        this.crashReportingEnabled = true;
        this.logLevel = 'INFO';
        this.maxLogEntries = 1000;
        this.maxCrashReports = 50;
        
        // User identification
        this.userId = null;
        this.userEmail = null;
        this.userName = null;
        this.sessionId = this.generateSessionId();
        
        // Custom context
        this.customKeys = new Map();
        this.breadcrumbs = [];
        this.maxBreadcrumbs = 100;
        
        // Storage
        this.logEntries = [];
        this.crashReports = [];
        
        // Configuration
        this.config = {
            applicationName: 'REChain',
            applicationVersion: '1.0.0',
            environment: 'production',
            apiEndpoint: '/api/crash-reports',
            autoSubmit: true,
            collectUserAgent: true,
            collectUrl: true,
            collectLocalStorage: false,
            maxStackTraceDepth: 50
        };
        
        // Error handlers
        this.originalErrorHandler = null;
        this.originalUnhandledRejectionHandler = null;
    }

    /**
     * Initialize the crash reporting manager
     */
    async initialize() {
        if (this.isInitialized) {
            return true;
        }

        try {
            console.log('[CrashReportingManager] Initializing...');

            // Setup error handlers
            this.setupErrorHandlers();

            // Setup performance monitoring
            this.setupPerformanceMonitoring();

            // Load stored data
            await this.loadStoredData();

            // Set default custom keys
            this.setDefaultCustomKeys();

            // Start session
            this.startSession();

            this.isInitialized = true;
            this.logInfo('CrashReportingManager initialized successfully');
            
            return true;
        } catch (error) {
            console.error('[CrashReportingManager] Initialization failed:', error);
            return false;
        }
    }

    /**
     * Setup error handlers
     */
    setupErrorHandlers() {
        // Global error handler
        this.originalErrorHandler = window.onerror;
        window.onerror = (message, source, lineno, colno, error) => {
            this.handleError({
                type: 'javascript',
                message: message,
                source: source,
                lineno: lineno,
                colno: colno,
                error: error,
                stack: error ? error.stack : null
            });

            // Call original handler if it exists
            if (this.originalErrorHandler) {
                return this.originalErrorHandler(message, source, lineno, colno, error);
            }
            return false;
        };

        // Unhandled promise rejection handler
        this.originalUnhandledRejectionHandler = window.onunhandledrejection;
        window.onunhandledrejection = (event) => {
            this.handleError({
                type: 'unhandledrejection',
                message: event.reason ? event.reason.toString() : 'Unhandled Promise Rejection',
                error: event.reason,
                stack: event.reason && event.reason.stack ? event.reason.stack : null,
                promise: event.promise
            });

            // Call original handler if it exists
            if (this.originalUnhandledRejectionHandler) {
                return this.originalUnhandledRejectionHandler(event);
            }
        };

        // Console error override
        const originalConsoleError = console.error;
        console.error = (...args) => {
            this.logError(args.join(' '));
            originalConsoleError.apply(console, args);
        };
    }

    /**
     * Setup performance monitoring
     */
    setupPerformanceMonitoring() {
        // Monitor long tasks
        if ('PerformanceObserver' in window) {
            try {
                const observer = new PerformanceObserver((list) => {
                    for (const entry of list.getEntries()) {
                        if (entry.duration > 50) { // Tasks longer than 50ms
                            this.addBreadcrumb({
                                type: 'performance',
                                category: 'long-task',
                                message: `Long task detected: ${entry.duration}ms`,
                                data: {
                                    duration: entry.duration,
                                    startTime: entry.startTime
                                }
                            });
                        }
                    }
                });
                observer.observe({ entryTypes: ['longtask'] });
            } catch (error) {
                console.warn('[CrashReportingManager] Performance monitoring not available:', error);
            }
        }

        // Monitor navigation timing
        window.addEventListener('load', () => {
            setTimeout(() => {
                const navigation = performance.getEntriesByType('navigation')[0];
                if (navigation) {
                    this.addBreadcrumb({
                        type: 'navigation',
                        category: 'timing',
                        message: 'Page load completed',
                        data: {
                            loadTime: navigation.loadEventEnd - navigation.loadEventStart,
                            domContentLoaded: navigation.domContentLoadedEventEnd - navigation.domContentLoadedEventStart,
                            firstPaint: this.getFirstPaint()
                        }
                    });
                }
            }, 0);
        });
    }

    /**
     * Handle error
     */
    handleError(errorInfo) {
        if (!this.isInitialized || !this.crashReportingEnabled) {
            return;
        }

        try {
            const crashReport = this.createCrashReport(errorInfo);
            this.crashReports.push(crashReport);

            // Limit stored crash reports
            if (this.crashReports.length > this.maxCrashReports) {
                this.crashReports = this.crashReports.slice(-this.maxCrashReports);
            }

            // Store crash report
            this.storeCrashReport(crashReport);

            // Auto-submit if enabled
            if (this.config.autoSubmit) {
                this.submitCrashReport(crashReport);
            }

            this.logError(`Crash report created: ${crashReport.id}`);
        } catch (error) {
            console.error('[CrashReportingManager] Failed to handle error:', error);
        }
    }

    /**
     * Create crash report
     */
    createCrashReport(errorInfo) {
        const crashReport = {
            id: this.generateCrashId(),
            timestamp: new Date().toISOString(),
            type: errorInfo.type || 'unknown',
            message: errorInfo.message || 'Unknown error',
            stack: errorInfo.stack || this.getCurrentStackTrace(),
            
            // Error details
            error: {
                name: errorInfo.error ? errorInfo.error.name : 'Unknown',
                message: errorInfo.message,
                source: errorInfo.source,
                lineno: errorInfo.lineno,
                colno: errorInfo.colno
            },
            
            // Application context
            application: {
                name: this.config.applicationName,
                version: this.config.applicationVersion,
                environment: this.config.environment
            },
            
            // User context
            user: {
                id: this.userId,
                email: this.userEmail,
                name: this.userName
            },
            
            // Session context
            session: {
                id: this.sessionId,
                startTime: this.sessionStartTime,
                duration: Date.now() - this.sessionStartTime
            },
            
            // Browser context
            browser: this.getBrowserInfo(),
            
            // Page context
            page: this.getPageInfo(),
            
            // Custom keys
            customKeys: Object.fromEntries(this.customKeys),
            
            // Breadcrumbs
            breadcrumbs: [...this.breadcrumbs],
            
            // Performance data
            performance: this.getPerformanceData()
        };

        return crashReport;
    }

    /**
     * Record exception
     */
    recordException(error, context = {}) {
        if (!this.isInitialized || !this.crashReportingEnabled) {
            return;
        }

        this.handleError({
            type: 'exception',
            message: error.message || error.toString(),
            error: error,
            stack: error.stack,
            context: context
        });

        this.logError(`Exception recorded: ${error.message}`);
    }

    /**
     * Record error
     */
    recordError(message, context = {}) {
        if (!this.isInitialized || !this.crashReportingEnabled) {
            return;
        }

        this.handleError({
            type: 'error',
            message: message,
            context: context,
            stack: this.getCurrentStackTrace()
        });

        this.logError(`Error recorded: ${message}`);
    }

    /**
     * Record non-fatal error
     */
    recordNonFatalError(message, context = {}) {
        if (!this.isInitialized || !this.crashReportingEnabled) {
            return;
        }

        this.addBreadcrumb({
            type: 'error',
            category: 'non-fatal',
            message: message,
            data: context,
            level: 'error'
        });

        this.logWarning(`Non-fatal error recorded: ${message}`);
    }

    /**
     * Logging methods
     */
    log(message, level = 'INFO', data = {}) {
        if (!this.shouldLog(level)) {
            return;
        }

        const logEntry = {
            timestamp: new Date().toISOString(),
            level: level,
            message: message,
            data: data,
            sessionId: this.sessionId
        };

        this.logEntries.push(logEntry);

        // Limit stored log entries
        if (this.logEntries.length > this.maxLogEntries) {
            this.logEntries = this.logEntries.slice(-this.maxLogEntries);
        }

        // Add to breadcrumbs for important logs
        if (['ERROR', 'WARNING'].includes(level)) {
            this.addBreadcrumb({
                type: 'log',
                category: level.toLowerCase(),
                message: message,
                data: data
            });
        }

        // Store log entry
        this.storeLogEntry(logEntry);
    }

    logDebug(message, data = {}) {
        this.log(message, 'DEBUG', data);
    }

    logInfo(message, data = {}) {
        this.log(message, 'INFO', data);
    }

    logWarning(message, data = {}) {
        this.log(message, 'WARNING', data);
    }

    logError(message, data = {}) {
        this.log(message, 'ERROR', data);
    }

    /**
     * User identification
     */
    setUserId(userId) {
        this.userId = userId;
        this.setCustomKey('user_id', userId);
        this.logInfo(`User ID set: ${userId}`);
    }

    setUserEmail(email) {
        this.userEmail = email;
        this.setCustomKey('user_email', email);
        this.logInfo('User email set');
    }

    setUserName(name) {
        this.userName = name;
        this.setCustomKey('user_name', name);
        this.logInfo(`User name set: ${name}`);
    }

    /**
     * Custom keys management
     */
    setCustomKey(key, value) {
        this.customKeys.set(key, value);
        this.logDebug(`Custom key set: ${key} = ${value}`);
    }

    setCustomKeys(keys) {
        for (const [key, value] of Object.entries(keys)) {
            this.customKeys.set(key, value);
        }
        this.logDebug('Multiple custom keys set');
    }

    removeCustomKey(key) {
        this.customKeys.delete(key);
        this.logDebug(`Custom key removed: ${key}`);
    }

    /**
     * Breadcrumbs management
     */
    addBreadcrumb(breadcrumb) {
        const fullBreadcrumb = {
            timestamp: new Date().toISOString(),
            level: breadcrumb.level || 'info',
            ...breadcrumb
        };

        this.breadcrumbs.push(fullBreadcrumb);

        // Limit breadcrumbs
        if (this.breadcrumbs.length > this.maxBreadcrumbs) {
            this.breadcrumbs = this.breadcrumbs.slice(-this.maxBreadcrumbs);
        }
    }

    clearBreadcrumbs() {
        this.breadcrumbs = [];
        this.logDebug('Breadcrumbs cleared');
    }

    /**
     * Session management
     */
    startSession() {
        this.sessionStartTime = Date.now();
        this.sessionId = this.generateSessionId();
        
        this.addBreadcrumb({
            type: 'session',
            category: 'lifecycle',
            message: 'Session started',
            data: {
                sessionId: this.sessionId,
                userAgent: navigator.userAgent,
                url: window.location.href
            }
        });

        this.logInfo('Session started');
    }

    endSession() {
        const duration = Date.now() - this.sessionStartTime;
        
        this.addBreadcrumb({
            type: 'session',
            category: 'lifecycle',
            message: 'Session ended',
            data: {
                sessionId: this.sessionId,
                duration: duration
            }
        });

        this.logInfo(`Session ended (duration: ${duration}ms)`);
    }

    /**
     * Configuration
     */
    setCrashReportingEnabled(enabled) {
        this.crashReportingEnabled = enabled;
        this.logInfo(`Crash reporting ${enabled ? 'enabled' : 'disabled'}`);
    }

    setLogLevel(level) {
        this.logLevel = level;
        this.logInfo(`Log level set to: ${level}`);
    }

    setConfig(config) {
        this.config = { ...this.config, ...config };
        this.logInfo('Configuration updated');
    }

    /**
     * Data submission
     */
    async submitCrashReport(crashReport) {
        try {
            const response = await fetch(this.config.apiEndpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(crashReport)
            });

            if (response.ok) {
                this.logInfo(`Crash report submitted: ${crashReport.id}`);
                return true;
            } else {
                this.logError(`Failed to submit crash report: ${response.status}`);
                return false;
            }
        } catch (error) {
            this.logError(`Crash report submission failed: ${error.message}`);
            return false;
        }
    }

    async submitAllCrashReports() {
        const results = await Promise.allSettled(
            this.crashReports.map(report => this.submitCrashReport(report))
        );

        const successful = results.filter(result => result.status === 'fulfilled' && result.value).length;
        this.logInfo(`Submitted ${successful}/${this.crashReports.length} crash reports`);

        return successful;
    }

    /**
     * Helper methods
     */
    shouldLog(level) {
        const levels = ['DEBUG', 'INFO', 'WARNING', 'ERROR'];
        const currentLevelIndex = levels.indexOf(this.logLevel);
        const messageLevelIndex = levels.indexOf(level);
        
        return messageLevelIndex >= currentLevelIndex;
    }

    getCurrentStackTrace() {
        try {
            throw new Error();
        } catch (error) {
            return error.stack;
        }
    }

    getBrowserInfo() {
        return {
            userAgent: navigator.userAgent,
            language: navigator.language,
            platform: navigator.platform,
            cookieEnabled: navigator.cookieEnabled,
            onLine: navigator.onLine,
            screen: {
                width: screen.width,
                height: screen.height,
                colorDepth: screen.colorDepth
            },
            viewport: {
                width: window.innerWidth,
                height: window.innerHeight
            }
        };
    }

    getPageInfo() {
        return {
            url: window.location.href,
            referrer: document.referrer,
            title: document.title,
            timestamp: new Date().toISOString()
        };
    }

    getPerformanceData() {
        if (!('performance' in window)) {
            return null;
        }

        const navigation = performance.getEntriesByType('navigation')[0];
        const memory = performance.memory;

        return {
            navigation: navigation ? {
                loadTime: navigation.loadEventEnd - navigation.loadEventStart,
                domContentLoaded: navigation.domContentLoadedEventEnd - navigation.domContentLoadedEventStart,
                responseTime: navigation.responseEnd - navigation.requestStart
            } : null,
            memory: memory ? {
                usedJSHeapSize: memory.usedJSHeapSize,
                totalJSHeapSize: memory.totalJSHeapSize,
                jsHeapSizeLimit: memory.jsHeapSizeLimit
            } : null,
            timing: performance.now()
        };
    }

    getFirstPaint() {
        const paintEntries = performance.getEntriesByType('paint');
        const firstPaint = paintEntries.find(entry => entry.name === 'first-paint');
        return firstPaint ? firstPaint.startTime : null;
    }

    setDefaultCustomKeys() {
        this.setCustomKey('app_name', this.config.applicationName);
        this.setCustomKey('app_version', this.config.applicationVersion);
        this.setCustomKey('environment', this.config.environment);
        this.setCustomKey('platform', 'web');
        this.setCustomKey('user_agent', navigator.userAgent);
        this.setCustomKey('url', window.location.href);
    }

    generateSessionId() {
        return 'session_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
    }

    generateCrashId() {
        return 'crash_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
    }

    /**
     * Storage methods
     */
    async loadStoredData() {
        try {
            // Load from localStorage
            const storedLogs = localStorage.getItem('rechain_logs');
            if (storedLogs) {
                this.logEntries = JSON.parse(storedLogs);
            }

            const storedCrashReports = localStorage.getItem('rechain_crash_reports');
            if (storedCrashReports) {
                this.crashReports = JSON.parse(storedCrashReports);
            }
        } catch (error) {
            console.error('[CrashReportingManager] Failed to load stored data:', error);
        }
    }

    storeLogEntry(logEntry) {
        try {
            localStorage.setItem('rechain_logs', JSON.stringify(this.logEntries));
        } catch (error) {
            console.error('[CrashReportingManager] Failed to store log entry:', error);
        }
    }

    storeCrashReport(crashReport) {
        try {
            localStorage.setItem('rechain_crash_reports', JSON.stringify(this.crashReports));
        } catch (error) {
            console.error('[CrashReportingManager] Failed to store crash report:', error);
        }
    }

    /**
     * Getters
     */
    isCrashReportingEnabled() {
        return this.crashReportingEnabled;
    }

    getLogLevel() {
        return this.logLevel;
    }

    getSessionId() {
        return this.sessionId;
    }

    getLogEntries() {
        return [...this.logEntries];
    }

    getCrashReports() {
        return [...this.crashReports];
    }

    getBreadcrumbs() {
        return [...this.breadcrumbs];
    }

    getCustomKeys() {
        return Object.fromEntries(this.customKeys);
    }

    /**
     * Shutdown
     */
    shutdown() {
        // Restore original error handlers
        if (this.originalErrorHandler) {
            window.onerror = this.originalErrorHandler;
        }
        
        if (this.originalUnhandledRejectionHandler) {
            window.onunhandledrejection = this.originalUnhandledRejectionHandler;
        }

        // End session
        this.endSession();

        // Submit pending crash reports
        if (this.config.autoSubmit && this.crashReports.length > 0) {
            this.submitAllCrashReports();
        }

        this.isInitialized = false;
        console.log('[CrashReportingManager] Shutdown completed');
    }
}

// Export for use
window.CrashReportingManager = CrashReportingManager;
