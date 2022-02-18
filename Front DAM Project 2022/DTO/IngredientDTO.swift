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

struct IngredientDTO: Codable {
    var code: Int
    var libelle: String
    var unite: String
    var prix_unitaire: Double
    var stock: Double
    var allergene: Int
    
    init(code: Int, libelle: String, unite: String, prix_unitaire: Double, stock: Double, allergene: Int) {
        self.code = code
        self.libelle = libelle
        self.unite = unite
        self.prix_unitaire = prix_unitaire
        self.stock = stock
        self.allergene = allergene
    }
}

struct IngredientStocksDTO: Codable {
    var stocks: [IngredientStockDTO]
    
    init(stocks: [IngredientStockDTO]) {
        self.stocks = stocks
    }
}

