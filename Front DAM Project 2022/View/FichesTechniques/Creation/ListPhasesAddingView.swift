//
//  ListPhasesAddingView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 01/03/2022.
//

import SwiftUI

struct ListPhasesAddingView: View {
    @ObservedObject var vm: FicheTechniqueViewModel
    @State private var showingCover = false
    
    var body: some View {
        ScrollView {
            ForEach(vm.phases, id: \.id_phase) { phase in
                PhasesDetailView(phase: phase)
                    .padding(.vertical, 15)
                Divider()
            }
            Button("Ajouter une phase", action: {
                showingCover.toggle()
            }).fullScreenCover(isPresented: $showingCover) {
                PhaseAddingView(vm: vm, showingCover: $showingCover)
            }
                .padding(10)
                .frame(width: 200)
                .foregroundColor(Color.green)
                .background(Color.green.opacity(0.25))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
        }
    }
}

struct ListPhasesAddingView_Previews: PreviewProvider {
    static var previews: some View {
        ListPhasesAddingView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])))
    }
}
