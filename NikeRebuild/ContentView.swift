//
//  ContentView.swift
//  NikeRebuild
//
//  Created by Thom Pheijffer on 07/05/2020.
//  Copyright © 2020 Thom Pheijffer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                Color(#colorLiteral(red: 0.9607003331, green: 0.9608381391, blue: 0.9606701732, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                Home()
                    .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var index = 0
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Text("menu")
                Spacer()
                Text("logo")
                Spacer()
                Image(systemName: "bookmark")
                Image(systemName: "bag")
            }.padding(.horizontal)
                .padding(.bottom)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Discover your")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                    Text("Favourite footwear")
                        .font(.system(size: 22, weight: .bold))
                }
                Spacer()
            }.padding()
            
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                TextField("Search shoes...", text: .constant(""))
            }
            .padding()
            .background(Color.white)
            .cornerRadius(6)
            .padding(.horizontal, 16)
            .shadow(color: Color.black.opacity(0.01), radius: 1, x: 0, y: 5)
            
            VStack(spacing: 0.0) {
                HStack(spacing: 40) {
                    Button(action: {self.index = 0}) {
                        VStack(spacing: 2.0) {
                            Text("MEN")
                                .foregroundColor(self.index == 0 ? Color(#colorLiteral(red: 0.3018714786, green: 0.4745509624, blue: 0.8430320621, alpha: 1)) : Color.gray)
                                .fontWeight(self.index == 0 ? .bold : .regular)
                            Divider()
                                .frame(width: 24, height: 3)
                                .background(self.index == 0 ? Color(#colorLiteral(red: 0.3018714786, green: 0.4745509624, blue: 0.8430320621, alpha: 1)) : Color.clear)
                                .cornerRadius(1.5)
                                .opacity(self.index == 0 ? 1 : 0)
                            
                            
                        }
                    }
                    Button(action: {self.index = 1}) {
                        VStack(spacing: 2.0) {
                            Text("WOMEN")
                                .foregroundColor(self.index == 1 ? Color(#colorLiteral(red: 0.3018714786, green: 0.4745509624, blue: 0.8430320621, alpha: 1)) : Color.gray)
                                .fontWeight(self.index == 1 ? .bold : .regular)
                            Divider()
                                .frame(width: 24, height: 3)
                                .background(self.index == 1 ? Color(#colorLiteral(red: 0.3018714786, green: 0.4745509624, blue: 0.8430320621, alpha: 1)) : Color.black.opacity(0.001))
                                .cornerRadius(1.5)
                                .opacity(self.index == 1 ? 1 : 0)
                        }
                    }
                    Button(action: {self.index = 2}) {
                        VStack(spacing: 2.0) {
                            Text("KIDS")
                                .foregroundColor(self.index == 2 ? Color(#colorLiteral(red: 0.3018714786, green: 0.4745509624, blue: 0.8430320621, alpha: 1)) : Color.gray)
                                .fontWeight(self.index == 2 ? .bold : .regular)
                            Divider()
                                .frame(width: 24, height: 3)
                                .background(self.index == 2 ? Color(#colorLiteral(red: 0.3018714786, green: 0.4745509624, blue: 0.8430320621, alpha: 1)) : Color.clear)
                                .cornerRadius(1.5)
                                .opacity(self.index == 2 ? 1 : 0)
                        }
                    }
                }
                .padding(.top, 40)
                
                Divider()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                ShoeList()
                ShoeList()
            }
            
            
            Spacer()
        }
    }
}

struct ShoeCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(systemName: "bookmark.fill")
                    .padding(.trailing, 8)
                    .padding(.top, 16)
            }
            
            Spacer()
            
            Text("Nike Air Max")
                .font(.footnote)
                .foregroundColor(Color(#colorLiteral(red: 0.415643245, green: 0.4313999116, blue: 0.4940550327, alpha: 1)))
                .bold()
                .padding(.leading, 8)
            
            HStack {
                Text("$45")
                    .bold()
                    .font(.title)
                    .padding(.leading, 8)
                
                Spacer()
                
                Image(systemName: "bag")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.3018714786, green: 0.4745509624, blue: 0.8430320621, alpha: 1)))
                    .clipShape(CustomShape(corner: .topLeft, radii: 25))
            }
            
        }
        .background(Color(#colorLiteral(red: 0.9097210765, green: 0.9216209054, blue: 0.9489062428, alpha: 1)))
        .cornerRadius(6)
    }
}

struct ShoeList: View {
    var body: some View {
        VStack {
            HStack {
                Text("Running shoes")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Spacer()
                
                NavigationLink(destination: AllShoesList()) {
                    Text("See all")
                        .font(.caption)
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.3765105605, blue: 0.7959781289, alpha: 1)))
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0 ..< 5) { item in
                        NavigationLink(destination: ShoeDetail()) {
                            ShoeCard()
                                .frame(width: UIScreen.main.bounds.width / 2, height:  220)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
        }
    }
}

struct CustomShape : Shape {
    
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}
