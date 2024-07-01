//
//  HackerNews.swift
//  HackerNews
//
//  Created by Siran Li on 6/26/24.
//

import Foundation

// MARK: - Welcome
struct HackerNews: Codable {
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let author: String
    let title: String
    let url: String
    let storyText: String?

    enum CodingKeys: String, CodingKey {
        case author
        case title
        case url
        case storyText = "story_text"
    }
}
