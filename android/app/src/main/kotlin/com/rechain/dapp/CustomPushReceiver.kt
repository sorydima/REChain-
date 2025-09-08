package com.rechain.dapp

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

class CustomPushReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        Log.d("CustomPushReceiver", "Received push broadcast")
        
        val payload = intent.getStringExtra("payload")
        val newIntent = Intent("com.rechain.push.RECEIVED")
        newIntent.putExtra("payload", payload)
        context.sendBroadcast(newIntent)
    }
}
