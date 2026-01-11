package com.rechain.online

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.BroadcastReceiver
import android.os.Bundle
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject
import timber.log.Timber

import androidx.lifecycle.LifecycleService
import androidx.work.*

class MainActivity : FlutterActivity() {
    private val INIT_CHANNEL = "rechain.push/init"
    private val EVENT_CHANNEL = "rechain.push/events"
    private val AUTONOMOUS_CHANNEL = "rechain.autonomous/notifications"

    private var eventSink: EventChannel.EventSink? = null
    private lateinit var autonomousNotificationService: AutonomousNotificationService
    private lateinit var permissionManager: PermissionManager

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        // Инициализация автономного сервиса уведомлений
        autonomousNotificationService = AutonomousNotificationService(this)
        
        // Инициализация менеджера разрешений
        permissionManager = PermissionManager(this)

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
        
        // Канал для автономных уведомлений
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, AUTONOMOUS_CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "showNotification" -> {
                    val type = call.argument<String>("type") ?: ""
                    val title = call.argument<String>("title") ?: ""
                    val message = call.argument<String>("message") ?: ""
                    val payload = call.argument<Map<String, Any>>("payload") ?: emptyMap()
                    
                    autonomousNotificationService.showNotification(type, title, message, payload)
                    result.success("Notification shown")
                }
                "showMessageNotification" -> {
                    val senderName = call.argument<String>("senderName") ?: ""
                    val message = call.argument<String>("message") ?: ""
                    val roomId = call.argument<String>("roomId") ?: ""
                    
                    autonomousNotificationService.showMessageNotification(senderName, message, roomId)
                    result.success("Message notification shown")
                }
                "showCallNotification" -> {
                    val callerName = call.argument<String>("callerName") ?: ""
                    val callId = call.argument<String>("callId") ?: ""
                    
                    autonomousNotificationService.showCallNotification(callerName, callId)
                    result.success("Call notification shown")
                }
                "showUserJoinedNotification" -> {
                    val userName = call.argument<String>("userName") ?: ""
                    val roomName = call.argument<String>("roomName") ?: ""
                    
                    autonomousNotificationService.showUserJoinedNotification(userName, roomName)
                    result.success("User joined notification shown")
                }
                "showFileUploadedNotification" -> {
                    val fileName = call.argument<String>("fileName") ?: ""
                    val roomName = call.argument<String>("roomName") ?: ""
                    
                    autonomousNotificationService.showFileUploadedNotification(fileName, roomName)
                    result.success("File uploaded notification shown")
                }
                "showSyncErrorNotification" -> {
                    val error = call.argument<String>("error") ?: ""
                    
                    autonomousNotificationService.showSyncErrorNotification(error)
                    result.success("Sync error notification shown")
                }
                "showLoginSuccessNotification" -> {
                    val userName = call.argument<String>("userName") ?: ""
                    
                    autonomousNotificationService.showLoginSuccessNotification(userName)
                    result.success("Login success notification shown")
                }
                "cancelNotification" -> {
                    val type = call.argument<String>("type") ?: ""
                    
                    autonomousNotificationService.cancelNotification(type)
                    result.success("Notification cancelled")
                }
                "cancelAllNotifications" -> {
                    autonomousNotificationService.cancelAllNotifications()
                    result.success("All notifications cancelled")
                }
                else -> result.notImplemented()
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

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        try {
            // Проверка и запрос разрешений
            if (!permissionManager.checkAllPermissions()) {
                permissionManager.requestMissingPermissions(this)
            }
            
            Timber.d("MainActivity created")
        } catch (e: Exception) {
            Timber.e(e, "Error in MainActivity onCreate")
        }
    }
    
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        
        when (requestCode) {
            PermissionManager.PERMISSION_REQUEST_CODE -> {
                val deniedPermissions = permissions.filterIndexed { index, _ ->
                    grantResults[index] != android.content.pm.PackageManager.PERMISSION_GRANTED
                }
                
                if (deniedPermissions.isNotEmpty()) {
                    Timber.w("Permissions denied: ${deniedPermissions.joinToString()}")
                    autonomousNotificationService.showNotification(
                        "permission_denied",
                        "Разрешения отклонены",
                        "Некоторые функции могут работать неправильно"
                    )
                } else {
                    Timber.d("All permissions granted")
                }
            }
        }
    }

    override fun onDestroy() {
        try {
            unregisterReceiver(pushReceiver)
        } catch (e: IllegalArgumentException) {
            Timber.w("Receiver was not registered")
        }
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

