//
//  Checkout.swift
//  NikeRebuild
//
//  Created by Thom Pheijffer on 11/05/2020.
//  Copyright © 2020 Thom Pheijffer. All rights reserved.
//

import SwiftUI

struct Checkout: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var index = 3
    
    var rows = ["Credit/Debit card", "Netbanking", "Cashon delivery", "Phonepe/Google pay", "Paytm/wallets"]
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9607003331, green: 0.9608381391, blue: 0.9606701732, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: { self.mode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                    }
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Payment method")
                        .font(.system(size: 22, weight: .heavy, design: .rounded))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Spacer()
                        Text("VISA")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .heavy, design: .rounded))
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("**** **** **** 4567")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .heavy, design: .rounded))
                        
                        Spacer()
                    }
                    .offset(y: -15)
                    
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("CARD HOLDER")
                            .foregroundColor(Color(#colorLiteral(red: 0.3450431228, green: 0.4196364284, blue: 0.5450284481, alpha: 1)))
                            .font(.system(size: 11, weight: .heavy, design: .rounded))
                            
                            Text("ELAYAMANIK")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .heavy, design: .rounded))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("EXPIRES")
                            .foregroundColor(Color(#colorLiteral(red: 0.3450431228, green: 0.4196364284, blue: 0.5450284481, alpha: 1)))
                            .font(.system(size: 11, weight: .heavy, design: .rounded))
                            
                            Text("3 MARCH")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .heavy, design: .rounded))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("CVV")
                            .foregroundColor(Color(#colorLiteral(red: 0.3450431228, green: 0.4196364284, blue: 0.5450284481, alpha: 1)))
                            .font(.system(size: 11, weight: .heavy, design: .rounded))
                            
                            Text("907")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .heavy, design: .rounded))
                        }
                    }
                }
                .frame(height: 160)
                .padding()
                .background(Color(#colorLiteral(red: 0.1372042596, green: 0.2353151143, blue: 0.4038677216, alpha: 1)))
                .cornerRadius(8)
                .shadow(color: Color(#colorLiteral(red: 0.1372042596, green: 0.2353151143, blue: 0.4038677216, alpha: 1)).opacity(0.2), radius: 8, x: 0, y: 30)
                .padding()
                
                Button(action: {}) {
                    HStack(spacing: 2) {
                        Text("+")
                            .offset(y: -1)
                        Text("ADD NEW CARD")
                            .font(.system(size: 12, weight: .heavy, design: .rounded))
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.3411764706, green: 0.5020022392, blue: 0.850874424, alpha: 1)))
                    .cornerRadius(8)
                    .padding()
                }
                .padding(.top)
                
                PriceDetailsView()
                                    
                Spacer()
                
                Button(action: {}) {
                    Text("PAY $50".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.heavy)
                        .padding()
                        .padding(.vertical, 10)
                        .frame(width: UIScreen.main.bounds.width)
                        .background(Color(#colorLiteral(red: 0.3411764706, green: 0.5020022392, blue: 0.850874424, alpha: 1)))
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(true)
        .navigationBarTitle(Text("Home"))
    }
    
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
    }
}
