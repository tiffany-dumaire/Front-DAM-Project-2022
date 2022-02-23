//
//  SearchBarView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 10/02/2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var placeholder: String
    @State private var isEditing = false
        
    var body: some View {
        HStack {
            TextField("\(placeholder)", text: $text)
                .padding(10)
                .padding(.horizontal, 25)
                .background(Color(red: 217/255, green: 217/255, blue: 217/255))
                .cornerRadius(10)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        if isEditing && self.text != "" {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.trailing, 15)
                            }
                        }
                    }
                    
                )
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""), placeholder: "ok")
    }
}

