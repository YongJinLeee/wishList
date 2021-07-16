//
//  DetailViewController.swift
//  WishList
//
//
// modally present
import UIKit

class DetailViewController: UIViewController {
    
    // MVVM 리팩토링
    // Model
    //  - nameList와 costList의 Data 상호 연결성 확보 필요
    //  > New) WishItemInfo
    
    // View
    //  - imgView, nameLabel, costLabel
    //  > View들은 ViewModel을 통해서 구성됨
    //  > 클래스에 필요한 data를 ViewModel로 부터 받아 View Update진행
    
    // ViewModel
    //  - New) DetailViewModel
    //  > View Layer에서 필요한 Method 작성
    //  > Model 포함 할 것

    @IBOutlet weak var closed: UIButton!
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!

    var viewModel = DetailViewModel()
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //들여올 데이터 셋팅
        updateInfo()
    }

    func updateInfo() {
        
        if let wishItemInfo = self.viewModel.wishItemInfoFromWishList {
            detailImg.image = wishItemInfo.img
            nameLabel.text = wishItemInfo.name
            costLabel.text = "\(wishItemInfo.cost)"
        }
    }
}
class DetailViewModel {
    //Model
    var wishItemInfoFromWishList: WishItemInfo?
    
    func modelUpdate(model: WishItemInfo?) {
        wishItemInfoFromWishList = model
    }
}
