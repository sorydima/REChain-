import UIKit
import UserNotifications
import os.log

class DebugViewController: UIViewController {
    private let logger = OSLog(subsystem: "com.rechain.dapp", category: "DebugViewController")
    private var autonomousNotificationService: AutonomousNotificationService?
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "REChain Debug"
        view.backgroundColor = UIColor.systemBackground
        
        autonomousNotificationService = AutonomousNotificationService()
        
        setupUI()
        os_log("DebugViewController loaded", log: logger, type: .info)
    }
    
    private func setupUI() {
        // Create stack view programmatically if not connected via storyboard
        if stackView == nil {
            stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 16
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
                stackView.widthAnchor.constraint(lessThanOrEqualToConstant: 300)
            ])
        }
        
        // Create test buttons
        let buttons = [
            ("Test Message Notification", #selector(testMessageNotification)),
            ("Test Call Notification", #selector(testCallNotification)),
            ("Test User Joined", #selector(testUserJoinedNotification)),
            ("Test File Upload", #selector(testFileUploadNotification)),
            ("Test Sync Error", #selector(testSyncErrorNotification)),
            ("Test Login Success", #selector(testLoginSuccessNotification)),
            ("Test Device Verification", #selector(testDeviceVerificationNotification)),
            ("Clear All Notifications", #selector(clearAllNotifications)),
            ("Check Permissions", #selector(checkPermissions)),
            ("Request Permissions", #selector(requestPermissions))
        ]
        
        for (title, action) in buttons {
            let button = createButton(title: title, action: action)
            stackView.addArrangedSubview(button)
        }
    }
    
    private func createButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: action, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        return button
    }
    
    @objc private func testMessageNotification() {
        autonomousNotificationService?.showMessageNotification(
            sender: "Test User",
            message: "This is a test message from the debug interface",
            roomId: "!test:matrix.org"
        )
        os_log("Test message notification sent", log: logger, type: .info)
        showAlert(title: "Test Sent", message: "Message notification sent")
    }
    
    @objc private func testCallNotification() {
        autonomousNotificationService?.showCallNotification(
            caller: "Test Caller",
            callId: "test_call_123",
            isVideo: true
        )
        os_log("Test call notification sent", log: logger, type: .info)
        showAlert(title: "Test Sent", message: "Call notification sent")
    }
    
    @objc private func testUserJoinedNotification() {
        autonomousNotificationService?.showUserJoinedNotification(
            username: "TestUser123",
            roomName: "Test Room",
            roomId: "!test:matrix.org"
        )
        os_log("Test user joined notification sent", log: logger, type: .info)
        showAlert(title: "Test Sent", message: "User joined notification sent")
    }
    
    @objc private func testFileUploadNotification() {
        autonomousNotificationService?.showFileUploadNotification(
            filename: "test_document.pdf",
            roomName: "Test Room",
            roomId: "!test:matrix.org"
        )
        os_log("Test file upload notification sent", log: logger, type: .info)
        showAlert(title: "Test Sent", message: "File upload notification sent")
    }
    
    @objc private func testSyncErrorNotification() {
        autonomousNotificationService?.showSyncErrorNotification(
            error: "Test sync error: Connection timeout"
        )
        os_log("Test sync error notification sent", log: logger, type: .info)
        showAlert(title: "Test Sent", message: "Sync error notification sent")
    }
    
    @objc private func testLoginSuccessNotification() {
        autonomousNotificationService?.showLoginSuccessNotification(
            userId: "@testuser:matrix.org"
        )
        os_log("Test login success notification sent", log: logger, type: .info)
        showAlert(title: "Test Sent", message: "Login success notification sent")
    }
    
    @objc private func testDeviceVerificationNotification() {
        autonomousNotificationService?.showDeviceVerificationNotification(
            deviceName: "iPhone Test Device"
        )
        os_log("Test device verification notification sent", log: logger, type: .info)
        showAlert(title: "Test Sent", message: "Device verification notification sent")
    }
    
    @objc private func clearAllNotifications() {
        autonomousNotificationService?.cancelAllNotifications()
        os_log("All notifications cleared", log: logger, type: .info)
        showAlert(title: "Cleared", message: "All notifications cleared")
    }
    
    @objc private func checkPermissions() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                let status = settings.authorizationStatus
                let statusString = self.getPermissionStatusString(status)
                
                os_log("Notification permission status: %@", log: self.logger, type: .info, statusString)
                self.showAlert(title: "Permission Status", message: "Notifications: \(statusString)")
            }
        }
    }
    
    @objc private func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound, .criticalAlert]) { granted, error in
            DispatchQueue.main.async {
                if let error = error {
                    os_log("Permission request error: %@", log: self.logger, type: .error, error.localizedDescription)
                    self.showAlert(title: "Error", message: "Permission request failed: \(error.localizedDescription)")
                } else {
                    let message = granted ? "Permissions granted" : "Permissions denied"
                    os_log("Permission request result: %@", log: self.logger, type: .info, message)
                    self.showAlert(title: "Permission Result", message: message)
                }
            }
        }
    }
    
    private func getPermissionStatusString(_ status: UNAuthorizationStatus) -> String {
        switch status {
        case .notDetermined:
            return "Not Determined"
        case .denied:
            return "Denied"
        case .authorized:
            return "Authorized"
        case .provisional:
            return "Provisional"
        case .ephemeral:
            return "Ephemeral"
        @unknown default:
            return "Unknown"
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
