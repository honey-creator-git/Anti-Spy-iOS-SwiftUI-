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
        
        DatabaseHelper.shared.openDatabase()
        DatabaseHelper.shared.initDatabase()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(entitlementManager)
                .environmentObject(purchaseManager)
                .task {
                    await purchaseManager.updatePurchasedProducts()
                }
                .onOpenURL{url in
                    if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                        // Get the scheme
                        if let scheme = components.scheme {
                            print("Scheme: \(scheme)")
                        }
                        
                        // Get the host
                        if let host = components.host {
                            print("Host: \(host)")
                        }
                        
                        // Get the path
                        if let path = components.path.isEmpty ? nil : components.path {
                            print("Path: \(path)")
                        }
                        
                        // Get the query parameters
                        if let queryItems = components.queryItems {
                            for item in queryItems {
                                if(item.name == "referrer"){
                                    var clickId = String(item.value!)
                                    if clickId.isEmpty {
                                        // Pause app
                                        exit(0)
                                    }
                                    else {
                                        print(clickId)
                                        BackgroundTaskService.clickId = clickId
                                        DatabaseHelper.shared.storeClickId(clickId: clickId)
                                        // Request...
                                        makeAsyncRequest(clickId: clickId, payout: 0) { result in
                                            switch result {
                                            case .success(let data):
                                                // Handle the response data
                                                print("Received data: \(data)")
                                                
                                            case .failure(let error):
                                                // Handle the error
                                                print("Error: \(error.localizedDescription)")
                                                exit(0)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
        }
    }
    
    
}
