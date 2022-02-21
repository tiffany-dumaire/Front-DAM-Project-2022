//
//  ListCategorieFTViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import Foundation
import SwiftUI

class ListCategorieFTViewModel: ObservableObject {
    private var model: ListCategorieFicheModel
    @Published var categories: [CategorieFTModel]
    
    init(_ categories: [CategorieFTModel]) {
        self.categories = categories
        self.model = ListCategorieFicheModel(categories)
    }
}
