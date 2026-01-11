package com.rechain.online

import android.app.Application
import android.content.Context
import androidx.multidex.MultiDex
import timber.log.Timber

class REChainApplication : Application() {
    
    companion object {
        lateinit var instance: REChainApplication
            private set
    }
    
    override fun onCreate() {
        super.onCreate()
        instance = this
        
        // Initialize Timber logging
        if (BuildConfig.DEBUG) {
            Timber.plant(Timber.DebugTree())
        } else {
            Timber.plant(ReleaseTree())
        }
        
        Timber.d("REChainApplication initialized")
        
        try {
            // Initialize autonomous notification service safely
            AutonomousNotificationBackgroundService.startService(this)
        } catch (e: Exception) {
            Timber.e(e, "Failed to start autonomous notification service")
        }
    }
    
    override fun attachBaseContext(base: Context?) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
    
    private class ReleaseTree : Timber.Tree() {
        override fun log(priority: Int, tag: String?, message: String, t: Throwable?) {
            // Only log warnings and errors in release builds
            if (priority >= android.util.Log.WARN) {
                android.util.Log.println(priority, tag, message)
            }
        }
    }
}
