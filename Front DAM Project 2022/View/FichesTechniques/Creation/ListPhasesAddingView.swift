//
//  ListPhasesAddingView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 01/03/2022.
//

import SwiftUI

struct ListPhasesAddingView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    @State private var showingCover = false
    @State private var showingCover2 = false
    var cols = [GridItem](repeating: .init(.flexible()), count: 2)
    
    private func stateChanged(_ newValue: FicheTechniqueIntent) {
        switch self.vm.state {
            case .phaseDeleted:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .phaseDeleted to .ready")
                self.fiches.state = .changingListFT
            default:
                return
        }
    }
    
    var body: some View {
        ScrollView {
            ForEach(vm.phases, id: \.id_phase) { phase in
                PhasesDetailView(phase: phase)
                    .padding(.vertical, 15)
                Spacer().frame(height: 15)
                LazyVGrid(columns: cols, alignment: .center) {
                    Button("Modifier", action: {
                        showingCover2.toggle()
                    }).fullScreenCover(isPresented: $showingCover2) {
                        PhaseModificationView(vm: vm, phase: phase, showingCover: $showingCover2)
                    }
                    .padding(10)
                    .frame(width: 138)
                    .foregroundColor(Color.modifyButton)
                    .background(Color.modifyButton.opacity(0.25))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.modifyButton, lineWidth: 2))
                    Button("Supprimer", action: {
                        vm.state.intentToChange(phaseDelete: phase.id_phase_ft)
                    })
                    .padding(10)
                    .frame(width: 138)
                    .foregroundColor(Color.red)
                    .background(Color.red.opacity(0.25))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                }
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
            
                .onChange(of: self.vm.state, perform: {
                    newValue in stateChanged(newValue)
                })
        }
    }
}

struct ListPhasesAddingView_Previews: PreviewProvider {
    static var previews: some View {
        ListPhasesAddingView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])))
    }
}
