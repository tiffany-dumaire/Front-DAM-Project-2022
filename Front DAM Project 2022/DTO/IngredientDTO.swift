//
//  IngredientDTO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import Foundation
import SwiftUI

struct IngredientStockDTO: Codable {
    var code: Int
    var libelle: String
    var stock: Double
    
    init(code: Int, libelle: String, stock: Double) {
        self.code = code
        self.libelle = libelle
        self.stock = stock
    }
}

struct IngredientStocksDTO: Codable {
    var stocks: [IngredientStockDTO]
    
    init(stocks: [IngredientStockDTO]) {
        self.stocks = stocks
    }
}

