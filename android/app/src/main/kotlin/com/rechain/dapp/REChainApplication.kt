package com.rechain.dapp

import android.app.Application
import android.content.Context
import androidx.multidex.MultiDex
import timber.log.Timber

import androidx.lifecycle.LifecycleService
import androidx.work.*

class REChainApplication : Application() {
    
    companion object {
        lateinit var instance: REChainApplication
            private set
    }
    
    override fun onCreate() {
        super.onCreate()
        instance = this
        
        Timber.d("REChainApplication initialized")
        
        // Initialize autonomous notification service
        AutonomousNotificationBackgroundService.startService(this)
    }
    
    override fun attachBaseContext(base: Context?) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
    
    private class ReleaseTree : Timber.Tree() {
        override fun log(priority: Int, tag: String?, message: String, t: Throwable?) {
            // Only log warnings and errors in release builds
            if (priority >= android.util.Log.WARN) {
                CrashReportingManager.getInstance().logMessage("$tag: $message")
                if (t != null) {
                    CrashReportingManager.getInstance().logException(t)
                }
            }
        }
    }
}
