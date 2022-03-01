//
//  FicheTechniqueIntent.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 01/03/2022.
//

import Foundation

enum FicheTechniqueIntent: CustomStringConvertible, Equatable {
    static func == (lhs: FicheTechniqueIntent, rhs: FicheTechniqueIntent) -> Bool {
        return lhs.description == rhs.description
    }
    
    case ready
    case ftAdding(FicheTechniqueModel)
    case ftAdded
    case ftChanging(FicheTechniqueModel)
    case ftChanged
    case ftDeleting(Int)
    case ftDeleted
    
    var description: String{
        switch self {
            case .ready: return "state: .ready"
            case .ftAdding(let fiche): return "state: .ftAdding(\(fiche.libelle_fiche_technique))"
            case .ftChanging(let fiche): return "state: .ftChanging(\(fiche.libelle_fiche_technique))"
            case .ftDeleting(let id_fiche_technique): return "state: .ftDeleting(\(id_fiche_technique))"
            default: return ""
        }
    }
    
    mutating func intentToChange(ficheAdd: FicheTechniqueModel){
        self = .ftAdding(ficheAdd)
        print("FicheTechniqueIntent: .ready to .ftAdding")
    }
    
    mutating func intentToChange(ficheModify: FicheTechniqueModel){
        self = .ftChanging(ficheModify)
        print("FicheTechniqueIntent: .ready to .ftChanging")
    }
    
    mutating func intentToChange(ficheDelete: Int){
        self = .ftDeleting(ficheDelete)
        print("FicheTechniqueIntent: .ready to .ftDeleting")
    }
    
}
