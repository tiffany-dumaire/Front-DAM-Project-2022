//
//  AllergenesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 18/02/2022.
//

import SwiftUI

struct AllergenesView: View {
    @State var texte: String = ""
    @EnvironmentObject var mercurial: ListIngredientViewModel
    
    /*private func filterSearch(ingredient: IngredientModel) -> Bool{
        var ret = true
        if !texte.isEmpty {
            ret = false || (ingredient.libelle.lowercased().contains(texte.lowercased()) && ingredient.allergene)
        }
        return ret && ingredient.allergene
    }*/

    var body: some View {
        VStack {
            VStack {
                SearchBarView(text: $texte)
            }
            /*Text("Il y a \(mercurial.ingredients.count) allergènes correspondant à votre recherche")
                .font(.system(size: 11))
                .foregroundColor(.myGray)
            List {
                ForEach(mercurial.ingredients.filter(filterSearch), id: \.code) { ingredient in
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
            .listStyle(SidebarListStyle())
            .padding(.horizontal, 15)*/
            CustomIngredientListView(texte: texte, allergen: true)
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Liste des allergènes")
        }
    }
}

struct AllergenesView_Previews: PreviewProvider {
    static var previews: some View {
        AllergenesView()
    }
}
