//
//  PhasesDetailView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 28/02/2022.
//

import SwiftUI

struct PhasesDetailView: View {
    var phase: PhaseModel
    var cols = [GridItem(.flexible()),GridItem(.fixed(130))]
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Phase n° \(phase.ordre) - durée : \(phase.duree_phase) minutes")
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(.blue)
                if phase.ingredients.count != 0 {
                    Text(phase.libelle_denrees + " :")
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.blue.opacity(0.7))
                    ForEach(phase.ingredients, id: \.code) { ingredient in
                        LazyVGrid(columns: cols, alignment: .leading) {
                            Text(ingredient.libelle)
                                .font(.system(size: 15))
                            Text(String(format: "%.3f", ingredient.quantite) + " \(ingredient.unite)")
                                .font(.system(size: 15))
                        }
                    }
                }
            }
            Divider()
            VStack(alignment: .leading, spacing: 10) {
                Text(phase.libelle_phase + " :")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.blue.opacity(0.7))
                Text(phase.description_phase)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.horizontal, 15)
    }
}

struct PhasesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhasesDetailView(phase: PhaseModel(id_phase: 101, id_phase_ft: 1, libelle_phase: "C'est une phase", libelle_denrees: "Ingrédient phase", description_phase: "Les ingrédients de la phase seront utilisés dans cette phase.", duree_phase: 30, ordre: 1, ingredients: []))
    }
}
