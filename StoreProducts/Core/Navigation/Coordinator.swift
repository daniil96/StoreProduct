//
//  Coordinator.swift
//  StoreProducts
//
//  Created by A1 on 23.03.2025.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: [Route] = [] // Используем enum для маршрутов
    
    // Enum для представления маршрутов
    enum Route: Hashable {
        case homePageView
        case detailProductView(product: PostsResponse)
    }
    
    // Функция для разрешения маршрута в View
    @ViewBuilder
    func resolve(pathItem: Route) -> some View {
        switch pathItem {
        case .homePageView:
            HomePageView()
        case .detailProductView(let product):
            DetailProductView(product: product)
        }
    }
}
