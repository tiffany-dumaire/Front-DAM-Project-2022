//
//  ListIngredientIntent.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import Foundation

enum ListIngredientIntent: Equatable {
    case ready
    case changingListIngredient
    case changedListIngredient
    
    mutating func intentToChange() {
        self = .changingListIngredient
        print("ListIngredientIntent: state changed --> ready to changingListIngredient")
    }
    
    
}
