//
//  ShoeList.swift
//  NikeRebuild
//
//  Created by Thom Pheijffer on 08/05/2020.
//  Copyright © 2020 Thom Pheijffer. All rights reserved.
//

import SwiftUI

struct AllShoesList: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.mode.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                Spacer()
            }
            .padding()
            
            HStack {
                Text("Casual shoes")
                    .font(.system(size: 22, weight: .bold))
                
                Spacer()
                
                HStack {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 12))
                    Text("FILTER")
                        .font(.system(size: 12, weight: .heavy, design: .rounded))
                }
                .foregroundColor(Color.blue)
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black.opacity(0.4), lineWidth: 0.5)
                )
            }
            .padding(.horizontal)
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 8)], spacing: 16) {
                    ForEach(0 ..< 5) { item in
                        NavigationLink(destination: ShoeDetail()) {
                            ShoeCard()
                                .frame(height: 220)
                        }
                    }
                }
                
            }.padding(.horizontal)
            
//            ScrollView(.vertical, showsIndicators: false) {
//                ForEach(0 ..< 5) { item in
//                    NavigationLink(destination: ShoeDetail()) {
//                        HStack(spacing: 16) {
//                            ShoeCard()
//                                .frame(height: 220)
//                            ShoeCard()
//                                .frame(height: 220)
//                        }
//                        .padding(.horizontal)
//                        .padding(.top)
//                    }
//                }
//            }
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarTitle(Text("Home"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ShoeList_Previews: PreviewProvider {
    static var previews: some View {
        AllShoesList()
    }
}
