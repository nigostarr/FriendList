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
    
    // 이름정보를 가지면 이미지를 알수있다, 생년월일도 (데이터 필요한 property 추가)
    var name: String?
    var birth: Int?
    
    // viewDidLoad 는 viewController 가 실제로 메모리에 올라오는 시점에 호출이됨.(viewController 가 뜨기 직전에 메모리가 올라왔을때 위의 property 데이터를 가지고 updateUI에 이를 업데이트 한다)
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    // Data Setting
    func updateUI() {
        if let name = self.name, let birth = self.birth {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            birthLabel.text = "\(birth)"
        }
    }
    
    // dismiss 사용으로 버튼을 누를시 창을 닫을수 있게 설정
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}



