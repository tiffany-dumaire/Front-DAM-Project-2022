//
//  FTView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct FTView: View {
    @State var texte: String = ""
    //var listFT: [String] = ["Saint-Honoré","Crêpes","Poulet au curry","Pain"]
    //@StateObject var fiches: ListFicheTechniqueViewModel = ListFicheTechniqueViewModel([])
    @EnvironmentObject var categoriesFT: ListCategorieFTViewModel
    @State var selectedCategorie: Int = 0
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Intitulé de la fiche :")
                    .padding(.horizontal,10)
                SearchBarView(text: $texte)
                HStack {
                    Text("Catégorie :")
                    Picker("Catégorie", selection: $selectedCategorie) {
                        Text("Aucune").tag(0)
                        ForEach(categoriesFT.categories, id: \.id_categorie_fiche) { categorie in
                            Text(categorie.categorie_fiche).tag(categorie.id_categorie_fiche)
                        }
                    }
                } .padding(.horizontal, 10)
            }.padding(10)
                .background(Color.salmon.opacity(0.2))
            CustomFTListView(texte: texte, categorie: selectedCategorie)
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Fiches techniques")
        }
    }
}

struct FTView_Previews: PreviewProvider {
    static var previews: some View {
        FTView()
    }
}
