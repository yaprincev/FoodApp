//
//  ModuleBuilder.swift
//  FoodApp
//
//  Created by Максим Япринцев on 14.01.2024.
//

import Foundation
import UIKit
protocol AssemblyBuilderProtocol {
    func createMainModule() -> UIViewController
}


class AssemblyBuilder: AssemblyBuilderProtocol {
    func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetrworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
