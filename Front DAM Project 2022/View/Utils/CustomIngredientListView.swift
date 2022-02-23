//
//  CustomIngredientListView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 20/02/2022.
//

import SwiftUI

struct CustomIngredientListView: View {
    private var texte: String
    private var allergen: Bool
    private var categorie: Int
    private var categorieA: Int
    @EnvironmentObject var mercurial: ListIngredientViewModel
    
    private func filterSearch(ingredient: IngredientModel) -> Bool{
        return ((!texte.isEmpty ? ingredient.libelle.lowercased().contains(texte.lowercased()) : true) && (categorie != 0 ? ingredient.id_categorie == categorie : true) && (allergen ? ingredient.allergene : true) && (categorieA != 0 ? ingredient.id_categorie_allergene == categorieA : true))
    }
    
    private func stateChanged(_ state: ListIngredientIntent) {
        switch state {
            case .changedListIngredient:
                mercurial.state = .ready
            default:
                return
        }
    }
    
    init(texte: String, allergen: Bool, categorie: Int, categorieA: Int) {
        self.texte = texte
        self.allergen = allergen
        self.categorie = categorie
        self.categorieA = categorieA
    }
    
    var body: some View {
        ScrollView {
            ForEach(mercurial.ingredients.filter(filterSearch), id: \.code) { ingredient in
                NavigationLink(destination: IngredientDetailView(IngredientViewModel(model: ingredient))) {
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
                .padding(5)
                
            }
        }
        .onChange(of: mercurial.state, perform: {
            newValue in stateChanged(newValue)
        })
    }
}

