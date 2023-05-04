//
//  AntiSpyApp.swift
//  AntiSpy
//
//  Created by Rome on 4/12/23.
//

import SwiftUI

@main
struct AntiSpyApp: App {
    @StateObject
    private var entitlementManager: EntitlementManager
    
    @StateObject
    private var purchaseManager: PurchaseManager
    
    init() {
        let entitlementManager = EntitlementManager()
        let purchaseManager = PurchaseManager(entitlementManager: entitlementManager)

        self._entitlementManager = StateObject(wrappedValue: entitlementManager)
        self._purchaseManager = StateObject(wrappedValue: purchaseManager)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(entitlementManager)
                .environmentObject(purchaseManager)
                .task {
                    await purchaseManager.updatePurchasedProducts()
                    DatabaseHelper.shared.openDatabase()
                    DatabaseHelper.shared.initDatabase()
                }
        }
    }
    
    
}
