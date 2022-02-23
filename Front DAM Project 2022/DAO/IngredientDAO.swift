//
//  DataDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 17/02/2022.
//

import Foundation

struct IngredientDAO {
    
    /**GET**/
    
    static func loadStockDatas() async -> IngredientStocksDTO {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/stocks") {
            do {
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
    
    static func loadMercurialDatas() async -> [IngredientModel] {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/all") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [IngredientDTO] = JSONHelper.decode(data: data) {
                    let list: [IngredientDTO] = s.sorted {
                        $0.libelle < $1.libelle
                    }
                    var ingredients: [IngredientModel] = []
                    for ingredient in list {
                        ingredients.append(IngredientModel(code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, stock: ingredient.stock, allergene: ingredient.allergene == 1 ? true : false, id_categorie: ingredient.id_categorie, id_categorie_allergene: ingredient.id_categorie_allergene))
                    }
                    return ingredients
                } else {
                    print("Récupération des ingrédients -> nil | Aucune donnée trouvée.")
                    return []
                }
            } catch {
                print("Récupération des ingrédients -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des ingrédients -> Error | L'url donnée n'existe pas.")
        return []
     }
    
    /*static func loadAllergenesDatas() async -> [IngredientModel] {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/allergenes") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [IngredientDTO] = JSONHelper.decode(data: data) {
                    let list: [IngredientDTO] = s.sorted {
                        $0.libelle < $1.libelle
                    }
                    var ingredients: [IngredientModel] = []
                    for ingredient in list {
                        ingredients.append(IngredientModel(code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, stock: ingredient.stock, allergene: ingredient.allergene == 1 ? true : false, id_categorie: ingredient.id_categorie, id_categorie_allergene: ingredient.id_categorie_allergene))
                    }
                    return ingredients
                } else {
                    print("Récupération des allergènes -> nil | Aucune donnée trouvée.")
                    return []
                }
            } catch {
                print("Récupération des allergènes -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des allergènes -> Error | L'url donnée n'existe pas.")
        return []
    }*/
    
    /**POST**/
    
    static func addIngredient(ingredient: IngredientModel) async {
        if let encoded = try? JSONEncoder().encode(IngredientDTO(code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, stock: ingredient.stock, allergene: ingredient.allergene ? 1 : 0, id_categorie: ingredient.id_categorie, id_categorie_allergene: ingredient.allergene ? ingredient.id_categorie_allergene : nil)) {
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/create"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.httpBody = encoded
                    request.addValue("application/json", forHTTPHeaderField: "content-type")
                    if let (_, response) = try? await URLSession.shared.upload(for: request, from:encoded){
                        let httpresponse = response as! HTTPURLResponse
                        if httpresponse.statusCode == 200 || httpresponse.statusCode == 201 {
                            print("L'ingrédient a été ajouté avec succès.")
                        }
                        else{
                            print("Ajout d'un ingrédient - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                        }
                    }
                }
            }
        }
    }
    
    /**PUT**/
    
    static func modifyIngredient(ingredient: IngredientModel) async {
        let idto = IngredientDTO(code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, stock: ingredient.stock, allergene: ingredient.allergene ? 1 : 0, id_categorie: ingredient.id_categorie, id_categorie_allergene: ingredient.allergene ? ingredient.id_categorie_allergene : nil)
        if let encoded = try? JSONEncoder().encode(idto){
            if let url = URL(string: "https://back-awi-projet-2021.herokuapp.com/ingredients/modify/\(idto.code)"){
                do {
                    var request = URLRequest(url: url)
                    request.httpMethod = "PUT"
                    request.httpBody = encoded
                    request.setValue("application/json", forHTTPHeaderField: "content-type")
                    if let (_, response) = try? await URLSession.shared.data(for: request){
                        let httpresponse = response as! HTTPURLResponse
                        if httpresponse.statusCode == 200 {
                            print("L'ingrédient a été modifié avec succès.")
                        }
                        else{
                            print("Modification d'un ingrédient - error \(httpresponse.statusCode): \(HTTPURLResponse.localizedString(forStatusCode: httpresponse.statusCode))")
                        }
                    }
                }
            }
        }
    }
}
