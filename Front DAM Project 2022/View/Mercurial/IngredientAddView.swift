//
//  IngredientAddView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 11/02/2022.
//

import SwiftUI

struct IngredientAddView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var categoriesIngredient: ListCategorieIngredientViewModel
    @EnvironmentObject var categoriesAllergenes: ListCategorieAllergeneViewModel
    @EnvironmentObject var mercurial: ListIngredientViewModel
    @ObservedObject var vm: IngredientViewModel = IngredientViewModel(model: IngredientModel(code: 0, libelle: "", unite: "", prix_unitaire: 0, stock: 0, allergene: false, id_categorie: 0, id_categorie_allergene: nil))
    @State var categorieA: Int = 0
    @State private var showingAlert = false
    @State var code: Int = 0
    @State var prix_unitaire: Double = 0
    
    var cols = [GridItem(.fixed(140)),GridItem(.flexible())]
    var cols2 = [GridItem](repeating: .init(.flexible()), count: 2)
    
    private func stateChanged(_ newValue: IngredientIntent) {
        switch self.vm.state {
            case .ingredientAdded:
                self.vm.state = .ready
                print("IngredientIntent: .ingredientAdded to .ready")
                self.mercurial.state = .changingListIngredient
            default:
                return
        }
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Code :").frame(height: 30)
                CustomIntStepperView(value: $vm.code, step: 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
            }
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Libellé :").frame(height: 30)
                TextField("libellé...", text: $vm.libelle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
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
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
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
                    Picker("Catégorie d'allergènes", selection: $categorieA) {
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
                    Button("Ajouter", action: {
                        if vm.libelle == "" || vm.unite == "" || vm.id_categorie == 0 || (vm.allergene && vm.id_categorie_allergene == 0) {
                            vm.reset()
                            showingAlert.toggle()
                        } else {
                            vm.state.intentToChange(ingredientAdd: IngredientModel(code: vm.code, libelle: vm.libelle, unite: vm.unite, prix_unitaire: vm.prix_unitaire, stock: vm.stock, allergene: vm.allergene, id_categorie: vm.id_categorie, id_categorie_allergene: vm.allergene ? categorieA == 0 ? nil : categorieA : nil))
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
                .navigationTitle("Ajouter un ingrédient")
                .navigationBarTitleDisplayMode(.inline)
            
                .onChange(of: self.vm.state, perform: {
                    newValue in stateChanged(newValue)
                })
            
        }.padding(10)
    }
}

struct IngredientAddView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientAddView()
    }
}
