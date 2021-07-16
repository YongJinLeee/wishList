//
//  WishListViewController.swift
//  WishList
//
//  Created by LeeYongJin on 2021/07/04.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MVVM 리팩토링
    // Model
    //  - nameList와 costList의 Data 상호 연결성 확보 필요
    //  > New) WishItemInfo, WishItemList
    
    // View
    //  - ListCell
    //  > View들은 ViewModel을 통해서 구성됨
    //  > ListCell에 필요한 data를 ViewModel로 부터 받아 View Update진행
    
    // ViewModel
    //  - New) WishListViewModel
    //  > View Layer에서 필요한 Method 작성 <
    //  > Model 포함 할 것 (wishItemInfo'들' 을 갖고 있어야함)
    
    // View와 Model은 상호 직접 접근 하지 않음
    let viewModel =  WishListViewModel()
    
    // DetailViewController에 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let ViewCtrl = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let wishItemInfoToDetail = viewModel.ItemInfo(at: index)
                
                // DetailViewController에서 넘겨받을 정보의 형태(type)를 구조체 WishItemInfo로 변경
                
                ViewCtrl?.viewModel.modelUpdate(model: wishItemInfoToDetail)
//                ViewCtrl?.viewModel.wishItemInfoFromWishList = wishItemInfoToDetail
                //직접 접근보다는 데이터에 변동이 생겼을 때를 상정하여 함수를 통해 접근
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//    //viewController 초기화면 돌아오기
//    @IBAction func unwindMain (segue : UIStoryboardSegue) {
//    }
    
    //UITableViewDataSource
    //TableView cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfItem
        //array 개수 세기
    }
    // TableView 표시형태(재사용시)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        //각 cell에 항목별 data 뿌리기
        let itemInfoSetToList = viewModel.ItemInfo(at: indexPath.row)
        cell.cellDataUpdate(Info: itemInfoSetToList)
        
        return cell
    }
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //cell 터치시 console message 확인
        print("Index : \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}
// View
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    func cellDataUpdate(Info: WishItemInfo) {
        imgView.image = Info.img
        nameLabel.text = Info.name
        costLabel.text = "\(Info.cost)"
    }
}

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
    
    // 아이템(생성될 cell) 개수
    var numOfItem: Int {
        return wishItemList.count
    }
    //Cell에 넘어갈 아이템 정보
    func ItemInfo(at index: Int) -> WishItemInfo {
        return wishItemList[index]
    }
}
