package com.rechain.dapp

import android.content.Context
import com.google.firebase.crashlytics.FirebaseCrashlytics
import timber.log.Timber

class CrashReportingManager private constructor() {
    
    companion object {
        @Volatile
        private var INSTANCE: CrashReportingManager? = null
        
        fun getInstance(): CrashReportingManager {
            return INSTANCE ?: synchronized(this) {
                INSTANCE ?: CrashReportingManager().also { INSTANCE = it }
            }
        }
    }
    
    private var crashlytics: FirebaseCrashlytics? = null
    private var isInitialized = false
    
    fun initialize(context: Context, enableInDebug: Boolean = false) {
        if (isInitialized) return
        
        try {
            crashlytics = FirebaseCrashlytics.getInstance()
            
            // Enable/disable crashlytics collection
            crashlytics?.setCrashlyticsCollectionEnabled(
                !BuildConfig.DEBUG || enableInDebug
            )
            
            isInitialized = true
            Timber.d("CrashReportingManager initialized")
            
        } catch (e: Exception) {
            Timber.e(e, "Failed to initialize crash reporting")
        }
    }
    
    fun logException(throwable: Throwable) {
        try {
            crashlytics?.recordException(throwable)
            Timber.e(throwable, "Exception logged to crash reporting")
        } catch (e: Exception) {
            Timber.e(e, "Failed to log exception to crash reporting")
        }
    }
    
    fun logMessage(message: String) {
        try {
            crashlytics?.log(message)
            Timber.d("Message logged to crash reporting: $message")
        } catch (e: Exception) {
            Timber.e(e, "Failed to log message to crash reporting")
        }
    }
    
    fun setUserId(userId: String) {
        try {
            crashlytics?.setUserId(userId)
            Timber.d("User ID set in crash reporting: $userId")
        } catch (e: Exception) {
            Timber.e(e, "Failed to set user ID in crash reporting")
        }
    }
    
    fun setCustomKey(key: String, value: String) {
        try {
            crashlytics?.setCustomKey(key, value)
            Timber.d("Custom key set in crash reporting: $key = $value")
        } catch (e: Exception) {
            Timber.e(e, "Failed to set custom key in crash reporting")
        }
    }
    
    fun setCustomKey(key: String, value: Boolean) {
        try {
            crashlytics?.setCustomKey(key, value)
            Timber.d("Custom key set in crash reporting: $key = $value")
        } catch (e: Exception) {
            Timber.e(e, "Failed to set custom key in crash reporting")
        }
    }
    
    fun setCustomKey(key: String, value: Int) {
        try {
            crashlytics?.setCustomKey(key, value)
            Timber.d("Custom key set in crash reporting: $key = $value")
        } catch (e: Exception) {
            Timber.e(e, "Failed to set custom key in crash reporting")
        }
    }
}
