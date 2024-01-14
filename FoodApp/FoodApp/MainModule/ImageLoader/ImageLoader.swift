//
//  ImageLoader.swift
//  FoodApp
//
//  Created by Максим Япринцев on 14.01.2024.
//

import Foundation
import UIKit

struct ImageLoader {
    let queueForLoad = DispatchQueue.global(qos: .utility)
    let session = URLSession(configuration: .default)

    func loadImage(from url: URL, _ onLoadWasCompleted: @escaping (_ result: Result<UIImage, Error>) -> Void) {
        session.dataTask(with: url) { data, _, error in
            if let error = error {
                onLoadWasCompleted(.failure(error))
            }
            if let data = data, let image = UIImage(data: data) {
                onLoadWasCompleted(.success(image))
            }
        }
        .resume()
    }
     
}
