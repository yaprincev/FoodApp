//
//  PromoCollectionViewCell.swift
//  FoodApp
//
//  Created by Максим Япринцев on 12.01.2024.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {

    // MARK: - Views
    
    @IBOutlet weak var imageCell: UIImageView!
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
}

// MARK: - Private Methods

private extension PromoCollectionViewCell {
    func configureAppearance() {
        imageCell.layer.cornerRadius = 20
        imageCell.clipsToBounds = true
        imageCell.translatesAutoresizingMaskIntoConstraints = false
    }
}
