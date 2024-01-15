//
//  NetworkService.swift
//  FoodApp
//
//  Created by Максим Япринцев on 14.01.2024.
//

import Foundation

// MARK: - Network protocol

protocol NetworkServiceProtocol {
    func getDishes(completion: @escaping (Result<[Dish]?, Error>) -> Void)
}

// MARK: - Network service


class NetrworkService: NetworkServiceProtocol {

    let sessionConfiguration = URLSessionConfiguration.default
    let decoder = JSONDecoder()
    let session = URLSession.shared

    func getDishes(completion: @escaping (Result<[Dish]?, Error>) -> Void) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Beef") else { return }
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let response = try self.decoder.decode(DishResponse.self, from: data!)
                completion(.success(response.meals))
                
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
