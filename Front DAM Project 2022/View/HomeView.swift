//
//  HomeView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 10/02/2022.
//

import SwiftUI

struct HomeView: View {
    var cols = [GridItem](repeating: .init(.flexible()), count: 2)
    @State var index = 0
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("logo2").resizable().frame(minWidth: 50, idealWidth: 50, maxWidth: 50, minHeight: 50, idealHeight: 50, maxHeight: 50, alignment: .top)
                    Text("Gestionnaire de fiches \ntechniques de cuisine")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                    Spacer()
                }.padding(.horizontal)
                
                HStack(spacing: 0) {
                    Text("Mercurial")
                        .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
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
                        .padding(.horizontal, 15)
                        .background(Color.purple.opacity(self.index == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation(.default) {
                                self.index = 1
                            }
                        }
                    Spacer(minLength: 0)
                    Text("Stocks")
                        .foregroundColor(self.index == 2 ? .white : Color.black.opacity(0.7))
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(Color.purple.opacity(self.index == 2 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation(.default) {
                                self.index = 2
                            }
                        }
                
                }.background(Color.black.opacity(0.06))
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    .padding(.top, 25)
                
                TabView(selection: $index) {
                    MercurialMenuView().tag(0)
                    FTMenuView().tag(1)
                    StocksMenuView().tag(2)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                HStack {
                    Spacer()
                    Image(systemName: "gearshape.circle.fill")
                }
                Spacer(minLength: 0)
            }.padding(.top)
                .navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
