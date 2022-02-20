//
//  CustomListView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 20/02/2022.
//

import SwiftUI

struct CustomIngredientListView: View {
    //@State var ingredients: [IngredientModel] = [IngredientModel(code: 101, libelle: "Test 1", unite: "kg", prix_unitaire: 1.24, stock: 5.435, allergene: false), IngredientModel(code: 102, libelle: "Test2", unite: "L", prix_unitaire: 1.35, stock: 6.7, allergene: true)]
    private var texte: String
    private var allergen: Bool
    @EnvironmentObject var mercurial: ListIngredientViewModel
    
    private func filterSearch(ingredient: IngredientModel) -> Bool{
        var ret = true
        if allergen {
            if !texte.isEmpty {
                ret = false || (ingredient.libelle.lowercased().contains(texte.lowercased()) && ingredient.allergene)
            }
            return ret && ingredient.allergene
        } else {
            if !texte.isEmpty {
                ret = false || ingredient.libelle.lowercased().contains(texte.lowercased())
            }
            return ret
        }
    }
    
    init(texte: String, allergen: Bool) {
        self.texte = texte
        self.allergen = allergen
    }
    
    var body: some View {
        ScrollView {
            ForEach(mercurial.ingredients.filter(filterSearch), id: \.code) { ingredient in
                NavigationLink(destination: IngredientDetailView()) {
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                if ingredient.allergene {
                                    Image(systemName: "allergens")
                                        .foregroundColor(.red)
                                }
                                Text(ingredient.libelle)
                                    .bold()
                                    .font(.system(size: 16))
                            }.padding(.horizontal)
                            HStack {
                                Text("Unite: \(ingredient.unite)")
                                    .font(.system(size: 11))
                                    .padding(8)
                                    .foregroundColor(Color.blue)
                                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 2))
                                Spacer()
                                Text("Valeur stock: " + String(format: "%.2f", ingredient.valeurStock) + " €")
                                    .font(.system(size: 11))
                                    .padding(8)
                                    .foregroundColor(ingredient.valeurStock == 0 ? Color.red : Color.purple)
                                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.purple, lineWidth: 2))
                                Spacer()
                            }.padding(.horizontal, 15)
                        }
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.blue)
                            .padding(.trailing, 10)
                    }
                        .padding(.vertical, 8)
                        .foregroundColor(.black)
                        .background(Color.salmon.opacity(0.1))
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.salmon, lineWidth: 2))
                }
                .padding(15)
            }
        }
    }
}

