//
//  DataDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import Foundation

struct IngredientDAO {
    static func loadStockDatas() async -> IngredientStocksDTO {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/stocks") {
            do {
               /* var urlS = URLSession.data(from: url)
                let s: IngredientStocksDTO = await urlS.getJSON(from: url)
                self.stocks = s*/
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [IngredientStockDTO] = JSONHelper.decode(data: data) {
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
    
    static func loadMercurialDatas() async -> ListIngredientViewModel {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/all") {
            do {
               /* var urlS = URLSession.data(from: url)
                let s: IngredientStocksDTO = await urlS.getJSON(from: url)
                self.stocks = s*/
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [IngredientDTO] = JSONHelper.decode(data: data) {
                    let list: [IngredientDTO] = s.sorted {
                        $0.libelle < $1.libelle
                    }
                    var ingredients: [IngredientModel] = []
                    for ingredient in list {
                        ingredients.append(IngredientModel(code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, stock: ingredient.stock, allergene: ingredient.allergene == 1 ? true : false))
                    }
                    return ListIngredientViewModel(ingredients)
                } else {
                    print("Récupération des ingrédients -> nil | Aucune donnée trouvée.")
                    return ListIngredientViewModel([])
                }
            } catch {
                print("Récupération des ingrédients -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des ingrédients -> Error | L'url donnée n'existe pas.")
        return ListIngredientViewModel([])
     }
    
    static func loadAllergenesDatas() async -> ListIngredientViewModel {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/allergenes") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [IngredientDTO] = JSONHelper.decode(data: data) {
                    let list: [IngredientDTO] = s.sorted {
                        $0.libelle < $1.libelle
                    }
                    var ingredients: [IngredientModel] = []
                    for ingredient in list {
                        ingredients.append(IngredientModel(code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, stock: ingredient.stock, allergene: ingredient.allergene == 1 ? true : false))
                    }
                    return ListIngredientViewModel(ingredients)
                } else {
                    print("Récupération des allergènes -> nil | Aucune donnée trouvée.")
                    return ListIngredientViewModel([])
                }
            } catch {
                print("Récupération des allergènes -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des allergènes -> Error | L'url donnée n'existe pas.")
        return ListIngredientViewModel([])
     }
    
   /* static func postIngredient(ingredient: IngredientModel) async {
        if let encoded = try JSONEncoder().encode(ingredient)
    }*/
}
