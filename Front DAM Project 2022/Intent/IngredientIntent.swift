//
//  IngredientIntent.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 22/02/2022.
//

import Foundation

enum IngredientIntent: CustomStringConvertible, Equatable {
    static func == (lhs: IngredientIntent, rhs: IngredientIntent) -> Bool {
        return lhs.description == rhs.description
    }
    
    case ready
    case ingredientAdding(IngredientModel)
    case ingredientAdded(Int)
    case ingredientChanging(IngredientModel)
    case ingredientChanged
    case ingredientStockModifying(IngredientModel)
    case ingredientStockModified
    case ingredientDeleting(Int)
    case ingredientDeleted
    
    var description: String{
        switch self {
            case .ready: return "state: .ready"
            case .ingredientAdding(let ingredient): return "state: .ingredientAdding(\(ingredient.libelle))"
            case .ingredientChanging(let ingredient): return "state: .ingredientChanging(\(ingredient.libelle))"
            case .ingredientStockModifying(let ingredient): return "state: .ingredientStockModifying(\(ingredient.libelle))"
            case .ingredientDeleting(let code): return "state: .ingredientDeleting(\(code))"
            default: return ""
        }
    }
    
    mutating func intentToChange(ingredientAdd: IngredientModel){
        self = .ingredientAdding(ingredientAdd)
        print("IngredientIntent: .ready to .ingredientAdding")
    }
    
    mutating func intentToChange(ingredientModify: IngredientModel){
        self = .ingredientChanging(ingredientModify)
        print("IngredientIntent: .ready to .ingredientChanging")
    }
    
    mutating func intentToChange(ingredientStockModify: IngredientModel) async {
        self = .ingredientStockModifying(ingredientStockModify)
        print("IngredientIntent: .ready to .ingredientStockModifying")
    }
    
    mutating func intentToChange(ingredientDeleting: Int){
        self = .ingredientDeleting(ingredientDeleting)
        print("IngredientIntent: .ready to .ingredientDeleting")
    }
    
}
