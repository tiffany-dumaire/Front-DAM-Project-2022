//
//  ListIngredientIntent.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import Foundation

enum ListIngredientIntent: CustomStringConvertible, Equatable {
    case ready
    case changingListIngredient
    case changedListIngredient
    
    var description: String{
        switch self {
            case .ready: return "state: .ready"
            case .changingListIngredient: return "state: .ready to .changingListIngredient"
            default: return ""
        }
    }
    
    mutating func intentToChange() {
        self = .changingListIngredient
        print("ListIngredientIntent: .ready to .changingListIngredient")
    }
    
    mutating func endOfIntent() {
        self = .ready
    }
}
