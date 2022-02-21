//
//  ListCategoriesViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import Foundation
import SwiftUI

class ListCategorieIngredientViewModel: ObservableObject {
    private var model: ListCategorieIngredientModel
    @Published var categories: [CategorieIngredientModel]
    
    init(_ categories: [CategorieIngredientModel]) {
        self.categories = categories
        self.model = ListCategorieIngredientModel(categories)
    }
}

class ListCategorieAllergeneViewModel: ObservableObject {
    private var model: ListCategorieAllergeneModel
    @Published var categories: [CategorieAllergeneModel]
    
    init(_ categories: [CategorieAllergeneModel]) {
        self.categories = categories
        self.model = ListCategorieAllergeneModel(categories)
    }
}
