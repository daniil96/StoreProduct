//
//  ProductViewModel.swift
//  StoreProducts
//
//  Created by A1 on 19.03.2025.
//

import Foundation
import SwiftUI
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [PostsResponse] = []
    @Published var category: [Category] = []

    private let cache = URLCache.shared // Используем системный кэш
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        guard let url = URL(string: "https://api.escuelajs.co/api/v1/products") else {
            print("Invalid URL")
            return
        }
        
        // Проверяем, есть ли данные в кэше
        if let cachedResponse = cache.cachedResponse(for: URLRequest(url: url)) {
            // Если данные есть в кэше, декодируем их
            do {
                let products = try JSONDecoder().decode([PostsResponse].self, from: cachedResponse.data)
                self.products = products
                print("Данные загружены из кэша")
                return
            } catch {
                print("Ошибка декодирования данных из кэша: \(error)")
            }
        }
        
        // Если данных нет в кэше, загружаем их из сети
        URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response -> Data in
                // Сохраняем ответ в кэш
                let cachedData = CachedURLResponse(response: response, data: data)
                self.cache.storeCachedResponse(cachedData, for: URLRequest(url: url))
                return data
            }
            .decode(type: [PostsResponse].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Ошибка при загрузке данных: \(error)")
                }
            }, receiveValue: { [weak self] products in
                self?.products = products
                print("Сетевой запрос выполнен, данные сохранены в кэш")
            })
            .store(in: &cancellables)
    }
}
