//
//  FTCreationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 28/02/2022.
//

import SwiftUI

struct FTCreationView: View {
    @State var index: Int = 0
    @StateObject var vm: FicheTechniqueViewModel = FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 0, libelle_fiche_technique: "", nombre_couverts: 1, id_responsable: 0, intitule_responsable: "", id_categorie_fiche: 0, phases: []))
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("Infos")
                    .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.orange.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Phases")
                    .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.orange.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
                Spacer(minLength: 0)
                Text("Ordre")
                    .foregroundColor(self.index == 2 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.orange.opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 2
                        }
                    }
            }
                .background(Color.blue.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top, 10)
            VStack {
                TabView(selection: $index) {
                    AddGlobalFicheInformationView().tag(0)
                    ListPhasesView(phases: vm.phases).tag(1)
                }
            }
            .navigationTitle("Créer une fiche technique")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FTCreationView_Previews: PreviewProvider {
    static var previews: some View {
        FTCreationView()
    }
}
