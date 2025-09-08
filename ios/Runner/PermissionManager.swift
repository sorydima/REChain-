import Foundation
import UIKit
import UserNotifications
import AVFoundation
import Photos
import Contacts
import EventKit
import CoreLocation
import os.log

class PermissionManager: NSObject {
    private let logger = OSLog(subsystem: "com.rechain.dapp", category: "PermissionManager")
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    // MARK: - Notification Permissions
    func requestNotificationPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound, .criticalAlert]) { granted, error in
            if let error = error {
                os_log("Notification permission error: %@", log: self.logger, type: .error, error.localizedDescription)
            }
            os_log("Notification permission granted: %@", log: self.logger, type: .info, String(granted))
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    func checkNotificationPermission(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            let granted = settings.authorizationStatus == .authorized
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    // MARK: - Camera Permissions
    func requestCameraPermission(completion: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            os_log("Camera permission granted: %@", log: self.logger, type: .info, String(granted))
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    func checkCameraPermission() -> Bool {
        return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    }
    
    // MARK: - Microphone Permissions
    func requestMicrophonePermission(completion: @escaping (Bool) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            os_log("Microphone permission granted: %@", log: self.logger, type: .info, String(granted))
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    func checkMicrophonePermission() -> Bool {
        return AVAudioSession.sharedInstance().recordPermission == .granted
    }
    
    // MARK: - Photo Library Permissions
    func requestPhotoLibraryPermission(completion: @escaping (Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            let granted = status == .authorized
            os_log("Photo library permission granted: %@", log: self.logger, type: .info, String(granted))
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    func checkPhotoLibraryPermission() -> Bool {
        return PHPhotoLibrary.authorizationStatus() == .authorized
    }
    
    // MARK: - Contacts Permissions
    func requestContactsPermission(completion: @escaping (Bool) -> Void) {
        CNContactStore().requestAccess(for: .contacts) { granted, error in
            if let error = error {
                os_log("Contacts permission error: %@", log: self.logger, type: .error, error.localizedDescription)
            }
            os_log("Contacts permission granted: %@", log: self.logger, type: .info, String(granted))
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    func checkContactsPermission() -> Bool {
        return CNContactStore.authorizationStatus(for: .contacts) == .authorized
    }
    
    // MARK: - Calendar Permissions
    func requestCalendarPermission(completion: @escaping (Bool) -> Void) {
        EKEventStore().requestAccess(to: .event) { granted, error in
            if let error = error {
                os_log("Calendar permission error: %@", log: self.logger, type: .error, error.localizedDescription)
            }
            os_log("Calendar permission granted: %@", log: self.logger, type: .info, String(granted))
            DispatchQueue.main.async {
                completion(granted)
            }
        }
    }
    
    func checkCalendarPermission() -> Bool {
        return EKEventStore.authorizationStatus(for: .event) == .authorized
    }
    
    // MARK: - Location Permissions
    func requestLocationPermission(completion: @escaping (Bool) -> Void) {
        guard let locationManager = locationManager else {
            completion(false)
            return
        }
        
        locationManager.requestWhenInUseAuthorization()
        
        // Check permission after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let granted = self.checkLocationPermission()
            completion(granted)
        }
    }
    
    func checkLocationPermission() -> Bool {
        guard CLLocationManager.locationServicesEnabled() else { return false }
        
        let status = CLLocationManager.authorizationStatus()
        return status == .authorizedWhenInUse || status == .authorizedAlways
    }
    
    // MARK: - All Permissions Check
    func checkAllRequiredPermissions() -> [String: Bool] {
        return [
            "notifications": false, // Async check required
            "camera": checkCameraPermission(),
            "microphone": checkMicrophonePermission(),
            "photoLibrary": checkPhotoLibraryPermission(),
            "contacts": checkContactsPermission(),
            "calendar": checkCalendarPermission(),
            "location": checkLocationPermission()
        ]
    }
    
    func requestAllRequiredPermissions(completion: @escaping ([String: Bool]) -> Void) {
        var results: [String: Bool] = [:]
        let group = DispatchGroup()
        
        // Request notifications
        group.enter()
        requestNotificationPermission { granted in
            results["notifications"] = granted
            group.leave()
        }
        
        // Request camera
        group.enter()
        requestCameraPermission { granted in
            results["camera"] = granted
            group.leave()
        }
        
        // Request microphone
        group.enter()
        requestMicrophonePermission { granted in
            results["microphone"] = granted
            group.leave()
        }
        
        // Request photo library
        group.enter()
        requestPhotoLibraryPermission { granted in
            results["photoLibrary"] = granted
            group.leave()
        }
        
        // Request contacts
        group.enter()
        requestContactsPermission { granted in
            results["contacts"] = granted
            group.leave()
        }
        
        // Request calendar
        group.enter()
        requestCalendarPermission { granted in
            results["calendar"] = granted
            group.leave()
        }
        
        // Request location
        group.enter()
        requestLocationPermission { granted in
            results["location"] = granted
            group.leave()
        }
        
        group.notify(queue: .main) {
            os_log("All permissions requested. Results: %@", log: self.logger, type: .info, String(describing: results))
            completion(results)
        }
    }
    
    func openAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl)
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension PermissionManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        os_log("Location authorization changed: %@", log: logger, type: .info, String(describing: status))
    }
}
