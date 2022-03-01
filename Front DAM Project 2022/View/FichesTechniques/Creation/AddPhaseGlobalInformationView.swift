//
//  AddPhaseGlobalInformationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 01/03/2022.
//

import SwiftUI

struct AddPhaseGlobalInformationView: View {
    @ObservedObject var vm: FicheTechniqueViewModel
    @State var phase: PhaseModel
    @Binding var index: Int
    @Binding var showingCover: Bool
    var cols = [GridItem(.flexible()),GridItem(.fixed(130))]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Group {
                Text("Libellé de la phase :")
                    .frame(height: 30)
                    .foregroundColor(.blue)
                TextField("libellé phase..", text: $phase.libelle_phase)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .foregroundColor(.black)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Titre des denrées de la phase :")
                    .frame(height: 30)
                    .foregroundColor(.blue)
                TextField("libellé denrées..", text: $phase.libelle_denrees)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .foregroundColor(.black)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Durée en minutes :")
                    .frame(height: 30)
                    .foregroundColor(.blue)
                CustomIntStepperView(value: $phase.duree_phase, step: 1)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Ordre :")
                    .frame(height: 30)
                    .foregroundColor(.blue)
                Text("\(vm.phases.count)")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .foregroundColor(.black)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
            }
            Spacer().frame(height: 15)
            LazyVGrid(columns: cols, alignment: .center) {
                Button("Continuer", action: {
                    self.index = 1
                })
                .padding(10)
                .frame(width: 138)
                .foregroundColor(Color.green)
                .background(Color.green.opacity(0.25))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                Button("Annuler", role:.none){
                    self.showingCover = false
                }
                .padding(10)
                .frame(width: 138)
                .foregroundColor(Color.red)
                .background(Color.red.opacity(0.25))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
            }
            Spacer()
        }.padding(.horizontal, 20)
    }
}

struct AddPhaseGlobalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhaseGlobalInformationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])), phase: PhaseModel(id_phase: 0, id_phase_ft: 0, libelle_phase: "", libelle_denrees: "", description_phase: "", duree_phase: 0, ordre: 0, ingredients: []), index: .constant(0), showingCover: .constant(true))
    }
}
