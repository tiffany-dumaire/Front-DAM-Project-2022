//
//  IngredientStockView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 28/02/2022.
//

import SwiftUI

struct IngredientStockView: View {
    @ObservedObject var ingredient: IngredientViewModel
    var cols = [GridItem(.flexible()),GridItem(.fixed(150))]
    var body: some View {
        LazyVGrid(columns: cols, alignment: .leading, spacing: 15) {
            Text(ingredient.libelle)
            CustomDoubleStepperView(value: $ingredient.stock, step: 0.001, decimal: 3)
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
}


struct IngredientStockView_Previews: PreviewProvider {
    static var ingredient: IngredientViewModel = IngredientViewModel(model: IngredientModel(code: 101, libelle: "Test", unite: "kg", prix_unitaire: 0.25, stock: 3.265, allergene: true, id_categorie: 5, id_categorie_allergene: 1))
    static var previews: some View {
        IngredientStockView(ingredient: ingredient)
    }
}

