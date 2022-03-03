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
    case phaseAdding(PhaseModel)
    case phaseAdded
    case phaseModifying(PhaseModel)
    case phaseModified
    case ordreModifying(PhaseModel)
    case ordreModified
    case phaseDeleting(Int)
    case phaseDeleted
    case ftDeleting(Int)
    case ftDeleted
    
    var description: String{
        switch self {
            case .ready: return "state: .ready"
            case .ftAdding(let fiche): return "state: .ftAdding(\(fiche.libelle_fiche_technique))"
            case .ftChanging(let fiche): return "state: .ftChanging(\(fiche.libelle_fiche_technique))"
            case .phaseAdding(let phase): return "state: .phaseAdding(\(phase.libelle_phase))"
            case .phaseDeleting(let id_fiche_FT): return "state: .phaseDeleting(\(id_fiche_FT)"
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
    
    mutating func intentToChange(phaseAdd: PhaseModel){
        self = .phaseAdding(phaseAdd)
        print("FicheTechniqueIntent: .ready to .phaseAdding")
    }
    
    mutating func intentToChange(phaseModify: PhaseModel){
        self = .phaseModifying(phaseModify)
        print("FicheTechniqueIntent: .ready to .phaseModifying")
    }
    
    mutating func intentToChange(phaseDelete: Int){
        self = .phaseDeleting(phaseDelete)
        print("FicheTechniqueIntent: .ready to .phaseDeleting")
    }
    
    mutating func intentToChange(ficheDelete: Int){
        self = .ftDeleting(ficheDelete)
        print("FicheTechniqueIntent: .ready to .ftDeleting")
    }
    
}
