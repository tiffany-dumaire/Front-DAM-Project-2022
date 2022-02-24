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
    var id_categorie: Int
    var id_categorie_allergene: Int?
    
    init(code: Int, libelle: String, unite: String, prix_unitaire: Double, stock: Double, allergene: Int, id_categorie: Int, id_categorie_allergene: Int?) {
        self.code = code
        self.libelle = libelle
        self.unite = unite
        self.prix_unitaire = prix_unitaire
        self.stock = stock
        self.allergene = allergene
        self.id_categorie = id_categorie
        self.id_categorie_allergene = id_categorie_allergene
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(code, forKey: .code)
        try container.encode(libelle, forKey: .libelle)
        try container.encode(unite, forKey: .unite)
        try container.encode(prix_unitaire, forKey: .prix_unitaire)
        try container.encode(stock, forKey: .stock)
        try container.encode(allergene, forKey: .allergene)
        try container.encode(id_categorie, forKey: .id_categorie)
        if id_categorie_allergene != nil {
            try container.encode(id_categorie_allergene, forKey: .id_categorie_allergene)
        } else {
            try container.encodeNil(forKey: .id_categorie_allergene)
        }
        
    }
}

struct IngredientInStepDTO: Codable {
    var id_phase_ingredient: Int
    var code: Int
    var libelle: String
    var unite: String
    var prix_unitaire: Double
    var allergene: Int
    var quantite: Double
    
    init(id_phase_ingredient: Int, code: Int, libelle: String, unite: String, prix_unitaire: Double, allergene: Int, quantite: Double) {
        self.id_phase_ingredient = id_phase_ingredient
        self.code = code
        self.libelle = libelle
        self.unite = unite
        self.prix_unitaire = prix_unitaire
        self.allergene = allergene
        self.quantite = quantite
    }
}

struct IngredientStocksDTO: Codable {
    var stocks: [IngredientStockDTO]
    
    init(stocks: [IngredientStockDTO]) {
        self.stocks = stocks
    }
}

