//
//  ParameterModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import Foundation
import SwiftUI

class ParameterModel: ObservableObject {
    @Published var libelle_parameters: String
    @Published var value: Double
    @Published var value2: Double
    @Published var utile: Bool
    
    init(libelle_parameters: String, value: Double, value2: Double, utile: Bool){
        self.libelle_parameters = libelle_parameters
        self.value = value
        self.value2 = value2
        self.utile = utile
    }
}

class ParametersModel: ObservableObject {
    @Published var parameters: [ParameterModel]
    
    init(parameters: [ParameterModel]) {
        self.parameters = parameters
    }
}
