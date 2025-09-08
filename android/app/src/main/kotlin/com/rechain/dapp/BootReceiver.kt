package com.rechain.dapp

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import timber.log.Timber

import androidx.lifecycle.LifecycleService
import androidx.work.*

class BootReceiver : BroadcastReceiver() {
    
    override fun onReceive(context: Context, intent: Intent) {
        when (intent.action) {
            Intent.ACTION_BOOT_COMPLETED,
            "android.intent.action.QUICKBOOT_POWERON" -> {
                Timber.d("Device boot completed, starting background services")
                
                // Start the autonomous notification background service
                AutonomousNotificationBackgroundService.startService(context)
                
                // Initialize notification channels
                val notificationService = AutonomousNotificationService(context)
                
                Timber.i("REChain background services initialized after boot")
            }
        }
    }
}
