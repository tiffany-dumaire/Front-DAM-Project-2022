//
//  AddGlobalFicheInformationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 28/02/2022.
//

import SwiftUI

struct AddGlobalFicheInformationView: View {
    @EnvironmentObject var categoriesFT: ListCategorieFTViewModel
    @EnvironmentObject var responsables: ListResponsableViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    
    private func filterSearch(categorie: CategorieFTModel) -> Bool{
        return categorie.id_categorie_fiche == vm.id_categorie_fiche
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("Intitulé :").frame(height: 30)
                TextField("intitulé..", text: $vm.libelle_fiche_technique)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Responsable :").frame(height: 30)
                Picker("Responsable", selection: $vm.id_responsable) {
                    Text("Aucune").tag(0)
                    ForEach(responsables.responsables, id: \.id_responsable) { respo in
                        Text(respo.intitule_responsable).tag(respo.id_responsable)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Nombre de couverts :").frame(height: 30)
                Text("\(vm.nombre_couverts)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Catégorie :").frame(height: 30)
                Picker("Catégorie", selection: $vm.id_categorie_fiche) {
                    Text("Aucune").tag(0)
                    ForEach(categoriesFT.categories, id: \.id_categorie_fiche) { categorie in
                        Text(categorie.categorie_fiche).tag(categorie.id_categorie_fiche)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
            }.padding(.horizontal, 20)
        }
    }
}

struct AddGlobalFicheInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AddGlobalFicheInformationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])))
    }
}
