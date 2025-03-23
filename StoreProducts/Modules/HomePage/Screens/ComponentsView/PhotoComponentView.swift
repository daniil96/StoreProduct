//
//  PhotoComponentView.swift
//  StoreProducts
//
//  Created by A1 on 23.03.2025.
//

import SwiftUI

struct PhotoComponentView: View {
    var product: PostsResponse
    
    var body: some View {
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
    }
}
