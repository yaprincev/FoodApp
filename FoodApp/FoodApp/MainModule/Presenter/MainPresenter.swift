//
//  MainPresenter.swift
//  FoodApp
//
//  Created by Максим Япринцев on 12.01.2024.
//

import Foundation

protocol MainViewProtocol: AnyObject { // output
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject { // input
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getDishes(forCategory category: String)
    var dishes: [Dish]? { get set }
    var categories: [String] { get set}
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var dishes: [Dish]?
    var categories: [String] = ["Beef", "Chicken", "Desert", "Pasta", "Vegetarian", "Breakfast"]
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        categories.forEach { category in
            getDishes(forCategory: category)
        }
    }
    
    func getDishes(forCategory category: String) {
        networkService.getDishes(dishCategory: category) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let dishes):
                self.dishes = dishes
                self.view?.success()
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
}
