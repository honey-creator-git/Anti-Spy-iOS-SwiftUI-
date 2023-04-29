//
//  ContentView.swift
//  AntiSpy
//
//  Created by Rome on 4/12/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @EnvironmentObject
    private var entitlementManager: EntitlementManager
    
    @EnvironmentObject
    private var purchaseManager: PurchaseManager
    var body: some View {
        SubscriptionView()
            .task {
                do {
                    try await purchaseManager.loadProducts()
                } catch {
                    print(error)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
