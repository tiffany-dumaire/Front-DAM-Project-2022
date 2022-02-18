//
//  FicheTechniqueDTO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 18/02/2022.
//

import Foundation

struct FicheTechniqueDTO: Codable {
    var id_fiche_technique: Int
    var libelle_fiche_technique: String
    var nombre_couverts: Int
    var id_responsable: Int
    var intitule_responsable: String
    var id_categorie_fiche: Int
    
    init(id_fiche_technique: Int, libelle_fiche_technique: String, nombre_couverts: Int, id_responsable: Int, intitule_responsable: String, id_categorie_fiche: Int) {
        self.id_fiche_technique = id_fiche_technique
        self.libelle_fiche_technique = libelle_fiche_technique
        self.nombre_couverts = nombre_couverts
        self.id_responsable = id_responsable
        self.intitule_responsable = intitule_responsable
        self.id_categorie_fiche = id_categorie_fiche
    }
}
