//
//  DetailViewController.swift
//  WishList
//
//
// modally present
import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var closed: UIButton!
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    
    
    var name: String?
    var cost: Int?
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //들여올 데이터 셋팅
        updataInfo()
    }

    func updataInfo() {
        if let name = self.name, let cost = self.cost {
            let img = UIImage(named: "\(name).jpg")
            detailImg.image = img
            nameLabel.text = "\(name)"
            costLabel.text = "\(cost)"
        }
    }
}
