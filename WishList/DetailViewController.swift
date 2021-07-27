//
//  DetailViewController.swift
//  WishList
//
//  Created by LeeYongJin
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
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var costLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var imageViewCenterX: NSLayoutConstraint!
    
    var viewModel = DetailViewModel()
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //들여올 데이터 셋팅
        updateInfo()
        prepareAnimation()
    }
    
    // 애니메이션 관련 View 표시 함수
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
        
    }
    // animation 준비, 두 Label 화면 밖으로 밀기
    private func prepareAnimation() {
//        nameLabelCenterX.constant = view.bounds.width
//        costLabelCenterX.constant = view.bounds.width
    // View 속성 animation
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        costLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 4, y: 4).rotated(by: 180)
        
        nameLabel.alpha = 0
        costLabel.alpha = 0
        detailImg.alpha = 0
    }
    
    // 설정된 animation 재생
    private func showAnimation() {
        // 라벨 animation
        UIView.animate(withDuration: 0.5,
                               delay: 0.1,
                               usingSpringWithDamping: 1, // 튀어오름
                               initialSpringVelocity: 2, // 옆으로
                               options: .curveEaseInOut,
                               animations: {
                                //제자리 복귀
                                self.nameLabel.transform = CGAffineTransform.identity
                                self.nameLabel.alpha = 1
                            }, completion: nil)
        
        UIView.animate(withDuration: 0.7,
                               delay: 0.4,
                               usingSpringWithDamping: 1, // 튀어오름
                               initialSpringVelocity: 2, // 옆으로
                               options: .curveEaseInOut,
                               animations: {
                                self.costLabel.transform = CGAffineTransform.identity
                                self.costLabel.alpha = 1
                            }, completion: nil)
//        nameLabelCenterX.constant = 0
//        costLabelCenterX.constant = 0
        
        // 이미지 회전
        UIView.transition(with: detailImg,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.detailImg.alpha = 1
                          }, completion: nil)
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
