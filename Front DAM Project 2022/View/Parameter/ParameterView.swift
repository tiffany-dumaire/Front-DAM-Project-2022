//
//  ParameterView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct ParameterView: View {
    var cols = [GridItem(.fixed(130)),GridItem(.flexible())]
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Coût moyen horaire")
                    .font(.title3)
                    .bold()
                Spacer()
            }.padding(.horizontal)
            HStack {
                Text("On peut distinguer deux coûts moyens horaires : le coût moyen horaire des fluides et le coût moyen horaire du personnel.").font(.system(size: 12))
            }.padding(.horizontal)
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Personnel")
                Stepper(String(format: "%.2f", 0), value:  .constant(0), step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                Text("Fluides")
                Stepper(String(format: "%.2f", 0), value: .constant(0), step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
            }.padding(.horizontal)
            HStack {
                Text("Coefficient de vente")
                    .font(.title3)
                    .bold()
                Spacer()
            }.padding(.horizontal)
            LazyVGrid(columns: cols, alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Coefficient")
                    Text("(charges définies)").font(.system(size: 12))
                }
                Stepper(String(format: "%.2f", 0), value:  .constant(0), step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                VStack(alignment: .leading) {
                    Text("Coefficient")
                    Text("(charges non définies)").font(.system(size: 12))
                }
                Stepper(String(format: "%.2f", 0), value: .constant(0), step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
            }.padding(.horizontal)
            HStack {
                Text("Coût d'assaisonnement")
                    .font(.title3)
                    .bold()
                Spacer()
            }.padding(.horizontal)
            LazyVGrid(columns: cols, alignment: .leading, spacing: 20) {
                Text("Coût en %")
                Stepper(String(format: "%.2f", 0), value:  .constant(0), step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                Text("Coût en €")
                Stepper(String(format: "%.2f", 0), value: .constant(0), step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
            }.padding(.horizontal)
            Spacer(minLength: 0)
            .navigationBarTitle("Paramètres")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ParameterView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterView()
    }
}
