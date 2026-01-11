package com.rechain.online

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log
import android.os.Build
import androidx.core.content.ContextCompat

import androidx.lifecycle.LifecycleService
import androidx.work.*

class CustomPushReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        Log.d("CustomPushReceiver", "Received push broadcast")
        
        val payload = intent.getStringExtra("payload")
        val newIntent = Intent("com.rechain.push.RECEIVED")
        newIntent.putExtra("payload", payload)
        
        // Android 14+ compatibility: Use explicit broadcast
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            newIntent.setPackage(context.packageName)
        }
        
        context.sendBroadcast(newIntent)
    }
}
