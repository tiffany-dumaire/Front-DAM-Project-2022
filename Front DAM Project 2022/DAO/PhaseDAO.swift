//
//  PhaseDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 02/03/2022.
//

import Foundation

struct PhaseDAO {
    
    /**POST**/
    
    static func addPhase(phase: PhaseModel) async -> Int {
        if let encoded = try? JSONEncoder().encode(PhaseInfosDTO(libelle_phase: phase.libelle_phase, libelle_denrees: phase.libelle_denrees, description_phase: phase.description_phase, duree_phase: phase.duree_phase)) {
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/create"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.httpBody = encoded
                    request.addValue("application/json", forHTTPHeaderField: "content-type")
                    if let (data, response) = try? await URLSession.shared.upload(for: request, from:encoded){
                        if let datas: UtilDTO = JSONHelper.decode(data: data) {
                            let httpresponse = response as! HTTPURLResponse
                            if httpresponse.statusCode == 200 || httpresponse.statusCode == 201 {
                                print("La phase a été créée avec succès.")
                                return datas.insertId
                            }
                            else{
                                print("Création d'une phase - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                            }
                        }
                    }
                }
            }
        }
        return phase.id_phase
    }
    
    static func addOrdrePhase(id_phase: Int, id_fiche_technique: Int, phase: PhaseModel) async -> Int {
        if let encoded = try? JSONEncoder().encode(PhaseOrdreDTO(id_phase: id_phase, id_fiche_technique: id_fiche_technique, ordre: phase.ordre)) {
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/phase_FT"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.httpBody = encoded
                    request.addValue("application/json", forHTTPHeaderField: "content-type")
                    if let (data, response) = try? await URLSession.shared.upload(for: request, from:encoded){
                        if let datas: UtilDTO = JSONHelper.decode(data: data) {
                            let httpresponse = response as! HTTPURLResponse
                            if httpresponse.statusCode == 200 || httpresponse.statusCode == 201 {
                                print("L'ordre de la phase a été ajouté avec succès.")
                                return datas.insertId
                            }
                            else{
                                print("Ajout ordre d'une phase - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                            }
                        }
                    }
                }
            }
        }
        return phase.id_phase_ft
    }
    
    static func addIngredientInPhase(id_phase: Int, code: Int) async -> Int {
        if let encoded = try? JSONEncoder().encode(IngredientAddDTO(id_phase: id_phase, code: code)) {
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/add_ingredient"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.httpBody = encoded
                    request.addValue("application/json", forHTTPHeaderField: "content-type")
                    if let (data, response) = try? await URLSession.shared.upload(for: request, from:encoded){
                        if let datas: UtilDTO = JSONHelper.decode(data: data) {
                            let httpresponse = response as! HTTPURLResponse
                            if httpresponse.statusCode == 200 || httpresponse.statusCode == 201 {
                                print("L'ingrédient a été ajouté à la phase avec succès.")
                                return datas.insertId
                            }
                            else{
                                print("Ajout d'un ingrédient à une phase - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                            }
                        }
                    }
                }
            }
        }
        return 0
    }
    
    static func addQuantityIngredientInPhase(id_phase_ingredient: Int, id_fiche_technique: Int, quantite: Double) async {
        if let encoded = try? JSONEncoder().encode(IngredientQuantityAddDTO(id_phase_ingredient: id_phase_ingredient, id_fiche_technique: id_fiche_technique, quantite: quantite)) {
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/phase_ingredient_quantity"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.httpBody = encoded
                    request.addValue("application/json", forHTTPHeaderField: "content-type")
                    if let (_ , response) = try? await URLSession.shared.upload(for: request, from:encoded){
                        let httpresponse = response as! HTTPURLResponse
                        if httpresponse.statusCode == 200 || httpresponse.statusCode == 201 {
                            print("La quantité de l'ingrédient ajouté à la phase a été initialisée avec succès.")
                        }
                        else{
                            print("Initialisation de la quantité d'un ingrédient d'une phase - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                        }
                    }
                }
            }
        }
    }
    
    /**PUT**/
    
    static func modifyPhase(phase: PhaseModel) async {
       if let encoded = try? JSONEncoder().encode(PhaseInfosDTO(libelle_phase: phase.libelle_phase, libelle_denrees: phase.libelle_denrees, description_phase: phase.description_phase, duree_phase: phase.duree_phase)){
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/modify/\(phase.id_phase)"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "PUT"
                    request.httpBody = encoded
                    request.setValue("application/json", forHTTPHeaderField: "content-type")
                    if let (_, response) = try? await URLSession.shared.data(for: request){
                        let httpresponse = response as! HTTPURLResponse
                        if httpresponse.statusCode == 200 {
                            print("La phase a été modifiée avec succès.")
                        }
                        else{
                            print("Modification d'une phase - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                        }
                    }
                }
            }
        }
    }
    
    static func modifyQuantityIngredientInPhase(id_fiche_technique: Int, ingredient: IngredientInStepModel) async {
        if let encoded = try? JSONEncoder().encode(IngredientQuantityAddDTO(id_phase_ingredient: ingredient.id_phase_ingredient, id_fiche_technique: id_fiche_technique, quantite: ingredient.quantite)){
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/phase_ingredient_quantity/modify/\(ingredient.id_phase_ingredient)"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "PUT"
                    request.httpBody = encoded
                    request.setValue("application/json", forHTTPHeaderField: "content-type")
                    if let (_, response) = try? await URLSession.shared.data(for: request){
                        let httpresponse = response as! HTTPURLResponse
                        if httpresponse.statusCode == 200 {
                            print("La quantité d'un ingrédient a été modifiée avec succès.")
                        }
                        else{
                            print("Modification d'une quantité d'ingrédient - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                        }
                    }
                }
            }
        }
    }
    
    static func modifyOrdrePhase(id_fiche_technique: Int, phase: PhaseModel) async {
        if let encoded = try? JSONEncoder().encode(PhaseOrdreDTO(id_phase: phase.id_phase, id_fiche_technique: id_fiche_technique, ordre: phase.ordre)){
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/phase_FT/modify/\(phase.id_phase_ft)"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "PUT"
                    request.httpBody = encoded
                    request.setValue("application/json", forHTTPHeaderField: "content-type")
                    if let (_, response) = try? await URLSession.shared.data(for: request){
                        let httpresponse = response as! HTTPURLResponse
                        if httpresponse.statusCode == 200 {
                            print("L'ordre d'une phase a été modifié avec succès.")
                        }
                        else{
                            print("Modification ordre d'une phase - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                        }
                    }
                }
            }
        }
    }
    
    /**DELETE**/
    
    static func deletePhase(id_phase_ft: Int) async {
        if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/phase_FT/delete/\(id_phase_ft)"){
            do {
                var request = URLRequest(url: url)
                request.httpMethod = "DELETE"
                if let (_, response) = try? await URLSession.shared.data(for: request){
                    let httpresponse = response as! HTTPURLResponse
                    if httpresponse.statusCode == 200 {
                        print("La phase a été retirée de la fiche avec succès.")
                    }
                    else{
                        print("Retirer une phase - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                    }
                }
            }
        }
    }
    
    static func deleteIngredientInPhase(id_phase_ingredient: Int) async {
        if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/phases/pull_ingredient/\(id_phase_ingredient)"){
            do {
                var request = URLRequest(url: url)
                request.httpMethod = "DELETE"
                if let (_, response) = try? await URLSession.shared.data(for: request){
                    let httpresponse = response as! HTTPURLResponse
                    if httpresponse.statusCode == 200 {
                        print("L'ingrédient a été retiré de la phase avec succès.")
                    }
                    else{
                        print("Retirer un ingrédient d'une phase - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                    }
                }
            }
        }
    }
}
