//
//  ContentView.swift
//  RayonMalin
//
//  Created by marhuenda joris on 29/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var groceryList = [
        GroceryItem(name: "Pommes", aisle: "Fruits", type: "Fruit", isMarked: false),
        GroceryItem(name: "Pain", aisle: "Boulangerie", type: "Pain", isMarked: false),
        GroceryItem(name: "Lait", aisle: "Produits laitiers", type: "Dairy", isMarked: false),
        GroceryItem(name: "Fromage", aisle: "Produits laitiers", type: "Dairy", isMarked: false),
        // Ajoute d'autres articles ici
    ]
    @State private var selectedSorting = SortingOption.byName 

    var body: some View {
            NavigationView {
                List {
                    ForEach($groceryList) { $item in
                        GroceryItemRow(item: $item)
                    }
                    .onDelete(perform: deleteItem)
                }
                .navigationTitle("Liste de Courses")
                .navigationBarItems(
                    leading: NavigationLink(destination: SortingView(selectedSorting: $selectedSorting)) {
                        Image(systemName: "arrow.up.arrow.down.circle")
                    },
                    trailing: EditButton()
                )
            }
        }

    private func deleteItem(at offsets: IndexSet) {
        groceryList.remove(atOffsets: offsets)
    }
}

struct GroceryItemRow: View {
    @Binding var item: GroceryItem

    var body: some View {
        HStack {
            Text(item.name)
                .font(.headline)
            Spacer()
            Text(item.aisle)
                .foregroundColor(.gray)
        }
        .padding(8)
        .background(item.isMarked ? Color.gray.opacity(0.5) : Color.clear)
        .cornerRadius(8)
        .contextMenu {
            Button(action: {
                markItem()
            }) {
                HStack {
                    Image(systemName: item.isMarked ? "checkmark.square.fill" : "square")
                    Text(item.isMarked ? "Masquer" : "Marquer")
                }
            }
        }
    }

    private func markItem() {
        // Inverse l'état du marquage de l'article
        item.isMarked.toggle()
    }
}

struct GroceryItem: Identifiable {
    var id = UUID()
    var name: String
    var aisle: String
    var type: String
    var isMarked: Bool
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
