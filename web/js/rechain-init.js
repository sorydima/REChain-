/**
 * REChain Web Platform Initialization
 * Handles service initialization and Flutter integration
 */

// Initialize REChain Web Services
let rechainServices = {};

window.addEventListener('load', function (ev) {
  // Initialize services before Flutter
  initializeREChainServices().then(() => {
    // Flutter initialization will be handled by template replacement
    console.log('REChain services ready, Flutter initialization will follow');
  });
});

async function initializeREChainServices() {
  try {
    // Initialize crash reporting first
    rechainServices.crashReporting = new CrashReportingManager();
    await rechainServices.crashReporting.initialize({
      appName: 'REChain',
      version: '1.0.0',
      environment: 'production'
    });

    // Initialize error handler
    rechainServices.errorHandler = new ErrorHandler();
    await rechainServices.errorHandler.initialize(rechainServices.crashReporting);

    // Initialize system integration
    rechainServices.systemIntegration = new WebSystemIntegration();
    await rechainServices.systemIntegration.initialize();

    // Initialize notification service
    rechainServices.notificationService = new AutonomousNotificationService();
    await rechainServices.notificationService.initialize({
      appName: 'REChain',
      icon: '/icons/Icon-192.png',
      soundPath: '/sounds/'
    });

    // Initialize web push service
    rechainServices.webPushService = new WebPushService();
    await rechainServices.webPushService.initialize({
      errorHandler: rechainServices.errorHandler,
      vapidPublicKey: 'BEl62iUYgUivxIkv69yViEuiBIa40HI0DLLuxazjqAKVXTJtkTXaXDiDNjRUjzgyw9FNeBHUHIHu6j3V0VdNULI'
    });

    console.log('REChain web services initialized successfully');
  } catch (error) {
    console.error('Failed to initialize REChain services:', error);
    // Use error handler if available
    if (rechainServices.errorHandler) {
      rechainServices.errorHandler.handleError({
        message: 'Service initialization failed',
        error: error,
        context: 'initialization'
      });
    }
  }
}

async function initializeNotificationIntegration() {
  try {
    rechainServices.notificationIntegration = new AutonomousNotificationIntegration();
    await rechainServices.notificationIntegration.initialize(rechainServices);
    
    // Make services globally available
    window.REChainServices = rechainServices;
    
    console.log('REChain notification integration initialized');
  } catch (error) {
    console.error('Failed to initialize notification integration:', error);
  }
}

// Hook for Flutter app initialization completion
window.onFlutterAppReady = function() {
  initializeNotificationIntegration();
};
