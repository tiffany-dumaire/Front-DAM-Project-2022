//
//  IngredientAddView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 11/02/2022.
//

import SwiftUI

struct IngredientAddView: View {
    @StateObject var vm: IngredientViewModel = IngredientViewModel(model: IngredientModel(libelle: "", unite: "", prix_unitaire: 0, stock: 0, allergene: false))
    var cols = [GridItem(.fixed(130)),GridItem(.flexible())]
    var cols2 = [GridItem](repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Libellé :")
                TextField("libellé...", text: $vm.libelle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Prix unitaire :").frame(height: 30)
                Stepper(String(format: "%.2f", vm.prix_unitaire), value: $vm.prix_unitaire, step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Stock :").frame(height: 30)
                Stepper(String(format: "%.3f", vm.stock), value: $vm.stock, step:0.001)
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
                Text("Repas").frame(maxWidth: .infinity, alignment: .leading)
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
                    Text("Cat.d'allergène :").frame(height: 30)
                    Text("Si allergène seulement").frame(maxWidth: .infinity, alignment: .leading)
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
                    Button("Ajouter", action: {})
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.green.opacity(0.25))
                        .foregroundColor(Color.green)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green, lineWidth: 2))
                    Button("Annuler", action: {})
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
        }.padding(10)
    }
}

struct IngredientAddView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientAddView()
    }
}
