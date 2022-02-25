//
//  CategoryEntriesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 13/02/2022.
//

import SwiftUI

struct CategoryEntriesView: View {
    @StateObject var stocks: ListIngredientViewModel = ListIngredientViewModel([])
    @State var categorieChoice: Int = 0
    @State var index = 0
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Choix catégorie")
                    .font(.system(size: 14))
                    .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.purple.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                Spacer(minLength: 0)
                Text("Gérer stocks")
                    .font(.system(size: 14))
                    .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.purple.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
            }
                .background(Color.black.opacity(0.06))
                .clipShape(Capsule())
                .padding(.horizontal)
                .padding(.top, 10)
            
            TabView(selection: $index) {
                CategoryChoiceView(stocks: stocks, categorie: $categorieChoice, index: $index).tag(0)
                ModifyStocksView(stocks: stocks).tag(1)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Entrée de stock par catégorie")
        }
    }
}

struct CategoryEntriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryEntriesView()
    }
}
