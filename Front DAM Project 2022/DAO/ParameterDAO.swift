//
//  ParameterDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import Foundation

struct ParameterDAO {
    
    /**GET**/
    
    static func loadData(libelle_parameters: String) async -> ParameterModel? {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/parameters/" + libelle_parameters) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [ParameterDTO] = JSONHelper.decode(data: data) {
                    return ParameterDAO.parameterDTOtoModel(dto: s[0])
                } else {
                    print("Récupération des stocks d'ingrédients -> nil | Aucune donnée trouvée.")
                    return nil
                }
            } catch {
                print("Récupération des stocks d'ingrédients -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des stocks d'ingrédients -> Error | L'url donnée n'existe pas.")
        return nil
    }
    
    /**Fonction utiles**/
    
    private static func parameterDTOtoModel(dto: ParameterDTO) -> ParameterModel {
        return ParameterModel(id_parameters: dto.id_parameters, libelle_parameters: dto.libelle_parameters, value: dto.value, value2: dto.value2, utile: dto.utile == 1 ? true : false)
    }
    
}
