package com.rechain.online

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

import ru.rustore.sdk.push.model.PushMessage
import ru.rustore.sdk.push.receiver.RuStorePushReceiver

class CustomPushReceiver : RuStorePushReceiver() {
    override fun onPushMessageReceived(context: Context, message: PushMessage) {
        Log.d("CustomPushReceiver", "Received message: ${message.payload}")

        val intent = Intent("com.rechain.push.RECEIVED")
        intent.putExtra("payload", message.payload)
        context.sendBroadcast(intent)
    }
}
