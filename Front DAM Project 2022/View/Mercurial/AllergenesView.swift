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
    @EnvironmentObject var categoriesAllergenes: ListCategorieAllergeneViewModel 
    @State var selectedCategorie: Int = 0
    var cols = [GridItem(.fixed(95)),GridItem(.flexible())]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                LazyVGrid(columns: cols, alignment: .leading, spacing: 5) {
                    Text("Libellé :")
                        .font(.system(size: 16))
                    SearchBarView(text: $texte, placeholder: "libellé..")
                    Text("Catégorie \nd'allergènes :")
                        .font(.system(size: 15))
                    Picker("Catégorie d'allergènes", selection: $selectedCategorie) {
                        Text("Aucune").tag(0)
                            .padding(.horizontal, 10)
                        ForEach(categoriesAllergenes.categories, id: \.id_categorie_allergene) { categorie in
                            Text(categorie.categorie_allergene).tag(categorie.id_categorie_allergene)
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
            CustomIngredientListView(texte: texte, allergen: true, categorie: 0, categorieA: selectedCategorie)
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
