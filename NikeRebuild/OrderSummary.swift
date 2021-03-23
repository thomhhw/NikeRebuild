//
//  OrderSummary.swift
//  NikeRebuild
//
//  Created by Thom Pheijffer on 11/05/2020.
//  Copyright © 2020 Thom Pheijffer. All rights reserved.
//

import SwiftUI

struct OrderSummary: View {
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
                    Text("Order Summery")
                        .font(.system(size: 22, weight: .heavy, design: .rounded))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                OrderItem()
                    .padding(.top, 8)
                 
                Group {
                    VStack {
                        HStack {
                            Text("Shipping address")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 16) {
                            Image(systemName: "car.fill")
                            
                            VStack(alignment: .leading) {
                                Text("6/41 Pandurangan Vittal")
                                Text("st-2, salem-6.")
                            }
                                
                            .foregroundColor(Color(#colorLiteral(red: 0.6548412442, green: 0.662783742, blue: 0.6901119947, alpha: 1)))
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            
                            Spacer()
                            
                            NavigationLink(destination: ShippingAddress()) {
                                Text("Change".uppercased())
                                    .foregroundColor(.black)
                                    .font(.system(size: 12, weight: .bold, design: .rounded))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.black.opacity(0.4), lineWidth: 0.5)
                                )
                            }
                        }
                        
                    }
                    .padding()
                    .padding(.top)
                    
                    Divider()
                }
                
                Group {
                    PriceDetailsView()
                    
                    Divider()
                }
                
                Group {
                    VStack {
                        HStack {
                            Text("Coupons")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                            
                            Spacer()
                        }
                        
                        HStack(spacing: 16) {
                            Image(systemName: "creditcard")
                                .foregroundColor(Color(#colorLiteral(red: 0.333296001, green: 0.3529645205, blue: 0.4195535183, alpha: 1)))
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Apply coupon")
                                    .foregroundColor(Color(#colorLiteral(red: 0.6548412442, green: 0.662783742, blue: 0.6901119947, alpha: 1)))
                                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                                
                                Text("SAVE Upto $25 for your first order".uppercased())
                                    .font(.system(size: 10, weight: .heavy, design: .rounded))
                                    .foregroundColor(Color(#colorLiteral(red: 0.333296001, green: 0.3529645205, blue: 0.4195535183, alpha: 1)))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        //                    .frame(maxWidth: .infinity)
                        
                    }
                    .padding()
                    
                    Divider()
                }
                
                Spacer()
                
                NavigationLink(destination: PaymentMethod()) {
                    Text("Continue".uppercased())
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

struct OrderSummary_Previews: PreviewProvider {
    static var previews: some View {
        OrderSummary()
    }
}

struct CustomStepper: View {
    var body: some View {
        HStack(spacing: 5) {
            Text("-")
                .fontWeight(.bold)
                .offset(y: -1)
                .frame(width: 24, height: 24)
                .background(Color(#colorLiteral(red: 0.7450148463, green: 0.8078922629, blue: 0.941062212, alpha: 1)))
                .cornerRadius(3)
                .foregroundColor(.white)
            
            
            Text("1")
                .font(.system(size: 14, weight: .heavy, design: .rounded))
            
            Text("+")
                .fontWeight(.bold)
                .offset(y: -1)
                .frame(width: 24, height: 24)
                .background(Color(#colorLiteral(red: 0.2940303385, green: 0.4627851248, blue: 0.8195054531, alpha: 1)))
                .cornerRadius(3)
                .foregroundColor(.white)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 3)
        .background(Color.white)
        .cornerRadius(3)
    }
}

struct OrderItem: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Nike Air Max(Men's)")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Color(#colorLiteral(red: 0.4078007936, green: 0.4235563874, blue: 0.4862127304, alpha: 1)))
                Text("$45")
                    .font(.system(size: 24, weight: .heavy, design: .rounded))
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
            .offset(x: 20)
            
            Spacer()
            
            HStack {
                Spacer()
                CustomStepper()
                
            }.padding()
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color(#colorLiteral(red: 0.9097210765, green: 0.9216209054, blue: 0.9489062428, alpha: 1)))
        .padding(.top)
        .overlay(
            Circle()
                .fill(Color(#colorLiteral(red: 0.7999177575, green: 0.8431871533, blue: 0.9332205653, alpha: 1)))
                .frame(height: 100)
                .offset(x: -UIScreen.main.bounds.width/2)
        )
    }
}
