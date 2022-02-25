//
//  FTChoiceView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct FTChoiceView: View {
    @ObservedObject private var fiches: ListFicheTechniqueViewModel
   // var fichesAjoutées:
    
    init(fiches: ListFicheTechniqueViewModel) {
        self.fiches = fiches
    }
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Listes des fiches")
                SearchBarView(text: .constant(""), placeholder: "intitulé fiche..")
                List {
                    ForEach(fiches.fiches, id: \.id_fiche_technique) { fiche in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(.green)
                                Text("\(fiche.libelle_fiche_technique)").font(.system(size: 14))
                            }
                            HStack {
                                Image(systemName: "person.3.sequence.fill").font(.system(size: 12))
                                Text("\(fiche.nombre_couverts)").font(.system(size: 12))
                            }.padding(.horizontal, 25)
                        }
                    }
                }.listStyle(PlainListStyle())
                
            }
            Divider()
            VStack(alignment: .leading) {
                Text("Fiches sélectionnées")
                List {
                    ForEach(fiches.fiches, id: \.id_fiche_technique) { fiche in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "minus.circle.fill")
                                    .font(.system(size: 14))
                                    .foregroundColor(.red)
                                Text("\(fiche.libelle_fiche_technique)").font(.system(size: 14))
                            }
                            HStack {
                                Image(systemName: "person.3.sequence.fill").font(.system(size: 12))
                                Text("\(fiche.nombre_couverts)").font(.system(size: 12))
                            }.padding(.horizontal, 25)
                        }
                    }
                }.listStyle(PlainListStyle())
            }
        }.padding()
    }
}

struct FTChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        FTChoiceView(fiches: ListFicheTechniqueViewModel([]))
    }
}
