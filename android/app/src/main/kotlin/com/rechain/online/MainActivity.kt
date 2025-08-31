package com.rechain.dapp

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.BroadcastReceiver
import android.os.Bundle
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val INIT_CHANNEL = "rechain.push/init"
    private val EVENT_CHANNEL = "rechain.push/events"

    private var eventSink: EventChannel.EventSink? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Инициализация по запросу
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, INIT_CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "initializePush") {
                initializePush()
                result.success("Push Initialized")
            } else {
                result.notImplemented()
            }
        }

        // EventChannel для получения пушей
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    eventSink = events
                }

                override fun onCancel(arguments: Any?) {
                    eventSink = null
                }
            }
        )
    }

    private fun initializePush() {
        val context = applicationContext

        // Регистрируем наш кастомный ресивер
        val filter = IntentFilter("com.rechain.push.RECEIVED")
        registerReceiver(pushReceiver, filter)
    }

    private val pushReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            val payload = intent?.getStringExtra("payload")
            payload?.let {
                eventSink?.success(it)
            }
        }
    }

    override fun onDestroy() {
        unregisterReceiver(pushReceiver)
        super.onDestroy()
    }

    companion object {
        var engine: FlutterEngine? = null
        fun provideEngine(context: Context): FlutterEngine {
            val eng = engine ?: FlutterEngine(context, emptyArray(), true, false)
            engine = eng
            return eng
        }
    }
}

