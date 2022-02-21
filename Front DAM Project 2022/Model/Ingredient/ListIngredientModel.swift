//
//  ListIngredientModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import Foundation

struct ListIngredientModel {
    var ingredients: [IngredientModel]
    
    init(_ ingredients: [IngredientModel]) {
        self.ingredients = ingredients
    }
}
