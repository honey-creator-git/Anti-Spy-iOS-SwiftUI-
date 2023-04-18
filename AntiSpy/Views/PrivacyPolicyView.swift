//
//  PrivacyPolicyView.swift
//  AntiSpy
//
//  Created by Rome on 4/18/23.
//

import Foundation
import SwiftUI

struct PrivacyPolicyView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack() {
            Button(action: {
                self.presentSideMenu.toggle()
            }) {
                Text("Privacy Policy")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
            }
        }
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("Privacy Policy")
        
        PrivacyPolicyView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("Privacy Policy (2)")
        
        PrivacyPolicyView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("Privacy Policy (3)")
    }
}
