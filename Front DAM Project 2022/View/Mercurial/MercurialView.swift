//
//  MercurialView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 08/02/2022.
//

import SwiftUI

struct MercurialView: View {
    @State var texte: String = ""
    @EnvironmentObject var mercurial: ListIngredientViewModel
    @EnvironmentObject var categoriesIngredient: ListCategorieIngredientViewModel
    @State var selectedCategorie: Int = 0
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Libellé :")
                    .padding(.horizontal,10)
                SearchBarView(text: $texte)
                HStack {
                    Text("Catégorie :")
                    Picker("Catégorie", selection: $selectedCategorie) {
                        Text("Aucune").tag(0)
                        ForEach(categoriesIngredient.categories, id: \.id_categorie) { categorie in
                            Text(categorie.categorie).tag(categorie.id_categorie)
                        }
                    }
                } .padding(.horizontal, 10)
            }.padding(10)
                .background(Color.salmon.opacity(0.2))
           /* List {
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
            .padding(15)*/
            CustomIngredientListView(texte: texte, allergen: false, categorie: selectedCategorie, categorieA: 0)
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Mercurial")
        }
    }
}

struct MercurialView_Previews: PreviewProvider {
    static var previews: some View {
        MercurialView()
    }
}
