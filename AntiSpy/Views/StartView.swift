//
//  StartView.swift
//  AntiSpy
//
//  Created by Rome on 4/14/23.
//

import Foundation
import SwiftUI
struct StartView: View{
    @State private var appsRunningWithLocation: [String] = []
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var mainTab: Int? = nil
    @State var deleteActity = true
    @State var vibration = true
    @State var notification = false
    @State var detectActivity: Int = 0
    
    @State var isPhoto = false
    @State var isMicrophone = false
    @State var isLocation = false
    
    init() {
        self.detectActivity = 0
        print("Initialization!")
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("BackButtonIconImage")
                    }
                }
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height,  alignment: .topLeading)
                .padding(.horizontal, 20)
                .zIndex(1)
                
                ScrollView {
                    ZStack {
                        VStack() {
                            Text("Camera")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                            
                            NavigationLink(destination: detectActivity == 2 ? MainTabView() : nil, tag: 4, selection: $mainTab) {
                                Button(action: {
                                    if(detectActivity == 1) {
                                        BackgroundTaskService.shared.cancelBackgroundTask()
                                        self.mainTab = 4
                                        self.detectActivity = 2
                                    } else if(detectActivity == 0) {
                                        BackgroundTaskService.shared.scheduleBackgroundTask()
                                        self.detectActivity = 1
                                    }
                                }) {
                                    if(detectActivity == 1) {
                                        HStack() {
                                            Image("StopLogoImage")
                                        }
                                        .padding(.vertical, 30)
                                    } else {
                                        HStack() {
                                            Image("StartLogoImage")
                                        }
                                        .padding(.vertical, 30)
                                    }
                                }
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
                                        self.isPhoto = !self.isPhoto
                                        BackgroundTaskService.isPhoto = self.isPhoto
                                    }) {
                                        Image("CameraIconImage")
                                    }
                                    
                                    Button(action: {
                                        self.isMicrophone = !self.isMicrophone
                                        BackgroundTaskService.isMicrophone=self.isMicrophone
                                    }) {
                                        Image("AudioLogoImage")
                                    }
                                    
                                    Button(action: {
                                        self.isLocation = !self.isLocation
                                        BackgroundTaskService.isLocation=self.isLocation
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
                    .frame(alignment: .top)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("StartPageBackgroundColor"), Color("StartPageBackgroundColor")]), startPoint: .top, endPoint: .bottom)
                )
                .ignoresSafeArea(edges: .vertical)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("StartView 1")
        
        StartView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("StartView 2")
        
        StartView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("StartView 3")
    }
}
