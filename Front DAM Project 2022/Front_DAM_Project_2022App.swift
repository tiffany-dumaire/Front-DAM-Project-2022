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
    @StateObject var parameters: ParametersModel = ParametersModel(parameters: [ParameterModel(libelle_parameters: "ASSAISONNEMENT", value: 5, value2: 3, utile: true), ParameterModel(libelle_parameters: "COEFF_VENTE", value: 6, value2: 10, utile: true), ParameterModel(libelle_parameters: "COUT_MOYEN_HORAIRE", value: 10, value2: 6, utile: true)])
    var body: some Scene {
        WindowGroup {
            //Exemple de IngredientDAO avec loadData()
            /*VStack {
                List {
                    ForEach(stocks.stocks, id: \.code) { stock in
                        Text(stock.libelle)
                    }
                }
               
                
                .onAppear(perform: {
                    Task {
                        self.stocks = await IngredientDAO.loadData()
                        print(self.stocks)
                    }
                })
            }*/
            ContentView()
                .environmentObject(parameters)
        }
    }
}
