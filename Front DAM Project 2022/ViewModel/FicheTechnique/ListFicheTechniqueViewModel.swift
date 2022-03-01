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
    @Published var state: ListFicheTechniqueIntent = .ready {
        didSet {
            switch state {
                case .changingListFT:
                    Task {
                        self.model = await FicheTechniqueDAO.loadFTsDatas()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.fiches = self.model
                        }
                    }
                    self.state = .changedListFT
                    print("ListIngredientIntent: .changingListFT to .changedListFT")
                default:
                    return
            }
        }
    }
    
    init(_ fiches: [FicheTechniqueModel]) {
        self.fiches = fiches
        self.model = fiches
    }
}
