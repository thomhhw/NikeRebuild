//
//  EditAddress.swift
//  NikeRebuild
//
//  Created by Thom Pheijffer on 11/05/2020.
//  Copyright © 2020 Thom Pheijffer. All rights reserved.
//

import SwiftUI

struct EditAddress: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                
                Group {
                    EditAdressTextfield()
                    EditAdressTextfield(field: "Phone no", value: "83009 88763")
                        .padding(.bottom)
                }
                
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.9293304086, green: 0.929463923, blue: 0.9293012023, alpha: 1)))
                    .frame(maxWidth: .infinity)
                    .frame(height: 20)
                
                Group {
                    EditAdressTextfield(field: "Pin code", value: "636006")
                    EditAdressTextfield(field: "Address(House no, Building, street", value: "6/41 Pandurangan Vitaal street")
                    EditAdressTextfield(field: "Town/Locality", value: "Karungalpatti")
                    EditAdressTextfield(field: "City/District", value: "Salem")
                    EditAdressTextfield(field: "State", value: "Tamilnadu")
                }
                
                Spacer()
                
                Button(action: { self.mode.wrappedValue.dismiss() }) {
                    Text("SAVE")
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

struct EditAddress_Previews: PreviewProvider {
    static var previews: some View {
        EditAddress()
    }
}

struct EditAdressTextfield: View {
    var field = "Name"
    var value = "Manikandan"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(field)
                .foregroundColor(Color.gray.opacity(0.5))
                .font(.system(size: 16, weight: .medium, design: .rounded))
            
            TextField(field, text: .constant(value))
                .foregroundColor(Color(#colorLiteral(red: 0.3176110387, green: 0.3372774124, blue: 0.4038690329, alpha: 1)))
                .font(.system(size: 16, weight: .heavy, design: .rounded))
                .padding(.top, 6)
                .padding(.bottom, 4)
            
            Divider()
        }
        .padding(.horizontal)
        .padding(.top)
    }
}
