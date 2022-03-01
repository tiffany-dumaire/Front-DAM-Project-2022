//
//  EntriesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 13/02/2022.
//

import SwiftUI

struct EntriesView: View {
    @EnvironmentObject var mercurial: ListIngredientViewModel
    @StateObject var stocks: ListOfIngredientViewModel
    @Environment(\.dismiss) var dismiss
    @State var loading: Int = 0
    
    private func modifyStocks() async {
        loading = 1
        Task {
            for ingredient in stocks.ingredients {
                await ingredient.state.intentToChange(ingredientStockModify: IngredientModel(code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, stock: ingredient.stock, allergene: ingredient.allergene, id_categorie: ingredient.id_categorie, id_categorie_allergene: ingredient.id_categorie_allergene))
                ingredient.state = .ready
                print("IngredientIntent: .ingredientStockModified to .ready")
                    
            }
        }
    }
    
    var body: some View {
        ScrollView {
            if loading == 1 {
                VStack {
                    Text("Stocks en cours d'enregistrement")
                    ProgressView()
                }
            }
            if loading == 0 {
                ForEach(stocks.ingredients, id: \.code) { ingredient in
                    IngredientStockView(ingredient: ingredient)
                }
                Button("Modifier les stocks", action: {
                    Task {
                        await modifyStocks()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            self.mercurial.state = .changingListIngredient
                            loading = 2
                        }
                    }
                })
                    .padding(10)
                    .frame(width: 200)
                    .background(Color.modifyButton.opacity(0.25))
                    .foregroundColor(Color.modifyButton)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.modifyButton, lineWidth: 2))
                    .padding(.vertical, 20)
                .navigationTitle("Entrée de stock complète")
                .navigationBarTitleDisplayMode(.inline)
            }
            if loading == 2 {
                VStack {
                    Text("Les stocks d'ingrédients ont bien été modifiés.")
                    Button("Retour au menu", action: { dismiss() })
                }
            }
        }
    }
}

struct EntriesView_Previews: PreviewProvider {
    static var previews: some View {
        EntriesView(stocks: ListOfIngredientViewModel(ListIngredientViewModel([])))
    }
}
