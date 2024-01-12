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
}

class MainPresenter: MainViewPresenterProtocol {
    
}
