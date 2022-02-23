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
    var cols = [GridItem(.fixed(85)),GridItem(.flexible())]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                LazyVGrid(columns: cols, alignment: .leading, spacing: 5) {
                    Text("Libellé :")
                        .font(.system(size: 16))
                    SearchBarView(text: $texte, placeholder: "libellé..")
                    Text("Catégorie :")
                        .font(.system(size: 16))
                    Picker("Catégorie", selection: $selectedCategorie) {
                        Text("Aucune").tag(0)
                            .padding(.horizontal, 10)
                        ForEach(categoriesIngredient.categories, id: \.id_categorie) { categorie in
                            Text(categorie.categorie).tag(categorie.id_categorie)
                                .padding(.horizontal, 10)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .background(Color.myGray.opacity(0.25))
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                }.padding(10)
            }.padding(.bottom, 5)
                .background(Color.salmon.opacity(0.2))
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
