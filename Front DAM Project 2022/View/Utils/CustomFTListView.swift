//
//  CustomFTListView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 20/02/2022.
//

import SwiftUI

struct CustomFTListView: View {
    private var texte: String
    private var categorie: Int
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    
    private func filterSearch(fiche: FicheTechniqueModel) -> Bool{
        return (categorie != 0 ? fiche.id_categorie_fiche == categorie : true) && (!texte.isEmpty ? fiche.libelle_fiche_technique.lowercased().contains(texte.lowercased()) : true)
    }
    
    init(texte: String, categorie: Int) {
        self.texte = texte
        self.categorie = categorie
    }
    
    var body: some View {
        ScrollView {
            ForEach(fiches.fiches.filter(filterSearch), id: \.id_fiche_technique) { fiche in
                NavigationLink(destination: FTDetailView(vm: FicheTechniqueViewModel(model: fiche))) {
                    HStack {
                        Image(systemName: "circle.hexagongrid.fill")
                            .symbolRenderingMode(.multicolor)
                            .padding(.leading, 10)
                        VStack(alignment: .leading) {
                            HStack {
                                Text(fiche.libelle_fiche_technique)
                                    .bold()
                                    .font(.system(size: 16))
                            }.padding(.horizontal)
                            HStack {
                                Text("\(fiche.intitule_responsable)")
                                    .font(.system(size: 11))
                                    .padding(8)
                                    .foregroundColor(Color.indigo)
                                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.indigo, lineWidth: 2))
                                Spacer()
                                Text("\(fiche.nombre_couverts) couverts")
                                    .font(.system(size: 11))
                                    .padding(8)
                                    .foregroundColor(Color.purple)
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
    }
}

struct CustomFTListView_Previews: PreviewProvider {
    static var previews: some View {
        CustomFTListView(texte: "", categorie: 1)
    }
}
