//
//  FicheTechniqueDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 18/02/2022.
//

import Foundation

struct FicheTechniqueDAO {
    static func loadFTsDatas() async -> ListFicheTechniqueViewModel {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/fiches_techniques/all") {
            do {
               /* var urlS = URLSession.data(from: url)
                let s: IngredientStocksDTO = await urlS.getJSON(from: url)
                self.stocks = s*/
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [FicheTechniqueDTO] = JSONHelper.decode(data: data) {
                    let list: [FicheTechniqueDTO] = s.sorted {
                        $0.libelle_fiche_technique < $1.libelle_fiche_technique
                    }
                    var fiches: [FicheTechniqueModel] = []
                    for ft in list {
                        fiches.append(FicheTechniqueModel(id_fiche_technique: ft.id_fiche_technique, libelle_fiche_technique: ft.libelle_fiche_technique, nombre_couverts: ft.nombre_couverts, id_responsable: ft.id_responsable, intitule_responsable: ft.intitule_responsable, id_categorie_fiche: ft.id_categorie_fiche))
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
     }
}
