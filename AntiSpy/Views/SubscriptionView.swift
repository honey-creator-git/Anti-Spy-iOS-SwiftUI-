//
//  SubscriptionView.swift
//  AntiSpy
//
//  Created by Rome on 4/12/23.
//

import Foundation
import SwiftUI

struct SubscriptionView: View {
    @State var paymentSucessTab: Int? = nil
    
    @EnvironmentObject
    private var entitlementManager: EntitlementManager
    
    @EnvironmentObject
    private var purchaseManager: PurchaseManager
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    ZStack {
                        VStack() {
                                Text("Subscription")
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)

                                Image("SubscriptionLogo")

                                Text("Pick a plan")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                    .padding(.top, 20)

                                ZStack() {
                                    HStack(spacing: 30.0) {
                                        ForEach(purchaseManager.products) { (product) in
                                            Button(action:{
                                                Task{
                                                    do {
                                                        try await purchaseManager.purchase(product)
                                                    } catch {
                                                        print(error)
                                                    }
                                                }
                                            }) {
                                                
                                                VStack(spacing: 10.0) {
                                                    Text("\(product.displayName)")
                                                        .font(.system(size: 28))
                                                        .foregroundColor(.white)
                                                        .multilineTextAlignment(.center)

                                                    Text("\(product.displayPrice)")
                                                        .font(.system(size: 16))
                                                        .foregroundColor(.white)
                                                }
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 20)
                                                .frame(maxWidth: UIScreen.main.bounds.width / 2 - 50, maxHeight: UIScreen.main.bounds.width / 2 - 50)
                                                .background(
                                                    LinearGradient(gradient: Gradient(colors: [Color("SubscriptionPlanBackgroundColor1"), Color("SubscriptionPlanBackgroundColor2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                                )
                                                .cornerRadius(20)
                                                .shadow(color: Color("SubscriptionPlanBackgroundColor1"), radius: 20, x: 0, y: 0)
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 20)

                                    HStack() {
                                        HStack() {
                                            Text("SAVE $19.99")
                                                .font(.system(size: 14))
                                                .foregroundColor(.white)
                                        }
                                        .frame(maxWidth: UIScreen.main.bounds.width / 2 - 80, maxHeight: 30)
                                        .background(Color("SaveBackgroundColor"))
                                        .cornerRadius(30)
                                    }
                                    .frame(width: UIScreen.main.bounds.width - 105, height: UIScreen.main.bounds.width / 2 - 30, alignment: .topTrailing)

                                    HStack() {
                                        HStack() {
                                            Text("*$8.33/month")
                                                .font(.system(size: 14))
                                                .foregroundColor(Color("GrayColor"))
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width - 130, height: UIScreen.main.bounds.width / 2, alignment: .bottomTrailing)
                                }

                                VStack(spacing: 10.0) {
                                    HStack(spacing: 20.0) {
                                        Image("SubscriptionCheckIcon")

                                        Text("We block large companies from blocking you")
                                            .font(.system(size: 16))
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: UIScreen.main.bounds.width - 100, maxHeight: 40, alignment: .topLeading)

                                    HStack(spacing: 20.0) {
                                        Image("SubscriptionCheckIcon")

                                        Text("We detect espionage and business Intelligence")
                                            .font(.system(size: 16))
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: UIScreen.main.bounds.width - 100, maxHeight: 40, alignment: .topLeading)

                                    HStack(spacing: 20.0) {
                                        Image("SubscriptionCheckIcon")

                                        Text("We prevent 3rd party to spy on you")
                                            .font(.system(size: 16))
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: UIScreen.main.bounds.width - 100, maxHeight: 40, alignment: .topLeading)
                                }
                                .padding(.top, 10)
                                .frame(maxWidth: UIScreen.main.bounds.width - 80, alignment: .center)
                            if purchaseManager.hasUnlockedPro {
                                NavigationLink(destination: PaymentSuccessView().navigationBarBackButtonHidden(true), tag: 1, selection: $paymentSucessTab) {
                                    
                                    Button(action: {
                                        self.paymentSucessTab = 1
                                    }) {
                                        HStack() {
                                            VStack() {
                                                
                                                Text("Continue")
                                                    .font(.system(size: 16))
                                                    .foregroundColor(.white)
                                            }
                                            .padding(.vertical, 15)
                                            .frame(maxWidth: UIScreen.main.bounds.width - 50)
                                            .background(Color("SaveBackgroundColor"))
                                            .cornerRadius(50)
                                        }
                                        .padding(.top, 30)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 70)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("SubscriptionBackgroundColor"), Color("SubscriptionBackgroundColor")]), startPoint: .top, endPoint: .bottom)
                )
                .ignoresSafeArea(edges: .vertical)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
        
        SubscriptionView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
        
        SubscriptionView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
            .previewDisplayName("iPhone 14 Pro")
    }
}
