//
//  Store.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/04.
//

import UIKit

class Store {
    var storeName: String?
    var detailName: [String]?
    
    init(storeName: String, detailName: [String]) {
        self.storeName = storeName
        self.detailName = detailName
    }
}
