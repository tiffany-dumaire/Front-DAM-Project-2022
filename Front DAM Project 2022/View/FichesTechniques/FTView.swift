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
    @StateObject var fiches: ListFicheTechniqueViewModel = ListFicheTechniqueViewModel([FicheTechniqueModel(id_fiche_technique: 1, libelle_fiche_technique: "Saint-Honoré", nombre_couverts: 10),FicheTechniqueModel(id_fiche_technique: 2, libelle_fiche_technique: "Crêpes", nombre_couverts: 6), FicheTechniqueModel(id_fiche_technique: 3, libelle_fiche_technique: "Poulet cocotte", nombre_couverts: 4)])
    var body: some View {
        VStack {
            /*HStack {
                Text("Fiches Techniques")
                    .font(.title)
                    .bold()
                    .padding(10)
                Spacer(minLength: 0)
            }*/
            VStack {
                SearchBarView(text: $texte)
            }
            Text("Il y a \(fiches.fiches.count) fiches techniques correspondant à votre recherche")
                .font(.system(size: 11))
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            List {
                ForEach(fiches.fiches, id: \.id_fiche_technique) { ft in
                    NavigationLink(destination: IngredientDetailView()) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "circle.hexagongrid.fill")
                                    .symbolRenderingMode(.multicolor)
                            Text(ft.libelle_fiche_technique)
                                .bold()
                            }
                            HStack {
                                Text("\(ft.nombre_couverts) couverts | Pâtissier")
                            }
                        }
                    }
                }
            }
            .padding(15)
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
