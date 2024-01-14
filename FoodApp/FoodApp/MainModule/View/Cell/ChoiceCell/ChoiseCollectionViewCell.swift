//
//  ChoiseCollectionViewCell.swift
//  FoodApp
//
//  Created by Максим Япринцев on 13.01.2024.
//

import UIKit

class ChoiseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var choiseButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
}

extension ChoiseCollectionViewCell {
    func configureAppearance() {
        choiseButton.sizeToFit()
        choiseButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4), for: .normal)
        choiseButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1.0), for: .selected)
        choiseButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4), for: .highlighted)
        choiseButton.setBackgroundImage(UIImage(named: "BackgroundColor"), for: .selected)
        choiseButton.backgroundColor = .white
        choiseButton.layer.borderWidth = 1
        choiseButton.layer.borderColor = CGColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4)
        choiseButton.layer.cornerRadius = 15
    }
}
