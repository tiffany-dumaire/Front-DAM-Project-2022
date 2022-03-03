//
//  FicheTechniqueDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 18/02/2022.
//

import Foundation

struct FicheTechniqueDAO {
    
    /**GET**/
    
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
    
    static func loadResponsables() async -> [ResponsableModel] {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/responsables/all") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let respo: [ResponsableDTO] = JSONHelper.decode(data: data) {
                    let list: [ResponsableDTO] = respo.sorted {
                        $0.intitule_responsable < $1.intitule_responsable
                    }
                    var responsables: [ResponsableModel] = []
                    for ft in list {
                        responsables.append(ResponsableModel(id_responsable: ft.id_responsable, intitule_responsable: ft.intitule_responsable))
                    }
                    return responsables
                } else {
                    print("Récupération des responsables -> nil | Aucune donnée trouvée.")
                    return []
                }
            } catch {
                print("Récupération des responsables -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des responsables -> Error | L'url donnée n'existe pas.")
        return []
    }
    
    /**POST**/
    
    static func addFiche(fiche: FicheTechniqueModel) async -> Int {
        if let encoded = try? JSONEncoder().encode(FicheTechniqueInfosDTO(libelle_fiche_technique: fiche.libelle_fiche_technique, nombre_couverts: fiche.nombre_couverts, id_responsable: fiche.id_responsable, id_categorie_fiche: fiche.id_categorie_fiche)) {
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/fiches_techniques/create"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.httpBody = encoded
                    request.addValue("application/json", forHTTPHeaderField: "content-type")
                    if let (data, response) = try? await URLSession.shared.upload(for: request, from:encoded){
                        if let datas: UtilDTO = JSONHelper.decode(data: data) {
                            let httpresponse = response as! HTTPURLResponse
                            if httpresponse.statusCode == 200 || httpresponse.statusCode == 201 {
                                print("La fiche technique a été ajouté avec succès.")
                                return datas.insertId
                            }
                            else{
                                print("Ajout d'une fiche technique - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                            }
                        }
                    }
                }
            }
        }
        return fiche.id_fiche_technique
    }
    
    /**PUT**/
    
    static func modifyFiche(fiche: FicheTechniqueModel) async {
        if let encoded = try? JSONEncoder().encode(FicheTechniqueInfosDTO(libelle_fiche_technique: fiche.libelle_fiche_technique, nombre_couverts: fiche.nombre_couverts, id_responsable: fiche.id_responsable, id_categorie_fiche: fiche.id_categorie_fiche)){
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/fiches_techniques/modify/\(fiche.id_fiche_technique)"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "PUT"
                    request.httpBody = encoded
                    request.setValue("application/json", forHTTPHeaderField: "content-type")
                    if let (_, response) = try? await URLSession.shared.data(for: request){
                        let httpresponse = response as! HTTPURLResponse
                        if httpresponse.statusCode == 200 {
                            print("La fiche technique '\(fiche.libelle_fiche_technique)' a été modifiée avec succès.")
                        }
                        else{
                            print("Modification d'une fiche technique - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                        }
                    }
                }
            }
        }
    }
    
    /**DELETE**/
    
    static func deleteFiche(id_fiche_technique: Int) async {
        if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/fiches_techniques/delete/\(id_fiche_technique)"){
            do {
                var request = URLRequest(url: url)
                request.httpMethod = "DELETE"
                if let (_, response) = try? await URLSession.shared.data(for: request){
                    let httpresponse = response as! HTTPURLResponse
                    if httpresponse.statusCode == 200 {
                        print("La fiche technique a été supprimée avec succès.")
                    }
                    else{
                        print("Suppression d'une fiche technique - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                    }
                }
            }
        }
    }
    
    /**Fonctions utiles**/
    
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
