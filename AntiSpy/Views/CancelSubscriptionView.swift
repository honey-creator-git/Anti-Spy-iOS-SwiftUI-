//
//  CancelSubscriptionView.swift
//  AntiSpy
//
//  Created by Rome on 4/18/23.
//

import Foundation
import SwiftUI

struct CancelSubscriptionView: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack() {
            VStack() {
                ZStack() {
                    VStack(spacing: 10.0) {
                        Text("Cancel Subscription")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        
                        Text("You want to cancel your subscription ?")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        
                        Button(action: {
                            
                        }) {
                            HStack() {
                                Text("Yes")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 15)
                            }
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color("GrayColor"), Color("GrayColor")]), startPoint: .top, endPoint: .bottom)
                            )
                            .cornerRadius(50)
                            .padding(.top, 10)
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height - 100, alignment: .center)
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .center)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("StartPageBackgroundColor"), Color("StartPageBackgroundColor")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct CancelSubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CancelSubscriptionView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("Cancel Subscription")
        
        CancelSubscriptionView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("Cancel Subscription (2)")
        
        CancelSubscriptionView(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("Cancel Subscription (3)")
    }
}
