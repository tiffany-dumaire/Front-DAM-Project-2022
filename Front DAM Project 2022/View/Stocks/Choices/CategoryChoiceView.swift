//
//  CategoryChoiceView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 22/02/2022.
//

import SwiftUI

struct CategoryChoiceView: View {
    @EnvironmentObject var categoriesIngredient: ListCategorieIngredientViewModel
    @Binding var categorie: Int
    @State private var showingAlert = false
    @Binding var index: Int
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Catégorie :").frame(height: 30)
                Picker("Catégorie", selection: $categorie) {
                    Text("Aucune").tag(0)
                        .padding(.horizontal, 15)
                    ForEach(categoriesIngredient.categories, id: \.id_categorie) { categorie in
                        Text(categorie.categorie).tag(categorie.id_categorie)
                            .padding(.horizontal, 15)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Button("Choisir cette catégorie", action: {
                    if categorie == 0 {
                        showingAlert.toggle()
                    } else {
                        index = 1
                    }
                }).alert("Vous devez impérativement sélectionner une catégorie avant de continuer", isPresented: $showingAlert) {
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
            }.padding(15)
                .background(Color.brown.opacity(0.05))
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.brown, lineWidth: 2))
            Spacer()
        }.padding(15)
    }
}

struct CategoryChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryChoiceView(categorie: .constant(0), index: .constant(0))
    }
}
