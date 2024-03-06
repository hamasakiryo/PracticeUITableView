//
//  CustomTableViewCell.swift
//  PracticeTableView
//
//  Created by 浜崎良 on 2024/03/06.
//

import UIKit

class AnimalImageCell: UITableViewCell {
    @IBOutlet weak private var iconImageView: UIImageView!
    @IBOutlet weak private var label: UILabel!
    
    //セルの内容を構成するメソッド
    func configure(animal: Animal) {
        iconImageView.image = UIImage(named: animal.imageName)
        label.text = animal.name
    }
}
