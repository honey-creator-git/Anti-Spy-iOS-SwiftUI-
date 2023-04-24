//
//  LocationHelper.swift
//  MyApplication
//
//  Created by Rome on 4/13/23.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI

func getAppsUsingLocation() -> [Activity] {
    var appsUsingLocation = [Activity]()
    
    let locationManager = CLLocationManager()
    locationManager.requestWhenInUseAuthorization()
  
    for app in Bundle.allBundles {

        let hasLocationAlwaysUsageDescription = app.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil
        let hasLocationWhenInUseUsageDescription = app.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") != nil
        
        if hasLocationAlwaysUsageDescription || hasLocationWhenInUseUsageDescription {
            let appName = app.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
            
            let iconName = app.object(forInfoDictionaryKey: "CFBundleIconFile") as? String ?? ""
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let dateString = formatter.string(from: currentDate)
            formatter.dateFormat = "HH:mm:ss"
            let timeString = formatter.string(from: currentDate)
            let slug = appName+"_location"
            appsUsingLocation.append(
                Activity(startDate: dateString, startTime: timeString, name: appName, iconName: iconName, serviceName: "LocationIconImage", period: "", slug: slug)
            )
        }

    }
    
    return appsUsingLocation
}
