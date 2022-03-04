//
//  PhaseQuantityModificationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 04/03/2022.
//

import SwiftUI


struct PhaseQuantityModificationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    @Binding var phase: PhaseModel
    @Binding var index: Int
    var cols = [GridItem(.flexible()),GridItem(.fixed(120))]
    
    private func stateChanged(_ newValue: FicheTechniqueIntent) {
        switch self.vm.state {
            case .quantityModified:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .quantityModified to .ready")
                self.fiches.state = .changingListFT
            default:
                return
        }
    }
        
    var body: some View {
        ScrollView {
            VStack {
                ForEach($phase.ingredients, id: \.id_phase_ingredient) { $ingredient in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(ingredient.libelle)
                            Text("(en \(ingredient.unite))")
                                .font(.system(size: 14))
                        }
                        LazyVGrid(columns: cols, alignment: .leading) {
                            CustomDoubleStepperView(value: $ingredient.quantite, step: 0.001, decimal: 3)
                            Button(action: {
                                vm.state.intentToChange(id_phase: phase.id_phase, quantityModify: IngredientInStepModel(id_phase_ingredient: ingredient.id_phase_ingredient, code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, allergene: ingredient.allergene, quantite: ingredient.quantite))
                                if let i: Int = phase.ingredients.firstIndex(where: { ingredient.id_phase_ingredient == $0.id_phase_ingredient }) {
                                    phase.ingredients[i].quantite = ingredient.quantite
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
                })
                    .padding(10)
                    .frame(width: 138)
                    .background(Color.blue.opacity(0.25))
                    .foregroundColor(Color.blue)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            }.padding(.horizontal, 15)
                .onChange(of: self.vm.state, perform: {
                    newValue in stateChanged(newValue)
                })
        }
    }
}

struct PhaseQuantityModificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseQuantityModificationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])), phase: .constant(PhaseModel(id_phase: 0, id_phase_ft: 0, libelle_phase: "", libelle_denrees: "", description_phase: "", duree_phase: 0, ordre: 0, ingredients: [IngredientInStepModel(id_phase_ingredient: 1, code: 1, libelle: "Test", unite: "kg", prix_unitaire: 1.23, allergene: true, quantite: 2.356)])), index: .constant(2))
    }
}
