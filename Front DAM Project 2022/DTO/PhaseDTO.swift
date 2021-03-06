//
//  PhaseDTO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 23/02/2022.
//

import Foundation
import UIKit

struct PhaseDTO: Codable {
    var id_phase: Int
    var id_phase_ft: Int
    var libelle_phase: String
    var libelle_denrees: String
    var description_phase: String
    var duree_phase: Int
    var ordre: Int
    var ingredients: [IngredientInStepDTO]
    
    init(id_phase: Int, id_phase_ft: Int, libelle_phase: String, libelle_denrees: String, description_phase: String, duree_phase: Int, ordre: Int, ingredients: [IngredientInStepDTO]) {
        self.id_phase = id_phase
        self.id_phase_ft = id_phase_ft
        self.libelle_phase = libelle_phase
        self.libelle_denrees = libelle_denrees
        self.description_phase = description_phase
        self.duree_phase = duree_phase
        self.ordre = ordre
        self.ingredients = ingredients
    }
}

struct PhaseInfosDTO: Codable {
    var libelle_phase: String
    var libelle_denrees: String
    var description_phase: String
    var duree_phase: Int
    
    init(libelle_phase: String, libelle_denrees: String, description_phase: String, duree_phase: Int) {
        self.libelle_phase = libelle_phase
        self.libelle_denrees = libelle_denrees
        self.description_phase = description_phase
        self.duree_phase = duree_phase
    }
}

struct PhaseOrdreDTO: Codable {
    var id_phase: Int
    var id_fiche_technique: Int
    var ordre: Int
    
    init(id_phase: Int, id_fiche_technique: Int, ordre: Int) {
        self.id_phase = id_phase
        self.id_fiche_technique = id_fiche_technique
        self.ordre = ordre
    }
}
