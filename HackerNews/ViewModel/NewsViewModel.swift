//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Siran Li on 6/26/24.
//

import Foundation

class NewsViewModel {
    private var news: [Hit] = []
    private var apiManager: APIManager
    
    init(apiManager: APIManager = APIManager.shared) {
        self.apiManager = apiManager
    }
    
    func fetchNews(urlString: String, completion: @escaping () -> ()) async {
        await apiManager.fetchData(urlString: urlString) { data in
            guard let data = data else {
                print(URLError(.badServerResponse))
                return
            }
            
            guard let apiResponse = try? JSONDecoder().decode(HackerNews.self, from: data) else {
                print(URLError(.cannotDecodeRawData))
                return
            }
            
            self.news = apiResponse.hits
            completion()
        }
    }
    
    func getNews() -> [Hit] {
        return news
    }
}
