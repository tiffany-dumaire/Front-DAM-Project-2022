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
    case phaseAdded(Int)
    case phaseModifying(PhaseModel)
    case phaseModified
    case ordreModifying(PhaseModel)
    case ordreModified
    case phaseDeleting(Int)
    case phaseDeleted
    case ingredientAdding(Int, IngredientInStepModel)
    case ingredientAdded
    case ingredientDeleting(Int, Int)
    case ingredientDeleted
    case quantityModifying(IngredientInStepModel)
    case quantityModified
    case ftDeleting(Int)
    case ftDeleted
    
    var description: String{
        switch self {
            case .ready: return "state: .ready"
            case .ftAdding(let fiche): return "state: .ftAdding(\(fiche.libelle_fiche_technique))"
            case .ftChanging(let fiche): return "state: .ftChanging(\(fiche.libelle_fiche_technique))"
            case .phaseAdding(let phase): return "state: .phaseAdding(\(phase.libelle_phase))"
            case .phaseModifying(let phase): return "state: .phaseAdding(\(phase.libelle_phase))"
            case .ordreModifying(let phase): return "state: .phaseAdding(\(phase.libelle_phase))"
            case .phaseDeleting(let id_fiche_FT): return "state: .phaseDeleting(\(id_fiche_FT)"
            case .ingredientAdding(let phase, let ingredient): return "state: .ingredientAdding(\(ingredient.libelle)) to \(phase)"
            case .ingredientDeleting(let id_phase, let id_phase_ingredient): return "state: .ingredientDeleting(\(id_phase_ingredient) to \(id_phase)"
            case .quantityModifying(let ingredient): return "state: .quantityModifying(\(ingredient.libelle))"
            case .ftDeleting(let id_fiche_technique): return "state: .ftDeleting(\(id_fiche_technique))"
            default: return "state: done"
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
    
    mutating func intentToChange(ordreModify: PhaseModel){
        self = .ordreModifying(ordreModify)
        print("FicheTechniqueIntent: .ready to .ordreModifying")
    }
    
    mutating func intentToChange(phaseDelete: Int){
        self = .phaseDeleting(phaseDelete)
        print("FicheTechniqueIntent: .ready to .phaseDeleting")
    }
    
    mutating func intentToChange(phase: Int, ingredient: IngredientInStepModel){
        self = .ingredientAdding(phase, ingredient)
        print("FicheTechniqueIntent: .ready to .ingredientAdding")
    }
    
    mutating func intentToChange(id_phase: Int, ingredientDelete: Int){
        self = .ingredientDeleting(id_phase, ingredientDelete)
        print("FicheTechniqueIntent: .ready to .ingredientDeleting")
    }
    
    mutating func intentToChange(quantityModify: IngredientInStepModel){
        self = .quantityModifying(quantityModify)
        print("FicheTechniqueIntent: .ready to .quantityModifying")
    }
    
    mutating func intentToChange(ficheDelete: Int){
        self = .ftDeleting(ficheDelete)
        print("FicheTechniqueIntent: .ready to .ftDeleting")
    }
    
}
