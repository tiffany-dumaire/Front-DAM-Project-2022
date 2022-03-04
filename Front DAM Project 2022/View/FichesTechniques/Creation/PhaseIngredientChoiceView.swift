//
//  PhaseIngredientChoiceView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 03/03/2022.
//

import SwiftUI

struct PhaseIngredientChoiceView: View {
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    @EnvironmentObject var mercurial: ListIngredientViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    @State private var showingAlert = false
    @State var texte: String = ""
    @Binding var phase: PhaseModel
    @Binding var index: Int
    
    private func filterSearch(ingredient: IngredientModel) -> Bool{
        return (!texte.isEmpty ? ingredient.libelle.lowercased().contains(texte.lowercased()) : true) && (!phase.ingredients.contains{ $0.code == ingredient.code })
    }
    
    private func stateChanged(_ newValue: FicheTechniqueIntent) {
        switch self.vm.state {
            case .ingredientAdded:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .ingredientAdded to .ready")
                self.fiches.state = .changingListFT
            case .ingredientDeleted:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .ingredientDeleted to .ready")
                self.fiches.state = .changingListFT
            default:
                return
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Listes des ingrédients")
                SearchBarView(text: $texte, placeholder: "libellé..")
                List {
                    ForEach(mercurial.ingredients.filter(filterSearch), id: \.code) { ingredient in
                        VStack(alignment: .leading, spacing: 10) {
                            Button(action: {
                                Task {
                                    vm.state.intentToChange(phase: phase.id_phase, ingredient: IngredientInStepModel(id_phase_ingredient: 0, code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, allergene: ingredient.allergene, quantite: 0))
                                }
                                phase.ingredients.append(IngredientInStepModel(id_phase_ingredient: 0, code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, allergene: ingredient.allergene, quantite: 0))
                                phase.ingredients = phase.ingredients.sorted {
                                    $0.libelle < $1.libelle
                                }
                            }) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.green)
                                        Text("\(ingredient.libelle)").font(.system(size: 14))
                                    }
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
            }
            Divider()
            VStack(alignment: .leading) {
                Text("Ingrédients sélectionnés")
                List {
                    ForEach(phase.ingredients, id: \.code) { ingredient in
                        VStack(alignment: .leading) {
                            Button(action: {
                                vm.state.intentToChange(id_phase: phase.id_phase, ingredientDelete: ingredient.id_phase_ingredient)
                                if let i = phase.ingredients.firstIndex(of: IngredientInStepModel(id_phase_ingredient: ingredient.id_phase_ingredient, code: ingredient.code, libelle: ingredient.libelle, unite: ingredient.unite, prix_unitaire: ingredient.prix_unitaire, allergene: ingredient.allergene, quantite: ingredient.quantite)) {
                                    phase.ingredients.remove(at: i)
                                }
                            }) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.red)
                                        Text("\(ingredient.libelle)").font(.system(size: 14))
                                    }
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
            }
            Button("Choisir ces ingrédients", action: {
                if phase.ingredients.count == 0 {
                    showingAlert.toggle()
                } else {
                    index = 1
                }
            }).alert("Vous devez impérativement sélectionner au moins un ingrédient avant de continuer", isPresented: $showingAlert) {
                Button("J'ai compris", role: .cancel) {
                    return
                }
            }
                .padding(10)
                .frame(width: 200)
                .background(Color.blue.opacity(0.25))
                .foregroundColor(Color.blue)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            
                .onChange(of: self.vm.state, perform: {
                    newValue in stateChanged(newValue)
                })
        }.padding()
    }
}
/*
struct PhaseIngredientChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        PhaseIngredientChoiceView()
    }
}
*/
