package com.rechain.dapp

import android.app.Activity
import android.os.Bundle
import android.widget.Button
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import timber.log.Timber

import androidx.lifecycle.LifecycleService
import androidx.work.*

class DebugActivity : Activity() {
    
    private lateinit var autonomousNotificationService: AutonomousNotificationService
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        autonomousNotificationService = AutonomousNotificationService(this)
        
        setupUI()
        Timber.d("DebugActivity created")
    }
    
    private fun setupUI() {
        val scrollView = ScrollView(this)
        val layout = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(32, 32, 32, 32)
        }
        
        // Title
        val title = TextView(this).apply {
            text = "REChain Debug - Notification Testing"
            textSize = 18f
            setPadding(0, 0, 0, 32)
        }
        layout.addView(title)
        
        // Test buttons
        val testButtons = listOf(
            "Test Message Notification" to { testMessageNotification() },
            "Test Call Notification" to { testCallNotification() },
            "Test User Joined" to { testUserJoinedNotification() },
            "Test File Upload" to { testFileUploadNotification() },
            "Test Sync Error" to { testSyncErrorNotification() },
            "Test Login Success" to { testLoginSuccessNotification() },
            "Test Device Verified" to { testDeviceVerifiedNotification() },
            "Test Space Joined" to { testSpaceJoinedNotification() },
            "Test Reaction Added" to { testReactionNotification() },
            "Clear All Notifications" to { clearAllNotifications() }
        )
        
        testButtons.forEach { (text, action) ->
            val button = Button(this).apply {
                this.text = text
                setPadding(16, 16, 16, 16)
                setOnClickListener { action() }
            }
            layout.addView(button)
        }
        
        scrollView.addView(layout)
        setContentView(scrollView)
    }
    
    private fun testMessageNotification() {
        autonomousNotificationService.showMessageNotification(
            "John Doe",
            "Hey! How are you doing?",
            "!room123"
        )
        Timber.d("Test message notification sent")
    }
    
    private fun testCallNotification() {
        autonomousNotificationService.showCallNotification(
            "Alice Smith",
            "call456"
        )
        Timber.d("Test call notification sent")
    }
    
    private fun testUserJoinedNotification() {
        autonomousNotificationService.showUserJoinedNotification(
            "Bob Wilson",
            "General Chat"
        )
        Timber.d("Test user joined notification sent")
    }
    
    private fun testFileUploadNotification() {
        autonomousNotificationService.showFileUploadedNotification(
            "document.pdf",
            "Work Group"
        )
        Timber.d("Test file upload notification sent")
    }
    
    private fun testSyncErrorNotification() {
        autonomousNotificationService.showSyncErrorNotification(
            "Failed to connect to server"
        )
        Timber.d("Test sync error notification sent")
    }
    
    private fun testLoginSuccessNotification() {
        autonomousNotificationService.showLoginSuccessNotification(
            "TestUser"
        )
        Timber.d("Test login success notification sent")
    }
    
    private fun testDeviceVerifiedNotification() {
        autonomousNotificationService.showDeviceVerifiedNotification(
            "Samsung Galaxy S24"
        )
        Timber.d("Test device verified notification sent")
    }
    
    private fun testSpaceJoinedNotification() {
        autonomousNotificationService.showSpaceJoinedNotification(
            "Development Team"
        )
        Timber.d("Test space joined notification sent")
    }
    
    private fun testReactionNotification() {
        autonomousNotificationService.showReactionAddedNotification(
            "Emma Davis",
            "👍",
            "Random Chat"
        )
        Timber.d("Test reaction notification sent")
    }
    
    private fun clearAllNotifications() {
        autonomousNotificationService.cancelAllNotifications()
        Timber.d("All notifications cleared")
    }
}
