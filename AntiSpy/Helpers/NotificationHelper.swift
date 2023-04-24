//
//  NotificationHelper.swift
//  AntiSpy
//
//  Created by Rome on 4/23/23.
//

import Foundation
import UIKit
import UserNotifications

func makeNotification(title: String, body: String) {
    // Request permission to display notifications
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if let error = error {
            // Handle the error
            print("Error requesting authorization for notifications: \(error.localizedDescription)")
        }
        
        if granted {
            // Register the app for remote notifications
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

    // Create a notification content object
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default

    // Create a trigger for the notification (in this case, trigger it after 5 seconds)
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

    // Create a request for the notification
    let request = UNNotificationRequest(identifier: "my_notification", content: content, trigger: trigger)

    // Add the request to the notification center
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            // Handle the error
            print("Error adding notification request: \(error.localizedDescription)")
        } else {
            // Notification was successfully scheduled
            print("Notification scheduled!")
        }
    }
}
