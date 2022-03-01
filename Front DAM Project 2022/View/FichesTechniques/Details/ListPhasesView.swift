//
//  ListPhasesView.swift
//  Front DAM Project 2022
//
//  Created by Tiffany Dumaire on 28/02/2022.
//

import SwiftUI

struct ListPhasesView: View {
    @State var phases: [PhaseModel]
    var body: some View {
        ScrollView {
            ForEach(phases, id: \.id_phase) { phase in
                PhasesDetailView(phase: phase)
                    .padding(.vertical, 15)
                Divider()
            }
        }
    }
}

struct ListPhasesView_Previews: PreviewProvider {
    static var previews: some View {
        ListPhasesView(phases: [])
    }
}
