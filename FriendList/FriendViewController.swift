//
//  FriendViewController.swift
//  FriendList
//
//  Created by Ji Chang Hyun on 2020/05/05.
//  Copyright © 2020 Nigostarr. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
   
    let viewModel = FriendViewModel()
    
    // segueway 를 수행하기 직전에 데이터를 넘겨주는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터를 줄것
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                
                let friendInfo = viewModel.friendInfo(at: index)
                vc?.viewModel.update(model: friendInfo)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // UICollectionViewDataSource
    // 몇개를 보여줄것인가?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfFriendInfoList
    }
    // 셀은 어떻게 표현할지?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let friendInfo = viewModel.friendInfo(at: indexPath.item)
        cell.update(info: friendInfo)
        return cell
    }
    // UICollectionViewDelegate
    // 셀이 클릭되었을때 어쩔까요?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("--->\(indexPath.item)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
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

class GridCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    
    func update(info: FriendInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        birthLabel.text = "\(info.birth)"
    }
}

