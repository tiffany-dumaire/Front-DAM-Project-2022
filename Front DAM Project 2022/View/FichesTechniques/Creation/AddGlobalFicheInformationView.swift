//
//  AddGlobalFicheInformationView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 28/02/2022.
//

import SwiftUI

struct AddGlobalFicheInformationView: View {
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    @EnvironmentObject var categoriesFT: ListCategorieFTViewModel
    @EnvironmentObject var responsables: ListResponsableViewModel
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: FicheTechniqueViewModel
    @Binding var index: Int
    
    var cols = [GridItem](repeating: .init(.flexible()), count: 2)
    
    private func filterSearch(categorie: CategorieFTModel) -> Bool{
        return categorie.id_categorie_fiche == vm.id_categorie_fiche
    }
    
    private func stateChanged(_ newValue: FicheTechniqueIntent) {
        switch self.vm.state {
            case .ftAdded:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .ftAdded to .ready")
                self.fiches.state = .changingListFT
            case .ftChanged:
                self.vm.state = .ready
                print("FicheTechniqueIntent: .ftChanged to .ready")
                self.fiches.state = .changingListFT
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
                TextField("intitulé..", text: $vm.libelle_fiche_technique)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Responsable :").frame(height: 30)
                Picker("Responsable", selection: $vm.id_responsable) {
                    Text("Aucune").tag(0)
                    ForEach(responsables.responsables, id: \.id_responsable) { respo in
                        Text(respo.intitule_responsable).tag(respo.id_responsable)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Nombre de couverts :").frame(height: 30)
                CustomIntStepperView(value: $vm.nombre_couverts, step: 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Catégorie :").frame(height: 30)
                Picker("Catégorie", selection: $vm.id_categorie_fiche) {
                    Text("Aucune").tag(0)
                    ForEach(categoriesFT.categories, id: \.id_categorie_fiche) { categorie in
                        Text(categorie.categorie_fiche).tag(categorie.id_categorie_fiche)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                if vm.id_fiche_technique == 0 {
                    LazyVGrid(columns: cols, alignment: .center) {
                        Button("Continuer", action: {
                            vm.state.intentToChange(ficheAdd: FicheTechniqueModel(id_fiche_technique: vm.id_fiche_technique, libelle_fiche_technique: vm.libelle_fiche_technique, nombre_couverts: vm.nombre_couverts, id_responsable: vm.id_responsable, intitule_responsable: vm.intitule_responsable, id_categorie_fiche: vm.id_categorie_fiche, phases: []))
                            self.index = 1
                        })
                            .padding(10)
                            .frame(width: 138)
                            .foregroundColor(Color.green)
                            .background(Color.green.opacity(0.25))
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                        Button("Annuler", action: {
                            dismiss()
                        })
                            .padding(10)
                            .frame(width: 138)
                            .foregroundColor(Color.red)
                            .background(Color.red.opacity(0.25))
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                    }
                } else {
                    LazyVGrid(columns: cols, alignment: .center) {
                        Button("Modifier", action: {
                            vm.state.intentToChange(ficheModify: FicheTechniqueModel(id_fiche_technique: vm.id_fiche_technique, libelle_fiche_technique: vm.libelle_fiche_technique, nombre_couverts: vm.nombre_couverts, id_responsable: vm.id_responsable, intitule_responsable: vm.intitule_responsable, id_categorie_fiche: vm.id_categorie_fiche, phases: []))
                            self.index = 1
                        })
                            .padding(10)
                            .frame(width: 138)
                            .foregroundColor(Color.modifyButton)
                            .background(Color.modifyButton.opacity(0.25))
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
            }.padding(.horizontal, 20)
                .onChange(of: self.vm.state, perform: {
                    newValue in stateChanged(newValue)
                })
        }
    }
}

struct AddGlobalFicheInformationView_Previews: PreviewProvider {
    static var previews: some View {
        AddGlobalFicheInformationView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Abricots", nombre_couverts: 2, id_responsable: 1, intitule_responsable: "Patissier", id_categorie_fiche: 1, phases: [])), index: .constant(0))
    }
}
