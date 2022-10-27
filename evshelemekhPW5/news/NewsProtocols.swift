//
//  NewsProtocols.swift
//  evshelemekhPW5
//
//  Created by Lisa Shell on 27.10.2022.
//

import Foundation

protocol NewsBuisnessLogic {
    typealias Model = NewsModel
    func loadNews(_ request: Model.GetNews.Request)
}

protocol NewsPresentationLogic {
    typealias Model = NewsModel
    func presentNews(_ response: Model.GetNews.Response)
}

protocol NewsDisplayLogic: AnyObject {
    typealias Model = NewsModel
    func displayNews(_ viewModel: Model.GetNews.ViewModel)
}


protocol NewsWorkerLogic {
    typealias Model = NewsModel
    func getNews(_ request: Model.GetNews.Request, completion: @escaping ((Model.News) -> ()))
}
