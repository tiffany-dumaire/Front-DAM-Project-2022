//
//  ParametersViewModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import Foundation

import Foundation
import SwiftUI

class ParametersViewModel: ObservableObject {
    @Published var parameters: [ParameterModel]
    
    init(_ parameters: [ParameterModel]) {
        self.parameters = parameters
    }
}
