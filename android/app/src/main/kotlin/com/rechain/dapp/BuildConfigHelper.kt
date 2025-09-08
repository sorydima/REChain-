package com.rechain.dapp

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import timber.log.Timber

object BuildConfigHelper {
    
    fun getVersionInfo(context: Context): VersionInfo {
        return try {
            val packageInfo: PackageInfo = context.packageManager.getPackageInfo(
                context.packageName, 
                0
            )
            
            VersionInfo(
                versionName = packageInfo.versionName ?: "Unknown",
                versionCode = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                    packageInfo.longVersionCode
                } else {
                    @Suppress("DEPRECATION")
                    packageInfo.versionCode.toLong()
                },
                packageName = packageInfo.packageName,
                isDebug = BuildConfig.DEBUG,
                buildType = if (BuildConfig.DEBUG) "debug" else "release"
            )
        } catch (e: PackageManager.NameNotFoundException) {
            Timber.e(e, "Failed to get version info")
            VersionInfo(
                versionName = "Unknown",
                versionCode = 0,
                packageName = context.packageName,
                isDebug = BuildConfig.DEBUG,
                buildType = if (BuildConfig.DEBUG) "debug" else "release"
            )
        }
    }
    
    fun getDeviceInfo(): DeviceInfo {
        return DeviceInfo(
            manufacturer = Build.MANUFACTURER,
            model = Build.MODEL,
            device = Build.DEVICE,
            androidVersion = Build.VERSION.RELEASE,
            apiLevel = Build.VERSION.SDK_INT,
            buildId = Build.ID,
            hardware = Build.HARDWARE,
            brand = Build.BRAND
        )
    }
    
    fun logBuildInfo(context: Context) {
        val versionInfo = getVersionInfo(context)
        val deviceInfo = getDeviceInfo()
        
        Timber.i("=== REChain Build Info ===")
        Timber.i("Version: ${versionInfo.versionName} (${versionInfo.versionCode})")
        Timber.i("Package: ${versionInfo.packageName}")
        Timber.i("Build Type: ${versionInfo.buildType}")
        Timber.i("Debug: ${versionInfo.isDebug}")
        
        Timber.i("=== Device Info ===")
        Timber.i("Device: ${deviceInfo.manufacturer} ${deviceInfo.model}")
        Timber.i("Android: ${deviceInfo.androidVersion} (API ${deviceInfo.apiLevel})")
        Timber.i("Build ID: ${deviceInfo.buildId}")
        Timber.i("Hardware: ${deviceInfo.hardware}")
        Timber.i("Brand: ${deviceInfo.brand}")
    }
}

data class VersionInfo(
    val versionName: String,
    val versionCode: Long,
    val packageName: String,
    val isDebug: Boolean,
    val buildType: String
)

data class DeviceInfo(
    val manufacturer: String,
    val model: String,
    val device: String,
    val androidVersion: String,
    val apiLevel: Int,
    val buildId: String,
    val hardware: String,
    val brand: String
)
