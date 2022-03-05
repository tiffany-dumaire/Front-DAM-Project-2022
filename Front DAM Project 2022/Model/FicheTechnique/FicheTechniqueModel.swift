//
//  FicheTechniqueModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import Foundation

struct FicheTechniqueModel {    
    var id_fiche_technique: Int
    var libelle_fiche_technique: String
    var nombre_couverts: Int
    var id_responsable: Int
    var intitule_responsable: String
    var id_categorie_fiche: Int
    var phases: [PhaseModel]
    
    init(id_fiche_technique: Int, libelle_fiche_technique: String, nombre_couverts: Int, id_responsable: Int, intitule_responsable: String, id_categorie_fiche: Int, phases: [PhaseModel]) {
        self.id_fiche_technique = id_fiche_technique
        self.libelle_fiche_technique = libelle_fiche_technique
        self.nombre_couverts = nombre_couverts
        self.id_responsable = id_responsable
        self.intitule_responsable = intitule_responsable
        self.id_categorie_fiche = id_categorie_fiche
        self.phases = phases
    }
    
    public func ftToTicket() -> TicketModel {
        var ingredientsList: [IngredientTicketModel] = []
        for phase in self.phases {
            for ingredient in phase.ingredients {
                if ingredientsList.contains(where: { $0.code == ingredient.code }) {
                    if let i: Int = ingredientsList.firstIndex(where: { $0.code == ingredient.code }) {
                        ingredientsList[i].quantite_ingredient += ingredient.quantite
                    }
                } else {
                    ingredientsList.append(IngredientTicketModel(code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, allergene: ingredient.allergene, quantite_ingredient: ingredient.quantite))
                }
            }
        }
        ingredientsList = ingredientsList.sorted(by: {
            $0.libelle < $1.libelle
        })
        return TicketModel(id_fiche_technique: self.id_fiche_technique, libelle_fiche_technique: self.libelle_fiche_technique, nombre_couverts: self.nombre_couverts, quantite_fiche: 1, ingredients: ingredientsList)
    }
}

struct ResponsableModel {
    var id_responsable: Int
    var intitule_responsable: String
    
    init(id_responsable: Int, intitule_responsable: String) {
        self.id_responsable = id_responsable
        self.intitule_responsable = intitule_responsable
    }
}
