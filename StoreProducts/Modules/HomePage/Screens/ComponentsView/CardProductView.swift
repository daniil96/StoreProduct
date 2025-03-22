//
//  CardProduct.swift
//  StoreProducts
//
//  Created by A1 on 20.03.2025.
//

import SwiftUI

struct CardProductView: View {
    var product: PostsResponse
    
    var body: some View {
        HStack() {
            
            if let firstImageURL = product.images.first, let url = URL(string: firstImageURL) {
                AsyncImage(url: url) { cases in
                    switch cases {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(10)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading ) {
                Text(product.title)
                    .font(.headline)
                    .padding(5)
                
                Text(product.category.name)
                    .font(.headline)
                    .padding(5)
                
                Text("Цена: \(String(product.price))00 руб.")
                    .font(.subheadline)
                    .padding(5)
            }
            .frame(width: 150)
        }
        .frame(minWidth: 300, idealWidth: 330, maxWidth: 350, minHeight: 200, idealHeight: 210, maxHeight: 220)
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

//#Preview {
//    CardProduct()
//}
