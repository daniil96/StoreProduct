//
//  RootView.swift
//  StoreProducts
//
//  Created by A1 on 23.03.2025.
//

import Foundation
import SwiftUI

struct RootView: View {
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.resolve(pathItem: .homePageView)
                .navigationDestination(for: Coordinator.Route.self) { route in
                    coordinator.resolve(pathItem: route)
                }
        }
        .environmentObject(coordinator) // Передаем координатор в Environment
    }
}
