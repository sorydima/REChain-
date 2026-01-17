/**
 * REChain Service Worker
 * Handles caching, push notifications, and background sync
 */

const CACHE_NAME = 'rechain-v4.1.10+1160';
const STATIC_CACHE = 'rechain-static-v4.1.10+1160';
const DYNAMIC_CACHE = 'rechain-dynamic-v4.1.10+1160';

// Files to cache immediately
const STATIC_FILES = [
    '/',
    '/index.html',
    '/manifest.json',
    '/favicon.png',
    '/icons/Icon-192.png',
    '/icons/Icon-512.png',
    '/js/AutonomousNotificationService.js',
    '/js/CrashReportingManager.js',
    '/js/WebSystemIntegration.js',
    '/css/app.css',
    '/sounds/notification.mp3',
    '/sounds/message.mp3',
    '/sounds/call.mp3'
];

// Network-first resources
const NETWORK_FIRST = [
    '/api/',
    '/_matrix/',
    '/auth'
];

// Cache-first resources
const CACHE_FIRST = [
    '/assets/',
    '/icons/',
    '/sounds/',
    '/fonts/'
];

/**
 * Service Worker Installation
 */
self.addEventListener('install', (event) => {
    console.log('[ServiceWorker] Installing...');
    
    event.waitUntil(
        Promise.all([
            // Cache static files
            caches.open(STATIC_CACHE).then((cache) => {
                console.log('[ServiceWorker] Caching static files');
                return cache.addAll(STATIC_FILES);
            }),
            
            // Skip waiting to activate immediately
            self.skipWaiting()
        ])
    );
});

/**
 * Service Worker Activation
 */
self.addEventListener('activate', (event) => {
    console.log('[ServiceWorker] Activating...');
    
    event.waitUntil(
        Promise.all([
            // Clean up old caches
            caches.keys().then((cacheNames) => {
                return Promise.all(
                    cacheNames.map((cacheName) => {
                        if (cacheName !== STATIC_CACHE && 
                            cacheName !== DYNAMIC_CACHE && 
                            cacheName !== CACHE_NAME) {
                            console.log('[ServiceWorker] Deleting old cache:', cacheName);
                            return caches.delete(cacheName);
                        }
                    })
                );
            }),
            
            // Take control of all clients
            self.clients.claim()
        ])
    );
});

/**
 * Fetch Event Handler
 */
self.addEventListener('fetch', (event) => {
    const { request } = event;
    const url = new URL(request.url);
    
    // Skip non-GET requests
    if (request.method !== 'GET') {
        return;
    }
    
    // Skip chrome-extension requests
    if (url.protocol === 'chrome-extension:') {
        return;
    }
    
    // Handle different caching strategies
    if (isNetworkFirst(url.pathname)) {
        event.respondWith(networkFirst(request));
    } else if (isCacheFirst(url.pathname)) {
        event.respondWith(cacheFirst(request));
    } else {
        event.respondWith(staleWhileRevalidate(request));
    }
});

/**
 * Push Event Handler
 */
self.addEventListener('push', (event) => {
    console.log('[ServiceWorker] Push received');
    
    let notificationData = {
        title: 'REChain',
        body: 'You have a new notification',
        icon: '/icons/Icon-192.png',
        badge: '/icons/Icon-192.png',
        tag: 'default',
        data: {}
    };
    
    // Parse push payload
    if (event.data) {
        try {
            const payload = event.data.json();
            notificationData = { ...notificationData, ...payload };
        } catch (error) {
            console.error('[ServiceWorker] Failed to parse push payload:', error);
            notificationData.body = event.data.text();
        }
    }
    
    // Show notification
    event.waitUntil(
        Promise.all([
            self.registration.showNotification(notificationData.title, notificationData),
            sendMessageToClients({ type: 'push-received', payload: notificationData })
        ])
    );
});

/**
 * Notification Click Handler
 */
self.addEventListener('notificationclick', (event) => {
    console.log('[ServiceWorker] Notification clicked:', event.notification.tag);
    
    event.notification.close();
    
    const notificationData = event.notification.data || {};
    const action = event.action;
    
    event.waitUntil(
        Promise.all([
            // Handle notification action
            handleNotificationAction(action, notificationData),
            
            // Send message to clients
            sendMessageToClients({
                type: action ? 'notification-action' : 'notification-click',
                tag: event.notification.tag,
                action: action,
                data: notificationData
            })
        ])
    );
});

/**
 * Notification Close Handler
 */
self.addEventListener('notificationclose', (event) => {
    console.log('[ServiceWorker] Notification closed:', event.notification.tag);
    
    event.waitUntil(
        sendMessageToClients({
            type: 'notification-close',
            tag: event.notification.tag,
            data: event.notification.data || {}
        })
    );
});

/**
 * Background Sync Handler
 */
self.addEventListener('sync', (event) => {
    console.log('[ServiceWorker] Background sync:', event.tag);
    
    if (event.tag === 'background-sync') {
        event.waitUntil(doBackgroundSync());
    } else if (event.tag === 'message-sync') {
        event.waitUntil(syncMessages());
    }
});

/**
 * Message Handler
 */
self.addEventListener('message', (event) => {
    console.log('[ServiceWorker] Message received:', event.data);
    
    const { type, data } = event.data;
    
    switch (type) {
        case 'skip-waiting':
            self.skipWaiting();
            break;
            
        case 'cache-urls':
            event.waitUntil(cacheUrls(data.urls));
            break;
            
        case 'clear-cache':
            event.waitUntil(clearCache(data.cacheName));
            break;
            
        case 'get-cache-info':
            event.waitUntil(getCacheInfo().then(info => {
                event.ports[0].postMessage(info);
            }));
            break;
    }
});

/**
 * Caching Strategies
 */

// Network First Strategy
async function networkFirst(request) {
    try {
        const networkResponse = await fetch(request);
        
        if (networkResponse.ok) {
            const cache = await caches.open(DYNAMIC_CACHE);
            cache.put(request, networkResponse.clone());
        }
        
        return networkResponse;
    } catch (error) {
        console.log('[ServiceWorker] Network failed, trying cache:', request.url);
        const cachedResponse = await caches.match(request);
        
        if (cachedResponse) {
            return cachedResponse;
        }
        
        // Return offline page for navigation requests
        if (request.mode === 'navigate') {
            return caches.match('/offline.html');
        }
        
        throw error;
    }
}

// Cache First Strategy
async function cacheFirst(request) {
    const cachedResponse = await caches.match(request);
    
    if (cachedResponse) {
        return cachedResponse;
    }
    
    try {
        const networkResponse = await fetch(request);
        
        if (networkResponse.ok) {
            const cache = await caches.open(DYNAMIC_CACHE);
            cache.put(request, networkResponse.clone());
        }
        
        return networkResponse;
    } catch (error) {
        console.error('[ServiceWorker] Cache first failed:', error);
        throw error;
    }
}

// Stale While Revalidate Strategy
async function staleWhileRevalidate(request) {
    const cachedResponse = await caches.match(request);
    
    const networkResponsePromise = fetch(request).then((networkResponse) => {
        if (networkResponse.ok) {
            const cache = caches.open(DYNAMIC_CACHE);
            cache.then(c => c.put(request, networkResponse.clone()));
        }
        return networkResponse;
    }).catch(error => {
        console.log('[ServiceWorker] Network failed:', error);
        return null;
    });
    
    return cachedResponse || networkResponsePromise;
}

/**
 * Helper Functions
 */

function isNetworkFirst(pathname) {
    return NETWORK_FIRST.some(pattern => pathname.startsWith(pattern));
}

function isCacheFirst(pathname) {
    return CACHE_FIRST.some(pattern => pathname.startsWith(pattern));
}

async function handleNotificationAction(action, data) {
    switch (action) {
        case 'reply':
            return openWindow(`/chat/${data.roomId}?action=reply`);
            
        case 'accept':
            return openWindow(`/call/${data.callId}?action=accept`);
            
        case 'decline':
            return handleCallDecline(data.callId);
            
        case 'open':
            return openWindow(`/room/${data.roomId || data.spaceId}`);
            
        default:
            return openWindow('/');
    }
}

async function openWindow(url) {
    const clients = await self.clients.matchAll({ type: 'window' });
    
    // Check if there's already a window open
    for (const client of clients) {
        if (client.url.includes(url.split('?')[0])) {
            client.focus();
            if (url.includes('?')) {
                client.postMessage({ type: 'navigate', url });
            }
            return;
        }
    }
    
    // Open new window
    if (self.clients.openWindow) {
        return self.clients.openWindow(url);
    }
}

async function handleCallDecline(callId) {
    // Send decline message to all clients
    return sendMessageToClients({
        type: 'call-decline',
        callId: callId
    });
}

async function sendMessageToClients(message) {
    const clients = await self.clients.matchAll();
    
    return Promise.all(
        clients.map(client => {
            try {
                client.postMessage(message);
            } catch (error) {
                console.error('[ServiceWorker] Failed to send message to client:', error);
            }
        })
    );
}

async function doBackgroundSync() {
    try {
        console.log('[ServiceWorker] Performing background sync');
        
        // Sync pending messages
        await syncMessages();
        
        // Sync user presence
        await syncPresence();
        
        // Clean up old data
        await cleanupOldData();
        
        console.log('[ServiceWorker] Background sync completed');
    } catch (error) {
        console.error('[ServiceWorker] Background sync failed:', error);
        throw error;
    }
}

async function syncMessages() {
    try {
        // Get pending messages from IndexedDB
        const pendingMessages = await getPendingMessages();
        
        for (const message of pendingMessages) {
            try {
                const response = await fetch('/api/messages', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(message)
                });
                
                if (response.ok) {
                    await removePendingMessage(message.id);
                }
            } catch (error) {
                console.error('[ServiceWorker] Failed to sync message:', error);
            }
        }
    } catch (error) {
        console.error('[ServiceWorker] Message sync failed:', error);
    }
}

async function syncPresence() {
    try {
        await fetch('/api/presence', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                status: 'online',
                lastSeen: Date.now()
            })
        });
    } catch (error) {
        console.error('[ServiceWorker] Presence sync failed:', error);
    }
}

async function cleanupOldData() {
    try {
        // Clean up old cache entries
        const cache = await caches.open(DYNAMIC_CACHE);
        const requests = await cache.keys();
        
        const oneWeekAgo = Date.now() - (7 * 24 * 60 * 60 * 1000);
        
        for (const request of requests) {
            const response = await cache.match(request);
            const dateHeader = response.headers.get('date');
            
            if (dateHeader) {
                const responseDate = new Date(dateHeader).getTime();
                if (responseDate < oneWeekAgo) {
                    await cache.delete(request);
                }
            }
        }
    } catch (error) {
        console.error('[ServiceWorker] Cleanup failed:', error);
    }
}

async function cacheUrls(urls) {
    const cache = await caches.open(DYNAMIC_CACHE);
    return cache.addAll(urls);
}

async function clearCache(cacheName) {
    return caches.delete(cacheName || DYNAMIC_CACHE);
}

async function getCacheInfo() {
    const cacheNames = await caches.keys();
    const cacheInfo = {};
    
    for (const cacheName of cacheNames) {
        const cache = await caches.open(cacheName);
        const keys = await cache.keys();
        cacheInfo[cacheName] = keys.length;
    }
    
    return cacheInfo;
}

// IndexedDB helpers (simplified)
async function getPendingMessages() {
    // Implementation would use IndexedDB to get pending messages
    return [];
}

async function removePendingMessage(messageId) {
    // Implementation would use IndexedDB to remove message
    console.log('[ServiceWorker] Removing pending message:', messageId);
}
