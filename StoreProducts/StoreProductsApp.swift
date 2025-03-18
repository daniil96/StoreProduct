//
//  StoreProductsApp.swift
//  StoreProducts
//
//  Created by A1 on 18.03.2025.
//

import SwiftUI

@main
struct StoreProductsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
