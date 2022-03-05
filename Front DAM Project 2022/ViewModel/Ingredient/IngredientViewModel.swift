//
//  IngredientViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 11/02/2022.
//

import Foundation
import SwiftUI

class IngredientViewModel: ObservableObject, IngredientObserver {
    
    private var model: IngredientModel
    
    @Published var code: Int
    @Published var libelle: String
    @Published var unite: String
    @Published var prix_unitaire: Double
    @Published var stock: Double
    @Published var allergene: Bool
    @Published var id_categorie: Int
    @Published var id_categorie_allergene: Int?
    
    @Published var state: IngredientIntent = .ready{
        didSet{
            switch state {
                case .ingredientAdding(let ingredient):
                    Task {
                        await IngredientDAO.addIngredient(ingredient: ingredient)
                        self.state = .ingredientAdded
                        print("IngredientIntent: .ingredientAdding to .ingredientAdded")
                    }
                case .ingredientChanging(let ingredient):
                    self.code = ingredient.code
                    self.libelle = ingredient.libelle
                    self.unite = ingredient.unite
                    self.prix_unitaire = ingredient.prix_unitaire
                    self.stock = ingredient.stock
                    self.allergene = ingredient.allergene
                    self.id_categorie = ingredient.id_categorie
                    self.id_categorie_allergene = id_categorie_allergene
                    Task {
                        await IngredientDAO.modifyIngredient(ingredient: ingredient)
                        self.state = .ingredientChanged
                        print("IngredientIntent: .ingredientChanging to .ingredientChanged")
                    }
                case .ingredientStockModifying(let ingredient):
                    self.stock = ingredient.stock
                    Task {
                        await IngredientDAO.modifyStock(ingredient: ingredient)
                        self.state = .ingredientStockModified
                        print("IngredientIntent: .ingredientStockModifying to .ingredientStockModified")
                    }
                case .ingredientDeleting(let code):
                    Task {
                        await IngredientDAO.deleteIngredient(code: code)
                        self.state = .ingredientDeleted
                        print("IngredientIntent: .ingredientDeleting to .ingredientDeleted")
                    }
                default:
                    return
            }
        }
    }
    
    init(model: IngredientModel) {
        self.code = model.code
        self.libelle = model.libelle
        self.unite = model.unite
        self.prix_unitaire = model.prix_unitaire
        self.stock = model.stock
        self.allergene = model.allergene
        self.id_categorie = model.id_categorie
        self.id_categorie_allergene = model.id_categorie_allergene
        self.model = model
    }
    
    func reset() {
        self.code = self.model.code
        self.libelle = self.model.libelle
        self.unite = self.model.unite
        self.prix_unitaire = self.model.prix_unitaire
        self.stock = self.model.stock
        self.allergene = self.model.allergene
        self.id_categorie = self.model.id_categorie
        self.id_categorie_allergene = self.model.id_categorie_allergene
    }
    
    func changed(libelle: String) {
        self.libelle = libelle
    }
    
    func changed(unite: String) {
        self.unite = unite
    }
    
    func changed(prix_unitaire: Double) {
        self.prix_unitaire = prix_unitaire
    }
    
    func changed(stock: Double) {
        self.stock = stock
    }
    
    func changed(allergene: Bool) {
        self.allergene = allergene
    }
    
    func changed(id_categorie: Int) {
        self.id_categorie = id_categorie
    }
    
    func changed(id_categorie_allergene: Int?) {
        self.id_categorie_allergene = id_categorie_allergene
    }
    
    func changed(valeurStock: Double) {}
}
