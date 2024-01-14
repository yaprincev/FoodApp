//
//  NetworkService.swift
//  FoodApp
//
//  Created by Максим Япринцев on 14.01.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func getDishes(dishCategory: String, completion: @escaping (Result<[Dish]?, Error>) -> Void)
}


class NetrworkService: NetworkServiceProtocol {

    
    let sessionConfiguration = URLSessionConfiguration.default
    let decoder = JSONDecoder()
    let session = URLSession.shared
    
    
    func getDishes(dishCategory: String, completion: @escaping (Result<[Dish]?, Error>) -> Void) {
        guard let url = URL(string: "www.themealdb.com/api/json/v1/1/filter.php?c=\(dishCategory)") else { return }
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try self.decoder.decode([Dish].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
