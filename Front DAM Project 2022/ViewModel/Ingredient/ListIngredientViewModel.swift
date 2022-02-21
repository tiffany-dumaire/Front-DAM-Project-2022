//
//  ListIngredientViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import Foundation
import SwiftUI

class ListIngredientViewModel: ObservableObject {
    private var model: ListIngredientModel
    @Published var ingredients: [IngredientModel]
    @Published var state: ListIngredientIntent = .ready {
        didSet {
            switch state {
                case .changingListIngredient:
                    self.model.ingredients = self.ingredients
                    self.state = .changedListIngredient
                default:
                    return
            }
        }
    }
    
    init(_ ingredients: [IngredientModel]) {
        self.ingredients = ingredients
        self.model = ListIngredientModel(ingredients)
    }
}
