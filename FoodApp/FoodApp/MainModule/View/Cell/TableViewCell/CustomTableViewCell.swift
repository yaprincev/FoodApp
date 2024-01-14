//
//  CustomTableViewCell.swift
//  FoodApp
//
//  Created by Максим Япринцев on 14.01.2024.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishID: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    static let identifier = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
