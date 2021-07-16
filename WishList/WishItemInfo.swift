//
//  WishItemInfo.swift
//  WishList
//
//  Created by LeeYongJin
//

import UIKit

// 각 물건의 정보 구조체.
// struct로 관리시 정보 입출 용이
struct WishItemInfo {
    let name: String
    let cost: Int
    
    var img: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    init(name: String, cost: Int) {
        self.name = name
        self.cost = cost
    }
}
