//
//  ParameterModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import Foundation
import SwiftUI

class ParameterModel {
    var id_parameters: Int
    var libelle_parameters: String
    var value: Double
    var value2: Double
    var utile: Bool
    
    init(id_parameters: Int, libelle_parameters: String, value: Double, value2: Double, utile: Bool){
        self.id_parameters = id_parameters
        self.libelle_parameters = libelle_parameters
        self.value = value
        self.value2 = value2
        self.utile = utile
    }
}

class ParametersModel {
    var parameters: [ParameterModel]
    
    init(parameters: [ParameterModel]) {
        self.parameters = parameters
    }
}
