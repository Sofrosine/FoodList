//
//  Favorite.swift
//  FirstProject
//
//  Created by gomodo on 18/05/20.
//  Copyright © 2020 soultanmuh. All rights reserved.
//

import SwiftUI

class Favorite: ObservableObject {
    @Published var items = [MenuItem]()
    
    
    var total: Int {
        if items.count > 0 {
            return items.count
        } else {
            return 0
        }
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
}
