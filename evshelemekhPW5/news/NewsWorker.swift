//
//  NewsWorker.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 25.10.2022.
//

import UIKit

import UIKit

final class NewsWorker: NewsWorkerLogic {
    private let decoder: JSONDecoder = JSONDecoder()
    private let session: URLSession = URLSession.shared
    func getNews(_ request: Model.GetNews.Request, completion: @escaping ((Model.News) -> ())) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6390e173995840ad9c4f20ce14d2174f") else {
            return
        }
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if
                let data = data,
                let news = try? self?.decoder.decode(Model.News.self, from: data)
            {
                completion(news)
            } else {
                print("Could not get any content")
            }
        }

        task.resume()
    }
}
