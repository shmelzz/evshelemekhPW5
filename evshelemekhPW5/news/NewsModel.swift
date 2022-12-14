//
//  NewsModel.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 25.10.2022.
//

import UIKit

enum NewsModel {
    enum GetNews {
        struct Request { }
        struct Response {
            var news: News
        }
        struct ViewModel {
            var news: News
        }
    }
    
    // MARK: - News
    struct News: Decodable {
        let status: String?
        let totalResults: Int?
        let articles: [Article]?
    }
    
    
    // MARK: - Article
    struct Article: Decodable {
        let source: Source?
        let author, title, articleDescription: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String?
        let content: String?
        
        enum CodingKeys: String, CodingKey {
            case articleDescription = "description"
            case source, author, title, url, urlToImage, publishedAt, content
        }
    }
    
    // MARK: - Source
    struct Source: Decodable {
        let id, name: String?
    }
}
