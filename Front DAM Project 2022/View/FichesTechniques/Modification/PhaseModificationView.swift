//
//  PhaseModificationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 03/03/2022.
//

import SwiftUI

struct PhaseModificationView: View {
    @StateObject var vm: FicheTechniqueViewModel
    @State var phase: PhaseModel
    var cols = [GridItem](repeating: .init(.flexible()), count: 2)
    @State var index: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Phase")
                    .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.7))
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.indigo.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                Spacer(minLength: 0)
                Text("Ingrédient")
                    .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.7))
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.indigo.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                Spacer(minLength: 0)
                Text("Quantité")
                    .foregroundColor(self.index == 2 ? .white : Color.black.opacity(0.7))
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background(Color.indigo.opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
            }.background(Color.blue.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top, 10)
            Spacer().frame(height: 15)
            TabView(selection: $index) {
                AddPhaseGlobalInformationView(vm: vm, phase: $phase, index: $index).tag(0)
                PhaseIngredientChoiceView(vm: vm, phase: $phase, index: $index).tag(1)
                PhaseQuantityModificationView(vm: vm, phase: $phase, index: $index).tag(2)
            }
            Spacer(minLength: 0)
        }
    }
}

struct PhaseModificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseModificationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])), phase: PhaseModel(id_phase: 3, id_phase_ft: 2, libelle_phase: "Phase 1", libelle_denrees: "Ingrédient phase 1", description_phase: "Ma super description des enfers !!!", duree_phase: 30, ordre: 2, ingredients: []))
    }
}
