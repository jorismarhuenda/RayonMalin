//
//  SortingView.swift
//  RayonMalin
//
//  Created by marhuenda joris on 29/09/2023.
//

import SwiftUI

struct SortingView: View {
    @Binding var selectedSorting: SortingOption

    var body: some View {
        Form {
            Section(header: Text("Tri de la Liste")) {
                Picker("Trier par", selection: $selectedSorting) {
                    ForEach(SortingOption.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle("Tri")
    }
}

enum SortingOption: String, CaseIterable {
    case byName = "Nom"
    case byAisle = "Rayon"
    case byType = "Type"
}
