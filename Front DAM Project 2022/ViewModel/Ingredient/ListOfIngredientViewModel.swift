//
//  ListOfIngredientViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 28/02/2022.
//

import Foundation

class ListOfIngredientViewModel: ObservableObject {
    private var model: ListIngredientViewModel
    @Published var ingredients: [IngredientViewModel]
    
    init(_ ingredients: ListIngredientViewModel) {
        var listIngredients: [IngredientViewModel] = []
        for i in ingredients.ingredients {
            listIngredients.append(IngredientViewModel(model: i))
        }
        self.ingredients = listIngredients
        self.model = ingredients
    }
}
