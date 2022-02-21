//
//  CategoriesModel.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 21/02/2022.
//

import Foundation

struct CategorieFTModel {
    var id_categorie_fiche: Int
    var categorie_fiche: String
    
    init(id_categorie_fiche: Int, categorie_fiche: String) {
        self.id_categorie_fiche = id_categorie_fiche
        self.categorie_fiche = categorie_fiche
    }
}

struct CategorieIngredientModel {
    var id_categorie: Int
    var categorie: String
    
    init(id_categorie: Int, categorie: String) {
        self.id_categorie = id_categorie
        self.categorie = categorie
    }
}

struct CategorieAllergeneModel {
    var id_categorie_allergene: Int
    var categorie_allergene: String
    
    init(id_categorie_allergene: Int, categorie_allergene: String) {
        self.id_categorie_allergene = id_categorie_allergene
        self.categorie_allergene = categorie_allergene
    }
}
