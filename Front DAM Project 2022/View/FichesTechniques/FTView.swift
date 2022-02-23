//
//  FTView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct FTView: View {
    @State var intitule: String = ""
    @State var libelle: String = ""
    @EnvironmentObject var categoriesFT: ListCategorieFTViewModel
    @State var selectedCategorie: Int = 0
    var cols = [GridItem(.fixed(85)),GridItem(.flexible())]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                LazyVGrid(columns: cols, alignment: .leading, spacing: 5) {
                    Text("Intitulé :")
                        .font(.system(size: 16))
                    SearchBarView(text: $intitule, placeholder: "intitulé fiche..")
                    Text("Ingrédient :")
                        .font(.system(size: 16))
                    SearchBarView(text: $libelle, placeholder: "libellé ingrédient..")
                    Text("Catégorie :")
                        .font(.system(size: 16))
                    Picker("Catégorie", selection: $selectedCategorie) {
                        Text("Aucune").tag(0)
                            .padding(.horizontal, 10)
                        ForEach(categoriesFT.categories, id: \.id_categorie_fiche) { categorie in
                            Text(categorie.categorie_fiche).tag(categorie.id_categorie_fiche)
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
            CustomFTListView(texte: intitule, categorie: selectedCategorie)
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
