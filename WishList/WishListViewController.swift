//
//  WishListViewController.swift
//  WishList
//
//  Created by LeeYongJin on 2021/07/04.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //UITableViewDataSource
    //TableView cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    // TableView 표시형태(재사용시)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        }

}
