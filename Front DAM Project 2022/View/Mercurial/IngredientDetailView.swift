//
//  IngredientDetailView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 10/02/2022.
//

import SwiftUI

struct IngredientDetailView: View {
    @EnvironmentObject var categoriesIngredient: ListCategorieIngredientViewModel
    @EnvironmentObject var categoriesAllergenes: ListCategorieAllergeneViewModel
    @ObservedObject var vm: IngredientViewModel
    
    var cols = [GridItem(.fixed(140)),GridItem(.flexible())]
    var cols2 = [GridItem](repeating: .init(.flexible()), count: 2)
    
    init(_ vm: IngredientViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            Text("\(vm.libelle)")
                .font(.title)
                .bold()
                .foregroundColor(Color.pink)
            Divider()
            Spacer().frame(height: 20)
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Prix unitaire :").frame(height: 30)
                Text(String(format: "%.2f", vm.prix_unitaire) + " €")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Stock :").frame(height: 30)
                Text(String(format: "%.3f", vm.stock) + " " + vm.unite).frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Valeur du stock :").frame(height: 30)
                Text(String(format: "%.2f", vm.prix_unitaire * vm.stock) + " €").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Catégorie :").frame(height: 30)
                Picker("Catégorie", selection: $vm.id_categorie) {
                    Text("Aucune").tag(0)
                        .foregroundColor(.black)
                    ForEach(categoriesIngredient.categories, id: \.id_categorie) { categorie in
                        Text(categorie.categorie).tag(categorie.id_categorie)
                            .foregroundColor(.black)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .disabled(true)
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
                HStack {
                    if vm.allergene == false {
                        HStack {
                            Image(systemName: "checkmark.shield.fill")
                                .foregroundColor(.green)
                            Text("Non")
                        }
                    } else {
                        HStack {
                            Image(systemName: "xmark.seal.fill")
                                .foregroundColor(.red)
                            Text("Oui")
                        }
                    }
                }
                if vm.allergene {
                    Text("Cat. d'allergènes :").frame(height: 30)
                    Picker("Cat. d'allergènes", selection: $vm.id_categorie_allergene) {
                        Text("Aucune").tag(0)
                            .foregroundColor(.black)
                        ForEach(categoriesAllergenes.categories, id: \.id_categorie_allergene) { categorie in
                            Text(categorie.categorie_allergene).tag(categorie.id_categorie_allergene)
                                .foregroundColor(.black)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .disabled(true)
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
                    NavigationLink(destination: IngredientModifyView(vm: vm)) {
                        Text("Modifier")
                    }
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.modifyButton.opacity(0.25))
                        .foregroundColor(Color.modifyButton)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.modifyButton, lineWidth: 2))
                    Button("Supprimer", action: {})
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.red.opacity(0.25))
                        .foregroundColor(Color.red)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                    Button("Imprimer", action: {})
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.blue.opacity(0.25))
                        .foregroundColor(Color.blue)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                }
            }
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
        }.padding(.horizontal, 10)
    }
}

struct IngredientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetailView(IngredientViewModel(model: IngredientModel(code: 101, libelle: "Frites", unite: "Kg", prix_unitaire: 2.32, stock: 0.32, allergene: false, id_categorie: 1, id_categorie_allergene: 0)))
    }
}
