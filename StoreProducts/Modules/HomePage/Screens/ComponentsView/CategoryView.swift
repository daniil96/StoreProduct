//
//  CategoryView.swift
//  StoreProducts
//
//  Created by A1 on 22.03.2025.
//

import SwiftUI

struct CategoryView: View {
    var category: Category

    var body: some View {
        HStack {
            Text(category.name)
                .padding(2)
        }
        .padding(5)
    }
}

//#Preview {
//    CategoryView()
//}
