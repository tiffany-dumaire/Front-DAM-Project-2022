//
//  AddPhaseGlobalInformationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 01/03/2022.
//

import SwiftUI

struct AddPhaseGlobalInformationView: View {
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    @State var phase: PhaseModel
    @Binding var index: Int
    @Binding var showingCover: Bool
    var cols = [GridItem](repeating: .init(.flexible()), count: 2)
    
    private func stateChanged(_ newValue: FicheTechniqueIntent) {
        switch self.vm.state {
            case .phaseAdded:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .phaseAdded to .ready")
                self.fiches.state = .changingListFT
            case .phaseModified:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .phaseModified to .ready")
                self.fiches.state = .changingListFT
            default:
                return
        }
    }
    
    var body: some View {
        ScrollView {
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
                    Text("Description de la phase :")
                        .frame(height: 30)
                        .foregroundColor(.blue)
                    TextEditor(text: $phase.description_phase)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 200, alignment: .topLeading)
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
                    if (phase.id_phase == 0) {
                        Text("\(vm.phases.count + 1)")
                            .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .foregroundColor(.black)
                            .background(Color.myGray.opacity(0.25))
                            .cornerRadius(10)
                    } else {
                        Text("\(phase.ordre)")
                            .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .foregroundColor(.black)
                            .background(Color.myGray.opacity(0.25))
                            .cornerRadius(10)
                    }
                       
                }
                Spacer().frame(height: 15)
                LazyVGrid(columns: cols, alignment: .center) {
                    Button("Continuer", action: {
                        Task {
                            if (phase.id_phase == 0) {
                                vm.state.intentToChange(phaseAdd: PhaseModel(id_phase: phase.id_phase, id_phase_ft: phase.id_phase_ft, libelle_phase: phase.libelle_phase, libelle_denrees: phase.libelle_denrees, description_phase: phase.description_phase, duree_phase: phase.duree_phase, ordre: vm.phases.count + 1, ingredients: []))
                            } else {
                                vm.state.intentToChange(phaseModify: phase)
                            }
                            self.showingCover = false
                        }
                    })
                    .padding(10)
                    .frame(width: 138)
                    .foregroundColor(Color.blue)
                    .background(Color.blue.opacity(0.25))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
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
                    .onChange(of: self.vm.state, perform: {
                        newValue in stateChanged(newValue)
                    })
            }.padding(.horizontal, 20)
        }
    }
}

struct AddPhaseGlobalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhaseGlobalInformationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])), phase: PhaseModel(id_phase: 0, id_phase_ft: 0, libelle_phase: "", libelle_denrees: "", description_phase: "", duree_phase: 0, ordre: 0, ingredients: []), index: .constant(0), showingCover: .constant(true))
    }
}
