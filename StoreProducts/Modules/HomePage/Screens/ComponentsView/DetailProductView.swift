//
//  DetailProductView.swift
//  StoreProducts
//
//  Created by A1 on 23.03.2025.
//

import SwiftUI

struct DetailProductView: View {
    var product: PostsResponse
    
    var body: some View {
        VStack {
            ScrollView(.vertical ) {
                
                PhotosArrayComponentsView(product: product)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                            .padding(5)
                        
                        Text("Цена: \(String(product.price))00 руб.")
                            .font(.subheadline)
                            .padding(5)
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Описание:")
                            .font(.body)
                        Text(product.description ?? "Нет описания")
                            .font(.body)
                            .padding(5)
                        
                        Text("Цвет:")
                            .font(.body)
                        Text(product.slug ?? "Нет информации")
                            .font(.body)
                            .padding(5)
                    }
                    .padding()
                    
                    Spacer()
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                
                Spacer()
            }
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    DetailProductView(product: PostsResponse(id: 1, title: "Часы", slug: "ааа", price: 30, description: "This is Apple Watch", category: Category(id: 2, name: "Watch", image: "", slug: ""), images: ["photo"]))
}
