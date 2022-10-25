//
//  NewsModel.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 25.10.2022.
//

import UIKit

final class NewsModel {
    let title: String
    let article: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(title: String, article: String, imageURL: URL?) {
        self.title = title
        self.article = article
        self.imageURL = imageURL
    }
}
