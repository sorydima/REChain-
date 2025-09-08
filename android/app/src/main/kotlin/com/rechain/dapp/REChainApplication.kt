package com.rechain.dapp

import android.app.Application
import android.content.Context
import androidx.multidex.MultiDex
import timber.log.Timber

import androidx.lifecycle.LifecycleService
import androidx.work.*
import com.google.firebase.crashlytics.FirebaseCrashlytics

class REChainApplication : Application() {
    
    companion object {
        lateinit var instance: REChainApplication
            private set
    }
    
    override fun onCreate() {
        super.onCreate()
        instance = this
        
        Timber.d("REChainApplication initialized")
        
        // Initialize crash reporting
        CrashReportingManager.getInstance().initialize(this, enableInDebug = false)
        
        CrashReportingManager.getInstance().apply {
            setCustomKey("version_name", versionInfo.versionName)
            setCustomKey("version_code", versionInfo.versionCode.toInt())
            setCustomKey("build_type", versionInfo.buildType)
            setCustomKey("device_model", "${deviceInfo.manufacturer} ${deviceInfo.model}")
            setCustomKey("android_version", deviceInfo.androidVersion)
            setCustomKey("api_level", deviceInfo.apiLevel)
        }
        
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
