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
    @State private var showingAlert = false
    @Binding var index: Int
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
            Button("Continuer", action: {
                self.index = 2
            })
                .padding(10)
                .frame(width: 138)
                .background(Color.blue.opacity(0.25))
                .foregroundColor(Color.blue)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            NavigationLink(destination: PhaseAddingView(vm: vm)) {
                Text("Ajouter une phase")
                    .padding(10)
                    .frame(width: 200)
                    .foregroundColor(Color.green)
                    .background(Color.green.opacity(0.25))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
            }.padding(.top, 15)
            ForEach(vm.phases, id: \.id_phase) { phase in
                PhasesDetailView(phase: phase)
                    .padding(.vertical, 15)
                Spacer().frame(height: 15)
                LazyVGrid(columns: cols, alignment: .center) {
                    NavigationLink(destination: PhaseModificationView(vm: vm, phase: phase)) {
                        Text("Modifier")
                            .padding(10)
                            .frame(width: 138)
                            .foregroundColor(Color.modifyButton)
                            .background(Color.modifyButton.opacity(0.25))
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.modifyButton, lineWidth: 2))
                    }
                    Button("Supprimer", action: {
                        showingAlert.toggle()
                    }).alert("Souhaitez-vous r??ellement supprimer cette phase de la fiche technique ?", isPresented: $showingAlert) {
                        Button("Non", role: .cancel) {}
                        Button("Oui", role: .none) {
                            vm.state.intentToChange(phaseDelete: phase.id_phase_ft)
                            if let i = vm.phases.firstIndex(of: phase) {
                                vm.phases.remove(at: i)
                            }
                        }
                    }
                    .padding(10)
                    .frame(width: 138)
                    .foregroundColor(Color.red)
                    .background(Color.red.opacity(0.25))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                }
                .padding(.vertical, 15)
                Divider()
            }
                .onChange(of: self.vm.state, perform: {
                    newValue in stateChanged(newValue)
                })
        }
    }
}

struct ListPhasesAddingView_Previews: PreviewProvider {
    static var previews: some View {
        ListPhasesAddingView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])), index: .constant(1))
    }
}
