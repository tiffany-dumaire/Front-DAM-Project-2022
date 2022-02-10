//
//  IngredientDetailView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 10/02/2022.
//

import SwiftUI

struct IngredientDetailView: View {
    var cols = [GridItem(.fixed(160)),GridItem(.flexible())]
    var body: some View {
        VStack {
            Text("Ingredient name")
                .font(.title2)
                .bold()
                .foregroundColor(Color.pink)
            Divider()
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Prix unitaire :").frame(height: 30)
                Text("6 €").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Stock :").frame(height: 30)
                Text("11.345 kg").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Valeur du stock :").frame(height: 30)
                Text(String(format: "%.2f", 6*11.345) + " €").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
                Text("Catégorie :").frame(height: 30)
                Text("Repas").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
            }
            Divider()
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Allergène :").frame(height: 30)
                Toggle("", isOn: .constant(true))
                    .padding(.trailing, 130)
                Text("Catégorie allergène :").frame(height: 30)
                Text("Si allergène seulement").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                    .cornerRadius(10)
            }
            Divider()
            Spacer().frame(height: 40)
            VStack {
                HStack {
                    Spacer()
                    Button("Modifier", action: {})
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.modifyButton.opacity(0.25))
                        .foregroundColor(Color.modifyButton)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.modifyButton, lineWidth: 2))
                    Spacer()
                    Button("Supprimer", action: {})
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.red.opacity(0.25))
                        .foregroundColor(Color.red)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 2))
                    Spacer()
                    
                }
                Spacer()
                    .frame(height: 20)
                HStack {
                    Spacer()
                    Button("Imprimer", action: {})
                        .padding(10)
                        .frame(width: 138)
                        .background(Color.blue.opacity(0.25))
                        .foregroundColor(Color.blue)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                    Spacer()
                    
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
