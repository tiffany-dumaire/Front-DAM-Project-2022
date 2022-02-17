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
    
    init(id_fiche_technique: Int, libelle_fiche_technique: String, nombre_couverts: Int) {
        self.id_fiche_technique = id_fiche_technique
        self.libelle_fiche_technique = libelle_fiche_technique
        self.nombre_couverts = nombre_couverts
    }
}
