//
//  TicketView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 05/03/2022.
//

import SwiftUI

struct TicketView: View {
    @Binding var tickets: [TicketModel]
    @State var emporter: Bool = false
    var cols = [GridItem(.fixed(140)),GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                LazyVGrid(columns: cols, alignment: .leading, spacing: 5) {
                    Text("A emporter :").frame(height: 30)
                    Toggle("", isOn: $emporter)
                        .padding(.trailing, 130)
                }.padding(10)
            }
                .padding(.bottom, 5)
                .background(Color.salmon.opacity(0.2))
            VStack(alignment: .leading, spacing: 10) {
                Text("Etiquette de vente - \(emporter ? "à emporter" : "sur place")")
                List {
                    ForEach(tickets, id: \.id_fiche_technique) { ticket in
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "record.circle.fill")
                                    .font(.system(size: 12))
                                Text(" \(ticket.quantite_fiche) x \(ticket.libelle_fiche_technique)")
                                    .font(.system(size: 16))
                            }
                            Text("(\(ticket.nombre_couverts) couverts)")
                                .font(.system(size: 12))
                                .padding(.leading, 20)
                            if emporter {
                                ForEach(ticket.ingredients, id: \.code) { ingredient in
                                    HStack {
                                        Image(systemName: "record.circle")
                                            .font(.system(size: 12))
                                        Text(" " + ingredient.libelle)
                                            .font(.system(size: 14))
                                            
                                    }.padding(.leading, 40)
                                }
                            }
                        }
                    }
                }.listStyle(PlainListStyle())
                    .frame(maxHeight: .infinity)
            }
            .padding(10)
            .background(Color.blue.opacity(0.25))
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
            .padding(15)
            Spacer(minLength: 0)
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView(tickets: .constant([]))
    }
}
