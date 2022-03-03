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
    @Published var id_responsable: Int
    @Published var intitule_responsable: String
    @Published var id_categorie_fiche: Int
    @Published var phases: [PhaseModel]
    @Published var state: FicheTechniqueIntent = .ready{
        didSet{
            switch state {
                case .ftAdding(let fiche):
                    Task {
                        self.id_fiche_technique = await FicheTechniqueDAO.addFiche(fiche: fiche)
                        self.model.id_fiche_technique = self.id_fiche_technique
                        modifyModel()
                        self.state = .ftAdded
                        print("FicheTechniqueIntent: .ftAdding to .ftAdded")
                    }
                    
                case .ftChanging(let fiche):
                    Task {
                        await FicheTechniqueDAO.modifyFiche(fiche: fiche)
                        modifyModel()
                        self.state = .ftChanged
                        print("FicheTechniqueIntent: .ftChanging to .ftChanged")
                    }
                case .phaseAdding(let phase):
                    Task {
                        let idP = await PhaseDAO.addPhase(phase: phase)
                        let idPFT = await PhaseDAO.addOrdrePhase(id_phase: idP, id_fiche_technique: self.id_fiche_technique, phase: phase)
                        let newPhase: PhaseModel = PhaseModel(id_phase: idP, id_phase_ft: idPFT, libelle_phase: phase.libelle_phase, libelle_denrees: phase.libelle_denrees, description_phase: phase.description_phase, duree_phase: phase.duree_phase, ordre: phase.ordre, ingredients: [])
                        addPhase(phase: newPhase)
                        self.state = .phaseAdded
                        print("FicheTechniqueIntent: .phaseAdding to .phaseAdded")
                    }
                case .phaseModifying(let phase):
                    Task {
                        //A FINIR
                        print(phase.libelle_phase)
                        self.state = .phaseModified
                        print("FicheTechniqueIntent: .phaseModifying to .phaseModified")
                    }
                case .phaseDeleting(let idpft):
                    Task {
                        await PhaseDAO.deletePhase(id_phase_ft: idpft)
                        self.state = .phaseDeleted
                        print("FicheTechniqueIntent: .phaseDeleting to .phaseDeleted")
                    }
                case .ftDeleting(let id):
                    Task {
                        await FicheTechniqueDAO.deleteFiche(id_fiche_technique: id)
                        self.state = .ftDeleted
                        print("FicheTechniqueIntent: .ftDeleting to .ftDeleted")
                    }
                default:
                    return
            }
        }
    }
    
    init(model: FicheTechniqueModel) {
        self.model = model
        self.id_fiche_technique = model.id_fiche_technique
        self.libelle_fiche_technique = model.libelle_fiche_technique
        self.nombre_couverts = model.nombre_couverts
        self.id_responsable = model.id_responsable
        self.intitule_responsable = model.intitule_responsable
        self.id_categorie_fiche = model.id_categorie_fiche
        self.phases = model.phases
    }
    
    private func modifyModel() {
        self.model.libelle_fiche_technique = self.libelle_fiche_technique
        self.model.nombre_couverts = self.nombre_couverts
        self.model.id_responsable = self.id_responsable
        self.model.id_categorie_fiche = self.id_categorie_fiche
        self.model.phases = self.phases
    }
    
    private func addPhase(phase: PhaseModel) {
        self.model.phases.append(phase)
        self.phases.append(phase)
    }
    
    private func modifyPhase(phase: PhaseModel) {
        
    }
}
