//
//  FTModificationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 02/03/2022.
//

import SwiftUI

struct FTModificationView: View {
    @State var index: Int = 0
    @ObservedObject var vm: FicheTechniqueViewModel
    
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
                Spacer(minLength: 0)
                Text("Phases")
                    .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.orange.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                Spacer(minLength: 0)
                Text("Ordre")
                    .foregroundColor(self.index == 2 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.orange.opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
            }
                .background(Color.blue.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top, 10)
            VStack {
                TabView(selection: $index) {
                    AddGlobalFicheInformationView(vm: vm, index: $index).tag(0)
                    ListPhasesAddingView(vm: vm, index: $index).tag(1)
                    ModificationOrdrePhasesView(vm : vm).tag(2)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("Modifier une fiche technique")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FTModificationView_Previews: PreviewProvider {
    static var previews: some View {
        FTModificationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 0, libelle_fiche_technique: "", nombre_couverts: 1, id_responsable: 0, intitule_responsable: "", id_categorie_fiche: 0, phases: [])))
    }
}
