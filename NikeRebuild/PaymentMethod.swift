//
//  PaymentMethod.swift
//  NikeRebuild
//
//  Created by Thom Pheijffer on 10/05/2020.
//  Copyright © 2020 Thom Pheijffer. All rights reserved.
//

import SwiftUI

struct PaymentMethod: View {
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
                
                VStack(spacing: 0) {
                    ForEach(0 ..< rows.count) { i in
                        PaymentMethodRow(text: self.rows[i], item: i, index: self.$index)
                            .onTapGesture {
                                self.index = i
                        }
                    }
                }
                
                Divider()
                    .padding(.top, 32)
                
                PriceDetailsView()
                
                Spacer()
                
                NavigationLink(destination: Checkout()) {
                    Text("PAY $50")
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

struct PaymentMethod_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethod()
    }
}

struct PaymentMethodRow: View {
    var text: String
    var item: Int
    @Binding var index: Int
    
    var body: some View {
        VStack {
            HStack {
                Text(text)
                    .foregroundColor((item == index) ? Color.white : Color(#colorLiteral(red: 0.4156443477, green: 0.4274778962, blue: 0.4822917581, alpha: 1)))
                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                
                Spacer()
                
                if !(item == index) {
                    Text("SELECT")
                        .foregroundColor(Color(#colorLiteral(red: 0.2548003793, green: 0.4549430013, blue: 0.8391107917, alpha: 1)))
                        .font(.system(size: 16, weight: .heavy, design: .rounded))
                        .frame(height: 50)
                } else {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .heavy, design: .rounded))
                        .frame(height: 50)
                }
            }
        }
        .frame(height: 50)
        .padding(.horizontal, 16)
        .background((item == index) ? Color(#colorLiteral(red: 0.3406906128, green: 0.5001910329, blue: 0.8524060845, alpha: 1)) : Color(#colorLiteral(red: 0.9999127984, green: 1, blue: 0.9998814464, alpha: 1)))
        .cornerRadius(10)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        //        .background(item.isMultiple(of: 2) ? Color.green : Color.red)
        
    }
}

struct PriceListingRow: View {
    var body: some View {
        HStack {
            
            Text("Nike Air Max")
                .foregroundColor(Color(#colorLiteral(red: 0.6548412442, green: 0.662783742, blue: 0.6901119947, alpha: 1)))
                .font(.system(size: 12, weight: .bold, design: .rounded))
            Spacer()
            GeometryReader { geometry in
                HStack(spacing: 8) {
                    Spacer()
                    ForEach(0..<Int(geometry.size.width/20)) { i in
                        Rectangle()
                            .frame(width: 12, height: 1)
                            .foregroundColor(Color.gray.opacity(0.15))
                    }
                }
            }
            Text("$45")
                .font(.system(size: 12, weight: .heavy, design: .rounded))
                .foregroundColor(Color(#colorLiteral(red: 0.372510612, green: 0.3843383491, blue: 0.4391593337, alpha: 1)))
                .padding(.leading)
            
        }
        .frame(height: 23)
    }
}

struct PriceDetailsView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Price details")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                
                Spacer()
            }
            
            PriceListingRow()
                .padding(.top)
            PriceListingRow()
            
            HStack {
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 26, height: 1)
                            .foregroundColor(Color.gray.opacity(0.15))
                    }
                    HStack {
                        Spacer()
                        Text("Total")
                            .font(.system(size: 10, weight: .heavy, design: .rounded))
                            .foregroundColor(Color(#colorLiteral(red: 0.372510612, green: 0.3843383491, blue: 0.4391593337, alpha: 1)))
                        Text("$50")
                            .fontWeight(.heavy)
                    }
                }
            }
            
        }
        .padding()
    }
}
