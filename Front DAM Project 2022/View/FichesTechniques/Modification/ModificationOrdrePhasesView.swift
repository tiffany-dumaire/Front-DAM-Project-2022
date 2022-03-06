//
//  ModificationOrdrePhasesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany dumaire on 05/03/2022.
//

import SwiftUI
import SimpleToast

struct ModificationOrdrePhasesView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    @State var showToast: Bool = false
    var cols = [GridItem(.flexible()),GridItem(.fixed(120))]
    
    private let toastOptions = SimpleToastOptions(hideAfter: 5)
    
    private func stateChanged(_ newValue: FicheTechniqueIntent) {
        switch self.vm.state {
            case .ordreModified:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .ordreModified to .ready")
                self.fiches.state = .changingListFT
            default:
                return
        }
    }
        
    var body: some View {
        ScrollView {
            VStack {
                ForEach($vm.phases, id: \.id_phase_ft) { $phase in
                    VStack(alignment: .leading) {
                        Text(phase.libelle_phase)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            CustomIntStepperView(value: $phase.ordre, step: 1, max: vm.phases.count)
                            Button(action: {
                                vm.state.intentToChange(ordreModify: phase)
                                if let i: Int = vm.phases.firstIndex(where: { phase.id_phase == $0.id_phase }) {
                                    vm.phases[i].ordre = phase.ordre
                                    withAnimation {
                                        self.showToast.toggle()
                                    }
                               }
                            }) {
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.modifyButton)
                                    Text("Enregistrer")
                                        .font(.system(size: 14))
                                }
                            }
                                .padding(10)
                                .frame(width: 120)
                                .background(Color.modifyButton.opacity(0.25))
                                .foregroundColor(Color.modifyButton)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.modifyButton, lineWidth: 2))
                        }
                    }.padding(.vertical, 15)
                }
                Button("Terminer", action: {
                    dismiss()
                    dismiss()
                })
                    .padding(10)
                    .frame(width: 138)
                    .background(Color.blue.opacity(0.25))
                    .foregroundColor(Color.blue)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            }.padding(.horizontal, 15)
                .simpleToast(isPresented: $showToast, options: toastOptions) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("L'ordre d'une phase a été modifié.")
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                }
                .onChange(of: self.vm.state, perform: {
                    newValue in stateChanged(newValue)
                })
        }
    }
}

struct ModificationOrdrePhasesView_Previews: PreviewProvider {
    static var previews: some View {
        ModificationOrdrePhasesView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])))
    }
}
