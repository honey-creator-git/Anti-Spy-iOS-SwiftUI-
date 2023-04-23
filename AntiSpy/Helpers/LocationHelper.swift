//
//  LocationHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import CoreLocation
import UIKit

func getAppsUsingLocation() -> [Activity] {
    var appsUsingLocation = [Activity]()
    
    let locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    
    if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
        for app in Bundle.allBundles {
            let hasLocationAlwaysUsageDescription = app.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil
            let hasLocationWhenInUseUsageDescription = app.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") != nil
            
            if hasLocationAlwaysUsageDescription || hasLocationWhenInUseUsageDescription {
                let appName = app.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? ""
               
                let iconName = app.object(forInfoDictionaryKey: "CFBundleIconFile") as? String ?? ""
                let currentDate = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                let dateString = formatter.string(from: currentDate)
                formatter.dateFormat = "h:mm:ss a"
                let timeString = formatter.string(from: currentDate)
                appsUsingLocation.append(
                Activity(startDate: dateString, startTime: timeString, name: appName, iconName: iconName, serviceName: "MicroPhoneIconImage", period: "")
                )
            }
        }
    }
    
    return appsUsingLocation
}
