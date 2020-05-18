//
//  AppView.swift
//  FirstProject
//
//  Created by gomodo on 17/05/20.
//  Copyright © 2020 soultanmuh. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
            }
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
            }
            FavoriteView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorite")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static let favorite = Favorite()
    
    static var previews: some View {
        AppView().environmentObject(order).environmentObject(favorite)
    }
}
