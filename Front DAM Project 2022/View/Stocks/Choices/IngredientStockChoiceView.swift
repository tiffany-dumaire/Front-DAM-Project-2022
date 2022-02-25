//
//  IngredientStockChoiceView.swift
//  Front DAM Project 2022
//
//  Created by m1 on 25/02/2022.
//

import SwiftUI

struct IngredientStockChoiceView: View {
    @EnvironmentObject var mercurial: ListIngredientViewModel
    @ObservedObject var stocks: ListIngredientViewModel
    @State private var showingAlert = false
    @Binding var index: Int
    @State var texte: String = ""
    
    private func filterSearch(ingredient: IngredientModel) -> Bool{
        return (!texte.isEmpty ? ingredient.libelle.lowercased().contains(texte.lowercased()) : true) && (!stocks.ingredients.contains(ingredient))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Listes des ingrédients")
                SearchBarView(text: $texte, placeholder: "libellé..")
                List {
                    ForEach(mercurial.ingredients.filter(filterSearch), id: \.code) { ingredient in
                        VStack(alignment: .leading, spacing: 10) {
                            Button(action: {
                                stocks.ingredients.append(ingredient)
                                stocks.ingredients = stocks.ingredients.sorted {
                                    $0.libelle < $1.libelle
                                }
                            }) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.green)
                                        Text("\(ingredient.libelle)").font(.system(size: 14))
                                    }
                                    HStack {
                                        Text(String(format: "%.3f", ingredient.stock) + " \(ingredient.unite)").font(.system(size: 12))
                                    }.padding(.horizontal, 25)
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
            }
            Divider()
            VStack(alignment: .leading) {
                Text("Ingrédients sélectionnés")
                List {
                    ForEach(stocks.ingredients, id: \.code) { ingredient in
                        VStack(alignment: .leading) {
                            Button(action: {
                                if let i = stocks.ingredients.firstIndex(of: ingredient) {
                                    stocks.ingredients.remove(at: i)
                                }
                            }) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.red)
                                        Text("\(ingredient.libelle)").font(.system(size: 14))
                                    }
                                    HStack {
                                        Text(String(format: "%.3f", ingredient.stock) + " \(ingredient.unite)").font(.system(size: 12))
                                    }.padding(.horizontal, 25)
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
            }
        }.padding()
    }
}

struct IngredientStockChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientStockChoiceView(stocks: ListIngredientViewModel([]), index: .constant(0))
    }
}
