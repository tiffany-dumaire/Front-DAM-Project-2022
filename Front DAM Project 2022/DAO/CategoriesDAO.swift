//
//  CategoriesDAO.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import Foundation

struct CategoriesDAO {
    static func loadCategorieFTDatas() async -> ListCategorieFTViewModel {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/categories_fiches/all") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [CategorieFTDTO] = JSONHelper.decode(data: data) {
                    let list: [CategorieFTDTO] = s.sorted {
                        $0.id_categorie_fiche < $1.id_categorie_fiche
                    }
                    var categories: [CategorieFTModel] = []
                    for c in list {
                        categories.append(CategorieFTModel(id_categorie_fiche: c.id_categorie_fiche, categorie_fiche: c.categorie_fiche))
                    }
                    return ListCategorieFTViewModel(categories)
                } else {
                    print("Récupération des catégories de fiches techniques -> nil | Aucune donnée trouvée.")
                    return ListCategorieFTViewModel([])
                }
            } catch {
                print("Récupération des catégories de fiches techniques -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des catégories de fiches techniques -> Error | L'url donnée n'existe pas.")
        return ListCategorieFTViewModel([])
     }
    
    static func loadCategorieIngredientDatas() async -> ListCategorieIngredientViewModel {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/categories/all") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [CategorieIngredientDTO] = JSONHelper.decode(data: data) {
                    let list: [CategorieIngredientDTO] = s.sorted {
                        $0.id_categorie < $1.id_categorie
                    }
                    var categories: [CategorieIngredientModel] = []
                    for c in list {
                        categories.append(CategorieIngredientModel(id_categorie: c.id_categorie, categorie: c.categorie))
                    }
                    return ListCategorieIngredientViewModel(categories)
                } else {
                    print("Récupération des catégories de fiches techniques -> nil | Aucune donnée trouvée.")
                    return ListCategorieIngredientViewModel([])
                }
            } catch {
                print("Récupération des catégories de fiches techniques -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des catégories de fiches techniques -> Error | L'url donnée n'existe pas.")
        return ListCategorieIngredientViewModel([])
     }
    
    static func loadCategorieAllergeneDatas() async -> ListCategorieAllergeneViewModel {
        if let url: URL = URL(string: "https://back-awi-projet-2021.herokuapp.com/categories_allergenes/all") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let s: [CategorieAllergeneDTO] = JSONHelper.decode(data: data) {
                    let list: [CategorieAllergeneDTO] = s.sorted {
                        $0.id_categorie_allergene < $1.id_categorie_allergene
                    }
                    var categories: [CategorieAllergeneModel] = []
                    for c in list {
                        categories.append(CategorieAllergeneModel(id_categorie_allergene: c.id_categorie_allergene, categorie_allergene: c.categorie_allergene))
                    }
                    return ListCategorieAllergeneViewModel(categories)
                } else {
                    print("Récupération des catégories de fiches techniques -> nil | Aucune donnée trouvée.")
                    return ListCategorieAllergeneViewModel([])
                }
            } catch {
                print("Récupération des catégories de fiches techniques -> Error | Erreur durant l'exécution")
            }
        }
        print("Récupération des catégories de fiches techniques -> Error | L'url donnée n'existe pas.")
        return ListCategorieAllergeneViewModel([])
     }
}
