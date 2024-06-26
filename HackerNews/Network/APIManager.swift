//
//  APIManager.swift
//  HackerNews
//
//  Created by Siran Li on 6/26/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    func fetchData(urlString: String, completion: @escaping (Data?) -> ()) async {
        guard let url = URL(string: urlString) else {
            print(URLError(.badURL))
            return
        }
        
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            print(URLError(.badServerResponse))
            return
        }

        
        completion(data)
    }
}
