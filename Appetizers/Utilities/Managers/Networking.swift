//
//  Networking.swift
//  Appetizers
//
//  Created by Nodirbek Khudoyberdiev on 09/09/23.
//

import UIKit

class Networking {
    static let shared = Networking()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init(){}
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APAlert.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
            throw APAlert.invalidResponse
        }
        do {
            return try JSONDecoder().decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APAlert.failedToDecode
        }
    }
    
    func downloadImage(urlString: String) async throws -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        guard let url = URL(string: urlString) else {
            return nil
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return UIImage(data: data)
    }
    
}

