package com.rechain.dapp

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import android.util.Log
import org.json.JSONObject
import timber.log.Timber

import androidx.lifecycle.LifecycleService
import androidx.work.*
import com.google.firebase.crashlytics.FirebaseCrashlytics

class AutonomousNotificationService(private val context: Context) {
    
    companion object {
        private const val CHANNEL_ID = "rechain_autonomous_notifications"
        private const val CHANNEL_NAME = "REChain Autonomous Notifications"
        private const val CHANNEL_DESCRIPTION = "Autonomous notifications for REChain events"
        private const val TAG = "AutonomousNotificationService"
        
        // Notification types
        const val TYPE_MESSAGE_RECEIVED = "message_received"
        const val TYPE_USER_JOINED = "user_joined"
        const val TYPE_USER_LEFT = "user_left"
        const val TYPE_CALL_INCOMING = "call_incoming"
        const val TYPE_CALL_MISSED = "call_missed"
        const val TYPE_FILE_UPLOADED = "file_uploaded"
        const val TYPE_ROOM_CREATED = "room_created"
        const val TYPE_ROOM_INVITED = "room_invited"
        const val TYPE_ENCRYPTION_ENABLED = "encryption_enabled"
        const val TYPE_SYNC_ERROR = "sync_error"
        const val TYPE_LOGIN_SUCCESS = "login_success"
        const val TYPE_BACKUP_CREATED = "backup_created"
        const val TYPE_DEVICE_VERIFIED = "device_verified"
        const val TYPE_SPACE_JOINED = "space_joined"
        const val TYPE_REACTION_ADDED = "reaction_added"
        const val TYPE_TYPING_INDICATOR = "typing_indicator"
    }
    
    private val notificationManager = NotificationManagerCompat.from(context)
    
    init {
        createNotificationChannel()
    }
    
    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                CHANNEL_ID,
                CHANNEL_NAME,
                NotificationManager.IMPORTANCE_DEFAULT
            ).apply {
                description = CHANNEL_DESCRIPTION
                enableVibration(true)
                enableLights(true)
            }
            
            val manager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }
    }
    
    fun showNotification(
        type: String,
        title: String,
        message: String,
        payload: Map<String, Any> = emptyMap(),
        priority: Int = NotificationCompat.PRIORITY_DEFAULT
    ) {
        try {
            val intent = Intent(context, MainActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
                putExtra("notification_type", type)
                putExtra("notification_payload", JSONObject(payload).toString())
            }
            
            val pendingIntent = PendingIntent.getActivity(
                context,
                type.hashCode(),
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            
            val notification = NotificationCompat.Builder(context, CHANNEL_ID)
                .setSmallIcon(getNotificationIcon(type))
                .setContentTitle(title)
                .setContentText(message)
                .setPriority(priority)
                .setContentIntent(pendingIntent)
                .setAutoCancel(true)
                .setStyle(NotificationCompat.BigTextStyle().bigText(message))
                .apply {
                    when (type) {
                        TYPE_CALL_INCOMING -> {
                            setCategory(NotificationCompat.CATEGORY_CALL)
                            setPriority(NotificationCompat.PRIORITY_HIGH)
                            setFullScreenIntent(pendingIntent, true)
                        }
                        TYPE_MESSAGE_RECEIVED -> {
                            setCategory(NotificationCompat.CATEGORY_MESSAGE)
                        }
                        TYPE_SYNC_ERROR -> {
                            setCategory(NotificationCompat.CATEGORY_ERROR)
                            setPriority(NotificationCompat.PRIORITY_HIGH)
                        }
                        TYPE_LOGIN_SUCCESS -> {
                            setCategory(NotificationCompat.CATEGORY_STATUS)
                        }
                    }
                }
                .build()
            
            notificationManager.notify(type.hashCode(), notification)
            Timber.d("Notification shown: $type - $title")
            
        } catch (e: Exception) {
            Timber.e(e, "Error showing notification")
        }
    }
    
    fun cancelNotification(type: String) {
        notificationManager.cancel(type.hashCode())
    }
    
    fun cancelAllNotifications() {
        notificationManager.cancelAll()
    }
    
    // Предустановленные уведомления для различных событий
    fun showMessageNotification(senderName: String, message: String, roomId: String) {
        showNotification(
            TYPE_MESSAGE_RECEIVED,
            "Новое сообщение от $senderName",
            message,
            mapOf("roomId" to roomId, "sender" to senderName),
            NotificationCompat.PRIORITY_DEFAULT
        )
    }
    
    fun showCallNotification(callerName: String, callId: String) {
        showNotification(
            TYPE_CALL_INCOMING,
            "Входящий звонок",
            "Звонок от $callerName",
            mapOf("callId" to callId, "caller" to callerName),
            NotificationCompat.PRIORITY_HIGH
        )
    }
    
    fun showUserJoinedNotification(userName: String, roomName: String) {
        showNotification(
            TYPE_USER_JOINED,
            "Пользователь присоединился",
            "$userName присоединился к $roomName",
            mapOf("userName" to userName, "roomName" to roomName)
        )
    }
    
    fun showFileUploadedNotification(fileName: String, roomName: String) {
        showNotification(
            TYPE_FILE_UPLOADED,
            "Файл загружен",
            "$fileName загружен в $roomName",
            mapOf("fileName" to fileName, "roomName" to roomName)
        )
    }
    
    fun showSyncErrorNotification(error: String) {
        showNotification(
            TYPE_SYNC_ERROR,
            "Ошибка синхронизации",
            "Не удалось синхронизировать данные: $error",
            mapOf("error" to error),
            NotificationCompat.PRIORITY_HIGH
        )
    }
    
    fun showLoginSuccessNotification(userName: String) {
        showNotification(
            TYPE_LOGIN_SUCCESS,
            "Успешный вход",
            "Добро пожаловать, $userName!",
            mapOf("userName" to userName)
        )
    }
    
    fun showBackupCreatedNotification() {
        showNotification(
            TYPE_BACKUP_CREATED,
            "Резервная копия создана",
            "Ваши ключи безопасно сохранены",
            emptyMap()
        )
    }
    
    fun showDeviceVerifiedNotification(deviceName: String) {
        showNotification(
            TYPE_DEVICE_VERIFIED,
            "Устройство верифицировано",
            "Устройство $deviceName успешно верифицировано",
            mapOf("deviceName" to deviceName)
        )
    }
    
    fun showSpaceJoinedNotification(spaceName: String) {
        showNotification(
            TYPE_SPACE_JOINED,
            "Присоединение к пространству",
            "Вы присоединились к пространству $spaceName",
            mapOf("spaceName" to spaceName)
        )
    }
    
    fun showReactionAddedNotification(userName: String, reaction: String, roomName: String) {
        showNotification(
            TYPE_REACTION_ADDED,
            "Новая реакция",
            "$userName отреагировал $reaction в $roomName",
            mapOf("userName" to userName, "reaction" to reaction, "roomName" to roomName)
        )
    }
    
    private fun getNotificationIcon(type: String): Int {
        return when (type) {
            TYPE_MESSAGE_RECEIVED, TYPE_REACTION_ADDED -> R.drawable.ic_message
            TYPE_CALL_INCOMING, TYPE_CALL_MISSED -> R.drawable.ic_call
            TYPE_SYNC_ERROR -> R.drawable.ic_error
            TYPE_FILE_UPLOADED -> android.R.drawable.stat_sys_upload
            TYPE_USER_JOINED, TYPE_USER_LEFT -> android.R.drawable.ic_menu_add
            TYPE_ROOM_CREATED, TYPE_ROOM_INVITED -> android.R.drawable.ic_menu_add
            TYPE_ENCRYPTION_ENABLED -> android.R.drawable.ic_lock_lock
            TYPE_LOGIN_SUCCESS -> android.R.drawable.ic_menu_preferences
            TYPE_BACKUP_CREATED -> android.R.drawable.ic_menu_save
            TYPE_DEVICE_VERIFIED -> android.R.drawable.ic_menu_preferences
            TYPE_SPACE_JOINED -> android.R.drawable.ic_menu_add
            TYPE_TYPING_INDICATOR -> R.drawable.ic_message
            else -> R.drawable.ic_notification
        }
    }
}
