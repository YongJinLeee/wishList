//
//  WishListViewController.swift
//  WishList
//
//  Created by LeeYongJin
//

import UIKit

class WishListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
                ViewCtrl?.viewModel.modelUpdate(model: wishItemInfoToDetail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//    //viewController 초기화면 돌아오기
//    @IBAction func unwindMain (segue : UIStoryboardSegue) {
//    }

//    UICollectionViewDataSource : data 개수 세기, 데이터 표현 형태, 각 cell에 채울 데이터 가져오기
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfItem
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath  ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
    }
        let itemInfoSetToList = viewModel.ItemInfo(at: indexPath.item)
        cell.cellDataUpdate(Info: itemInfoSetToList)
        return cell
}
//    UICollectionViewDelegate : cell 터치 및 클릭 되었을 때의 동작은
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
            
    }
//    UICollectionViewDelegateLayoutFlow : 기기 별 상이한 화면 크기에 따라 cell size 계산 및 배치
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //cell 간 횡간격
        let itemSpacing: CGFloat = 10
        // TextBox size
        let textAreaHeight: CGFloat = 65
        
        let width: CGFloat = (collectionView.bounds.width - itemSpacing) / 2
        let height: CGFloat = width * (10/7) + textAreaHeight
        
        return CGSize(width: width, height: height)
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

    class GridCell: UICollectionViewCell {
        @IBOutlet weak var imgView: UIImageView!
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var costLabel: UILabel!
        
        func cellDataUpdate(Info: WishItemInfo) {
            imgView.image = Info.img
            nameLabel.text = Info.name
            costLabel.text = "\(Info.cost)"
        }
    }
