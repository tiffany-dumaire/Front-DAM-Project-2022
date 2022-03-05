//
//  CoutsView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 05/03/2022.
//

import SwiftUI

struct CoutsView: View {
    @EnvironmentObject var parameters: ParametersViewModel
    @ObservedObject var vm: FicheTechniqueViewModel
    var cols = [GridItem(.fixed(180)),GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    Text("Coût de production/prix de vente")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.indigo)
                    Group {
                        Text("Coût des charges :")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.blue)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            Text("Charges de personnel :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", parameters.parameters[2].value * vm.tempsTotalHeure()) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Charges de fluides :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", parameters.parameters[2].value2 * vm.tempsTotalHeure()) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Coût total charges :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", (parameters.parameters[2].value + parameters.parameters[2].value2) * vm.tempsTotalHeure()) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                        }
                    }
                    Group {
                        Text("Coût des matières :")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.blue)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            Text("Coût des matières :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", vm.coutMatiere()) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Coût assaisonnement :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(parameters.parameters[0].utile ? String(format: "%.2f", parameters.parameters[0].value * vm.coutMatiere() / 100) + " €" : "\(parameters.parameters[0].value2)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                        }
                    }
                    Group {
                        Text("Coût de production :")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.blue)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            if parameters.parameters[1].utile {
                                Text("charges fixes incluses :")
                                    .frame(height: 30)
                                    .font(.system(size: 15))
                                Text(parameters.parameters[0].utile ? String(format: "%.2f", parameters.parameters[0].value * vm.coutMatiere() / 100 + vm.coutMatiere() + parameters.parameters[2].value * vm.tempsTotalHeure() + parameters.parameters[2].value2 * vm.tempsTotalHeure()) + " €" : "\(parameters.parameters[0].value2 + vm.coutMatiere() + parameters.parameters[2].value * vm.tempsTotalHeure() + parameters.parameters[2].value2 * vm.tempsTotalHeure()) €")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 15))
                                    .background(Color.blue.opacity(0.25))
                                    .cornerRadius(10)
                            } else {
                                Text("charges fixes exclues :")
                                    .frame(height: 30)
                                    .font(.system(size: 15))
                                Text(parameters.parameters[0].utile ? String(format: "%.2f", parameters.parameters[0].value * vm.coutMatiere() / 100 + vm.coutMatiere()) + " €" : "\(parameters.parameters[0].value2 + vm.coutMatiere()) €")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .font(.system(size: 15))
                                    .background(Color.blue.opacity(0.25))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    Group {
                        Text("Prix de vente :")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.blue)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            Text("Prix de vente :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", parameters.parameters[2].value * vm.tempsTotalHeure()) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Prix de vente/portion :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", parameters.parameters[2].value * vm.tempsTotalHeure()) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                        }
                    }
                }
                Group {
                    Text("Bénéfice & seuil de rentabilité")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.indigo)
                    Group {
                        Text("Durée de la progression:")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.blue)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            Text("Durée totale en heure :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", vm.tempsTotalHeure()))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Durée totale en minutes :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text("\(Int(vm.tempsTotalHeure() * 60))")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                        }
                    }
                    Group {
                        Text("Bénéfice :")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.blue)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            Text("Bénéfice net par portion :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", vm.tempsTotalHeure()))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Bénéfice net :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text("\(Int(vm.tempsTotalHeure() * 60))")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                        }
                    }
                    Group {
                        Text("Seuil de rentabilité :")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.blue)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            Text("Seuil de rentabilité :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(" portions")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
        }
    }
}

struct CoutsView_Previews: PreviewProvider {
    static var previews: some View {
        CoutsView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Test", nombre_couverts: 10, id_responsable: 1, intitule_responsable: "Responsable", id_categorie_fiche: 2, phases: [])))
    }
}
