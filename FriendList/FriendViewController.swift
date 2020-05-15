//
//  FriendViewController.swift
//  FriendList
//
//  Created by Ji Chang Hyun on 2020/05/05.
//  Copyright © 2020 Nigostarr. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    // MVVM
    
    // Model
    // - FriendInfo 라는 오브젝트로 만들면 좋겠다.
    // > FriendInfo 만들자
    
    // View
    // - ListCell = View
    // > ListCell 필요한 정보를 ViewModel 한테서 받아야겠다
    // > ListCell은 ViewModel 로 부터 받은 정보로 뷰 업데이트 하기
    
    // ViewModel
    // - FriendViewModel
    // > FriendViewModel 을 만들고, 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, BountyInfo 들

//    let friendInfoList: [FriendInfo] = [
//        FriendInfo(name: "Honey", birth: 990122),
//        FriendInfo(name: "Babjung", birth: 990316),
//        FriendInfo(name: "Groichoi", birth: 990124),
//        FriendInfo(name: "Mino", birth: 990207),
//        FriendInfo(name: "Nigostarr", birth: 990807),
//        FriendInfo(name: "Notak", birth: 990903),
//        FriendInfo(name: "Ham", birth: 990325),
//        FriendInfo(name: "Hyunwoo", birth: 990107)
//    ]
        
    let viewModel = FriendViewModel()
    
//    let nameList = ["Honey" , "Babjung" , "Groichoi" , "Mino" , "Nigostarr" , "Notak" , "Ham" , "Hyunwoo"]
//    let birthList = [990122, 990316 , 990124 , 990207 , 990807 , 990903, 990325, 990107]

    // segueway 를 수행하기 직전에 데이터를 넘겨주는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터를 줄것
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                
//                let friendInfo = friendInfoList[index]
                let friendInfo = viewModel.friendInfo(at: index)
                vc?.viewModel.update(model: friendInfo)
//                vc?.name = friendInfo.name
//                vc?.birth = friendInfo.birth
//                vc?.name = nameList[index]
//                vc?.birth = birthList[index]

            }
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return FriendList.count
        // return friendInfoList.count
        return viewModel.numOfFriendInfoList
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
//        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//        cell.imgView.image = img
//        cell.nameLabel.text = nameList[indexPath.row]
//        cell.birthLabel.text = "\(birthList[indexPath.row])"
        
       // let friendInfo = friendInfoList[indexPath.row]
        let friendInfo = viewModel.friendInfo(at: indexPath.row)
        cell .update(info: friendInfo)
//        cell.imgView.image = friendInfo.image
//        cell.nameLabel.text = friendInfo.name
//        cell.birthLabel.text = "\(friendInfo.birth)"
        return cell
       }
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--->\(indexPath.row)")
        // 셀이 클릭이 되었을때 실제로 아까 연결되었던 Segueway를 수행하는 메서드 (performSegue)
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

// Custom cell
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    
    func update(info: FriendInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        birthLabel.text = "\(info.birth)"
    }
}


class FriendViewModel {
    let friendInfoList: [FriendInfo] = [
           FriendInfo(name: "Honey", birth: 990122),
           FriendInfo(name: "Babjung", birth: 990316),
           FriendInfo(name: "Groichoi", birth: 990124),
           FriendInfo(name: "Mino", birth: 990207),
           FriendInfo(name: "Nigostarr", birth: 990807),
           FriendInfo(name: "Notak", birth: 990903),
           FriendInfo(name: "Ham", birth: 990325),
           FriendInfo(name: "Hyunwoo", birth: 990107)
    ]
    
    var sortedList: [FriendInfo] {
        let sortedList = friendInfoList.sorted { prev, next in
            return prev.birth < next.birth
        }
        return sortedList
    }
    
    var numOfFriendInfoList: Int {
        return friendInfoList.count
    }
    func friendInfo(at index: Int) -> FriendInfo {
        return sortedList[index]
    }
}
