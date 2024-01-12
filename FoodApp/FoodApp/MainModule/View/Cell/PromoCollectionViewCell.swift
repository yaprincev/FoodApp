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
        imageCell.layer.cornerRadius = 20
        imageCell.clipsToBounds = true
        imageCell.translatesAutoresizingMaskIntoConstraints = false
     //   imageCell.frame = CGRect(origin: imageCell.frame.origin, size: CGSize(width: 350, height: 100))
     
    }
    

}
