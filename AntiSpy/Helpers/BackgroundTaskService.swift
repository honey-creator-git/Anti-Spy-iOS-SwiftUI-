//
//  BackgroundTaskService.swift
//  AntiSpy
//
//  Created by Rome on 4/23/23.
//
import Foundation

import UIKit

class BackgroundTaskService {
    
    static let shared = BackgroundTaskService()
    
    static var isCamera = false
    static var isMicrophone = false
    static var isLocation = false
    static var activities: [Activity] = []
    static var countUsingPhoto = 0
    static var countUsingMicrophone = 0
    static var countUsingLocation = 0
    var timer: Timer?
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    
    func scheduleBackgroundTask() {
        // Cancel any previous background task
        cancelBackgroundTask()

        // Register the background task with the system, and start a new task
        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "BackgroundTask") {
            self.cancelBackgroundTask()
        }

       // Schedule the task to run every 30 seconds (adjust as needed)
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in

            // Handle your background task logic here
            if(BackgroundTaskService.isLocation) {
              print(getAppsUsingLocation())
            }
            print("Background task running for location!")
        }
        RunLoop.current.add(timer!, forMode: .default)
    }

    func cancelBackgroundTask() {
        timer?.invalidate()
        timer=nil
        if backgroundTask != .invalid {
            UIApplication.shared.endBackgroundTask(backgroundTask)
            backgroundTask = .invalid
            print("Background task stopped")
        }
    }
    
}
