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
    
    init(model: FicheTechniqueModel) {
        self.model = model
        self.id_fiche_technique = model.id_fiche_technique
        self.libelle_fiche_technique = model.libelle_fiche_technique
        self.nombre_couverts = model.nombre_couverts
    }
}
