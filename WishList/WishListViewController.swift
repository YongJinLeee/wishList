//
//  WishListViewController.swift
//  WishList
//
//  Created by LeeYongJin on 2021/07/04.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameList = ["PS5", "Zero Dawn", "Forbidden", "Miles", "LOU2"]
    let costList = [680000, 28000, 69000, 32000, 89000]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //UITableViewDataSource
    //TableView cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costList.count
        //array 개수 세기
    }
    // TableView 표시형태(재사용시)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //setting된 값을 ListCell를 통해 표현해야 하기때문에 옵셔널로 캐스팅
        //guard - else 로 옵셔널 바인딩 방식 변경
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.costLabel.text = "\(costList[indexPath.row])"
        
        return cell
        
        //   if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
//        
//            let img = UIImage(named : "\(nameList[indexPath.row]).jpg")
//            cell.imgView.image = img
//            cell.nameLabel.text = nameList[indexPath.row]
//            cell.costLabel.text = "\(costList[indexPath.row])"
//          return cell
//         } else {
//              return UITableViewCell()
//         }
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //cell 터치시 console message 확인
        print("--> \(indexPath.row)")
        }

}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
}
