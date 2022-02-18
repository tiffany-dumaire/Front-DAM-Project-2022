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
    @State var fiches: ListFicheTechniqueViewModel = ListFicheTechniqueViewModel([])

    private func filterSearch(fiche: FicheTechniqueModel) -> Bool{
        var ret = true
        if !texte.isEmpty {
            ret = false || fiche.libelle_fiche_technique.lowercased().contains(texte.lowercased())
        }
        return ret
    }
    
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
                /*Button(action: {}){
                    Image(systemName: "arrow.up.arrow.down.square.fill")
                        .foregroundColor(.orange)
                        .font(.system(size: 30))
    
                }*/
            }
            Text("Il y a \(fiches.fiches.count) fiches techniques correspondant à votre recherche")
                .font(.system(size: 11))
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            List {
                ForEach(fiches.fiches.filter(filterSearch), id: \.id_fiche_technique) { ft in
                    NavigationLink(destination: IngredientDetailView()) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "circle.hexagongrid.fill")
                                    .symbolRenderingMode(.multicolor)
                            Text(ft.libelle_fiche_technique)
                                .bold()
                            }
                            Text("\(ft.nombre_couverts) couverts | Pâtissier").font(.system(size: 13)).padding(.horizontal,30)
                        }
                    }
                }
            }
            .padding(15)
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Fiches techniques")
            
                .onAppear(perform:{
                    Task {
                        self.fiches = await FicheTechniqueDAO.loadFTsDatas()
                        print(self.fiches)
                    }
                })
        }
    }
}

struct FTView_Previews: PreviewProvider {
    static var previews: some View {
        FTView()
    }
}
