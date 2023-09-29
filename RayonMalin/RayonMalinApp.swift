//
//  RayonMalinApp.swift
//  RayonMalin
//
//  Created by marhuenda joris on 29/09/2023.
//

import SwiftUI

@main
struct RayonMalinApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
