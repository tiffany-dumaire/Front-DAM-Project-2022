//
//  Front_DAM_Project_2022App.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 08/02/2022.
//

import SwiftUI

@main
struct Front_DAM_Project_2022App: App {
    //Exemple de IngredientDAO avec loadData()
    //@State var stocks: IngredientStocksDTO = IngredientStocksDTO(stocks: [])
    
    //il faudra charger les paramètres depuis le site à chaque lancement de l'application
    @StateObject var parameters: ParametersViewModel = ParametersViewModel([])
    @StateObject var mercurial: ListIngredientViewModel = ListIngredientViewModel([])
    @StateObject var fiches: ListFicheTechniqueViewModel = ListFicheTechniqueViewModel([])
    @StateObject var categoriesFT: ListCategorieFTViewModel = ListCategorieFTViewModel([])
    @StateObject var categoriesIngredient: ListCategorieIngredientViewModel = ListCategorieIngredientViewModel([])
    @StateObject var categoriesAllergenes: ListCategorieAllergeneViewModel = ListCategorieAllergeneViewModel([])
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(parameters)
                .environmentObject(mercurial)
                .environmentObject(fiches)
                .environmentObject(categoriesFT)
                .environmentObject(categoriesIngredient)
                .environmentObject(categoriesAllergenes)
                .onAppear(perform: {
                    Task {
                        let parameters: [String] = ["COUT_ASSAISONNEMENT", "COEFF_VENTE", "COUT_HORAIRE_MOYEN"]
                        for parameter in parameters {
                            if let p = await ParameterDAO.loadData(libelle_parameters: parameter) {
                                self.parameters.parameters.append(p)
                            }
                        }
                        self.mercurial.ingredients = await IngredientDAO.loadMercurialDatas().ingredients
                        self.fiches.fiches = await FicheTechniqueDAO.loadFTsDatas().fiches
                        self.categoriesFT.categories = await CategoriesDAO.loadCategorieFTDatas().categories
                        self.categoriesIngredient.categories = await CategoriesDAO.loadCategorieIngredientDatas().categories
                        self.categoriesAllergenes.categories = await CategoriesDAO.loadCategorieAllergeneDatas().categories
                    }
                })
        }
    }
}
