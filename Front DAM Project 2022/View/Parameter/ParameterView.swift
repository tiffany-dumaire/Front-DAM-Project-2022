//
//  ParameterView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct ParameterView: View {
    @EnvironmentObject var parameters: ParametersModel
    var cols = [GridItem(.fixed(130)),GridItem(.flexible())]
    var body: some View {
        ScrollView {
            HStack {
                Text("Coût moyen horaire")
                    .foregroundColor(.blue)
                    .font(.title3)
                    .bold()
                Spacer()
            }.padding(.horizontal)
            HStack {
                Text("On peut distinguer deux coûts moyens horaires : le coût moyen horaire des fluides et le coût moyen horaire du personnel.").font(.system(size: 12))
            }.padding(.horizontal)
            LazyVGrid(columns: cols, alignment: .leading) {
                Text("Personnel")
                Stepper(String(format: "%.2f", parameters.parameters[2].value), value:  $parameters.parameters[2].value, step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                Text("Fluides")
                Stepper(String(format: "%.2f", parameters.parameters[2].value2), value: $parameters.parameters[2].value2, step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
            }.padding(.horizontal)
            HStack {
                Text("Coefficient de vente")
                    .foregroundColor(.blue)
                    .font(.title3)
                    .bold()
                Spacer()
            }.padding(.horizontal)
            LazyVGrid(columns: cols, alignment: .leading) {
                Toggle("", isOn: $parameters.parameters[1].utile)
                    .padding(.trailing, 130)
                Text("Charges \(parameters.parameters[1].utile ? "définies" : "non définies")").font(.system(size: 14))
                if parameters.parameters[1].utile {
                    VStack(alignment: .leading) {
                        Text("Coefficient")
                        Text("(charges définies)").font(.system(size: 12))
                    }
                    Stepper(String(format: "%.2f", parameters.parameters[1].value), value:  $parameters.parameters[1].value, step:0.01)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .background(Color.myGray.opacity(0.25))
                } else {
                    VStack(alignment: .leading) {
                        Text("Coefficient")
                        Text("(charges non définies)").font(.system(size: 12))
                    }
                    Stepper(String(format: "%.2f", parameters.parameters[1].value2), value: $parameters.parameters[1].value2, step:0.01)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .background(Color.myGray.opacity(0.25))
                }
            }.padding(.horizontal)
            HStack {
                Text("Coût d'assaisonnement")
                    .foregroundColor(.blue)
                    .font(.title3)
                    .bold()
                Spacer()
            }.padding(.horizontal)
            LazyVGrid(columns: cols, alignment: .leading, spacing: 20) {
                Toggle("", isOn: $parameters.parameters[0].utile)
                    .padding(.trailing, 130)
                Text("Assaisonnement \(parameters.parameters[0].utile ? "en %" : "en €")").font(.system(size: 14))
                if parameters.parameters[0].utile {
                    Text("% coût matières").font(.system(size: 15))
                    Stepper(String(format: "%.2f", parameters.parameters[0].value), value:  $parameters.parameters[0].value, step:0.01)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .background(Color.myGray.opacity(0.25))
                } else {
                    Text("Montant fixe en €").font(.system(size: 15))
                    Stepper(String(format: "%.2f", parameters.parameters[0].value2), value: $parameters.parameters[0].value2, step:0.01)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                        .background(Color.myGray.opacity(0.25))
                }
            }.padding(.horizontal)
            Divider()
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                Text("Attention: La modification des paramètres de l'application ne sera effectuée qu'en local et durant l'utilisation en cours. Si vous souhaitez modifier les paramètres globaux de manière permanente, il faudra vous rendre sur le site web associé.")
                .font(.system(size: 10))
                .foregroundColor(.myGray)
            }
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
