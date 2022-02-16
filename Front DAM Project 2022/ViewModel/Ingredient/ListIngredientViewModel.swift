//
//  ListIngredientViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import Foundation
import SwiftUI

class ListIngredientViewModel: ObservableObject {
    @Published var ingredients: [IngredientModel]
    
    init(_ ingredients: [IngredientModel]) {
        self.ingredients = ingredients
    }
}
