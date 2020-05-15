//
//  FriendInfo.swift
//  FriendList
//
//  Created by Ji Chang Hyun on 2020/05/15.
//  Copyright © 2020 Nigostarr. All rights reserved.
//

import UIKit

struct FriendInfo {
    let name: String
    let birth: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, birth: Int){
        self.name = name
        self.birth = birth
    }
}
