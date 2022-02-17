//
//  MercurialView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 08/02/2022.
//

import SwiftUI

struct MercurialView: View {
    @State var texte: String = ""
    @State var stocks: [IngredientStockDTO] = []
    @StateObject var ingredients: ListIngredientViewModel = ListIngredientViewModel([IngredientModel(code: 1, libelle: "Frites", unite: "kg", prix_unitaire: 0.99, stock: 5, allergene: false), IngredientModel(code: 2, libelle: "Pommes", unite: "kg", prix_unitaire: 2.59, stock: 6, allergene: false),IngredientModel(code: 3, libelle: "Lait", unite: "L", prix_unitaire: 1.32, stock: 10.32, allergene: true)])
        var body: some View {
            VStack {
                /*HStack {
                    Text("Mercurial")
                        .font(.title)
                        .bold()
                        .padding(10)
                    Spacer(minLength: 0)
                }*/
                VStack {
                    SearchBarView(text: $texte)
                }
                Text("Il y a \(ingredients.ingredients.count) ingrédients correspondant à votre recherche")
                    .font(.system(size: 11))
                    .foregroundColor(.myGray)
                List {
                    ForEach(ingredients.ingredients, id: \.code) { ingredient in
                        NavigationLink(destination: IngredientDetailView()) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(ingredient.libelle)
                                        .bold()
                                    if ingredient.allergene {
                                        Image(systemName: "allergens")
                                            .foregroundColor(.red)
                                    }
                                    Text("Unité : \(ingredient.unite)").font(.system(size: 13))
                                }
                                Text("Valeur du stock : " + String(format: "%.2F",ingredient.valeurStock) + " €").font(.system(size: 13))
                            }
                        }.foregroundColor(.black)
                    }
                }
                .padding(15)
                Spacer(minLength: 0)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Mercurial")
                
                    //.onAppear(perform:{})
            }
        }
            
               /* .onAppear(perform: {
                    var i: [IngredientModel]? = JSONHelper.decode(data: JSONHelper.loadFromFile(name: "ingredient", ext: "json")!)
                    self.ingredients = i!
                })*/
}

struct MercurialView_Previews: PreviewProvider {
    static var previews: some View {
        MercurialView()
    }
}
