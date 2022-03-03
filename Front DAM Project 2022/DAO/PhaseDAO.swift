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
}
