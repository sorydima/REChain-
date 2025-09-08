/**
 * REChain Web System Integration
 * Handles PWA features, system integration, and web platform capabilities
 */

class WebSystemIntegration {
    constructor() {
        this.isInitialized = false;
        this.isInstalled = false;
        this.deferredPrompt = null;
        this.wakeLock = null;
        
        // Configuration
        this.config = {
            applicationName: 'REChain',
            applicationShortName: 'REChain',
            applicationDescription: 'Secure decentralized communication platform',
            themeColor: '#0175C2',
            backgroundColor: '#0175C2',
            startUrl: '/',
            scope: '/',
            display: 'standalone'
        };
        
        // Feature detection
        this.features = {
            serviceWorker: 'serviceWorker' in navigator,
            pushNotifications: 'PushManager' in window,
            webShare: 'share' in navigator,
            wakeLock: 'wakeLock' in navigator,
            fullscreen: 'requestFullscreen' in document.documentElement,
            clipboard: 'clipboard' in navigator,
            geolocation: 'geolocation' in navigator,
            mediaDevices: 'mediaDevices' in navigator,
            webRTC: 'RTCPeerConnection' in window,
            indexedDB: 'indexedDB' in window,
            webGL: this.checkWebGLSupport(),
            webAssembly: typeof WebAssembly === 'object'
        };
        
        // Event handlers
        this.eventHandlers = {
            install: null,
            beforeInstallPrompt: null,
            appInstalled: null,
            visibilityChange: null,
            online: null,
            offline: null
        };
    }

    /**
     * Initialize web system integration
     */
    async initialize() {
        if (this.isInitialized) {
            return true;
        }

        try {
            console.log('[WebSystemIntegration] Initializing...');

            // Check installation status
            this.checkInstallationStatus();

            // Setup PWA event listeners
            this.setupPWAEventListeners();

            // Setup system event listeners
            this.setupSystemEventListeners();

            // Setup media session
            this.setupMediaSession();

            // Setup keyboard shortcuts
            this.setupKeyboardShortcuts();

            // Setup theme management
            this.setupThemeManagement();

            // Setup fullscreen management
            this.setupFullscreenManagement();

            // Initialize file handling
            this.initializeFileHandling();

            this.isInitialized = true;
            console.log('[WebSystemIntegration] Initialized successfully');
            console.log('[WebSystemIntegration] Features:', this.features);
            
            return true;
        } catch (error) {
            console.error('[WebSystemIntegration] Initialization failed:', error);
            return false;
        }
    }

    /**
     * Check if app is installed
     */
    checkInstallationStatus() {
        // Check if running in standalone mode
        this.isInstalled = window.matchMedia('(display-mode: standalone)').matches ||
                          window.navigator.standalone ||
                          document.referrer.includes('android-app://');

        console.log('[WebSystemIntegration] Installation status:', this.isInstalled ? 'Installed' : 'Not installed');
    }

    /**
     * Setup PWA event listeners
     */
    setupPWAEventListeners() {
        // Before install prompt
        window.addEventListener('beforeinstallprompt', (event) => {
            console.log('[WebSystemIntegration] Before install prompt triggered');
            
            // Prevent default mini-infobar
            event.preventDefault();
            
            // Store the event for later use
            this.deferredPrompt = event;
            
            if (this.eventHandlers.beforeInstallPrompt) {
                this.eventHandlers.beforeInstallPrompt(event);
            }
        });

        // App installed
        window.addEventListener('appinstalled', (event) => {
            console.log('[WebSystemIntegration] App installed');
            this.isInstalled = true;
            this.deferredPrompt = null;
            
            if (this.eventHandlers.appInstalled) {
                this.eventHandlers.appInstalled(event);
            }
        });

        // Display mode changes
        const mediaQuery = window.matchMedia('(display-mode: standalone)');
        mediaQuery.addEventListener('change', (event) => {
            this.isInstalled = event.matches;
            console.log('[WebSystemIntegration] Display mode changed:', event.matches ? 'Standalone' : 'Browser');
        });
    }

    /**
     * Setup system event listeners
     */
    setupSystemEventListeners() {
        // Visibility change
        document.addEventListener('visibilitychange', () => {
            const isVisible = !document.hidden;
            console.log('[WebSystemIntegration] Visibility changed:', isVisible ? 'Visible' : 'Hidden');
            
            if (this.eventHandlers.visibilityChange) {
                this.eventHandlers.visibilityChange(isVisible);
            }
        });

        // Online/offline status
        window.addEventListener('online', () => {
            console.log('[WebSystemIntegration] Connection restored');
            if (this.eventHandlers.online) {
                this.eventHandlers.online();
            }
        });

        window.addEventListener('offline', () => {
            console.log('[WebSystemIntegration] Connection lost');
            if (this.eventHandlers.offline) {
                this.eventHandlers.offline();
            }
        });

        // Page lifecycle events
        document.addEventListener('freeze', () => {
            console.log('[WebSystemIntegration] Page frozen');
        });

        document.addEventListener('resume', () => {
            console.log('[WebSystemIntegration] Page resumed');
        });
    }

    /**
     * Setup media session
     */
    setupMediaSession() {
        if (!('mediaSession' in navigator)) {
            console.warn('[WebSystemIntegration] Media Session API not supported');
            return;
        }

        // Set metadata
        navigator.mediaSession.metadata = new MediaMetadata({
            title: this.config.applicationName,
            artist: 'REChain Team',
            album: 'Communication',
            artwork: [
                { src: '/icons/Icon-96.png', sizes: '96x96', type: 'image/png' },
                { src: '/icons/Icon-128.png', sizes: '128x128', type: 'image/png' },
                { src: '/icons/Icon-192.png', sizes: '192x192', type: 'image/png' },
                { src: '/icons/Icon-256.png', sizes: '256x256', type: 'image/png' },
                { src: '/icons/Icon-384.png', sizes: '384x384', type: 'image/png' },
                { src: '/icons/Icon-512.png', sizes: '512x512', type: 'image/png' }
            ]
        });

        // Set action handlers
        const actionHandlers = {
            play: () => this.handleMediaAction('play'),
            pause: () => this.handleMediaAction('pause'),
            stop: () => this.handleMediaAction('stop'),
            seekbackward: () => this.handleMediaAction('seekbackward'),
            seekforward: () => this.handleMediaAction('seekforward'),
            previoustrack: () => this.handleMediaAction('previoustrack'),
            nexttrack: () => this.handleMediaAction('nexttrack'),
            hangup: () => this.handleMediaAction('hangup')
        };

        for (const [action, handler] of Object.entries(actionHandlers)) {
            try {
                navigator.mediaSession.setActionHandler(action, handler);
            } catch (error) {
                console.warn(`[WebSystemIntegration] Media action '${action}' not supported:`, error);
            }
        }
    }

    /**
     * Setup keyboard shortcuts
     */
    setupKeyboardShortcuts() {
        document.addEventListener('keydown', (event) => {
            // Handle global shortcuts
            if (event.ctrlKey || event.metaKey) {
                switch (event.key) {
                    case 'k':
                        event.preventDefault();
                        this.triggerSearch();
                        break;
                    case 'n':
                        event.preventDefault();
                        this.createNewChat();
                        break;
                    case 'f':
                        if (event.shiftKey) {
                            event.preventDefault();
                            this.toggleFullscreen();
                        }
                        break;
                    case '/':
                        event.preventDefault();
                        this.showKeyboardShortcuts();
                        break;
                }
            }

            // Handle function keys
            switch (event.key) {
                case 'F11':
                    event.preventDefault();
                    this.toggleFullscreen();
                    break;
                case 'Escape':
                    if (document.fullscreenElement) {
                        this.exitFullscreen();
                    }
                    break;
            }
        });
    }

    /**
     * Setup theme management
     */
    setupThemeManagement() {
        // Listen for system theme changes
        const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
        mediaQuery.addEventListener('change', (event) => {
            console.log('[WebSystemIntegration] System theme changed:', event.matches ? 'Dark' : 'Light');
            this.updateTheme(event.matches ? 'dark' : 'light');
        });

        // Set initial theme
        const prefersDark = mediaQuery.matches;
        this.updateTheme(prefersDark ? 'dark' : 'light');
    }

    /**
     * Setup fullscreen management
     */
    setupFullscreenManagement() {
        if (!this.features.fullscreen) {
            console.warn('[WebSystemIntegration] Fullscreen API not supported');
            return;
        }

        // Listen for fullscreen changes
        document.addEventListener('fullscreenchange', () => {
            const isFullscreen = !!document.fullscreenElement;
            console.log('[WebSystemIntegration] Fullscreen changed:', isFullscreen);
            this.updateFullscreenUI(isFullscreen);
        });
    }

    /**
     * Initialize file handling
     */
    initializeFileHandling() {
        // Setup drag and drop
        document.addEventListener('dragover', (event) => {
            event.preventDefault();
        });

        document.addEventListener('drop', (event) => {
            event.preventDefault();
            this.handleFileDrop(event.dataTransfer.files);
        });

        // Setup paste handling
        document.addEventListener('paste', (event) => {
            const items = event.clipboardData.items;
            for (const item of items) {
                if (item.kind === 'file') {
                    this.handleFileUpload(item.getAsFile());
                }
            }
        });
    }

    /**
     * PWA Installation
     */
    async promptInstall() {
        if (!this.deferredPrompt) {
            console.warn('[WebSystemIntegration] No install prompt available');
            return false;
        }

        try {
            // Show the install prompt
            this.deferredPrompt.prompt();

            // Wait for the user to respond
            const { outcome } = await this.deferredPrompt.userChoice;
            
            console.log('[WebSystemIntegration] Install prompt result:', outcome);
            
            if (outcome === 'accepted') {
                this.deferredPrompt = null;
                return true;
            }
            
            return false;
        } catch (error) {
            console.error('[WebSystemIntegration] Install prompt failed:', error);
            return false;
        }
    }

    canInstall() {
        return !!this.deferredPrompt && !this.isInstalled;
    }

    /**
     * Sharing
     */
    async shareContent(data) {
        if (!this.features.webShare) {
            console.warn('[WebSystemIntegration] Web Share API not supported');
            return this.fallbackShare(data);
        }

        try {
            await navigator.share({
                title: data.title || this.config.applicationName,
                text: data.text || this.config.applicationDescription,
                url: data.url || window.location.href
            });
            
            console.log('[WebSystemIntegration] Content shared successfully');
            return true;
        } catch (error) {
            if (error.name === 'AbortError') {
                console.log('[WebSystemIntegration] Share cancelled by user');
            } else {
                console.error('[WebSystemIntegration] Share failed:', error);
            }
            return false;
        }
    }

    fallbackShare(data) {
        // Copy to clipboard as fallback
        const shareText = `${data.title || this.config.applicationName}\n${data.text || ''}\n${data.url || window.location.href}`;
        
        return this.copyToClipboard(shareText);
    }

    /**
     * Clipboard operations
     */
    async copyToClipboard(text) {
        if (!this.features.clipboard) {
            console.warn('[WebSystemIntegration] Clipboard API not supported');
            return this.fallbackCopyToClipboard(text);
        }

        try {
            await navigator.clipboard.writeText(text);
            console.log('[WebSystemIntegration] Text copied to clipboard');
            return true;
        } catch (error) {
            console.error('[WebSystemIntegration] Failed to copy to clipboard:', error);
            return this.fallbackCopyToClipboard(text);
        }
    }

    fallbackCopyToClipboard(text) {
        try {
            const textArea = document.createElement('textarea');
            textArea.value = text;
            textArea.style.position = 'fixed';
            textArea.style.opacity = '0';
            document.body.appendChild(textArea);
            textArea.select();
            const successful = document.execCommand('copy');
            document.body.removeChild(textArea);
            
            if (successful) {
                console.log('[WebSystemIntegration] Text copied to clipboard (fallback)');
                return true;
            }
            return false;
        } catch (error) {
            console.error('[WebSystemIntegration] Fallback copy failed:', error);
            return false;
        }
    }

    async readFromClipboard() {
        if (!this.features.clipboard) {
            console.warn('[WebSystemIntegration] Clipboard API not supported');
            return null;
        }

        try {
            const text = await navigator.clipboard.readText();
            console.log('[WebSystemIntegration] Text read from clipboard');
            return text;
        } catch (error) {
            console.error('[WebSystemIntegration] Failed to read from clipboard:', error);
            return null;
        }
    }

    /**
     * Wake lock management
     */
    async requestWakeLock() {
        if (!this.features.wakeLock) {
            console.warn('[WebSystemIntegration] Wake Lock API not supported');
            return false;
        }

        try {
            this.wakeLock = await navigator.wakeLock.request('screen');
            
            this.wakeLock.addEventListener('release', () => {
                console.log('[WebSystemIntegration] Wake lock released');
            });
            
            console.log('[WebSystemIntegration] Wake lock acquired');
            return true;
        } catch (error) {
            console.error('[WebSystemIntegration] Wake lock request failed:', error);
            return false;
        }
    }

    async releaseWakeLock() {
        if (this.wakeLock) {
            await this.wakeLock.release();
            this.wakeLock = null;
            console.log('[WebSystemIntegration] Wake lock released manually');
        }
    }

    /**
     * Fullscreen management
     */
    async requestFullscreen(element = document.documentElement) {
        if (!this.features.fullscreen) {
            console.warn('[WebSystemIntegration] Fullscreen API not supported');
            return false;
        }

        try {
            await element.requestFullscreen();
            console.log('[WebSystemIntegration] Fullscreen requested');
            return true;
        } catch (error) {
            console.error('[WebSystemIntegration] Fullscreen request failed:', error);
            return false;
        }
    }

    async exitFullscreen() {
        if (!document.fullscreenElement) {
            return;
        }

        try {
            await document.exitFullscreen();
            console.log('[WebSystemIntegration] Fullscreen exited');
        } catch (error) {
            console.error('[WebSystemIntegration] Fullscreen exit failed:', error);
        }
    }

    async toggleFullscreen() {
        if (document.fullscreenElement) {
            await this.exitFullscreen();
        } else {
            await this.requestFullscreen();
        }
    }

    /**
     * Theme management
     */
    updateTheme(theme) {
        document.documentElement.setAttribute('data-theme', theme);
        
        // Update meta theme-color
        const themeColorMeta = document.querySelector('meta[name="theme-color"]');
        if (themeColorMeta) {
            themeColorMeta.content = theme === 'dark' ? '#1a1a1a' : this.config.themeColor;
        }
        
        console.log('[WebSystemIntegration] Theme updated:', theme);
    }

    getSystemTheme() {
        return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    }

    /**
     * File handling
     */
    handleFileDrop(files) {
        console.log('[WebSystemIntegration] Files dropped:', files.length);
        
        for (const file of files) {
            this.handleFileUpload(file);
        }
    }

    handleFileUpload(file) {
        console.log('[WebSystemIntegration] File upload:', file.name, file.type, file.size);
        
        // Emit custom event for file upload
        const event = new CustomEvent('fileupload', {
            detail: { file }
        });
        document.dispatchEvent(event);
    }

    /**
     * Media action handlers
     */
    handleMediaAction(action) {
        console.log('[WebSystemIntegration] Media action:', action);
        
        // Emit custom event for media actions
        const event = new CustomEvent('mediaaction', {
            detail: { action }
        });
        document.dispatchEvent(event);
    }

    /**
     * Keyboard shortcut handlers
     */
    triggerSearch() {
        const event = new CustomEvent('triggersearch');
        document.dispatchEvent(event);
    }

    createNewChat() {
        const event = new CustomEvent('createnewchat');
        document.dispatchEvent(event);
    }

    showKeyboardShortcuts() {
        const event = new CustomEvent('showkeyboardshortcuts');
        document.dispatchEvent(event);
    }

    /**
     * UI updates
     */
    updateFullscreenUI(isFullscreen) {
        document.documentElement.classList.toggle('fullscreen', isFullscreen);
        
        const event = new CustomEvent('fullscreenchange', {
            detail: { isFullscreen }
        });
        document.dispatchEvent(event);
    }

    /**
     * Feature detection helpers
     */
    checkWebGLSupport() {
        try {
            const canvas = document.createElement('canvas');
            return !!(window.WebGLRenderingContext && canvas.getContext('webgl'));
        } catch (error) {
            return false;
        }
    }

    /**
     * Network information
     */
    getNetworkInfo() {
        if (!('connection' in navigator)) {
            return null;
        }

        const connection = navigator.connection;
        return {
            effectiveType: connection.effectiveType,
            downlink: connection.downlink,
            rtt: connection.rtt,
            saveData: connection.saveData
        };
    }

    /**
     * Device information
     */
    getDeviceInfo() {
        return {
            userAgent: navigator.userAgent,
            platform: navigator.platform,
            language: navigator.language,
            languages: navigator.languages,
            cookieEnabled: navigator.cookieEnabled,
            onLine: navigator.onLine,
            maxTouchPoints: navigator.maxTouchPoints,
            screen: {
                width: screen.width,
                height: screen.height,
                availWidth: screen.availWidth,
                availHeight: screen.availHeight,
                colorDepth: screen.colorDepth,
                pixelDepth: screen.pixelDepth
            },
            viewport: {
                width: window.innerWidth,
                height: window.innerHeight
            }
        };
    }

    /**
     * Event handlers
     */
    setEventHandlers(handlers) {
        this.eventHandlers = { ...this.eventHandlers, ...handlers };
    }

    /**
     * Configuration
     */
    setConfig(config) {
        this.config = { ...this.config, ...config };
    }

    /**
     * Getters
     */
    isAppInstalled() {
        return this.isInstalled;
    }

    getFeatures() {
        return { ...this.features };
    }

    getConfig() {
        return { ...this.config };
    }

    /**
     * Shutdown
     */
    shutdown() {
        // Release wake lock
        this.releaseWakeLock();
        
        // Exit fullscreen
        if (document.fullscreenElement) {
            this.exitFullscreen();
        }
        
        this.isInitialized = false;
        console.log('[WebSystemIntegration] Shutdown completed');
    }
}

// Export for use
window.WebSystemIntegration = WebSystemIntegration;
