//
//  TicketModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 05/03/2022.
//

import Foundation

struct IngredientTicketModel: Equatable {
    var code: Int
    var libelle: String
    var unite: String
    var allergene: Bool
    var quantite_ingredient: Double
    
    init(code: Int, libelle: String, unite: String, allergene: Bool, quantite_ingredient: Double) {
        self.code = code
        self.libelle = libelle
        self.unite = unite
        self.allergene = allergene
        self.quantite_ingredient = quantite_ingredient
    }
}

struct TicketModel {
    var id_fiche_technique: Int
    var libelle_fiche_technique: String
    var nombre_couverts: Int
    var quantite_fiche: Int
    var ingredients: [IngredientTicketModel]
    
    init(id_fiche_technique: Int, libelle_fiche_technique: String, nombre_couverts: Int, quantite_fiche: Int, ingredients: [IngredientTicketModel]) {
        self.id_fiche_technique = id_fiche_technique
        self.libelle_fiche_technique = libelle_fiche_technique
        self.nombre_couverts = nombre_couverts
        self.quantite_fiche = quantite_fiche
        self.ingredients = ingredients
    }
}
