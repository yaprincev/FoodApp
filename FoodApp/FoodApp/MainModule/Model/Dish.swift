//
//  Dish.swift
//  FoodApp
//
//  Created by Максим Япринцев on 14.01.2024.
//

import Foundation

struct DishResponse: Codable{
    var meals: [Dish]
}

struct Dish: Codable {
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}
