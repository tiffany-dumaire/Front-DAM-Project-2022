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
                            Text(String(format: "%.2f", chargesFixes()) + " €")
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
                            Text(String(format: "%.2f", assaisonnement()) + " €")
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
                            Text("charges fixes \(parameters.parameters[1].utile ? "incluses" : "exclues") :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", coutProduction()) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                        }
                    }
                    Group {
                        Text("Prix de vente :")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.blue)
                        LazyVGrid(columns: cols, alignment: .leading) {
                            Text("Prix de vente/portion :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", prixVente() / Double(vm.nombre_couverts)) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Prix de vente :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", prixVente()) + " €")
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
                            Text(String(format: "%.2f", vm.tempsTotalHeure()) + "h")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Durée totale en minutes :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text("\(Int(vm.tempsTotalHeure() * 60))min")
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
                            Text(String(format: "%.2f", benefice() / Double(vm.nombre_couverts)) + " €")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .font(.system(size: 15))
                                .background(Color.blue.opacity(0.25))
                                .cornerRadius(10)
                            Text("Bénéfice net :")
                                .frame(height: 30)
                                .font(.system(size: 15))
                            Text(String(format: "%.2f", benefice()) + " €")
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
                            Text("\(seuilRentabilite()) portions")
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
    
    private func chargesFixes() -> Double {
        return (parameters.parameters[2].value + parameters.parameters[2].value2) * vm.tempsTotalHeure()
    }
    
    private func assaisonnement() -> Double {
        if parameters.parameters[0].utile {
           return parameters.parameters[0].value * vm.coutMatiere() / 100
        }
        return parameters.parameters[0].value2
    }
    
    private func coutProduction() -> Double {
        if parameters.parameters[1].utile {
            return assaisonnement() + vm.coutMatiere() + chargesFixes()
        } else {
            return assaisonnement() + vm.coutMatiere()
        }
    }
    
    private func prixVente() -> Double {
        if parameters.parameters[1].utile {
            return coutProduction() + coutProduction() * (parameters.parameters[1].value / 100)
        } else {
            return coutProduction() + coutProduction() * (parameters.parameters[1].value2 / 100)
        }
    }
    
    private func benefice() -> Double {
        return prixVente() / 1.1 - coutProduction()
    }
    
    private func tauxMargeCoutV() -> Double {
        return ((prixVente() / 1.1) / Double(vm.nombre_couverts) - (vm.coutMatiere() + assaisonnement()) / Double(vm.nombre_couverts)) / ((prixVente() / 1.1) / Double(vm.nombre_couverts))
    }
    
    private func seuilRentabilite() -> Int {
        return Int(ceil(chargesFixes() / tauxMargeCoutV()))
    }
}

struct CoutsView_Previews: PreviewProvider {
    static var previews: some View {
        CoutsView(vm: FicheTechniqueViewModel(model: FicheTechniqueModel(id_fiche_technique: 101, libelle_fiche_technique: "Test", nombre_couverts: 10, id_responsable: 1, intitule_responsable: "Responsable", id_categorie_fiche: 2, phases: [])))
    }
}
