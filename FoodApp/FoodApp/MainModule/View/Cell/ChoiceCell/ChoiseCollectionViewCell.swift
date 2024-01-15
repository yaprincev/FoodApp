//
//  ChoiseCollectionViewCell.swift
//  FoodApp
//
//  Created by Максим Япринцев on 13.01.2024.
//

import UIKit


class ChoiseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    @IBOutlet weak var choiseButton: UIButton!
    
    // MARK: - Events
    
    var buttonTapHandler: (() -> Void)?
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Actions
    
    @IBAction func choiseButtonAction(_ sender: Any) {
        buttonTapHandler?()
    }
}

extension ChoiseCollectionViewCell {
    
    func configureAppearance() {
        choiseButton.sizeToFit()
        choiseButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4), for: .normal)
        choiseButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4), for: .highlighted)
        choiseButton.backgroundColor = .white
        choiseButton.layer.borderWidth = 1
        choiseButton.layer.borderColor = CGColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4)
        choiseButton.layer.cornerRadius = 15
        choiseButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight(400))
    }
    func configureTappedAppearance() {
        choiseButton.sizeToFit()
        choiseButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1), for: .normal)
        choiseButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1), for: .highlighted)
        choiseButton.backgroundColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.2)
        choiseButton.layer.borderWidth = 1
        choiseButton.layer.borderColor = CGColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4)
        choiseButton.layer.cornerRadius = 15
        choiseButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight(700))
    }
    
}
