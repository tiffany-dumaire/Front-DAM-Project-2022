//
//  FicheTechniqueDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 18/02/2022.
//

import Foundation

struct FicheTechniqueDAO {
    /*static func loadFTsDatas() async -> ListFicheTechniqueViewModel {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/fiches_techniques/all") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [FicheTechniqueDTO] = JSONHelper.decode(data: data) {
                    let list: [FicheTechniqueDTO] = s.sorted {
                        $0.libelle_fiche_technique < $1.libelle_fiche_technique
                    }
                    var fiches: [FicheTechniqueModel] = []
                    for ft in list {
                        fiches.append(FicheTechniqueModel(id_fiche_technique: ft.id_fiche_technique, libelle_fiche_technique: ft.libelle_fiche_technique, nombre_couverts: ft.nombre_couverts, id_responsable: ft.id_responsable, intitule_responsable: ft.intitule_responsable, id_categorie_fiche: ft.id_categorie_fiche, phases: []))
                    }
                    return ListFicheTechniqueViewModel(fiches)
                } else {
                    print("Récupération des stocks d'ingrédients -> nil | Aucune donnée trouvée.")
                    return ListFicheTechniqueViewModel([])
                }
            } catch {
                print("Récupération des stocks d'ingrédients -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des stocks d'ingrédients -> Error | L'url donnée n'existe pas.")
        return ListFicheTechniqueViewModel([])
    }*/
    
    
    
    static func loadFTsDatas() async -> [FicheTechniqueModel] {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/fiches_techniques/allDetails") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [FicheTechniqueDTO] = JSONHelper.decode(data: data) {
                    let list: [FicheTechniqueDTO] = s.sorted {
                        $0.libelle_fiche_technique < $1.libelle_fiche_technique
                    }
                    var fiches: [FicheTechniqueModel] = []
                    for ft in list {
                        fiches.append(ficheDTOToModel(fiche: ft))
                    }
                    return fiches
                } else {
                    print("Récupération des fiches techniques -> nil | Aucune donnée trouvée.")
                    return []
                }
            } catch {
                print("Récupération des fiches techniques -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des fiches techniques -> Error | L'url donnée n'existe pas.")
        return []
     }
    
    static func ficheDTOToModel(fiche: FicheTechniqueDTO) -> FicheTechniqueModel{
        var phases : [PhaseModel] = []
        for s in fiche.phases{
            var ingredients : [IngredientInStepModel] = []
            for i in s.ingredients {
                let ingredient = IngredientInStepModel(id_phase_ingredient: i.id_phase_ingredient, code: i.code, libelle: i.libelle, unite: i.unite, prix_unitaire: i.prix_unitaire, allergene: i.allergene == 1 ? true : false, quantite: i.quantite)
                ingredients.append(ingredient)
            }
            let phase = PhaseModel(id_phase: s.id_phase, id_phase_ft: s.id_phase_ft, libelle_phase: s.libelle_phase, libelle_denrees: s.libelle_denrees, description_phase: s.description_phase, duree_phase: s.duree_phase, ordre: s.ordre, ingredients: ingredients)
            phases.append(phase)
        }
        return FicheTechniqueModel(id_fiche_technique: fiche.id_fiche_technique, libelle_fiche_technique: fiche.libelle_fiche_technique, nombre_couverts: fiche.nombre_couverts, id_responsable: fiche.id_responsable, intitule_responsable: fiche.intitule_responsable, id_categorie_fiche: fiche.id_categorie_fiche, phases: phases)
    }
}
