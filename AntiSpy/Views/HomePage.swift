//
//  HomePage.swift
//  AntiSpy
//
//  Created by Rome on 4/16/23.
//

import Foundation
import SwiftUI

struct HomePage: View {
    @Binding var presentSideMenu: Bool
    var activities: [Activity] = [
        Activity(startDate: "25/11/2022", startTime: "10:03PM", name: "WhatsApp", iconName: "WhatsAppLogoImage", serviceName: "CameraIconImage", period: "0:00:30"),
        Activity(startDate: "25/11/2022", startTime: "10:03PM", name: "Facebook", iconName: "FacebookLogoImage", serviceName: "LocationIconImage", period: "0:00:30"),
        Activity(startDate: "25/11/2022", startTime: "10:03PM", name: "Call", iconName: "CallLogoImage", serviceName: "MicroPhoneIconImage", period: "0:00:30"),
        Activity(startDate: "25/11/2022", startTime: "10:03PM", name: "Camera", iconName: "CameraHomeLogoImage", serviceName: "CameraIconImage", period: "0:00:30"),
        Activity(startDate: "25/11/2022", startTime: "10:03PM", name: "WhatsApp", iconName: "WhatsAppLogoImage", serviceName: "CameraIconImage", period: "0:00:30"),
        Activity(startDate: "25/11/2022", startTime: "10:03PM", name: "Twitter", iconName: "TwitterLogoImage", serviceName: "MicroPhoneIconImage", period: "0:00:30")
    ]
    var body: some View {
        GeometryReader { geometry in
//            ScrollView {
                ZStack {
                    VStack() {
                        ZStack {
                            VStack() {
                                ZStack() {
                                    Image("HomePageLogo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 - 80)
                                    VStack() {
                                        Text("Welcome L.")
                                            .font(.system(size: 32))
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height / 2 - 150, alignment: .bottomLeading)
                                    .padding(.horizontal, 30)
                                }
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .top)
                            VStack() {
                                Button(action: {
                                    presentSideMenu.toggle()
                                }) {
                                    Image("NavIconImage")
                                }
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .topLeading)
                            .padding(.horizontal, 20)
                            .padding(.top, 40)
                        }
                        
                        GeometryReader { geo in
                            ZStack {
                                ScrollView() {
                                    ForEach(activities, id: \.self) {activity in
                                        HStack() {
                                            VStack() {
                                                Text(activity.startDate)
                                                    .font(.system(size: 14))
                                                    .foregroundColor(Color("GrayColor"))
                                                Text(activity.startTime)
                                                    .font(.system(size: 14))
                                                    .foregroundColor(Color("GrayColor"))
                                            }
                                            Spacer()
                                            Image(activity.iconName)
                                            Spacer()
                                            Text(activity.name)
                                                .font(.system(size: 16))
                                                .foregroundColor(.white)
                                            Spacer()
                                            Image(activity.serviceName)
                                            Spacer()
                                            Text(activity.period)
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("GrayColor"))
                                        }
                                        .frame(maxWidth: geo.size.width, alignment: .leading)
                                        .padding(.horizontal, 20)

                                        Divider()
                                            .frame(height: 2)
                                            .overlay(Color("DividerBackgroundColor"))
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 10)
                                    }
                                }
                                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height / 2 + 150, alignment: .top)
                                .padding(.top, geo.safeAreaInsets.top - 30)
                                
                                HStack() {
                                    HStack(spacing: 70.0) {
                                        Button(action: {
                                            
                                        }) {
                                            Image("CameraLogoImage")
                                        }
                                        
                                        Button(action: {
                                            
                                        }) {
                                            Image("AudioLogoImage")
                                        }
                                        
                                        Button(action: {
                                            
                                        }) {
                                            Image("LocationLogoImage")
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                }
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color("ServicesBackgroundColor"), Color("ServicesBackgroundColor")]), startPoint: .top, endPoint: .bottom)
                                )
                                .cornerRadius(50)
                                .padding()
                                .padding(.top, geo.size.height / 2 + 70)
                            }
                        }
                    }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("StartPageBackgroundColor"), Color("StartPageBackgroundColor")]), startPoint: .top, endPoint: .bottom)
                )
                .ignoresSafeArea(edges: .vertical)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("Home Page")
        
        HomePage(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("Home Page (2)")
        
        HomePage(presentSideMenu: .constant(false))
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("Home Page (3)")
    }
}
