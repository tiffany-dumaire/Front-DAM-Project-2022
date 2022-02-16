//
//  RealizeSalesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 16/02/2022.
//

import SwiftUI

struct RealizeSalesView: View {
    @State var index = 0
    var body: some View {
        //TabView avec 2 vue --> 1. choix des fiches techniques et quantité | 2.  Config vente/test, emporté/sur place  + aperçu et impression
        VStack {
            HStack(spacing: 0) {
                Text("Mercurial")
                    .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color.purple.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Fiches")
                    .foregroundColor(self.index == 1 ? .white : Color.black.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
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
                FTChoiceView().tag(0)
                FTMenuView().tag(1)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .navigationTitle("Réaliser une vente")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RealizeSalesView_Previews: PreviewProvider {
    static var previews: some View {
        RealizeSalesView()
    }
}
