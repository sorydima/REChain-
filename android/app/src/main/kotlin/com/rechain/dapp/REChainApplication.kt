package com.rechain.dapp

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
            // In production, you might want to use a different tree
            // that logs to crashlytics or other crash reporting service
            Timber.plant(ReleaseTree())
        }
        
        Timber.d("REChainApplication initialized")
        
        // Log build and device info
        BuildConfigHelper.logBuildInfo(this)
        
        // Initialize crash reporting
        CrashReportingManager.getInstance().initialize(this, enableInDebug = false)
        
        // Set crash reporting context
        val versionInfo = BuildConfigHelper.getVersionInfo(this)
        val deviceInfo = BuildConfigHelper.getDeviceInfo()
        
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
