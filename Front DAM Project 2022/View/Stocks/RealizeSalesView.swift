//
//  RealizeSalesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct FichesQuantites {
    var quantite: Int
    var fiche: FicheTechniqueModel
    
    init(quantite: Int, fiche: FicheTechniqueModel) {
        self.quantite = quantite
        self.fiche = fiche
    }
}

struct RealizeSalesView: View {
    @EnvironmentObject var fiches: ListFicheTechniqueViewModel
    @State var tickets: [TicketModel] = []
    
    @State var index = 0
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Commander")
                    .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.purple.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Prévisualiser")
                    .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.purple.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
            }
                .background(Color.black.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top, 10)
            
            TabView(selection: $index) {
                FTChoiceView(fiches: fiches, tickets: $tickets).tag(0)
                TicketView(tickets: $tickets).tag(1)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .navigationTitle("Simuler une vente")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RealizeSalesView_Previews: PreviewProvider {
    static var previews: some View {
        RealizeSalesView()
    }
}
