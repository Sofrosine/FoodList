//
//  ItemDetail.swift
//  FirstProject
//
//  Created by gomodo on 17/05/20.
//  Copyright © 2020 soultanmuh. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    var item: MenuItem
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Image(item.mainImage)
                HStack {
                    
                    Button(action: {
                        self.favorite.add(item: self.item)
                        self.alertPresented.toggle()
                    }, label: {
                        Image(systemName: "star")
                        .padding(8)
                        .background(Color.white)
                        .foregroundColor(.yellow)
                        .offset(x: 5, y: -5)
                    })
                    Spacer()
                    Text("Photo: \(item.photoCredit)")
                        .padding(4)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .font(.caption)
                        .offset(x: -5, y: -5)
                }
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                self.order.add(item: self.item)
            }
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 2))
            
            Spacer()
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .alert(isPresented: $alertPresented) {
            Alert(title:Text( "Favorite Adding"), message: Text("Success!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    
    static var order = Order()
    static var favorite = Favorite()
    
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
                .environmentObject(favorite)
        }
    }
}
