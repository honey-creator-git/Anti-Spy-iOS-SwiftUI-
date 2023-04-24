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
    
    static var isCamera = true
    static var isMicrophone = false
    static var isLocation = false
    static var activities: [Activity] = []
    static var enNotification = false
    static var enVibration = false
    static var enFilter = false
    var timer: Timer?
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    
    func scheduleBackgroundTask(serviceType: String) {
        print("Camera => ", BackgroundTaskService.isCamera)
        print("Location => ", BackgroundTaskService.isLocation)
        print("Microphone => ", BackgroundTaskService.isMicrophone)

        // Register the background task with the system, and start a new task
        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "BackgroundTask") {
            // Handle the expiration of the background task.
//            self.cancelBackgroundTask(serviceType: serviceType)
        }

       // Schedule the task to run every 30 seconds (adjust as needed)
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in

            // Handle your background task logic here
            var apps:[Activity] = []
            if(BackgroundTaskService.isLocation) {
                apps = apps + getAppsUsingLocation()
                print("Background Task is running for location.")
            }
            
            if(BackgroundTaskService.isCamera) {
                apps = apps + getAppsUsingCamera()
                print("Background Task is running for camera.")
            }
            
            if(BackgroundTaskService.isMicrophone) {
                apps = apps + getAppsUsingMicrophone()
                print("Backgound Task is running for microphone.")
            }
            
            self.processActivity(activities_: apps)
            
            if(BackgroundTaskService.enFilter == true){
                self.filterActivity()
                print("Delete Activities after 2 days has been enabled.")
            }
        }
        RunLoop.current.add(timer!, forMode: .default)
        
        // Cancel any previous background task
//        cancelBackgroundTask(serviceType: serviceType)
    }

    func cancelBackgroundTask(serviceType: String) {
        timer?.invalidate()
        timer=nil
        if backgroundTask != .invalid {
            DispatchQueue.main.async {
                UIApplication.shared.endBackgroundTask(self.backgroundTask)
            }
            backgroundTask = .invalid
            print("Background task stopped")
            switch(serviceType) {
                case "camera":
                    BackgroundTaskService.isCamera = false
                    return
                case "microphone":
                    BackgroundTaskService.isMicrophone = false
                    return
                case "location":
                    BackgroundTaskService.isLocation = false
                    return
                default:
                    return
            }
        }
    }
    
    func filterActivity(){
        let filtered = BackgroundTaskService.activities.filter{
            getDurationByDate(from: $0.startDate+" "+$0.startTime, duration: $0.period)
        }
        BackgroundTaskService.activities = filtered
    }
    
    func getDurationByDate(from: String, duration: String) -> Bool{
        let formatter = DateFormatter()
        let calendar = Calendar.current
        formatter.dateFormat = "dd/MM h"
        var durationComponents = DateComponents()
        if let durationDate = formatter.date(from: duration) {
            durationComponents = calendar.dateComponents([.day, .hour], from: durationDate)
        }
        
        let currentDate = Date()
        let startTime = calendar.date(byAdding: durationComponents, to: formatter.date(from: from)!)
        
        let components = calendar.dateComponents([.month, .day], from: startTime!, to: currentDate)
        
        let durationMonth = components.month as Int? ?? 0
        let durationDay = components.day as Int? ?? 0
        
        let isOld = durationDay + durationMonth < 2
        return isOld
    }
    
    func processActivity(activities_: [Activity]){
        activities_.forEach {
            activity in
            if var app = BackgroundTaskService.activities.first(where:{$0.slug == activity.slug}){
                
                /*
                 Duration
                */
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
                
                let startTime = formatter.date(from: app.startDate+" "+app.startTime)!
                let endTime = formatter.date(from: activity.startDate+" "+activity.startTime)!
                let calendar = Calendar.current
                let components = calendar.dateComponents([.hour, .minute], from: startTime, to: endTime)
                let duration = String(format: "%02d:%02d:%02d", components.hour!, components.minute!)
                
                if let idx = BackgroundTaskService.activities.firstIndex(of: app) {
                    app.period = duration
                    BackgroundTaskService.activities[idx] = app
                }
                
            } else {
                BackgroundTaskService.activities.append(activity)
                if(BackgroundTaskService.enVibration == true)
                {
                    makeVibration()
                    print("Vibration has been enabled.")
                }
                if(BackgroundTaskService.enNotification == true)
                {
                    makeNotification(title: "Location Alert", body: activity.name+" accessed the location")
                    print("Notification has been enabled.")
                }
            }
        }
    }
    
}
