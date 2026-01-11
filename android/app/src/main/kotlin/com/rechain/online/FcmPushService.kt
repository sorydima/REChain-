package com.rechain.online

import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import android.content.Intent
import android.util.Log
import timber.log.Timber

class FcmPushService : FirebaseMessagingService() {
    
    companion object {
        private const val TAG = "FcmPushService"
    }

    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)
        
        Timber.d("FCM message received from: ${remoteMessage.from}")
        
        // Handle FCM data payload
        if (remoteMessage.data.isNotEmpty()) {
            Timber.d("Message data payload: ${remoteMessage.data}")
            
            // Send broadcast to MainActivity
            val intent = Intent("com.rechain.push.RECEIVED")
            intent.putExtra("payload", remoteMessage.data.toString())
            sendBroadcast(intent)
        }

        // Handle FCM notification payload
        remoteMessage.notification?.let { notification ->
            Timber.d("Message notification body: ${notification.body}")
            
            // Show notification using AutonomousNotificationService
            val autonomousService = AutonomousNotificationService(this)
            autonomousService.showNotification(
                type = "fcm_message",
                title = notification.title ?: "REChain",
                message = notification.body ?: "",
                payload = remoteMessage.data
            )
        }
    }

    override fun onNewToken(token: String) {
        super.onNewToken(token)
        Timber.d("Refreshed FCM token: $token")
        
        // Send token to server if needed
        sendRegistrationToServer(token)
    }
    
    private fun sendRegistrationToServer(token: String) {
        // TODO: Implement token registration with your server
        Timber.d("FCM token registered: $token")
    }
}
