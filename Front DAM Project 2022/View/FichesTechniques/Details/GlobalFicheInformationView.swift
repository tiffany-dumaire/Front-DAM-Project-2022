//
//  GlobalFicheInformationView.swift
//  Front DAM Project 2022
//
//  Created by m1 on 24/02/2022.
//

import SwiftUI

struct GlobalFicheInformationView: View {
    @EnvironmentObject var categoriesFT: ListCategorieFTViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("Intitulé :").frame(height: 30)
                Text(vm.libelle_fiche_technique)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Responsable :").frame(height: 30)
                Text(vm.intitule_responsable)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Nombre de couverts :").frame(height: 30)
                Text("\(vm.nombre_couverts)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Catégorie :").frame(height: 30)
                Picker("Catégorie", selection: $vm.id_categorie_fiche) {
                    Text("Aucune").tag(0)
                        .foregroundColor(.black)
                    ForEach(categoriesFT.categories, id: \.id_categorie_fiche) { categorie in
                        Text(categorie.categorie_fiche).tag(categorie.id_categorie_fiche)
                            .foregroundColor(.black)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                    .disabled(true)
            }
            .padding(20)
        }
    }
}

struct GlobalFicheInformationView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalFicheInformationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Test", nombre_couverts: 10, id_responsable: 1, intitule_responsable: "Responsable", id_categorie_fiche: 2, phases: [])))
    }
}
