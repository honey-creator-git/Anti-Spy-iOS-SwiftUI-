//
//  SideMenu.swift
//  AntiSpy
//
//  Created by Rome on 4/17/23.
//

import Foundation

enum SideMenuRowType: Int, CaseIterable {
    case settings = 0
    case share
    case rate
    case privacy
    case cancelSubscription
    
    var title: String {
        switch self {
        case .settings:
            return "Settings"
        case .share:
            return "Share"
        case .rate:
            return "Activity"
        case .privacy:
            return "Privacy"
        case .cancelSubscription:
            return "CancelSubscription"
        }
    }
    
    var iconName: String {
        switch self {
        case .settings:
            return "SettingsIconImage"
        case .share:
            return "ShareIconImage"
        case .rate:
            return "RateIconImage"
        case .privacy:
            return "PrivacyIconImage"
        case .cancelSubscription:
            return "CancelSubscriptionIconImage"
        }
    }
}
