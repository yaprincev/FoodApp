//
//  PromoCollectionViewCell.swift
//  FoodApp
//
//  Created by Максим Япринцев on 12.01.2024.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
}

extension PromoCollectionViewCell {
    func configureAppearance() {
        imageCell.layer.cornerRadius = 20
        imageCell.clipsToBounds = true
        imageCell.translatesAutoresizingMaskIntoConstraints = false
    }
}
