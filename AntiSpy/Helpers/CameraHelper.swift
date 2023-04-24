//
//  CameraHelper.swift
//  AntiSpy
//
//  Created by Rome on 4/23/23.
//

import Foundation
import AVFoundation

func getAppsUsingCamera() -> [Activity] {
    var appsUsingCamera = [Activity]()
    
    let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInTelephotoCamera, .builtInUltraWideCamera], mediaType: .video, position: .unspecified)
    
    for device in discoverySession.devices {
        if let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String,
            AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            // Check if the device has an authorized status
            var iconName:String = ""
            if let iconsDict = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
               let primaryIconsDict = iconsDict["CFBundlePrimaryIcon"] as? [String: Any],
               let iconFiles = primaryIconsDict["CFBundleIconFiles"] as? [String],
               let lastIcon = iconFiles.last {
                    iconName=lastIcon
//                   let iconImage = UIImage(named: lastIcon)
                   // do something with the icon image...
            }
            let currentDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let dateString = formatter.string(from: currentDate)
            formatter.dateFormat = "HH:mm:ss"
            let timeString = formatter.string(from: currentDate)
            let slug = appName+"_camera"
            appsUsingCamera.append(
                Activity(startDate: dateString, startTime: timeString, name: appName, iconName: iconName, serviceName: "CameraWhiteIconImage", period: "", slug: slug)
            )
        }
    }
    
    return appsUsingCamera
}
