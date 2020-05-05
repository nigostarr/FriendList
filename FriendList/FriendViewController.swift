//
//  FriendViewController.swift
//  FriendList
//
//  Created by Ji Chang Hyun on 2020/05/05.
//  Copyright © 2020 Nigostarr. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    let nameList = ["Honey" , "Babjung" , "Groichoi" , "Mino" , "Nigostarr" , "Notak" , "Ham" , "Hyunwoo"]
    let birthList = [990122, 990316 , 990124 , 990207 , 990807 , 990903, 990325, 990107]

    // segueway 를 수행하기 직전에 데이터를 넘겨주는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터를 줄것
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.birth = birthList[index]
            }
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthList.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.birthLabel.text = "\(birthList[indexPath.row])"
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
}
