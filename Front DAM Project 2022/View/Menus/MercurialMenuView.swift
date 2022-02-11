//
//  MercurialMenuView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 10/02/2022.
//

import SwiftUI

struct MercurialMenuView: View {
    var rows = [GridItem(.adaptive(minimum: 100, maximum: 100))]
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: 30) {
            NavigationLink(destination: IngredientAddView()){
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Ajouter un ingrédient")
                    }.frame(width: 200, height: 40, alignment: .center)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.green)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
            NavigationLink(destination: MercurialView()){
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Voir le mercurial")
                    }.frame(width: 200, height: 40, alignment: .center)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.salmon)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
        }.padding(.horizontal)
        .padding(.top, 0.25)
    }
}

struct MercurialMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MercurialMenuView()
    }
}
