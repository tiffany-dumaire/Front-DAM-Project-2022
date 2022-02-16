//
//  ContentView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 08/02/2022.
//

import SwiftUI

struct ContentView: View {
    //@StateObject var list: IngredientViewModel = IngredientViewModel(model: IngredientModel(libelle: "Spaghettis", unite: "kg", prix_unitaire: 0.52, stock: 10, allergene: true))
    var body: some View {
        HomeView()
        //HomeView().environmentObject(list)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
