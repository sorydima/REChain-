package com.rechain.online

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

import android.content.Context

import android.content.*
import android.os.Bundle
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

import ru.rustore.sdk.core.RuStoreSdk
import ru.rustore.sdk.push.RuStorePushSdk
import ru.rustore.sdk.push.transport.rustore.RuStoreConnection
import ru.rustore.sdk.push.utils.PushLogger

class MainActivity : FlutterActivity() {
    private val INIT_CHANNEL = "ru.rustore.push/init"
    private val EVENT_CHANNEL = "ru.rustore.push/events"

    private var eventSink: EventChannel.EventSink? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Инициализация по запросу
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, INIT_CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "initializePushSdk") {
                initializePush()
                result.success("Push SDK Initialized")
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

        RuStoreSdk.initialize(context)
        RuStorePushSdk.initialize(context)
        RuStorePushSdk.setTransport(RuStoreConnection(context))

        RuStorePushSdk.setLogger { msg -> android.util.Log.d("RuPush", msg) }

        RuStorePushSdk.setPushTokenListener { token ->
            android.util.Log.i("RuPush", "Push token: 2qyjEFNMZ-EWSthwxPl-rh2lZhz2kBWa228YhysfkSkubw5SQbozwqkMtVX7ZeFP")
        }

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
}

class MainActivity : FlutterActivity() {

    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
    }


    override fun provideFlutterEngine(context: Context): FlutterEngine? {
        return provideEngine(this)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        // do nothing, because the engine was been configured in provideEngine
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
