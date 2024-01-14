//
//  ImageLoader.swift
//  FoodApp
//
//  Created by Максим Япринцев on 14.01.2024.
//

import Foundation
import UIKit

extension UIImageView {

    func loadImage(from url: URL) {
        ImageLoader().loadImage(from: url) { [weak self] result in
            if case let .success(image) = result {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
