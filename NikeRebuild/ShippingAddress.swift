//
//  ShippingAddress.swift
//  NikeRebuild
//
//  Created by Thom Pheijffer on 11/05/2020.
//  Copyright © 2020 Thom Pheijffer. All rights reserved.
//

import SwiftUI

struct ShippingAddress: View {
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
                        .font(.system(size: 24, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .foregroundColor(Color.gray.opacity(0.4))
                            .frame(width: 12, height: 12)
                    }
                    
                    HStack(alignment: .top) {
                        VStack {
                            Circle()
                                .fill(Color(#colorLiteral(red: 0.3410903811, green: 0.5020022392, blue: 0.850874424, alpha: 1)))
                                .frame(width: 18, height: 18)
                                .overlay(
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 8, height: 8)
                            )
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Mani")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                                .padding(.bottom)
                            
                            Text("6/41 Pandurangan Vittal street-2,")
                            Text("Karungalpatty, gugai")
                            Text("Salem-636006.")
                            Text("Tamilnadu")
                            
                            HStack {
                                Text("Mobile")
                                Text("8300988763")
                                    .foregroundColor(.black)
                            }.padding(.top)
                        }
                        .foregroundColor(Color(#colorLiteral(red: 0.5489676595, green: 0.5568960905, blue: 0.5960047245, alpha: 1)))
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                        
                        Spacer()
                        
                        HStack(alignment: .center) {
                            VStack {
                                Spacer()
                                Text("EDIT")
                                    .font(.system(size: 14, weight: .heavy, design: .rounded))
                                    .foregroundColor(Color(#colorLiteral(red: 0.2391076982, green: 0.4510214925, blue: 0.8391107917, alpha: 1)))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                                )
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                }
                .frame(height: 160)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding()
                
                NavigationLink(destination: EditAddress()) {
                    HStack(spacing: 2) {
                        Text("+")
                            .offset(y: -1)
                        Text("ADD NEW ADDRESS")
                            .font(.system(size: 12, weight: .heavy, design: .rounded))
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.3411764706, green: 0.5020022392, blue: 0.850874424, alpha: 1)))
                    .cornerRadius(8)
                    .padding()
                }
                
                Spacer()
                
                Button(action: { self.mode.wrappedValue.dismiss() }) {
                    Text("CONTINUE")
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

struct ShippingAddress_Previews: PreviewProvider {
    static var previews: some View {
        ShippingAddress()
    }
}
