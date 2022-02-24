//
//  ListFicheTechniqueViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import Foundation
import SwiftUI

class ListFicheTechniqueViewModel: ObservableObject {
    private var model: [FicheTechniqueModel]
    @Published var fiches: [FicheTechniqueModel]
    
    init(_ fiches: [FicheTechniqueModel]) {
        self.fiches = fiches
        self.model = fiches
    }
}
