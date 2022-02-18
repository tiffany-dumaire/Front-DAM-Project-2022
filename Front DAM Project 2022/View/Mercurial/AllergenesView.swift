//
//  AllergenesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 18/02/2022.
//

import SwiftUI

struct AllergenesView: View {
    @State var texte: String = ""
    @State var stocks: [IngredientStockDTO] = []
    @State var ingredients: ListIngredientViewModel = ListIngredientViewModel([])
    
    private func filterSearch(ingredient: IngredientModel) -> Bool{
        var ret = true
        if !texte.isEmpty {
            ret = false || ingredient.libelle.lowercased().contains(texte.lowercased())
        }
        return ret
    }

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
            Text("Il y a \(ingredients.ingredients.count) allergènes correspondant à votre recherche")
                .font(.system(size: 11))
                .foregroundColor(.myGray)
            List {
                ForEach(ingredients.ingredients.filter(filterSearch), id: \.code) { ingredient in
                    NavigationLink(destination: IngredientDetailView()) {
                        VStack(alignment: .leading) {
                            Text(ingredient.libelle)
                                .bold()
                                .font(.system(size: 17))
                            HStack {
                                Text("Unité : \(ingredient.unite)").font(.system(size: 13))
                                if ingredient.allergene {
                                    Image(systemName: "allergens")
                                        .foregroundColor(.red)
                                }
                            }
                            Text("Valeur du stock : " + String(format: "%.2F",ingredient.valeurStock) + " €").font(.system(size: 13))
                        }
                    }.foregroundColor(.black)
                }
            }
            .padding(15)
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Liste des allergènes")
            
                .onAppear(perform:{
                    Task {
                        self.ingredients = await IngredientDAO.loadAllergenesDatas()
                        print(self.ingredients)
                    }
                })
        }
    }
}

struct AllergenesView_Previews: PreviewProvider {
    static var previews: some View {
        AllergenesView()
    }
}
