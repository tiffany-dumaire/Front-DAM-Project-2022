//
//  IngredientDetailView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 10/02/2022.
//

import SwiftUI

struct IngredientDetailView: View {
    //@Environment var list: IngredientViewModel
    @StateObject var vm = IngredientViewModel(model: IngredientModel(libelle: "Frites", unite: "kg", prix_unitaire: 2.34, stock: 5.6, allergene: true))
    var cols = [GridItem(.fixed(160)),GridItem(.flexible())]
    var cols2 = [GridItem](repeating: .init(.flexible()), count: 2)
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
                Text(String(format: "%.2f", vm.prix_unitaire))
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
                    .disabled(true)
                    .padding(.trailing, 130)
                if vm.allergene {
                    Text("Catégorie allergène :").frame(height: 30)
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
        }.padding(10)
    }
}

struct IngredientDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDetailView()
    }
}
