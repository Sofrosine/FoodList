//
//  FavoriteView.swift
//  FirstProject
//
//  Created by gomodo on 18/05/20.
//  Copyright © 2020 soultanmuh. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorite: Favorite
    func deleteItems(at offsets:IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favorite.items) { item in
                    Text(item.name)
                }.onDelete(perform: deleteItems(at:))
            }
            .navigationBarTitle("Favorite")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var favorite = Favorite()
    
    static var previews: some View {
        FavoriteView().environmentObject(favorite)
    }
}
