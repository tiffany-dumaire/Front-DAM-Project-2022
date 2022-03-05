//
//  FTDetailView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct FTDetailView: View {
    @State var index: Int = 0
    @ObservedObject var vm: FicheTechniqueViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("Infos")
                    .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.orange.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Progression")
                    .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.orange.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
                Spacer(minLength: 0)
                Text("Coûts")
                    .foregroundColor(self.index == 2 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.orange.opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 2
                        }
                    }
            
            }.background(Color.blue.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top, 10)
            VStack {
                TabView(selection: $index) {
                    GlobalFicheInformationView(vm: vm).tag(0)
                    ListPhasesView(phases: vm.phases).tag(1)
                    CoutsView(vm: vm).tag(2)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle(vm.libelle_fiche_technique)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FTDetailView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Test", nombre_couverts: 10, id_responsable: 1, intitule_responsable: "Responsable", id_categorie_fiche: 2, phases: [])))
    }
}
