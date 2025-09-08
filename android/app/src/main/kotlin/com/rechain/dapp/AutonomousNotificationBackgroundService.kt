package com.rechain.dapp

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat
import androidx.lifecycle.LifecycleService
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.Worker
import androidx.work.WorkerParameters
import timber.log.Timber
import java.util.concurrent.TimeUnit

import androidx.lifecycle.LifecycleService
import androidx.work.*
import com.jakewharton.timber.log.Timber
import com.google.firebase.crashlytics.FirebaseCrashlytics

class AutonomousNotificationBackgroundService : LifecycleService() {
    
    companion object {
        private const val CHANNEL_ID = "rechain_background_service"
        private const val NOTIFICATION_ID = 1001
        private const val SERVICE_NAME = "REChain Background Service"
        
        fun startService(context: Context) {
            val intent = Intent(context, AutonomousNotificationBackgroundService::class.java)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(intent)
            } else {
                context.startService(intent)
            }
        }
        
        fun stopService(context: Context) {
            val intent = Intent(context, AutonomousNotificationBackgroundService::class.java)
            context.stopService(intent)
        }
    }
    
    private lateinit var notificationManager: NotificationManager
    
    override fun onCreate() {
        super.onCreate()
        Timber.d("AutonomousNotificationBackgroundService created")
        
        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        createNotificationChannel()
        
        // Schedule periodic work for background notifications
        schedulePeriodicWork()
    }
    
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        super.onStartCommand(intent, flags, startId)
        
        val notification = createForegroundNotification()
        startForeground(NOTIFICATION_ID, notification)
        
        Timber.d("AutonomousNotificationBackgroundService started")
        
        return START_STICKY // Restart service if killed
    }
    
    override fun onBind(intent: Intent): IBinder? {
        super.onBind(intent)
        return null
    }
    
    override fun onDestroy() {
        super.onDestroy()
        Timber.d("AutonomousNotificationBackgroundService destroyed")
        
        // Cancel all scheduled work
        WorkManager.getInstance(this).cancelAllWorkByTag("rechain_background_notifications")
    }
    
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                SERVICE_NAME,
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = "Background service for REChain notifications"
                setShowBadge(false)
                enableVibration(false)
                enableLights(false)
            }
            
            notificationManager.createNotificationChannel(channel)
        }
    }
    
    private fun createForegroundNotification(): Notification {
        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("REChain")
            .setContentText("Monitoring for new messages and events")
            .setSmallIcon(android.R.drawable.ic_dialog_info)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setCategory(NotificationCompat.CATEGORY_SERVICE)
            .setOngoing(true)
            .setShowWhen(false)
            .build()
    }
    
    private fun schedulePeriodicWork() {
        val workRequest = PeriodicWorkRequestBuilder<BackgroundNotificationWorker>(
            15, TimeUnit.MINUTES // Minimum interval for periodic work
        )
            .addTag("rechain_background_notifications")
            .build()
        
        WorkManager.getInstance(this).enqueueUniquePeriodicWork(
            "rechain_background_sync",
            ExistingPeriodicWorkPolicy.KEEP,
            workRequest
        )
    }
}

class BackgroundNotificationWorker(
    context: Context,
    params: WorkerParameters
) : Worker(context, params) {
    
    override fun doWork(): Result {
        return try {
            Timber.d("BackgroundNotificationWorker executing")
            
            // Here you can add logic to check for pending notifications
            // sync with server, check for missed messages, etc.
            
            // Example: Check if app is in background and show summary notification
            checkForPendingNotifications()
            
            Result.success()
        } catch (e: Exception) {
            Timber.e(e, "BackgroundNotificationWorker failed")
            Result.retry()
        }
    }
    
    private fun checkForPendingNotifications() {
        // This is where you would implement logic to:
        // 1. Check for unread messages
        // 2. Check for missed calls
        // 3. Check for pending invitations
        // 4. Show summary notifications if needed
        
        Timber.d("Checking for pending notifications...")
    }
}
