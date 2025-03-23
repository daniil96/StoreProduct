//
//  PhotoComponentView.swift
//  StoreProducts
//
//  Created by A1 on 23.03.2025.
//

import SwiftUI

struct PhotosArrayComponentsView: View {
    var product: PostsResponse
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(product.images, id: \.self) { imageURL in
                        if let url = URL(string: imageURL) {
                            AsyncImage(url: url) { cases in
                                switch cases {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 250, height: 250)
                                        .cornerRadius(10)
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 250, height: 250)
                                        .cornerRadius(10)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                }
            }
//            .padding(.horizontal, 10)
        }
        .padding()
        .frame(height: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
