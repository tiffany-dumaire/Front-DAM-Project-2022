//
//  IngredientViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 11/02/2022.
//

import Foundation
import SwiftUI

class IngredientViewModel: ObservableObject {
    private var model: IngredientModel
    
    @Published var code: Int
    @Published var libelle: String
    @Published var unite: String
    @Published var prix_unitaire: Double
    @Published var stock: Double
    @Published var allergene: Bool
    @Published var id_categorie: Int
    @Published var id_categorie_allergene: Int?
    
    init(model: IngredientModel) {
        self.model = model
        self.code = model.code
        self.libelle = model.libelle
        self.unite = model.unite
        self.prix_unitaire = model.prix_unitaire
        self.stock = model.stock
        self.allergene = model.allergene
        self.id_categorie = model.id_categorie
    }
}
