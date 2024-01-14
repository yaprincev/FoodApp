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
    func getDishes()
    var dishes: [Dish]? { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var dishes: [Dish]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getDishes()
    }
    
    func getDishes() {
        networkService.getDishes() { [weak self] result in
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
