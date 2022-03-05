//
//  FTChoiceView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct FTChoiceView: View {
    @ObservedObject var fiches: ListFicheTechniqueViewModel
    @Binding var tickets: [TicketModel]

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Listes des fiches")
                SearchBarView(text: .constant(""), placeholder: "intitulé fiche..")
                List {
                    ForEach(fiches.fiches, id: \.id_fiche_technique) { fiche in
                        VStack(alignment: .leading, spacing: 10) {
                            Button(action: {
                                if tickets.contains(where: { $0.id_fiche_technique == fiche.id_fiche_technique }) {
                                    if let i: Int = tickets.firstIndex(where: { $0.id_fiche_technique == fiche.id_fiche_technique }) {
                                        tickets[i].quantite_fiche += 1
                                    }
                                } else {
                                    tickets.append(fiche.ftToTicket())
                                    tickets = tickets.sorted {
                                        $0.libelle_fiche_technique < $1.libelle_fiche_technique
                                    }
                                }
                            }) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.green)
                                        Text("\(fiche.libelle_fiche_technique)").font(.system(size: 14))
                                    }
                                    HStack {
                                        Image(systemName: "person.3.sequence.fill").font(.system(size: 12))
                                        Text("\(fiche.nombre_couverts)").font(.system(size: 12))
                                    }.padding(.horizontal, 25)
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
                
            }
            Divider()
            VStack(alignment: .leading) {
                Text("Fiches sélectionnées")
                List {
                    ForEach(tickets, id: \.id_fiche_technique) { ticket in
                        VStack(alignment: .leading, spacing: 10) {
                            Button(action: {
                                if let i: Int = tickets.firstIndex(where: { $0.id_fiche_technique == ticket.id_fiche_technique }) {
                                    if ticket.quantite_fiche > 1 {
                                        tickets[i].quantite_fiche -= 1
                                    } else {
                                        tickets.remove(at: i)
                                    }
                                }
                            }) {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(systemName: "minus.circle.fill")
                                            .font(.system(size: 14))
                                            .foregroundColor(.red)
                                        Text("\(ticket.quantite_fiche) x \(ticket.libelle_fiche_technique)").font(.system(size: 14))
                                    }
                                    HStack {
                                        Image(systemName: "person.3.sequence.fill").font(.system(size: 12))
                                        Text("\(ticket.nombre_couverts)").font(.system(size: 12))
                                    }.padding(.horizontal, 25)
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
            }
        }.padding()
    }
}

struct FTChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        FTChoiceView(fiches: ListFicheTechniqueViewModel([]), tickets: .constant([]))
    }
}
