//
//  IngredientModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 11/02/2022.
//

import Foundation

protocol IngredientDelegate {
    func change(libelle: String)
}

struct IngredientModel {
    var observer: IngredientDelegate?
    
    var code: Int
    var libelle: String
    var unite: String
    var prix_unitaire: Double
    var stock: Double
    var allergene: Bool
    var valeurStock: Double {
        return self.stock * self.prix_unitaire
    }
    
    init(code: Int, libelle: String, unite: String, prix_unitaire: Double, stock: Double, allergene: Bool) {
        self.code = code
        self.libelle = libelle
        self.unite = unite
        self.prix_unitaire = prix_unitaire
        self.stock = stock
        self.allergene = allergene
    }
}
