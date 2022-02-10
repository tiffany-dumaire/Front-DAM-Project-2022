//
//  MercurialView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 08/02/2022.
//

import SwiftUI

struct MercurialView: View {
    var cols = [GridItem(.flexible()), GridItem(.fixed(150))]
    var body: some View {
        VStack {
            VStack {
                
            }
            LazyVGrid(columns: cols, alignment: .leading){
                Text("Title 1")
                    HStack {
                    Button("Modifier", action: {})
                    Button("delete", action: {})
                }
                Text("Title 1")
                HStack {
                    Button("Modifier", action: {})
                    Button("delete", action: {})
                }
                Text("Title 1")
                    HStack {
                    Button("Modifier", action: {})
                    Button("delete", action: {})
                }

            }
        }
    }
}

struct MercurialView_Previews: PreviewProvider {
    static var previews: some View {
        MercurialView()
    }
}
