//
//  DetailViewController.swift
//  WishList
//
//  Created by LeeYongJin on 2021/07/08.
//
// modally present
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var closed: UIButton!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
