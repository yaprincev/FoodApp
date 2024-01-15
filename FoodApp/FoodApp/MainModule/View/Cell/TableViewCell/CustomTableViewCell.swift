//
//  CustomTableViewCell.swift
//  FoodApp
//
//  Created by Максим Япринцев on 14.01.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifier = "CustomTableViewCell"
    
    
    // MARK: - Views
    
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishID: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    
    // MARK: - UITableViewCell
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - Private Methods

private extension CustomTableViewCell {
    
    func configureAppearance() {
        dishName.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight(600))
        dishName.textColor = UIColor(red: 34/255, green: 40/255, blue: 49/255, alpha: 1.0)
        dishID.text = "Dish ID: "
        dishID.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight(400))
        dishID.textColor = UIColor(red: 170/255, green: 170/255, blue: 173/255, alpha: 1.0)
        dishImage.layer.cornerRadius = 15
        priceButton.backgroundColor = .white
        priceButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1.0), for: .normal)
        priceButton.setTitleColor(UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1.0), for: .highlighted)
        priceButton.layer.cornerRadius = 6
        priceButton.layer.borderWidth = 1
        priceButton.layer.borderColor = CGColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 1.0)
        let price = randomPrice(in: 200...350)
        priceButton.setTitle(price, for: .normal)
        priceButton.setTitle(price, for: .highlighted)
    }
    
    func randomPrice(in range: ClosedRange<Int>) -> String {
        return "от " + String(Int.random(in: range)) + " р"
    }
}

