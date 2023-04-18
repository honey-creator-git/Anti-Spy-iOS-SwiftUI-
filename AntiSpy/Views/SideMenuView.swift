//
//  SideMenuView.swift
//  AntiSpy
//
//  Created by Rome on 4/17/23.
//

import Foundation
import SwiftUI

struct SideMenuView: View {
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            ZStack {
                VStack() {	
                    Button(action: {
                        
                    }) {
                        Image("MenuCloseIconImage")
                    }
                }
                .frame(maxWidth: 270, alignment: .leading)
                .padding(.horizontal, 20)
                
                VStack() {
                    Image("AppLogoImage")
                }
                
                VStack(alignment: .leading, spacing: 0) {
//                    ForEach(SideMenuRowType.allCases, if: \.self) { row in
//
//                    }
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(Color("StartPageBackgroundColor"))
            }
            
            Spacer()
        }
        .frame(maxWidth: 270, maxHeight: UIScreen.main.bounds.height, alignment: .top)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("StartPageBackgroundColor"), Color("StartPageBackgroundColor")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(selectedSideMenuTab: .constant(0), presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("SideMenuView")
        SideMenuView(selectedSideMenuTab: .constant(0), presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("SideMenuView (2)")
        SideMenuView(selectedSideMenuTab: .constant(0), presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("SideMenuView (3)")
    }
}
