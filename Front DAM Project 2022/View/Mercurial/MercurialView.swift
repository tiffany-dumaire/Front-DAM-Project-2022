//
//  MercurialView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 08/02/2022.
//

import SwiftUI

struct MercurialView: View {
    @State var texte: String = ""
    @EnvironmentObject var mercurial: ListIngredientViewModel

    var body: some View {
        VStack {
            /*HStack {
                Text("Mercurial")
                    .font(.title)
                    .bold()
                    .padding(10)
                Spacer(minLength: 0)
            }*/
            VStack {
                SearchBarView(text: $texte)
            }
           /* List {
                ForEach(mercurial.ingredients.filter(filterSearch), id: \.code) { ingredient in
                    NavigationLink(destination: IngredientDetailView()) {
                        VStack(alignment: .leading) {
                            Text(ingredient.libelle)
                                .bold()
                                .font(.system(size: 17))
                            HStack {
                                Text("Unité : \(ingredient.unite)").font(.system(size: 13))
                                if ingredient.allergene {
                                    Image(systemName: "allergens")
                                        .foregroundColor(.red)
                                }
                            }
                            Text("Valeur du stock : " + String(format: "%.2F",ingredient.valeurStock) + " €").font(.system(size: 13))
                        }
                    }.foregroundColor(.black)
                }
            }
            .padding(15)*/
            CustomIngredientListView(texte: texte, allergen: false)
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Mercurial")
            
                /*.onAppear(perform:{
                    Task {
                        self.ingredients = await IngredientDAO.loadMercurialDatas()
                        print(self.ingredients)
                    }
                })*/
        }
    }
}

struct MercurialView_Previews: PreviewProvider {
    static var previews: some View {
        MercurialView()
    }
}
