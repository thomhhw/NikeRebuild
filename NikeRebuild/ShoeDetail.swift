//
//  ShoeDetail.swift
//  NikeRebuild
//
//  Created by Thom Pheijffer on 08/05/2020.
//  Copyright © 2020 Thom Pheijffer. All rights reserved.
//

import SwiftUI

struct ShoeDetail: View {
     @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.9685428739, green: 0.9686816335, blue: 0.9685124755, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0.0) {
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
                    Image(systemName: "bookmark.fill")
                }
                .padding()
                
                ZStack {
                    Circle()
                        .foregroundColor(Color(#colorLiteral(red: 0.3411764706, green: 0.5020022392, blue: 0.850874424, alpha: 1)))
                        .frame(width: 310, height: 310)
                        .offset(x: -160)
                    
                    Text("$45")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .padding(23)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 1)
                        .offset(x: -30, y: -100)
                }
                
                
                Spacer()
                
                
                ShoeDetailCard()
                    .frame(height: 260)
                
                NavigationLink(destination: OrderSummary()) {
                    Text("BUY NOW")
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

struct ShoeDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetail()
    }
}

struct ShoeDetailCard: View {
    var body: some View {
        VStack {
            HStack {
                Text("Nike Air Max")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                
                Spacer()
                
                HStack {
                    Text("ADD TO BAG")
                        .font(.system(size: 9, weight: .bold, design: .rounded))
                    
                    Image(systemName: "bag")
                        .font(.system(size: 12))
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
                )
                
                
                //                        .stroke(RoundedRectangle(cornerRadius: 4), lineWidth: 1)
                
            }
            
            HStack {
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.gray)
                }
                .font(.caption)
                
                HStack(spacing: 2) {
                    Text("4.1")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .bold()
                    
                    Image(systemName: "star.fill")
                        .font(.system(size: 8))
                        .foregroundColor(.white)
                    
                    Divider()
                        .background(Color.white)
                        .frame(height: 12)
                    
                    Text("(340)")
                        .foregroundColor(.white)
                        .font(.system(size: 8))
                    
                }
                .padding(.horizontal ,2)
                .padding(.vertical, 3)
                .background(Color(#colorLiteral(red: 0.3411764706, green: 0.5020022392, blue: 0.850874424, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 3))
                
                
                Spacer()
            }
            
            Text("The Nike GTX shoe borrows design lines from The heritage runners the Nike React tech.")
                .foregroundColor(Color(#colorLiteral(red: 0.6783697605, green: 0.682392776, blue: 0.7136387825, alpha: 1)))
                .bold()
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
            
            HStack {
                Text("Size")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                Spacer()
            }
            
            HStack(spacing: 16) {
                SizeBox()
                SizeBox(size: "6", isSelected: false)
                SizeBox(size: "6.5", isSelected: false)
                SizeBox(size: "7", isSelected: true)
                SizeBox(size: "7.5", isSelected: false)
                Spacer()
            }
            .padding(.vertical)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 0.2)
    }
}

struct SizeBox: View {
    var size = "5.5"
    var isSelected = false
    
    var body: some View {
        Text(size)
            .font(.system(size: 14, weight: .heavy, design: .rounded))
            .foregroundColor(isSelected ? Color.white : Color(#colorLiteral(red: 0.8234568238, green: 0.8235760331, blue: 0.823430717, alpha: 1)))
            .frame(width: 40, height: 40)
            
            .overlay (
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.black.opacity(0.2), lineWidth: 0.5)
        )
            .background(isSelected ? Color(#colorLiteral(red: 0.3410903811, green: 0.5020022392, blue: 0.850874424, alpha: 1)).cornerRadius(6) : Color.clear.cornerRadius(6))
        
        
        
    }
}
