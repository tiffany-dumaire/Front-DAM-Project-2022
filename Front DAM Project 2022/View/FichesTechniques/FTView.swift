//
//  FTView.swift
//  Front DAM Project 2022
//
//  Created by m1 on 16/02/2022.
//

import SwiftUI

struct FTView: View {
    @State var texte: String = ""
    var listFT: [String] = ["Saint-Honoré","Crêpes","Poulet au curry","Pain"]
    var body: some View {
        VStack {
            HStack {
                Text("Fiches Techniques")
                    .font(.title)
                    .bold()
                    .padding(10)
                Spacer(minLength: 0)
            }
            VStack {
                SearchBarView(text: $texte)
            }
            Text("Il y a \(listFT.count) fiches techniques correspondant à votre recherche")
                .font(.system(size: 11))
                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
            List {
                ForEach(listFT, id: \.self) { ft in
                    NavigationLink(destination: IngredientDetailView()) {
                        Text(ft)
                    }
                }
            }
            .padding(15)
            Spacer(minLength: 0)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FTView_Previews: PreviewProvider {
    static var previews: some View {
        FTView()
    }
}
