//
//  PostsResponse.swift
//  StoreProducts
//
//  Created by A1 on 18.03.2025.
//

import Foundation

// MARK: - PostsResponse
struct PostsResponse: Decodable, Identifiable {
    let id: Int
    let title: String
    let slug: String?
    let price: Int
    let description: String?
    let category: Category
    let images: [String]
}

// MARK: - Category
struct Category: Decodable, Hashable {
    let id: Int
    let name: String
    let image: String?
    let slug: String?
}


