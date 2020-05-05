//
//  DetailViewController.swift
//  FriendList
//
//  Created by Ji Chang Hyun on 2020/05/06.
//  Copyright © 2020 Nigostarr. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    // dismiss 사용으로 버튼을 누를시 창을 닫을수 있게 설정
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}



