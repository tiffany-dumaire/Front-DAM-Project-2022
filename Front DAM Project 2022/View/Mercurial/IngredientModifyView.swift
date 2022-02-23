//
//  IngredientModifyView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 11/02/2022.
//

import SwiftUI

struct IngredientModifyView: View {
    @EnvironmentObject var categoriesIngredient: ListCategorieIngredientViewModel
    @EnvironmentObject var categoriesAllergenes: ListCategorieAllergeneViewModel
    @EnvironmentObject var mercurial: ListIngredientViewModel
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: IngredientViewModel
    @State private var showingAlert = false
    var cols = [GridItem(.fixed(140)),GridItem(.flexible())]
    var cols2 = [GridItem](repeating: .init(.flexible()), count: 2)
    
    init(vm: IngredientViewModel) {
        self.vm = vm
    }
    
    private func stateChanged(_ newValue: IngredientIntent) {
        switch self.vm.state {
            case .ingredientChanged:
                self.vm.state = .ready
                print("IngredientIntent: .ingredientChanged to .ready")
                self.mercurial.state = .changingListIngredient
            default:
                return
        }
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Libellé :")
                TextField("libellé..", text: $vm.libelle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Prix unitaire :").frame(height: 30)
                CustomDoubleStepperView(value: $vm.prix_unitaire, step: 0.01, decimal: 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Stock :").frame(height: 30)
                CustomDoubleStepperView(value: $vm.stock, step: 0.001, decimal: 3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Unité :").frame(height: 30)
                TextField("", text: $vm.unite).frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Catégorie :").frame(height: 30)
                Picker("Catégorie", selection: $vm.id_categorie) {
                    Text("Aucune").tag(0)
                    ForEach(categoriesIngredient.categories, id: \.id_categorie) { categorie in
                        Text(categorie.categorie).tag(categorie.id_categorie)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
            }
            VStack {
                Spacer().frame(height: 20)
                Divider()
                Spacer().frame(height: 20)
            }
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Allergène :").frame(height: 30)
                Toggle("", isOn: $vm.allergene)
                    .padding(.trailing, 130)
                if vm.allergene {
                    Text("Cat.d'allergènes :").frame(height: 30)
                    Picker("Catégorie d'allergènes", selection: $vm.id_categorie_allergene) {
                        Text("Aucune").tag(0)
                        ForEach(categoriesAllergenes.categories, id: \.id_categorie_allergene) { categorie in
                            Text(categorie.categorie_allergene).tag(categorie.id_categorie_allergene)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .background(Color.myGray.opacity(0.25))
                        .cornerRadius(10)
                }
            }
            VStack {
                Spacer().frame(height: 20)
                Divider()
                Spacer().frame(height: 20)
                LazyVGrid(columns: cols2, alignment: .center, spacing: 20) {
                    Button("Sauvegarder", action: {
                        if vm.allergene && (vm.id_categorie_allergene == 0 || vm.id_categorie_allergene == nil) {
                            vm.reset()
                            showingAlert.toggle()
                        } else {
                            vm.state.intentToChange(ingredientModify: IngredientModel(code: vm.code, libelle: vm.libelle, unite: vm.unite, prix_unitaire: vm.prix_unitaire, stock: vm.stock, allergene: vm.allergene, id_categorie: vm.id_categorie, id_categorie_allergene: vm.allergene ? vm.id_categorie_allergene : nil))
                            dismiss()
                        }
                    }).alert("Vous ne pouvez pas créer un ingrédient sans remplir tous les champs obligatoires.", isPresented: $showingAlert) {
                        Button("J'ai compris", role: .cancel) {
                            return
                        }
                    }
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.green.opacity(0.25))
                        .foregroundColor(Color.green)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                    Button("Annuler", action: {
                        vm.reset()
                        dismiss()
                    })
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.red.opacity(0.25))
                        .foregroundColor(Color.red)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                }
            }
            Spacer(minLength: 0)
                .navigationTitle("Modifier un ingrédient")
                .navigationBarTitleDisplayMode(.inline)
            
                .onChange(of: self.vm.state, perform: {
                    newValue in stateChanged(newValue)
                })
        }.padding(10)
    }
}

/*struct IngredientModifyView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientModifyView()
    }
}*/
