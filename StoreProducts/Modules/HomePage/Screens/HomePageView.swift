//
//  ContentView.swift
//  StoreProducts
//
//  Created by A1 on 18.03.2025.
//

import SwiftUI

struct HomePageView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var selectedCategory: String?
    
    var uniqueCategories: [String] {
        Array(Set(viewModel.products.map { $0.category.name })).sorted()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Категория", selection: $selectedCategory) {
                    Text("Все товары").tag(String?.none)
                    ForEach(uniqueCategories, id: \.self) { category in
                        Text(category).tag(String?.some(category))
                    }
                }
                .pickerStyle(.navigationLink)
                .padding()
                
                ScrollView(.vertical) {
                    LazyVStack{
                        ForEach(filteredProducts) { product in
                            CardProductView(product: product)
                        }
                    }
                }
            }
            .navigationTitle("Товары")
        }
    }
    
    // Отфильтрованные товары
    var filteredProducts: [PostsResponse] {
        if let selectedCategory = selectedCategory {
            return viewModel.products.filter { $0.category.name == selectedCategory }
        } else {
            return viewModel.products // Если категория не выбрана, показываем все товары
        }
    }
}

#Preview {
    HomePageView()
}
