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
    
    var libelle: String
    var unite: String
    var prix_unitaire: Double
    var stock: Double
    var allergene: Bool
    
    init(libelle: String, unite: String, prix_unitaire: Double, stock: Double, allergene: Bool) {
        self.libelle = libelle
        self.unite = unite
        self.prix_unitaire = prix_unitaire
        self.stock = stock
        self.allergene = allergene
    }
}
