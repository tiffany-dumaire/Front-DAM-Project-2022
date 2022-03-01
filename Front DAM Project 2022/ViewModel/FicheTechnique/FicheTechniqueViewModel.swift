//
//  FicheTechniqueViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import Foundation
import SwiftUI

class FicheTechniqueViewModel: ObservableObject {
    private var model: FicheTechniqueModel
    
    @Published var id_fiche_technique: Int
    @Published var libelle_fiche_technique: String
    @Published var nombre_couverts: Int
    @Published var id_responsable: Int
    @Published var intitule_responsable: String
    @Published var id_categorie_fiche: Int
    @Published var phases: [PhaseModel]
    @Published var state: FicheTechniqueIntent = .ready{
        didSet{
            switch state {
                case .ftAdding(let fiche):
                    Task {
                        /*await IngredientDAO.addIngredient(ingredient: ingredient)*/
                        self.state = .ftAdded
                        print("FicheTechniqueIntent: .ftAdding to .ftAdded")
                    }
                case .ftChanging(let fiche):
                   /* self.code = ingredient.code
                    self.libelle = ingredient.libelle
                    self.unite = ingredient.unite
                    self.prix_unitaire = ingredient.prix_unitaire
                    self.stock = ingredient.stock
                    self.allergene = ingredient.allergene
                    self.id_categorie = ingredient.id_categorie
                    self.id_categorie_allergene = id_categorie_allergene*/
                    Task {
                        /*await IngredientDAO.modifyIngredient(ingredient: ingredient)*/
                        self.state = .ftChanged
                        print("FicheTechniqueIntent: .ftChanging to .ftChanged")
                    }
                case .ftDeleting(let id):
                    Task {
                        await FicheTechniqueDAO.deleteFiche(id_fiche_technique: id)
                        self.state = .ftDeleted
                        print("FicheTechniqueIntent: .ftDeleting to .ftDeleted")
                    }
                default:
                    return
            }
        }
    }
    
    init(model: FicheTechniqueModel) {
        self.model = model
        self.id_fiche_technique = model.id_fiche_technique
        self.libelle_fiche_technique = model.libelle_fiche_technique
        self.nombre_couverts = model.nombre_couverts
        self.id_responsable = model.id_responsable
        self.intitule_responsable = model.intitule_responsable
        self.id_categorie_fiche = model.id_categorie_fiche
        self.phases = model.phases
    }
}
