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
    @EnvironmentObject var coordinator: Coordinator // Получаем координатор из Environment
    
    var uniqueCategories: [String] {
        Array(Set(viewModel.products.map { $0.category.name })).sorted()
    }
    
    // Отфильтрованные товары
    var filteredProducts: [PostsResponse] {
        if let selectedCategory = selectedCategory {
            return viewModel.products.filter { $0.category.name == selectedCategory }
        } else {
            return viewModel.products // Если категория не выбрана, показываем все товары
        }
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
                            Button(action: {
                                coordinator.path.append(.detailProductView(product: product))
                            }) {
                                CardProductView(product: product)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Товары")
        }
    }
}

#Preview {
    HomePageView()
}
