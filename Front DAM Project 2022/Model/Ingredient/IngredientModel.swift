//
//  IngredientModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 11/02/2022.
//

import Foundation

protocol IngredientObserver{
   func changed(libelle: String)
   func changed(unite: String)
    func changed(prix_unitaire: Double)
    func changed(stock: Double)
    func changed(allergene: Bool)
    func changed(id_categorie: Int)
    func changed(id_categorie_allergene: Int?)
    func changed(valeurStock: Double)
}

struct IngredientModel: Equatable {
    static func == (lhs: IngredientModel, rhs: IngredientModel) -> Bool {
        return lhs.code == rhs.code
    }
    
    var observer : IngredientObserver?
    
    var code: Int
    
    var libelle: String {
        didSet{
            if self.libelle != oldValue {
                if self.libelle != "" {
                    self.observer?.changed(libelle: self.libelle)
                } else {
                    self.libelle = oldValue
                }
            }
        }
    }
    
    var unite: String{
        didSet{
            if self.unite != oldValue {
                if self.unite != "" {
                    self.observer?.changed(unite: self.unite)
                } else {
                    self.unite = oldValue
                }
            }
        }
    }
    
    var prix_unitaire: Double {
        didSet{
            if self.prix_unitaire != oldValue {
                if self.prix_unitaire < 0 {
                    self.observer?.changed(prix_unitaire: 0)
                } else {
                    self.observer?.changed(prix_unitaire: self.prix_unitaire)
                }
                self.observer?.changed(valeurStock: self.valeurStock)
            }
        }
    }
    
    var stock: Double {
        didSet{
            if self.stock != oldValue {
                if self.stock < 0 {
                    self.observer?.changed(stock: 0)
                } else {
                    self.observer?.changed(stock: self.stock)
                }
                self.observer?.changed(valeurStock: self.valeurStock)
            }
        }
    }
    
    var allergene: Bool {
        didSet {
            if self.allergene != oldValue {
                if self.allergene && self.id_categorie_allergene != nil {
                    self.observer?.changed(allergene: self.allergene)
                } else {
                    if !self.allergene {
                        self.observer?.changed(id_categorie_allergene: nil)
                    } else {
                        self.allergene = oldValue
                    }
                }
            }
        }
    }
    
    var id_categorie: Int {
        didSet {
            if self.id_categorie != oldValue {
                self.observer?.changed(id_categorie: self.id_categorie)
            }
        }
    }
    
    var id_categorie_allergene: Int? {
        didSet {
            if self.id_categorie_allergene != oldValue {
                self.observer?.changed(id_categorie_allergene: self.id_categorie_allergene)
            }
        }
    }
    
    var valeurStock: Double {
        return self.stock * self.prix_unitaire
    }
    
    init(code: Int, libelle: String, unite: String, prix_unitaire: Double, stock: Double, allergene: Bool, id_categorie: Int, id_categorie_allergene: Int?) {
        self.code = code
        self.libelle = libelle
        self.unite = unite
        self.prix_unitaire = prix_unitaire
        self.stock = stock
        self.allergene = allergene
        self.id_categorie = id_categorie
        self.id_categorie_allergene = id_categorie_allergene
    }
}

struct IngredientInStepModel: Equatable {
    var id_phase_ingredient: Int
    var code: Int
    var libelle: String
    var unite: String
    var prix_unitaire: Double
    var allergene: Bool
    var quantite: Double
    
    init(id_phase_ingredient: Int, code: Int, libelle: String, unite: String, prix_unitaire: Double, allergene: Bool, quantite: Double) {
        self.id_phase_ingredient = id_phase_ingredient
        self.code = code
        self.libelle = libelle
        self.unite = unite
        self.prix_unitaire = prix_unitaire
        self.allergene = allergene
        self.quantite = quantite
    }
}
