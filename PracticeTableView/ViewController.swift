//
//  ViewController.swift
//  PracticeTableView
//
//  Created by 浜崎良 on 2024/03/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var table: UITableView!
    
    //セルに表示するデータ(Animal)の配列
    let animals: [Animal] = [
        Animal(name: "犬", imageName: "inu"),
        Animal(name: "猫", imageName: "neko"),
        Animal(name: "象", imageName: "zou")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //デリゲート先を自分自身に設定
        table.dataSource = self
        table.delegate = self
    }
    
}

// MARK: TableView
//extensionで大元のViewController内にTableViewの実装を書かなくて良くなるため、可読性を向上させることができる
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //行の高さを指定
        140
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //表示する行数を指定
        animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //再利用可能なセルを取得、または新規作成
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AnimalImageCell
        
        //セルのlabel,iconImageViewの内容を構成
        cell.configure(animal: animals[indexPath.row])
        
        //完成したcellを返す
        return cell
    }
    
}
