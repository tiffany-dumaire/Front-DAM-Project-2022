//
//  GlobalFicheInformationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 24/02/2022.
//

import SwiftUI

struct GlobalFicheInformationView: View {
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    @EnvironmentObject var categoriesFT: ListCategorieFTViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    @Environment(\.dismiss) var dismiss
    var cols = [GridItem](repeating: .init(.flexible()), count: 2)
    
    private func filterSearch(categorie: CategorieFTModel) -> Bool{
        return categorie.id_categorie_fiche == vm.id_categorie_fiche
    }
    
    private func stateChanged(_ newValue: FicheTechniqueIntent) {
        switch self.vm.state {
            case .ftDeleted:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .ftDeleted to .ready")
                self.fiches.state = .changingListFT
            default:
                return
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("Intitulé :").frame(height: 30)
                Text(vm.libelle_fiche_technique)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.blue.opacity(0.25))
                    .cornerRadius(10)
                Text("Responsable :").frame(height: 30)
                Text(vm.intitule_responsable)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.blue.opacity(0.25))
                    .cornerRadius(10)
                Text("Nombre de couverts :").frame(height: 30)
                Text("\(vm.nombre_couverts)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.blue.opacity(0.25))
                    .cornerRadius(10)
                Text("Catégorie :").frame(height: 30)
                ForEach(categoriesFT.categories.filter(filterSearch), id: \.id_categorie_fiche) { categorie in
                    Text(categorie.categorie_fiche)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(Color.blue.opacity(0.25))
                        .cornerRadius(10)
                }
                VStack {
                    Spacer().frame(height: 15)
                    Divider()
                    Spacer().frame(height: 15)
                    LazyVGrid(columns: cols, alignment: .center, spacing: 20) {
                        Button("Modifier", action: {
                            
                        })
                            .padding(10)
                            .frame(width: 130)
                            .background(Color.modifyButton.opacity(0.25))
                            .foregroundColor(Color.modifyButton)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.modifyButton, lineWidth: 2))
                        Button("Supprimer", action: {
                            vm.state.intentToChange(ficheDelete: vm.id_fiche_technique)
                            dismiss()
                        })
                            .padding(10)
                            .frame(width: 130)
                            .background(Color.red.opacity(0.25))
                            .foregroundColor(Color.red)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                    }
                }
            }
            .padding(20)
            .onChange(of: self.vm.state, perform: {
                newValue in stateChanged(newValue)
            })
        }
    }
}

struct GlobalFicheInformationView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalFicheInformationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Test", nombre_couverts: 10, id_responsable: 1, intitule_responsable: "Responsable", id_categorie_fiche: 2, phases: [])))
    }
}
