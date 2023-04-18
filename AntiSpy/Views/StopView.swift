//
//  StopView.swift
//  AntiSpy
//
//  Created by Rome on 4/16/23.
//

import Foundation
import SwiftUI

struct StopView: View {
    @State var deleteActity = true
    @State var vibration = true
    @State var notification = false
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack {
                    VStack() {
                        Text("Camera")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        
                        Button(action: {
                            
                        }) {
                            HStack() {
                                Image("StopLogoImage")
                            }
                            .padding(.vertical, 30)
                        }
                        
                        VStack(alignment: .leading, spacing: 20.0) {
                            Text("History Settings")
                                .font(.system(size: 24))
                                .foregroundColor(Color("GrayColor"))
                            
                            HStack() {
                                Toggle(isOn: $deleteActity, label: {
                                    HStack() {
                                        Image("DeleteActivityLogoImage")
                                        Text("Delete activity after 2 days")
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                    }
                                })
                                .toggleStyle(SwitchToggleStyle(tint: Color("ToggleButtonColor")))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        
                        Divider()
                            .frame(height: 2)
                            .overlay(Color("DividerBackgroundColor"))
                            .padding()
                        
                        VStack(alignment: .leading, spacing: 20.0) {
                            Text("Notification Settings")
                                .font(.system(size: 24))
                                .foregroundColor(Color("GrayColor"))
                            
                            HStack() {
                                Toggle(isOn: $vibration, label: {
                                    HStack() {
                                        Image("VibrationLogoImage")
                                        Text("Vibrate when is being used")
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                    }
                                })
                                .toggleStyle(SwitchToggleStyle(tint: Color("ToggleButtonColor")))
                            }
                            
                            HStack() {
                                Toggle(isOn: $notification, label: {
                                    HStack() {
                                        Image("NotificationLogoImage")
                                        Text("PushNotification")
                                            .font(.system(size: 18))
                                            .foregroundColor(.white)
                                    }
                                })
                                .toggleStyle(SwitchToggleStyle(tint: Color("ToggleButtonColor")))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        
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
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, 70)
                    .padding(.bottom, 40)
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("StartPageBackgroundColor"), Color("StartPageBackgroundColor")]), startPoint: .top, endPoint: .bottom)
            )
            .ignoresSafeArea(edges: .vertical)
        }
    }
}

struct StopView_Previews: PreviewProvider {
    static var previews: some View {
        StopView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("Stop View")
        
        StopView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("Stop View (2)")
        
        StopView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("Stop View(3)")
    }
}
