//
//  EntriesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 13/02/2022.
//

import SwiftUI

struct EntriesView: View {
    @EnvironmentObject var mercurial: ListIngredientViewModel
    var cols = [GridItem(.flexible()),GridItem(.fixed(80))]
    @Environment(\.dismiss) var dismiss
    @State var loading: Bool = false
    var body: some View {
        ScrollView {
            if loading {
                VStack {
                    Text("Stocks en cours d'enregistrement")
                    ProgressView()
                }
            } else {
                ForEach(mercurial.ingredients, id: \.code) { ingredient in
                    LazyVGrid(columns: cols, alignment: .leading, spacing: 15) {
                        Text(ingredient.libelle)
                        Text(String(format: "%.3f", ingredient.stock))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(5)
                            .background(Color.myGray.opacity(0.25))
                            .cornerRadius(10)
                    }
                    .padding(15)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(20)
                    .padding(.horizontal, 15)
                }
                Button("Modifier les stocks", action: {
                    loading = true
                    /*for ingredient in mercurial.ingredients {
                        print(ingredient.libelle)
                    }*/
                    dismiss()
                })
                    .padding(10)
                    .frame(width: 200)
                    .background(Color.modifyButton.opacity(0.25))
                    .foregroundColor(Color.modifyButton)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.modifyButton, lineWidth: 2))
                    .padding(.vertical, 20)
                .navigationTitle("Entrée de stock complète")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct EntriesView_Previews: PreviewProvider {
    static var previews: some View {
        EntriesView()
    }
}
