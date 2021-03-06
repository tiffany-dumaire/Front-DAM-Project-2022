//
//  StocksMenuView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 10/02/2022.
//

import SwiftUI
import PDFKit

func pdf() {

}

struct StocksMenuView: View {
    @EnvironmentObject var mercurial: ListIngredientViewModel
    var rows = [GridItem(.adaptive(minimum: 80, maximum: 90))]
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: 25) {
            NavigationLink(destination: EntriesView(stocks: ListOfIngredientViewModel(mercurial))) {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Entrée de stock \n(complète)").font(.system(size: 16))
                    }
                    .frame(width: 200, height: 40, alignment: .center)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(red: 153/255, green: 153/255, blue: 102/255))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
            NavigationLink(destination: CategoryEntriesView()) {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 15) {
                            Text("Entrée de stock \n(par catégorie)").font(.system(size: 16))
                    }
                    .frame(width: 200, height: 40, alignment: .center)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(red: 204/255, green: 153/255, blue: 1))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
            NavigationLink(destination: IngredientChoiceEntriesView()) {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Entrée de stock \n(choix ingrédients)").font(.system(size: 16))
                    }
                    .frame(width: 200, height: 40, alignment: .center)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(red: 0, green: 204/255, blue: 153/255))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
            NavigationLink(destination: RealizeSalesView()) {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Simuler une vente")
                    }
                    .frame(width: 200, height: 40, alignment: .center)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(red: 168/255, green: 94/255, blue: 82/255))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 0.25)
    }
}

struct StocksMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StocksMenuView()
    }
}
