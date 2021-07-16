//
//  WishListViewModel.swift
//  WishList
//
//  Created by LeeYongJin
//

import UIKit

class WishListViewModel {
    // 물건 리스트
    // 기존에 분리되어있던 이름과 가격 정보를 Struct를 사용해 하나의 의미있는 정보로 묶음 처리
    // Model (ViewModel은 Model을 갖고있어야 함)
    let wishItemList: [WishItemInfo] = [
        WishItemInfo(name: "PS5", cost: 680000),
        WishItemInfo(name: "Zero Dawn", cost: 28000),
        WishItemInfo(name: "Forbidden", cost: 69000),
        WishItemInfo(name: "Miles", cost: 32000),
        WishItemInfo(name: "LOU2", cost: 89000)
    ]
    
    var sortedItemByCost: [WishItemInfo] {
        let sortedList = wishItemList.sorted { pre, next in
            return pre.cost > next.cost }
        // 높은가격순
        
        return sortedList
    }
    
    // 아이템(생성될 cell) 개수
    var numOfItem: Int {
        return wishItemList.count
    }
    //Cell에 넘어갈 아이템 정보
    func ItemInfo(at index: Int) -> WishItemInfo {
        return sortedItemByCost[index]
    }
}
