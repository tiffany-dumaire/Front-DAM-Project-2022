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
                SearchBarView(text: .constant(""))
                List {
                    ForEach(fiches.fiches, id: \.id_fiche_technique) { fiche in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "cross.circle.fill").font(.system(size: 14))
                                Text("\(fiche.libelle_fiche_technique)").font(.system(size: 14))
                            }
                            HStack {
                                Image(systemName: "person.3.sequence.fill").font(.system(size: 12))
                                Text("\(fiche.nombre_couverts)").font(.system(size: 12))
                            }.padding(.horizontal, 25)
                        }
                    }
                }
                
            }
            Divider()
            VStack(alignment: .leading) {
                Text("Fiches sélectionnées")
                List {
                    Text("Il n'y a pas encore de fiches ici")
                    Text("Les quantités pour chaque fiche seront affichées à leur droite et le nombre de couverts en dessous du nom")
                }
            }
        }.padding()
    }
}

struct FTChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        FTChoiceView(fiches: ListFicheTechniqueViewModel([FicheTechniqueModel(id_fiche_technique: 1, libelle_fiche_technique: "Saint-Honoré", nombre_couverts: 10),FicheTechniqueModel(id_fiche_technique: 2, libelle_fiche_technique: "Crêpes", nombre_couverts: 6), FicheTechniqueModel(id_fiche_technique: 3, libelle_fiche_technique: "Poulet cocotte", nombre_couverts: 4)]))
    }
}
