//
//  DataDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import Foundation

struct IngredientDAO {
    static func loadData() async -> IngredientStocksDTO {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/stocks") {
            do {
               /* var urlS = URLSession.data(from: url)
                let s: IngredientStocksDTO = await urlS.getJSON(from: url)
                self.stocks = s*/
                let (data, _) = try await URLSession.shared.data(from: url)
                print(data)
                if let s: [IngredientStockDTO] = JSONHelper.decode(data: data) {
                    print(s)
                    return IngredientStocksDTO(stocks: s)
                } else {
                    print("Récupération des stocks d'ingrédients -> nil | Aucune donnée trouvée.")
                    return IngredientStocksDTO(stocks: [])
                }
            } catch {
                print("Récupération des stocks d'ingrédients -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des stocks d'ingrédients -> Error | L'url donnée n'existe pas.")
        return IngredientStocksDTO(stocks: [])
     }
    
   /* static func postIngredient(ingredient: IngredientModel) async {
        if let encoded = try JSONEncoder().encode(ingredient)
    }*/
}
