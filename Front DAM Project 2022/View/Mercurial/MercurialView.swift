//
//  MercurialView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 08/02/2022.
//

import SwiftUI

struct MercurialView: View {
    @State var texte: String = ""
    var ingredients: [String] = ["Chips","Frites","Coca","Pain"]
    var body: some View {
        VStack {
            HStack {
                Text("Mercurial")
                    .font(.title)
                    .bold()
                    .padding(10)
                Spacer(minLength: 0)
            }
            VStack {
                SearchBarView(text: $texte)
            }
            Text("Il y a \(ingredients.count) ingrédients correspondant à votre recherche")
                .font(.system(size: 11))
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            List {
                ForEach(ingredients, id: \.self) { ingredient in
                    NavigationLink(destination: IngredientDetailView()) {
                        Text(ingredient)
                    }
                }
            }
            .padding(15)
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MercurialView_Previews: PreviewProvider {
    static var previews: some View {
        MercurialView()
    }
}
