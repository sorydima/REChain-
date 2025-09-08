package com.rechain.dapp

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build
import timber.log.Timber

import androidx.lifecycle.LifecycleService
import androidx.work.*
import com.google.firebase.crashlytics.FirebaseCrashlytics

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
