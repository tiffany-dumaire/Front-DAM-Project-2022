//
//  EntriesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 13/02/2022.
//

import SwiftUI

struct EntriesView: View {
    @State var stocks: IngredientStocksDTO = IngredientStocksDTO(stocks: [])
    var cols = [GridItem(.flexible()),GridItem(.fixed(80))]
    var body: some View {
        ScrollView {
            ForEach(stocks.stocks, id: \.code) { stock in
                LazyVGrid(columns: cols, alignment: .leading, spacing: 10) {
                    Text(stock.libelle)
                    Text(String(format: "%.2f", stock.stock))
                }
            }
            
            .onAppear(perform: {
                Task {
                    self.stocks = await IngredientDAO.loadData()
                    print(self.stocks)
                }
            })
            
            .navigationTitle("Entrée de stock complète")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EntriesView_Previews: PreviewProvider {
    static var previews: some View {
        EntriesView()
    }
}
