//
//  SettingsView.swift
//  AntiSpy
//
//  Created by Rome on 4/18/23.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack() {
            Button(action: {
                self.presentSideMenu.toggle()
            }) {
                Text("Settings View")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("Settings View")
        
        SettingsView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("Settings View(2)")
        
        SettingsView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("Settings View(3)")
    }
}
