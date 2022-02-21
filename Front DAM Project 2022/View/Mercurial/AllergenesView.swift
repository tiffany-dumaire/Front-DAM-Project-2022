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
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Libellé :")
                    .padding(.horizontal,10)
                SearchBarView(text: $texte)
                HStack {
                    Text("Catégorie d'allergènes :")
                    Picker("Catégorie d'allergènes", selection: $selectedCategorie) {
                        Text("Aucune").tag(0)
                        ForEach(categoriesAllergenes.categories, id: \.id_categorie_allergene) { categorie in
                            Text(categorie.categorie_allergene).tag(categorie.id_categorie_allergene)
                        }
                    }
                } .padding(.horizontal, 10)
            }.padding(10)
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
