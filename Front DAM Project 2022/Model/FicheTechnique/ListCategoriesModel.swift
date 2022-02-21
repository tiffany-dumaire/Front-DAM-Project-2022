//
//  ListCategoriesModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import Foundation

struct ListCategorieFicheModel {
    var categories: [CategorieFTModel]
    
    init(_ categories: [CategorieFTModel]) {
        self.categories = categories
    }
}

struct ListCategorieIngredientModel {
    var categories: [CategorieIngredientModel]
    
    init(_ categories: [CategorieIngredientModel]) {
        self.categories = categories
    }
}

struct ListCategorieAllergeneModel {
    var categories: [CategorieAllergeneModel]
    
    init(_ categories: [CategorieAllergeneModel]) {
        self.categories = categories
    }
}
